/////////////////////////////////////////////////////////
// Extraction of biologically relevant parameters (6) //
//////////////////////////////////////////////////////////

// Needs the following tables and images:
// Table: Skeleton Results
// Image: BinarizedTubes.tif

getPixelSize(unit, px, py, pz);

// Total vessel length
IJ.renameResults("Skeleton Results", "Results"); // make table accessible
totalLength = 0;
nBranches = 0;
for(i=0; i<nResults; i++) {
	totalLength = totalLength + getResult("# Branches", i)*getResult("Average Branch Length", i);
	nBranches = nBranches + getResult("# Branches", i);	
}
IJ.renameResults("Results","Skeleton Results"); // prevent table from being overwritten 

// Total imaged and blood vessels volumes
selectWindow("BinarizedTubes.tif"); // image containing the segmented vessels
Stack.getStatistics(voxelCount, mean, min, max, stdDev);
totalImagedVolume = voxelCount*px*py*pz;
totalVolume = voxelCount*mean/255*px*py*pz;

// Mean vessel x-section and diameter
meanCrosssection = totalVolume / totalLength;
meanDiameter = 2*sqrt(meanCrosssection/PI);

print("");
print("");
print("Results");
print("----------");
print("Pruning = " + d2s(PruneEnds,0));
print("Total length = " + d2s(totalLength,2) + " " + unit);
print("Number of branches = " + d2s(nBranches,0) ); 
print("Average branch length = " + d2s(totalLength/nBranches,2) + " " + unit); 
print("Mean vessel cross-section = " + d2s(meanCrosssection,2) + " " + unit + "^2");
print("Mean vessel diameter = " + d2s(meanDiameter,2) + " " + unit);
print("Total vessel volume = " + d2s(totalVolume,2) + " " + unit + "^3" );
print("Total imaged volume = " + d2s(totalImagedVolume,2) + " " + unit + "^3");
print("Volume fraction occupied by vessels = " + d2s(totalVolume/totalImagedVolume,2) );