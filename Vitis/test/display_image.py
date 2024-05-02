from PIL import Image as im
import numpy as np

with open("dataset/batches.meta.txt", "r") as f:
    refLabels = f.read().splitlines()

with open("dataset/test_maps.bin", "rb") as f, open("dataset/test_labels.bin", "rb") as l:
    for x in range(50):
        data1 = f.read(32*32)
        data2 = f.read(32*32)
        data3 = f.read(32*32)

        label = l.read(1)
        
        label = int.from_bytes(label, "big")
        print("\nTest image label is " + refLabels[label] + "\n")

        array1 = np.frombuffer(data1, dtype=np.uint8)
        array2 = np.frombuffer(data2, dtype=np.uint8)
        array3 = np.frombuffer(data3, dtype=np.uint8)

        array1 = array1.reshape((32, 32))
        array2 = array2.reshape((32, 32))
        array3 = array3.reshape((32, 32))
        rgbArray = np.dstack((array1, array2, array3))

        out = im.fromarray(rgbArray)
        out.save("images/test_img_" + str(x) + "_" + str(refLabels[label]) + ".png")


