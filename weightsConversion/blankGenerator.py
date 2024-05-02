import argparse
import os
import sys
import numpy as np
from tqdm import tqdm

import brevitas.nn as qnn
import math
parser = argparse.ArgumentParser(description='Creates a blank pth file to be used with weightsConverter.py')
parser.add_argument('--modelFile', default="ResNet101Quant", type=str, help='Input model description file location e.g. mobilenetQuant.py ')
parser.add_argument('--modelPath', default="../models", type=str, help='Input Model path')
parser.add_argument('--model', default="ResNet101Quant", type=str, help='Name of the model e.g. MobileNetQuant')
parser.add_argument('--output', default="./out.pth", type=str, help='Output file e.g. blank.pth')
parser.add_argument('--modelWeights', nargs='+', default='8 4', type=int, help='weights sequence e.g [8,4]')
args = parser.parse_args()

sys.path.append(args.modelPath)

model_import_program = 'from '+args.modelFile.replace(".py","",1)+' import *'
exec(model_import_program)
#eval(args.model+".setBitWidths(8,8)")
#model = eval(args.model+"("+str(args.modelWeights)+")")

model = globals()[args.model]
model = model(args.modelWeights)

state = {
    'net': model.state_dict(),
    'optimizer_state': None,
    'acc': 0,
    'epoch': 0,
}

torch.save(state, args.output)
print(args.output+" file created")