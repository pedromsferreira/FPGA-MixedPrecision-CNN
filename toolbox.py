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

def setWeightBitWidth(num_layers, bit_width_list):
	num_width_options = len(bit_width_list)
	repeat_factor = round(num_layers/num_width_options)

	weightBitWidth = []
	for curr_width in bit_width_list:
		for i in range(repeat_factor):
			weightBitWidth.append(curr_width)

	return weightBitWidth

def setCache(m):
    m.cache_inference_quant_bias=True

def loadModel(args, device):

    #Get the absolute path to the model file
    programPath = os.path.dirname(os.path.abspath(__file__))
    fullModelPath = os.path.join(programPath, args.modelPath)

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

    checkpointPath = os.path.join(programPath, args.input)
    state_dict = torch.load(checkpointPath)

    if device == 'cpu':
        new_state_dict = OrderedDict()
        for k, v in state_dict['net'].items():
            name = k[7:] if k.startswith('module.') else k
            new_state_dict[name] = v
        state_dict['net'] = new_state_dict

    model.load_state_dict(state_dict['net'])
    model = model.to(device)
    
    return model, state_dict