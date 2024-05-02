'''Train CIFAR10 with PyTorch.'''
import torch
import torch.nn as nn
import torch.optim as optim
import torch.nn.functional as F
import torch.backends.cudnn as cudnn

import torchvision
import torchvision.transforms as transforms
import brevitas
import os
import argparse
import sys
import brevitas.nn as qnn
import brevitas

programPath = os.path.dirname(os.path.abspath(__file__))
projectDir = os.path.dirname(programPath)
sys.path.append(projectDir)

import toolbox as tb

parser = argparse.ArgumentParser(description='')
parser.add_argument('--model', default="ResNet101Quant", type=str, help='Name of the model e.g. MobileNetQuant')
parser.add_argument('--input', default="", type=str, help='input pth file')
parser.add_argument('--output', default="", type=str, help='output pth file')

parser.add_argument('--modelParams', default="", type=str, help='Parameters of the Model')
parser.add_argument('--modelPath', default="models", type=str, help='Input Model path')
parser.add_argument('--modelFile', default="resnetQuant", type=str, help='Input Model Description file name e.g. lenetQuant (don\'t include .py)')

parser.add_argument('--weights', nargs='+', default='8', type=int, help='weights sequence e.g 8 4')
parser.add_argument('--activations', default=8, type=int, help='batch size')
parser.add_argument('--layers', default=18, type=int, help='Number of layers in the model')
args = parser.parse_args()

device = 'cpu' 

net, checkpoint = tb.loadModel(args, device)

layers=net.named_modules()
i=0
numConvs=0
numBNs=0

for name,module in layers:
    #print(module)
    #input("ENTER")
    if not isinstance(module, nn.Sequential):
        if isinstance(module, qnn.QuantConv2d) or isinstance(module, nn.Conv2d):
            if(i>0):
                print("conv without bn")
            conv = module
            convName = name
            #print("Got conv2d")
            i = i + 1
            numConvs = numConvs + 1

        elif isinstance(module, nn.BatchNorm2d):
            i=0
            numBNs=numBNs+1
        
            print("merged conv " + convName + " with bn " + name)
            brevitas.nn.utils.merge_bn(conv,module)
            module.reset_parameters()
            with torch.no_grad():
                module.weight.fill_(1.0)
                module.bias.zero_()
            
            #print(conv.bias)
            #print("There is bn")
logs = open("logs.txt", "a")
logs.write("Model = "+ args.model + " from " + args.input + "\n")
logs.write("number of CONV layers is "+ str(numConvs) + "\n")
logs.write("number of BN layers is "+ str(numBNs) + "\n\n")
logs.close()
print("Switch all batchnorm layers to nn.Identity() and when loading the pth file, turn strict into false")

checkpoint["net"]=net.state_dict()

torch.save(checkpoint,"./output/" + args.output)