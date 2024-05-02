import argparse
import os
import numpy as np
from tqdm import tqdm
import torch
import torch.nn as nn
import torch.optim as optim
import importlib
import sys

import torchvision

import brevitas.nn as qnn
import brevitas
import math
from collections import OrderedDict


def setCache(m):
    m.cache_inference_quant_bias=True

def removeLastComma(fileName):
    with open(fileName, "r") as f:
        content = f.read()

    last_comma_index = content.rfind(",")
    if last_comma_index != -1:
        content = content[:last_comma_index] + content[last_comma_index+1:]

    with open(fileName, "w") as f:
        f.write(content)

def setWeightBitWidth(num_layers, bit_width_list):
	num_width_options = len(bit_width_list)
	repeat_factor = round(num_layers/num_width_options)

	weightBitWidth = []
	for curr_width in bit_width_list:
		for i in range(repeat_factor):
			weightBitWidth.append(curr_width)

	return weightBitWidth

parser = argparse.ArgumentParser(description='Quantized Weights Extractor')
parser.add_argument('--input', default="checkpoint/ckpt_ResNet18.pth", type=str, help='Location of .pth file e.g. ckpt.pth')
parser.add_argument('--weights', nargs='+', default='8', type=int, help='weights sequence e.g 8 4')
parser.add_argument('--activations', default=8, type=int, help='Activations bit width')
parser.add_argument('--modelPath', default="models", type=str, help='Input Model path')
parser.add_argument('--modelFile', default="resnetQuant", type=str, help='Input Model Description file name e.g. lenetQuant (don\'t include .py)')
parser.add_argument('--model', default="ResNetQuant18", type=str, help='Name of the Model e.g LeNetQuant')
parser.add_argument('--fullprint',action='store_true',help='Print Full tensors')
parser.add_argument('--debug', action='store_true', help='Only for when program is running in debug mode')
parser.add_argument('--modelParams', default="", type=str, help='Parameters of the Model')
parser.add_argument('--scaleOnly', action='store_true', help='Scale only extraction')
args = parser.parse_args()

#device = 'cuda' if torch.cuda.is_available() else 'cpu'
device = 'cpu'
debug = args.debug

#Get the absolute path to the model file
programPath = os.path.dirname(os.path.abspath(__file__))
projectDir = os.path.dirname(programPath)
fullModelPath = os.path.join(projectDir, args.modelPath)

sys.path.append(fullModelPath)

try:
    module = importlib.import_module(args.modelFile)

    if hasattr(module, args.model):
        model = getattr(module, args.model)
    else:
        print(f"Error: Function '{args.model}' not found in module '{args.modelFile}'.py.")
        sys.exit(1)

except ImportError:
    print(f"Error: Failed to import module '{args.model}' from '{fullModelPath}'.")
    sys.exit(1)

model = model(args.weights)

if device == 'cuda':
    model = torch.nn.DataParallel(model)

model.apply(setCache)

checkpointPath = os.path.join(projectDir, args.input)
state_dict = torch.load(checkpointPath)

if device == 'cpu':
    new_state_dict = OrderedDict()
    for k, v in state_dict['net'].items():
        name = k[7:] if k.startswith('module.') else k
        new_state_dict[name] = v
    state_dict['net'] = new_state_dict

model.load_state_dict(state_dict['net'])
model = model.to(device)
model.eval()

optionalPrint = False
if optionalPrint:
    inputs = torch.zeros(1,3,300,300)
    inputs = inputs.to(device)

    with torch.no_grad():
        model(inputs)

    if(args.fullprint):
        torch.set_printoptions(profile="full")

descriptionObj = open("description.txt", mode='w')
weightsAddressObj = open("weightsAddress.txt", mode='w')
weightsAddressObj.write("uintptr_t WEIGHTS_ADDR_OFF[] = {")
actScaleObj = open("act_scale.txt", mode='w')
actScaleObj.write("int ACT_SCALE[] = {")
filecounter=0
memAddress=0
weightId=0

actScaleList = []
wgtScaleList = []
ipScaleList = []

n_layers=0
for key, value in state_dict['net'].items():
    #print(key)
    res=""
    for i in key.split("."):
        
        if i.isdigit():
            i="["+i+"]"
            res=res[:len(res)-1]+i+"."
        else:
            res=res+i+"."

    key=res[:len(res)-1]
    if("weight" in key):
        n_layers += 1

