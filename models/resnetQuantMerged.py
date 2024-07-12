#This file was generated with brevitasConverter.py
defaultWeightBitWidth=8
defaultActivationBitWidth=8

layer = 1
block = 0

import math
import numpy as np
import brevitas.nn as qnn
from brevitas.quant import Int8Bias as BiasQuant
import time

#Engine declaration
from brevitas.inject import ExtendedInjector
from brevitas.quant.solver import WeightQuantSolver, ActQuantSolver
from brevitas.core.bit_width import BitWidthImplType
from brevitas.core.quant import QuantType
from brevitas.core.restrict_val import RestrictValueType, FloatToIntImplType
from brevitas.core.scaling import ScalingImplType
from brevitas.core.zero_point import ZeroZeroPoint
from brevitas.inject.enum import ScalingImplType, StatsOp, RestrictValueType
from dependencies import value

class CustomQuant(ExtendedInjector):
	bit_width_impl_type = BitWidthImplType.CONST
	restrict_scaling_type = RestrictValueType.POWER_OF_TWO
	zero_point_impl = ZeroZeroPoint
	float_to_int_impl_type = FloatToIntImplType.ROUND
	scaling_impl_type = ScalingImplType.STATS
	scaling_stats_op = StatsOp.MAX
	scaling_per_output_channel = False
	bit_width = 8
	narrow_range = True
	signed = True

	@value
	def quant_type():
		global defaultWeightBitWidth
		if defaultWeightBitWidth == 1:
			return QuantType.BINARY
		# elif defaultWeightBitWidth ==2:
		# 	return QuantType.TERNARY
		else:
			return QuantType.INT

class CustomWeightQuant(CustomQuant,WeightQuantSolver):
	scaling_const = 1.0

class CustomActQuant(CustomQuant, ActQuantSolver):
    signed=False
    float_to_int_impl_type = FloatToIntImplType.FLOOR

class CustomSignedActQuant(CustomQuant, ActQuantSolver):
    signed=True
    float_to_int_impl_type = FloatToIntImplType.FLOOR


#Global Variables

#End of Engine declaration

'''ResNetQuant in PyTorch.

For Pre-activation ResNet, see 'preact_resnetQuant.py'.

Reference:
[1] Kaiming He, Xiangyu Zhang, Shaoqing Ren, Jian Sun
	Deep Residual Learning for Image Recognition. arXiv:1512.03385
'''
import torch
import torch.nn as nn
import torch.nn.functional as F


class BasicBlock(nn.Module):
	expansion = 1

	def __init__(self, in_planes, planes, weightBitWidth, stride=1):
		super(BasicBlock, self).__init__()

		self.conv1 = qnn.QuantConv2d(in_planes, planes, kernel_size=3, 
			       					 stride=stride, padding=1, bias=False, 
									 weight_bit_width=weightBitWidth[0], 
									 bias_quant=BiasQuant, 
									 weight_quant=CustomWeightQuant, 
									 return_quant_tensor=False)
		self.bn1 = nn.Identity(planes)
		self.relu1 = qnn.QuantReLU(inplace=True,
							 	   bit_width=defaultActivationBitWidth, 
			    				   return_quant_tensor=True, 
								   act_quant=CustomSignedActQuant)

		self.conv2 = qnn.QuantConv2d(planes, planes, kernel_size=3, 
			       					 stride=1, padding=1, bias=False, 
									 weight_bit_width=weightBitWidth[1], 
									 bias_quant=BiasQuant, 
									 weight_quant=CustomWeightQuant, 
									 return_quant_tensor=False)
		self.bn2 = nn.Identity(planes)

		self.shortcut = nn.Sequential()
		if stride != 1 or in_planes != self.expansion*planes:
			self.shortcut = nn.Sequential(
				qnn.QuantConv2d(in_planes, self.expansion*planes, 
		    					kernel_size=1, stride=stride, bias=False, 
								weight_bit_width=weightBitWidth[0], bias_quant=BiasQuant, 
								weight_quant=CustomWeightQuant, 
								return_quant_tensor=False),
				nn.Identity(self.expansion*planes)
			)

		#self.identity = qnn.QuantIdentity(return_quant_tensor=False)
		self.relu2 = qnn.QuantReLU(inplace=True, 
			    				   bit_width=defaultActivationBitWidth, 
			    				   return_quant_tensor=True, 
								   act_quant=CustomSignedActQuant)
		

	def forward(self, x):
		global layer
		global block
		out = self.relu1(self.bn1(self.conv1(x)))
		# name = "maps/layer" + str(layer) + "_block" + str(block) + "_relu1.bin"
		# printImage(out, name)

		out = self.bn2(self.conv2(out))
		# name = "maps/layer" + str(layer) + "_block" + str(block) + "_conv2.bin"
		# printImage(out, name)
		c2_relu = self.relu2(out)
		# name = "maps/layer" + str(layer) + "_block" + str(block) + "_relu2_c2.bin"
		# printImage(c2_relu, name)

		out += self.shortcut(x)
		out = self.relu2(out)
		# name = "maps/layer" + str(layer) + "_block" + str(block) + "_relu2_sh.bin"
		# printImage(out, name)
		block = 1
		#print(out)
		return out


