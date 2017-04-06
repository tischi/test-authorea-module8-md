Segmentation of tubular structures
==================================

Introduction
------------

In order to analyze the tubular network we need to decide whether a
voxel is a part of a tube or part of the background. To do so we will
threshold the data, i.e. assign voxels below or above a certain gray
value as background or object. Typically such thresholding also yields
spurious isolated voxels that are not part of the tubular network. We
will clean up such voxels based on the criterion that they are rather
isolated and not connected to many other voxels.

Workflow
--------

Convert previous (“Tubeness”) image to 8-bit

:   \
    This step is optional but it somewhat simplifies the following
    thresholding operation. You should be careful not to clip the
    intensities during the conversion: The easiest way is to find the
    voxel with minimum and maximum intensities in the stack by
    inspecting the stack histogram and setting the minimum and maximum
    intensity values of the display accordingly before the conversion
    with .

Generate a binary image

:   \
    Threshold the previous (“Tubeness”) image using (manual, global
    thresholding). We recommend to convert the image to 8 bit before
    thresholding as the Adjust Threshold interface works better with 8
    bit than with 32-bit format. The aim is to adjust the lower bound of
    the threshold so that most of the vessels are thresholded without
    getting merged (if you followed the previous 8-bit conversion step a
    lower bound intensity around 8 gray values should work fine for both
    datasets).

    ****: Automated thresholding methods

    If you have time you may explore some automated thresholding methods
    such as:

    -   -   

Clean up small objects

:   \
    Clean up object voxels that are isolated, i.e. not connected to a
    minimum number of neighboring object voxels. This can be done by
    using the “minimum volume” option of . You can compare the initial
    segmentation mask and the resulting label mask after running “3D
    Objects Counter” in order to see what objects have been discarded. A
    practical value for the minimum volume filter is around 1000 voxels
    but you can experiment with different values.

    ****: The voxels of the output have an intensity corresponding to
    the index of the connected object they are part of (label mask). The
    indexing starts at 1 and, depending on the active Look-Up Table
    (LUT), some objects can thus appear very faint. To better visualize
    the results it is handy to use the “Random.lut” (see section
    \[sec:mod8prereq\]). Just select it from or call from your macro
    script.

Generate an ImageJ macro script
-------------------------------

Write a macro performing above operations. The lower bound of the
threshold should be stored in a variable **VesselThreshold** and the
minimum volume for each connected components should be called
**VesselVolumeThreshold**.

**** : For a proper 8-bit conversion of the Tubeness image you need to
set the display to the minimum and maximum gray value of the image
stack. In a macro the minimum and maximum value of the stack can be
retrieved using and the current bounds of the display can be set by .
