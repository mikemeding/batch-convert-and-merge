# ./20.01/LeftPL/20.01_LeftPL_7_1.tif
import sys
from PIL import Image

imgPath = str(sys.argv[1])
print('Grayscale converting: ' + str(sys.argv[1]))

img = Image.open(imgPath).convert('L')
img.save(imgPath)