class Bottleneck(nn.Module):
	expansion = 4

	def __init__(self, in_planes, planes, weightBitWidth, stride=1):
		super(Bottleneck, self).__init__()
		self.conv1 = qnn.QuantConv2d(in_planes, planes, kernel_size=1, 
			       					 bias=False, 
									 weight_bit_width=weightBitWidth[0], 
									 bias_quant=BiasQuant, 
									 weight_quant=CustomWeightQuant, 
									 return_quant_tensor=True)
		self.bn1 = nn.Identity(planes)
		self.conv2 = qnn.QuantConv2d(planes, planes, kernel_size=3, 
			       					 stride=stride, padding=1, bias=False, 
									 weight_bit_width=weightBitWidth[1], 
									 bias_quant=BiasQuant, 
									 weight_quant=CustomWeightQuant, 
									 return_quant_tensor=True)
		self.bn2 = nn.Identity(planes)
		self.conv3 = qnn.QuantConv2d(planes, self.expansion * planes, 
			       					 kernel_size=1, bias=False, 
									 weight_bit_width=weightBitWidth[2], 
									 bias_quant=BiasQuant, 
									 weight_quant=CustomWeightQuant, 
									 return_quant_tensor=True)
		self.bn3 = nn.Identity(self.expansion*planes)

		self.shortcut = nn.Sequential()
		if stride != 1 or in_planes != self.expansion*planes:
			self.shortcut = nn.Sequential(
				qnn.QuantConv2d(in_planes, self.expansion*planes, 
		    					kernel_size=1, stride=stride, bias=False, 
								weight_bit_width=weightBitWidth[0], 
								bias_quant=BiasQuant, 
								weight_quant=CustomWeightQuant, 
								return_quant_tensor=True),
				nn.Identity(self.expansion*planes)
			)

	def forward(self, x):
		out = F.relu(self.bn1(self.conv1(x)))
		out = F.relu(self.bn2(self.conv2(out)))
		out = self.bn3(self.conv3(out)) #desquantizar o bn3 aqui OU somar um quantTensor.add
		out += self.shortcut(x)
		out = F.relu(out)
		return out


