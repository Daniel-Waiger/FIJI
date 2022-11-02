/* Created by Daniel Waiger, Faculty of agriculture, HUJI; For: Noa Noach, Faculty of agriculture
*/

//Selecting outputfolder for analyzed images
output_path = getDirectory("Choose output folder");

//Opening an image file
run("Open...");

//Getting the original filename
orgName = getTitle();

//Change color to gray
run("Grays");

//Creating 2D image
run("Z Project...", "projection=[Sum Slices]");

//Creating a copy and rename
run("Duplicate...", "title=" + orgName + "_median.tif");

//Despeckle background noise
run("Median...", "radius=5");

//Detecting taget gray values
setAutoThreshold("MinError dark");
//run("Threshold...");

//Selecting parameters to measure
run("Set Measurements...", "area mean min area_fraction display redirect=None decimal=3");

//Connected components analysis
run("Analyze Particles...", "size=10-Infinity pixel display clear summarize add");


//Saving ROI, Summary and results
roiManager("Save", output_path + orgName + "_RoiSet.zip");
saveAs("Results", output_path + orgName + "_Summary.csv");
saveAs("Results", output_path + orgName + ".csv");