#Set bit width per layer
weightsPerLayer = setWeightBitWidth(n_layers, args.weights)
maxFilters=0
maxKernels=0
maxBus2=0
maxBus4=0

if args.scaleOnly == True:
    for key, value in state_dict['net'].items():
        #print(key)
        res=""
        for i in key.split("."):
            
            if i.isdigit():
                i="["+i+"]"
                res=res[:len(res)-1]+i+"."
            else:
                res=res+i+"."

        key=res[:len(res)-1]

        if("weight" in key and "linear" in key):
            layerName=key.replace("weight","int_weight()",1)
            scale=eval("model."+key.replace("weight","quant_weight_scale().cpu().detach().numpy()",1))


        if("weight" in key and "linear" not in key):
            layerName=key.replace("weight","int_weight()",1)
            scale=eval("model."+key.replace("weight","quant_weight_scale().cpu().detach().numpy()",1))
            wgtScaleList.append(int(abs(math.log(scale,2))))
            

        if("act_quant" in key):
            layerstr=key[:key.rfind("act_quant")-1]
            scale=eval("model."+layerstr+".quant_act_scale().cpu().detach().numpy()")
            actScaleList.append(int(abs(math.log(scale,2))))

    ipBufferAct = 0
    ipBufferWgt = 0
    ipBufferOut = 0

    shortcutBuffer = 0

    for key, value in state_dict['net'].items():
        #print(key)
        res=""
        for i in key.split("."):
            
            if i.isdigit():
                i="["+i+"]"
                res=res[:len(res)-1]+i+"."
            else:
                res=res+i+"."

        key=res[:len(res)-1]

        if("weight" in key and "linear" not in key):
            if("shortcut" in key):
                shortcutBuffer = actScaleList[ipBufferAct-2] + wgtScaleList[ipBufferWgt+1] - actScaleList[ipBufferAct]

        if("act_quant" in key):
            if("relu" in key and ipBufferAct == 0):
                ipScaleList.append(actScaleList[ipBufferAct] + wgtScaleList[ipBufferWgt] - actScaleList[ipBufferAct+1])
                ipBufferAct += 2
                ipBufferWgt += 1
            elif("relu" in key):
                if shortcutBuffer!=0:
                    ipScaleList.append(actScaleList[ipBufferAct-1] + wgtScaleList[ipBufferWgt] - actScaleList[ipBufferAct])
                    ipScaleList.append(shortcutBuffer)
                    ipBufferAct += 1
                    ipBufferWgt += 2
                    shortcutBuffer = 0
                else:
                    ipScaleList.append(actScaleList[ipBufferAct-1] + wgtScaleList[ipBufferWgt] - actScaleList[ipBufferAct])
                    ipBufferAct += 1
                    ipBufferWgt += 1
    print("ipScaleList is " + str(ipScaleList))