class ResNetQuantMerged(nn.Module):
	def __init__(self, block, num_blocks, weightBitWidth, num_classes=10):
		super(ResNetQuantMerged, self).__init__()
		global defaultWeightBitWidth
		global defaultActivationBitWidth
		global convsPerLayer

		#Find number of convolutions per layer (through block type)
		if block == BasicBlock:
			convsPerLayer = 2
		else:
			convsPerLayer = 3

		#Define each layer
		self.imageQuant = qnn.QuantIdentity(bit_width=8, 
				      						act_quant=CustomSignedActQuant, 
											return_quant_tensor=True)
		self.in_planes = 64

		self.conv1 = qnn.QuantConv2d(3, 64, kernel_size=3, stride=1, 
			       					 padding=1, bias=False, 
									 weight_bit_width=weightBitWidth[0], 
									 bias_quant=BiasQuant, 
									 weight_quant=CustomWeightQuant, 
									 return_quant_tensor=True)
		self.bn1 = nn.Identity(64)
		self.relu1 = qnn.QuantReLU(inplace=True, 
			    				  bit_width=defaultActivationBitWidth, 
			    				  return_quant_tensor=True, 
								  act_quant=CustomSignedActQuant)
		currIdx = 1
		self.layer1 = self._make_layer(block, 64, num_blocks[0], stride=1, 
				 					   wgtBitWidth=weightBitWidth, 
									   layerStartIdx=currIdx)
		currIdx += num_blocks[0]*convsPerLayer
		self.layer2 = self._make_layer(block, 128, num_blocks[1], stride=2, 
				 					   wgtBitWidth=weightBitWidth, 
									   layerStartIdx=currIdx)
		currIdx += num_blocks[1]*convsPerLayer
		self.layer3 = self._make_layer(block, 256, num_blocks[2], stride=2, 
				 					   wgtBitWidth=weightBitWidth, 
									   layerStartIdx=currIdx)
		currIdx += num_blocks[2]*convsPerLayer
		self.layer4 = self._make_layer(block, 512, num_blocks[3], stride=2, 
				 					   wgtBitWidth=weightBitWidth, 
									   layerStartIdx=currIdx)
		self.linear = qnn.QuantLinear(512*block.expansion, num_classes, 
									  bias=False, weight_bit_width=8, 
									  bias_quant=BiasQuant, 
									  weight_quant=CustomWeightQuant, 
									  return_quant_tensor=False)
	
	def _make_layer(self, block, planes, num_blocks, stride, wgtBitWidth, layerStartIdx):
		strides = [stride] + [1]*(num_blocks-1)
		layers = []
		layerOffset = 0

		for stride in strides:
			layers.append(block(in_planes=self.in_planes, planes=planes, 
		       					weightBitWidth=wgtBitWidth[layerStartIdx+layerOffset:
					 			layerStartIdx+layerOffset+convsPerLayer], 
								stride=stride))
			self.in_planes = planes * block.expansion
			layerOffset += convsPerLayer

		return nn.Sequential(*layers)

	def setBitWidths(weight,activation):
		global defaultWeightBitWidth
		global defaultActivationBitWidth
		defaultWeightBitWidth=weight
		defaultActivationBitWidth=activation

	def forward(self, x):
		global layer
		global block
		
		out = self.imageQuant(x)
		# print(out)
		# extractImage(out, "img17_horse.bin")
		
		out = self.relu1(self.bn1(self.conv1(out)))
		# printImage(out, "maps/conv1.bin")
		out = self.layer1(out)
		block = 0
		layer = 2
		out = self.layer2(out)
		block = 0
		layer = 3
		out = self.layer3(out)
		block = 0
		layer = 4
		out = self.layer4(out)
		#print(out)
		out = F.avg_pool2d(out, out.shape[2])
		# print(out)
		out = out.view(out.size(0), -1)
		out = self.linear(out)
		#print(out)
		return out

def setWeightBitWidth(num_layers, bit_width_list):
	num_width_options = len(bit_width_list)
	repeat_factor = round(num_layers/num_width_options)

	weightBitWidth = []
	for curr_width in bit_width_list:
		for i in range(repeat_factor):
			weightBitWidth.append(curr_width)

	return weightBitWidth

def ResNetQuantMerged18(weights_list):
	return ResNetQuantMerged(block=BasicBlock, num_blocks=[2, 2, 2, 2], 
		    		   weightBitWidth=setWeightBitWidth(18, weights_list))


