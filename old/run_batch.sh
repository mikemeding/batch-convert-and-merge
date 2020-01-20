rm -f filenames.txt # remove existing filenames.txt if it exists
rm -rf __MACOSX # remove __MACOSX archive folder if it exists
find 20.01 -name ".*" -exec rm -fv {} \; # remove dot files
find . -path ./__MACOSX -prune -o -name \*1.tif -type f > filenames.txt
find . -path ./__MACOSX -prune -o -name \*3.tif -type f >> filenames.txt
#while IFS= read -r line
#do
  #echo "$line"
#  python image_to_grayscale.py $line
#  python image_to_32bit.py $line
#done < "filenames.txt"
