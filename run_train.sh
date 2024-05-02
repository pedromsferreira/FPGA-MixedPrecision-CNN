model=$1

# python3 main.py --model=ResNetQuant50 \
#                 --lr=0.001 \
#                 -r \
#                 --resumeFile=checkpoint/ResNetQuant50/ckpt_ResNetQuant50_w4_2_86.09.pth \
#                 --weights 4 2 \
#                 --id=w4_2

# --resumeFile=checkpoint/ckpt_ResNet18_92.88_to_w4_2.pth \
#Resume training from converted Float .pth
# python3 main.py --model=ResNetQuant18 \
#                 --optimizer=SGD \
#                 --lr=0.0001 \
#                 -r \
#                 --resumeFile=checkpoint/ckpt_ResNet18_92.88_to_w4_2.pth \
#                 --modelFile=resnetQuant \
#                 --weights 4 2 \
#                 --id=w4_2

#Retrain Float model
# python3 main.py --model=ResNet50 \
#                 --lr=0.0001 \
#                 -r \
#                 --resumeFile=checkpoint/ResNet50/ckpt_ResNet50_90.33.pth 

#After BN merge
# python3 main.py --model=ResNetQuantMerged18 \
#                 --optimizer=Adam \
#                 --modelFile=resnetQuantMerged \
#                 --unstrict \
#                 --lr=0.0001 \
#                 -r \
#                 --resumeFile=bnMerger/output/ckpt_ResNetQuant18_w4_2_93.2.pth \
#                 --weights 4 2 \
#                 --id=w4_2

python3 main.py --model=ResNetQuantMerged18 \
                --optimizer=SGD \
                --modelFile=resnetQuantMerged \
                --lr=0.000095 \
                -r \
                --resumeFile=checkpoint/ResNetQuantMerged18/ckpt_ResNetQuantMerged18_w4_2_91.3.pth \
                --weights 4 2 \
                --id=w4_2
