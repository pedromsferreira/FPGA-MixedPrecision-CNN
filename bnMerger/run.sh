echo $'\n'=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/
echo Running bnMerger.py
echo =/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/$'\n'
python3 bnMerger.py --input=checkpoint/ResNetQuant18/ckpt_ResNetQuant18_w4_2_93.2.pth \
                    --output=ckpt_ResNetQuant18_w4_2_93.2.pth \
                    --modelFile=resnetQuant \
                    --modelPath=models \
                    --model=ResNetQuant18 \
                    --modelParams "num_classes=10,output_stride=16" \
                    --weights 4 2 \
                    --layers=18 \
                    --activations=8