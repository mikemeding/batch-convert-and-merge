# ./20.01/LeftPL/20.01_LeftPL_7_1.tif
import sys
import imageio

print('Processing: ' + str(sys.argv[1]))

imgPath = str(sys.argv[1])

image = imageio.imread(imgPath)
image = image * (2 ** 24)  # convert from 8 bit to 32 bit
# image = image * (2 ** 8)  # convert from 8 bit to 16 bit
image = image.astype('uint32')
# image = image.astype('uint16')
# imageio.imwrite('test.tif', image)
imageio.imwrite(imgPath, image)  # overwrite image