elif args.scaleOnly == False:
    for key, value in state_dict['net'].items():
        #print(key)
        res=""
        for i in key.split("."):
            
            if i.isdigit():
                i="["+i+"]"
                res=res[:len(res)-1]+i+"."
            else:
                res=res+i+"."

        key=res[:len(res)-1]

        if("weight" in key and "linear" in key):
            print("Layer Name = "+ key)
            layerName=key.replace("weight","int_weight()",1)

            array= eval("model."+key.replace("weight","int_weight()",1))
            array = array.cpu().numpy().astype(int)

            scale=eval("model."+key.replace("weight","quant_weight_scale().cpu().detach().numpy()",1))
            print("Scale = " + str(scale))

            linearObj = open("output/linear.bin",mode="wb")
            for a in range(array.shape[0]):
                for b in range(array.shape[1]):
                    linearObj.write(array[a][b].tobytes()[:1])
                

            linearObj.close()


        if("weight" in key and "linear" not in key):
            print("Layer Name = "+ key)
            #if debug: print(eval("model."+key.replace("weight","int_weight()",1)))
            layerName=key.replace("weight","int_weight()",1)

            array= eval("model."+key.replace("weight","int_weight()",1))
            array = array.cpu().numpy().astype(int)
            #print(array)
            #array = np.transpose(array,(0,2,3,1))
            #print(np.vectorize(hex)(array))
            if("depthwise" in key):
                array = np.transpose(array,(1,2,3,0))
            else:
                array = np.transpose(array,(0,2,3,1))
                numFilters=array.shape[0]
                numKernels=array.shape[3]
                numY=array.shape[1]
                numX=array.shape[2]
            #print(array.shape)
            #print(array)
            if maxFilters < numFilters:
                maxFilters = numFilters
            if maxKernels < numKernels:
                maxKernels = numKernels
            
            zvalues= math.floor(((numKernels-1)/math.floor(128/int(weightsPerLayer[weightId])))+1)

            # print("Key numbers: filters is "+str(numFilters)+", kernels is "+str(numKernels)+", X is "+str(numX)+", Y is "+str(numY))
            descriptionObj.write("Layer Name = "+ key + "\n")
            scale=eval("model."+key.replace("weight","quant_weight_scale().cpu().detach().numpy()",1))
            wgtScaleList.append(int(abs(math.log(scale,2))))
            descriptionObj.write("Scale = " + str(scale)+ "\n")
            descriptionObj.write("Shift " + str(int(abs(math.log(scale,2)))) + " positions to the right\n")
            descriptionObj.write("Address is " + hex(memAddress)+"\n")
            descriptionObj.write("Key numbers: filters is "+str(numFilters)+", Z channels is "+str(numKernels)+\
                                ", X is "+str(numX)+", Y is "+str(numY)+", bus per Z is "+str(zvalues)+"\n")
            
            #weightsAddressObj.write(memAddress.to_bytes(8, byteorder='big'))
            weightsAddressObj.write(hex(memAddress)+",")
            actScaleObj.write(str(int(abs(math.log(scale,2))))+",")
            

            # print("Z channels is " + str(zvalues))
            remainder = 128%int(weightsPerLayer[weightId])
            #print("remainder is " + str(remainder))
            #print("max is " + str(np.amax(array)))
            #print("min is " + str(np.amin(array)))
            #outarray = np.zeros((numFilters, numY, numX, zvalues*2),dtype=np.int64)
            outarray = np.zeros((numFilters, numY, numX, zvalues*2),dtype=np.int64)
            memAddress=memAddress+(numFilters*numY*numX*zvalues*math.floor(128/8))

            #print(outarray.shape)
            zindex = 0
            values=0

            busPerZ=math.ceil(numKernels/math.floor(128/int(weightsPerLayer[weightId])))
            numValuesInBus=math.floor(128/int(weightsPerLayer[weightId]))
            kiters=busPerZ*numValuesInBus
            # print("weight width is " + str(weightsPerLayer[weightId]))
            # print("kiters is " + str(kiters))
            for f in range(numFilters):
                for y in range(numY):
                    for x in range(numX):
                        outz=0
                        kOffset=1
                        for k in range(kiters):
                            if(k>=numKernels):
                                value=0
                            else:   
                                #print("array f is " +str(f)+ " y is "+str(y)+" x is "+str(x)+" k is "+str(k))
                                value=array[f,y,x,k]

                            #print("value is "+str(value))

                            values=(values<<weightsPerLayer[weightId]) | (value&((1<<int(weightsPerLayer[weightId]))-1))

                            if((k+1)%numValuesInBus==0 or \
                            k==kiters-1 or \
                            (((k+1)%16)==0 and weightsPerLayer[weightId]==4) or \
                            (((k+1)%32)==0 and weightsPerLayer[weightId]==2)):
                                #if(k%math.floor(128/int(weightsPerLayer[weightId]))==0):
                                    #for
                                #print("out array f is " +str(f)+ " y is "+str(y)+" x is "+str(x)+" outz is "+str(outz))
                                #print("values is "+str(values)+"\n")

                                #outarray[f,y,x,outz]= values<<remainder
                                if (k+1)%numValuesInBus==0:
                                    outarray[f,y,x,outz+kOffset]= values<<remainder
                                    outz=outz+2
                                    kOffset=1
                                else:
                                    outarray[f,y,x,outz+kOffset]= values
                                    kOffset=kOffset-1

                                values=0
            
            descriptionObj.write("Number of bus stored is " + str(numFilters*numY*numX*busPerZ)+"\n\n")
            #print("outz is " + str(math.floor(outz/2)))
            if maxBus2 < numFilters*numY*numX*busPerZ and weightsPerLayer[weightId] == 2:
                maxBus2 = numFilters*numY*numX*busPerZ
                print("new maxBus2 is " + str(maxBus2))
            if maxBus4 < numFilters*numY*numX*busPerZ and weightsPerLayer[weightId] == 4:
                maxBus4 = numFilters*numY*numX*busPerZ
                print("new maxBus4 is " + str(maxBus4))
            print("\n")
            
            if debug == False:
                weightobj = open("output/"+format(filecounter, '04d')+key+".bin",mode="wb")
                #outarray.tofile(weightobj)
                weightobj.write(outarray.tobytes())
                weightobj.close()
            filecounter=filecounter+1
            weightId+=1
            #print("size is " + str(numFilters*numY*numX*zvalues))
            #print("memAdress is " + str(memAddress))



            #input("ENTER")

        if("bias" in key):
            #descriptionObj.write("model."+key.replace(".bias","",1)+".int_bias()\n")
            array=eval("model."+key.replace(".bias","",1)+".int_bias()")
            array = array.cpu().numpy().astype(int)
            #print(array)
            descriptionObj.write("Layer Name = "+ key+"\n")
            print("Layer Name = "+ key)
            scale=eval("model."+key.replace("bias","quant_bias_scale().cpu().detach().numpy()[0]",1)+"\n")
            descriptionObj.write("Scale = "+ str(scale)+"\n")
            descriptionObj.write("Shift "+ str(abs(math.log(scale,2)))+ " positions to the right\n")
            descriptionObj.write("Address is " + hex(memAddress)+"\n\n")
            
            #print("Scale = " + str(eval("model."+key.replace("bias","quant_bias_scale()",1))))
            #kiters=math.ceil(numKernels/math.floor(128/int(weightsPerLayer[weightId])))*math.floor(128/int(weightsPerLayer[weightId]))
            numBias=array.shape[0]
            numIters=math.ceil(numBias/math.floor(128/8))*math.floor(128/8)
            memAddress=memAddress+((math.ceil(numBias/math.floor(128/8)))*8)
            #print("numBias is "+ str(numBias))
            #print("numiters is "+ str(numIters))
            index=0
            values=0
            outarray = np.zeros((math.ceil(numBias/math.floor(128/8))),dtype=np.int64)
            for i in range(numIters):
                if(i>=numBias):
                    value=0
                else:   
                    value=array[i]
                #print(value)
                values=(values<<8) | (value&((1<<8)-1))
                if((i+1)%math.floor(128/8)==0 or i==numIters-1):
                    #print("values is " + str(values) )
                    outarray[index]= values
                    index=index+1
                    values=0

            biasobj = open("output/"+format(filecounter, '04d')+key+".bin",mode='wb')
            filecounter=filecounter+1
            outarray.tofile(biasobj)
            biasobj.close()
            #print("size is " + str((math.ceil(numBias/math.floor(128/8)))))
            #print("memAdress is " + str(memAddress))




            #input("ENTER")

        if("act_quant" in key):
            layerstr=key[:key.rfind("act_quant")-1]
            print("Layer Name = "+ layerstr)
            descriptionObj.write("Layer Name = "+ layerstr+"\n")
            descriptionObj.write("Scale = " + str(eval("model."+layerstr+".quant_act_scale().cpu().detach().numpy()"))+"\n")
            scale=eval("model."+layerstr+".quant_act_scale().cpu().detach().numpy()")
            actScaleList.append(int(abs(math.log(scale,2))))
            descriptionObj.write("Shift "+ str(abs(math.log(scale,2)))+ " positions to the right\n\n\n\n")
            #input("ENTER")

weightsAddressObj.close()
actScaleObj.close()

removeLastComma("weightsAddress.txt")
removeLastComma("act_scale.txt")

with open("weightsAddress.txt", "a") as weightsAddressObj:
    weightsAddressObj.write("};")

with open("act_scale.txt", "a") as actScaleObj:
    actScaleObj.write("};")

descriptionObj.write("Max number of filters to save = "+ str(maxFilters) +"\n")
descriptionObj.write("Max number of kernels to save = "+ str(maxKernels) +"\n")
descriptionObj.write("Max number of bus to save for IP with width 2 = "+ str(maxBus2) +"\n")
descriptionObj.write("Max number of bus to save for IP with width 4 = "+ str(maxBus4) +"\n")
descriptionObj.write("\n\tTotal memory offset = "+ str(hex(memAddress)) +"\n")