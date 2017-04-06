//////////////////////////////////
// Graphical user interface (7) //
//////////////////////////////////

getPixelSize(unit, px, py, pz);
Dialog.create("TubeAnalyst");
Dialog.addNumber("Tube radius ("+unit+")", 6);
Dialog.addNumber("Vessel radius ("+unit+")", 8);
Dialog.addNumber("Vessel threshold", 8); //-1: man. calibration  
Dialog.addNumber("Minimum vessel volume (pixels)", 1000);
Dialog.addNumber("Dilate Skeleton for viewing by (pixels)", 2);
Dialog.addNumber("Number of threads", 8);
Dialog.show;

ClosingRadius = Dialog.getNumber();
VesselRadius = Dialog.getNumber();  
VesselThreshold = Dialog.getNumber();
VesselVolumeThreshold = Dialog.getNumber();
VisualisationDilation = Dialog.getNumber();