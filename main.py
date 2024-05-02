'''Train CIFAR10 with PyTorch.'''
import torch
import torch.nn as nn
import torch.optim as optim
import torch.nn.functional as F
import torch.backends.cudnn as cudnn

import torchvision
import torchvision.transforms as transforms

import importlib
import sys
import os
import argparse

from models import *
from utils import progress_bar
from PIL import Image

runInference = True

#To avoid CUDA running out of memory
#os.environ["PYTORCH_CUDA_ALLOC_CONF"] = "max_split_size_mb:512"

torch.set_printoptions(profile="full", precision=8)

parser = argparse.ArgumentParser(description='PyTorch CIFAR10 Training')
parser.add_argument('--lr', default=0.04, type=float, help='learning rate')
parser.add_argument('--resume', '-r', action='store_true', help='resume from checkpoint')
parser.add_argument('--weights', nargs='+', default='8', type=int, help='weights sequence e.g 8 4')

parser.add_argument('--id', default="", type=str, help='name appended to save file')
parser.add_argument('--modelPath', default="models", type=str, help='Input Model path')
parser.add_argument('--modelFile', default="resnetQuant", type=str, help='Input Model Description file name e.g. lenetQuant (don\'t include .py)')
parser.add_argument('--resumeFile', default="none", type=str, help='Name of the checkpoint file e.g. ./checkpoint/ckpt_ResNet18.pth')
parser.add_argument('--unstrict', action='store_true', help='Flag for loading a partial model e.g. after BN merging.')

parser.add_argument('--optimizer', default="SGD", type=str, help='Available optimizers: Adam and SGD')
parser.add_argument('--model', default="none", type=str, help='Name of the Model e.g ResNetQuant18')
args = parser.parse_args()

if args.resume == True and args.resumeFile == "none":
    print('Invalid resume operation')
    exit(1)

device = 'cuda' if torch.cuda.is_available() else 'cpu'
best_acc = 0  # best test accuracy
start_epoch = 0  # start from epoch 0 or last checkpoint epoch

# Data
print('==> Preparing data..')
transform_train = transforms.Compose([
    transforms.RandomCrop(32, padding=4),
    transforms.RandomHorizontalFlip(),
    transforms.ToTensor(),
    transforms.Normalize((0.4914, 0.4822, 0.4465), (0.2023, 0.1994, 0.2010)),
])

transform_test = transforms.Compose([
    transforms.ToTensor(),
    transforms.Normalize((0.4914, 0.4822, 0.4465), (0.2023, 0.1994, 0.2010)),
])



trainset = torchvision.datasets.CIFAR10(
    root='/opt/datasets/CIFAR10', train=True, download=False, transform=transform_train)
trainloader = torch.utils.data.DataLoader(
    trainset, batch_size=64, shuffle=True, num_workers=2) #og bs = 128

testset = torchvision.datasets.CIFAR10(
    root='/opt/datasets/CIFAR10', train=False, download=False, transform=transform_test)
testloader = torch.utils.data.DataLoader(
    testset, batch_size=50, shuffle=False, num_workers=2) #og bs = 100

classes = ('plane', 'car', 'bird', 'cat', 'deer',
           'dog', 'frog', 'horse', 'ship', 'truck')

# Model
print('==> Building model..')
if(args.model == "none"):
    # net = VGG('VGG19')

    net = ResNet18
    #net = ResNet50
    #net = ResNetQuant18
    #net = ResNetQuant34
    #net = ResNetQuant50
    #net = ResNetQuant101
    #net = ResNetQuant152

    # net = PreActResNet18()
    # net = GoogLeNet()
    # net = DenseNet121()
    # net = ResNeXt29_2x64d()
    # net = MobileNet()
    # net = MobileNetV2()
    # net = DPN92()
    # net = ShuffleNetG2()
    # net = SENet18()
    # net = ShuffleNetV2(1)
    # net = EfficientNetB0()
    # net = RegNetX_200MF()
    # net = SimpleDLA()
else:
    program_path = os.path.dirname(os.path.abspath(__file__))
    full_model_path = os.path.join(program_path, args.modelPath)

    sys.path.append(full_model_path)

    try:
        module = importlib.import_module(args.modelFile)

        if hasattr(module, args.model):
            net = getattr(module, args.model)
        else:
            print(f"Error: Function '{args.model}' not found in module '{args.modelFile}'.py.")
            exit(1)

    except ImportError:
        print(f"Error: Failed to import module '{args.model}' from '{full_model_path}'.")
        exit(1)

net_name = str(net.__name__)

if "Quant" in net_name:
    net = net(args.weights)
else:
    net = net()

net = net.to(device)

if device == 'cuda':
        net = torch.nn.DataParallel(net)
        cudnn.benchmark = True

if args.resume:
    # Load checkpoint.
    print('==> Resuming from checkpoint..')
    assert os.path.isdir('checkpoint'), 'Error: no checkpoint directory found!'
    
    #checkpoint = torch.load('./' + args.resumeFile, strict = args.strict)
    #net.load_state_dict(checkpoint['net'])
    
    checkpoint = torch.load('./' + args.resumeFile)
    if args.unstrict is True: 
        net.load_state_dict(checkpoint['net'], strict = False)
    else:
        net.load_state_dict(checkpoint['net'])

    net = net.to(device)
    best_acc = checkpoint['acc']
    start_epoch = checkpoint['epoch']

