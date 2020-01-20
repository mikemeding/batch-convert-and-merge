// Batch Merge Files
requires("1.33s"); 
dir = getDirectory("Choose a Directory ");
setBatchMode(true);
count = 0;
countFiles(dir);
n = 0;
processFiles(dir);
//print(count+" files processed");
   
function countFiles(dir) {
   list = getFileList(dir);
   for (i=0; i<list.length; i++) {
       if (endsWith(list[i], "/"))
           countFiles(""+dir+list[i]);
       else
           count++;
   }
}

function processFiles(dir) {
   list = getFileList(dir);
   for (i=0; i<list.length; i++) {
       if (endsWith(list[i], "/"))
           processFiles(""+dir+list[i]);
       else {
          showProgress(n++, count);
          path = dir+list[i];
          processFile(path);
       }
   }
}

function filenameFromPath(path) {
   array = split(path, "/");
   return array[array.length -1] // return last item in array (filename)
}

function processFile(path) {
   if (endsWith(path, "_1.tif")) {
       // get absolute paths for all needed files
       C3 = path;
       C2 = substring(path, 0, lengthOf(path)-6) + "_3.tif";
       outfile = substring(path, 0, lengthOf(path)-6) + "_2.tif";

       // get ref filename
       print("C3="+filenameFromPath(C3));
       open(C3);
       print("C2="+filenameFromPath(C2));
       open(C2);
       print("out="+outfile);

       // run image merge of open files 
       run("Merge Channels...", "c2=["+filenameFromPath(C2)+"] c3=["+filenameFromPath(C3)+"] keep");
       saveAs("tiff", outfile);
       
       // close all image windows
       close("*");

       // convert images 1 & 3 to 32-bit
       print("convert: "+filenameFromPath(C3));
       open(C3);
       run("32-bit");
       save(C3);
       close();

       print("convert: "+filenameFromPath(C2));
       open(C2);
       run("32-bit");
       save(C2);
       close();
   }
}
