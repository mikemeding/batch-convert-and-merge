// Batch Merge Files
requires("1.33s"); 
//setBatchMode(true);

dir = getDirectory("Choose a Directory ");
print("======== Running Merge Files Macro ========");
listFiles(dir);                                               //print list of the current directory

function listFiles(dir) {
 directories = getFileList(dir);                              // list of directories in the given directory
 for (i = 0; i < directories.length; i++) {                   // for each of those directories
    print("================================================");
    print(dir+directories[i]);
    fileList = getFileList(dir+directories[i]);
    paths = getUniquePaths(dir+directories[i], fileList);     // run merge of all images
    print("uniquePaths: ");
    Array.print(paths);
    for(y = 0; y < paths.length; y++) {                       // for each unique path
      absolutePath = dir+directories[i];
      c7 = paths[y] + "1";
      c6 = paths[y] + "2";
      c5 = paths[y] + "3";
      mergeImages(absolutePath, c7, c6, c5);
    }
 }
} 

function getUniquePaths(dir, imageFiles) {
 
 uniquePaths = newArray();                                     // create new empty array
 for (i = 0; i < imageFiles.length; i++) {
   commonName = getCommonName(imageFiles[i]);
   containsName = arrayContains(uniquePaths, commonName);
   if(containsName == "null") {
     uniquePaths = Array.concat(uniquePaths, commonName);   // add new unique name
   } 
 }
 return uniquePaths;
}

function getCommonName(fileName) {
 parts = split(fileName, "_");
 commonName = parts[0] + "_" + parts[1] + "_" + parts[2] + "_";
 return commonName;
}

function arrayContains(array, item) {
 var contains = "null";
 for (i = 0; i < array.length; i++) {
   if(array[i] == item) {
     contains = item;
   }
 }
 return contains;
}

function lastInPath(path) {
 array = split(path, "/");
 return array[array.length -1] // return last item in array (filename)
}

function mergeImages(dir, c7, c6, c5) {
 // setup file names
 print("dir: " + dir);
 print("lastInPath(): " + lastInPath(dir));
 c7File = ""+ lastInPath(dir) + "/" + c7 + ".tif";
 c6File = ""+ lastInPath(dir) + "/" + c6 + ".tif";
 c5File = ""+ lastInPath(dir) + "/" + c5 + ".tif";
 print("c7: " + c7File);
 print("c6: " + c6File);
 print("c5: " + c5File);
 outfile = substring(c7,0,(lengthOf(c7)-1)) + "4.tif";
 print("outfile: " + outfile);

 // open files
 open(c7File);
 open(c6File);
 open(c5File);
 run("Merge Channels...", "c7=["+c7+".tif"+"] c6=["+c6+".tif"+"] c5=["+c5+".tif"+"] keep");
 run("RGB Color");
 saveAs("tiff", dir+outfile);
 wait(1000);
 close("*");
}