if runInference:
    image = Image.open('test_img_17_horse.png')
    image = transform_test(image)
    image = image.unsqueeze(0)
    image = image.to(device)

    with torch.no_grad():
        net.eval()
        out = net(image)

    _, predicted = torch.max(out, 1)
    print('Predicted: ', classes[predicted.item()])
    exit(0)


criterion = nn.CrossEntropyLoss()

if args.optimizer == "SGD":
    optimizer = optim.SGD(net.parameters(), lr=args.lr,
                          momentum=0.9, weight_decay=0.000025) #og weight_decay=0.0001
elif args.optimizer == "Adam":
    optimizer = optim.Adam(net.parameters(), lr=args.lr,
                          betas=(0.9, 0.999), weight_decay=0)

scheduler = torch.optim.lr_scheduler.CosineAnnealingLR(optimizer, T_max=200)

best_acc_quant = 0

# Training
def train(epoch):
    print('\nEpoch: %d' % epoch)
    net.train()
    train_loss = 0
    correct = 0
    total = 0
    for batch_idx, (inputs, targets) in enumerate(trainloader):
        inputs, targets = inputs.to(device), targets.to(device)
        optimizer.zero_grad()
        outputs = net(inputs)
        loss = criterion(outputs, targets)
        loss.backward()
        optimizer.step()

        train_loss += loss.item()
        _, predicted = outputs.max(1)
        total += targets.size(0)
        correct += predicted.eq(targets).sum().item()

        progress_bar(batch_idx, len(trainloader), 'Loss: %.3f | Acc: %.3f%% (%d/%d)'
                     % (train_loss/(batch_idx+1), 100.*correct/total, correct, total))


def test(epoch):
    global best_acc
    global best_acc_quant
    net.eval()
    test_loss = 0
    correct = 0
    total = 0
    with torch.no_grad():
        for batch_idx, (inputs, targets) in enumerate(testloader):
            inputs, targets = inputs.to(device), targets.to(device)
            outputs = net(inputs)
            loss = criterion(outputs, targets)

            test_loss += loss.item()
            _, predicted = outputs.max(1)
            total += targets.size(0)
            correct += predicted.eq(targets).sum().item()

            progress_bar(batch_idx, len(testloader), 'Loss: %.3f | Acc: %.3f%% (%d/%d)'
                         % (test_loss/(batch_idx+1), 100.*correct/total, correct, total))

    # Save checkpoint.
    acc = 100.*correct/total
    if acc > best_acc:
        print('Saving..')
        state = {
            'net': net.state_dict(),
            'acc': acc,
            'epoch': epoch,
        }
        if not os.path.isdir('checkpoint'):
            os.mkdir('checkpoint')
        #torch.save(state, './checkpoint/ckpt_' + net_name + '.pth')
        #torch.save(state, './checkpoint/ckpt_' + net_name + '_converted.pth')
        if args.id == "":
            torch.save(state, './checkpoint/' + net_name + '/ckpt_' + net_name + '_' +
                       str(acc) + '.pth')
        else:    
            torch.save(state, './checkpoint/' + net_name + '/ckpt_' + net_name + '_' + 
                       args.id + '_' + str(acc) + '.pth')
        best_acc = acc

    elif acc > best_acc_quant and "Quant" in net_name:
        print('Saving 2nd best..')
        state = {
            'net': net.state_dict(),
            'acc': acc,
            'epoch': epoch,
        }
        if not os.path.isdir('checkpoint'):
            os.mkdir('checkpoint')
        #torch.save(state, './checkpoint/ckpt_' + net_name + '.pth')
        #torch.save(state, './checkpoint/ckpt_' + net_name + '_converted.pth')
        if args.id == "":
            torch.save(state, './checkpoint/' + net_name + '/ckpt_' + net_name + '_' +
                       str(acc) + '.pth')
        else:    
            torch.save(state, './checkpoint/' + net_name + '/ckpt_' + net_name + '_' + 
                       args.id + '_' + str(acc) + '.pth')
        best_acc_quant = acc

        print('\nDifference to best model:' + str(best_acc) + '-' + str(best_acc_quant) + 
              '=' + str(round(best_acc - best_acc_quant, 2)))


for epoch in range(start_epoch, start_epoch+100):
    train(epoch)
    test(epoch)
    before_lr = optimizer.param_groups[0]["lr"]
    scheduler.step()
    after_lr = optimizer.param_groups[0]["lr"]
    print("Epoch %d: lr %.5f -> %.5f" % (epoch, before_lr, after_lr))

results = open("results.txt", "a")
results.write(net_name + " with lr="+ str(args.lr) +":\n")
results.write("best acc = " + str(best_acc) + "%\n")
results.write("stopped at epoch = " + str(start_epoch+100) + "\n\n")
results.close()