def ResNetQuantMerged34(weights_list):
	return ResNetQuantMerged(block=BasicBlock, num_blocks=[3, 4, 6, 3], 
		    		   weightBitWidth=setWeightBitWidth(34, weights_list))


def ResNetQuantMerged50(weights_list):
	return ResNetQuantMerged(block=Bottleneck, num_blocks=[3, 4, 6, 3], 
		    		   weightBitWidth=setWeightBitWidth(50, weights_list))


def ResNetQuantMerged101(weights_list):
	return ResNetQuantMerged(block=Bottleneck, num_blocks=[3, 4, 23, 3], 
		    		   weightBitWidth=setWeightBitWidth(101, weights_list))


def ResNetQuanMerged152(weights_list):
	return ResNetQuantMerged(block=Bottleneck, num_blocks=[3, 8, 36, 3], 
		    		   weightBitWidth=setWeightBitWidth(152, weights_list))


def test(weights_list):
	net = ResNetQuantMerged18(weights_list)
	y = net(torch.randn(1, 3, 32, 32))
	print(y.size())

# test()
def printImage(out, name):
	#print(out)
	scale = out.scale.cpu().detach().numpy()
	array = out.value.cpu().detach().numpy()
	array /= scale
	
	#print(array)
	array = np.transpose(array, (0, 2, 3, 1))
	
	array = array.astype(int)

	batchSize = array.shape[0]
	numKernels = array.shape[3]
	numY = array.shape[1]
	numX = array.shape[2]

	numValuesInBus = 16
	busPerZ = math.floor(array.shape[3]/numValuesInBus)
	kiters = array.shape[3]

	outArray = np.zeros((batchSize, numY, numX, busPerZ*2), dtype=np.int64)
	values = 0

	for f in range(batchSize):
		for y in range(numY):
			for x in range(numX):
				outz = 0
				kOffset = 1
				for k in range(kiters):
					if(k >= numKernels):
						value = 0
					else:
						value = array[f,y,x,k]

					# if(value > 127):
					# 	value = 127
					# if(value < -127):
					# 	value = -127
					
					values = (values<<8) | (value&0xFF)

					if((k+1)%8 == 0):
						if((k+1)%numValuesInBus == 0):
							outArray[f,y,x,outz+kOffset] = values
							outz += 2
							kOffset = 1
						else:
							outArray[f,y,x,outz+kOffset] = values
							kOffset -= 1

						values = 0


	output_file = open(name, "wb")
	output_file.write(outArray.tobytes())
	output_file.close()

def extractImage(out, name):
	# print(out)
	scale = out.scale.cpu().detach().numpy()
	array = out.value.cpu().detach().numpy()
	array /= scale
	# print(array)
	array = np.transpose(array, (0, 2, 3, 1))
	
	array = array.astype(int)

	print(scale)

	batchSize = array.shape[0]
	numKernels = array.shape[3]
	numY = array.shape[1]
	numX = array.shape[2]

	numValuesInBus = 16
	busPerZ = 1
	kiters = numValuesInBus*busPerZ

	outArray = np.zeros((batchSize, numY, numX, busPerZ*2), dtype=np.int64)
	values = 0

	for f in range(batchSize):
		for y in range(numY):
			for x in range(numX):
				outz = 0
				kOffset = 1
				for k in range(kiters):
					if(k >= numKernels):
						value = 0
					else:
						value = array[f,y,x,k]
					
					values = (values<<8) | (value&0xFF)

					if((k+1)%8 == 0):
						if((k+1)%numValuesInBus == 0):
							outArray[f,y,x,outz+kOffset] = values
							outz += 2
							kOffset = 1
						else:
							outArray[f,y,x,outz+kOffset] = values
							kOffset -= 1

						values = 0


	output_file = open(name, "wb")
	output_file.write(outArray.tobytes())
	output_file.close()
	
