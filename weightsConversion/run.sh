python3 blankGenerator.py --modelFile=resnetQuant.py \
                          --model=ResNetQuant18 \
                          --modelPath=../models \
                          --output=./placeholder.pth \
                          --modelWeights 4 2

python3 weightsConverter.py --original=../checkpoint/ResNet18/ckpt_ResNet18_92.88.pth \
                            --blank=placeholder.pth \
                            --out=../checkpoint/ckpt_ResNet18_92.88_to_w4_2.pth