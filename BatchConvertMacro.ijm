macro "Batch Convert" {
    requires("1.33s");
    setBatchMode(true);  // ignore GUI and process in background
    fileString = File.openAsString("");  // opens file dialog
    lines=split(fileString,"\n")
    for (i=0; i<lines.length; i++) {
      if (!File.exists(lines[i]))
        exit("No such file: "+lines[i]);
      print("Processing: "+lines[i]);
      open(lines[i]);  // open image
      run("32-bit");  // convert to 32-bit
      save(lines[i]);  // save over original
      close();  // close file
    }
    print("Done.");
}
 
