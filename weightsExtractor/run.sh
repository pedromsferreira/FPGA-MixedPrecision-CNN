echo $'\n'=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/
echo Running weightsExtractor.py
echo =/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/$'\n'
python3 weightsExtractor.py --input=checkpoint/ResNetQuantMerged18/ckpt_ResNetQuantMerged18_w4_2_91.3.pth \
                            --modelFile=resnetQuantMerged \
                            --modelPath=models \
                            --model=ResNetQuantMerged18 \
                            --modelParams "num_classes=10,output_stride=16" \
                            --weights 4 2 \
                            --activations=8 

#cat all bins
rm -f memfile.bin
ls output | while read p; do cat output/$p >> memfile.bin; done