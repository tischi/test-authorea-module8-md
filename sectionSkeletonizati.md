Skeletonization and analysis of the tubular network
===================================================

Introduction
------------

In order to measure the network length and to count its branch points we
will reduce the segmented tubes (which have a certain thickness) to
their 1 voxel wide center lines. This process is called
“Skeletonization”. To identify the branch and end points of the
skeletonized network one can use the following observations:

-   End-point voxels have less than 2 neighbors.

-   Junction voxels have more than 2 neighbors.

-   Slab voxels (remaining voxels) have exactly 2 neighbors.

To perform these tasks we will use and (see [@Arganda-Carreras2010]).
Skeletonization is based on a specific connectivity. For 3D images
ImageJ uses 26 neighbor per voxel by default.

Workflow
--------

Skeletonization

:   \
    The label mask first needs to be binarized (all non zero voxels are
    objects) using with a lower threshold of 1 gray value. After this
    you can skeletonize the binary image using . In order to visually
    check the skeletonization you may overlay the binary mask (or the
    original data) with the skeleton using for instance the command .
    The original image might be assigned the gray channel and the
    skeleton the red channel.

Skeleton analysis

:   \
    Use to analyze the skeleton (for the moment leave all pruning
    options unchecked). Examine the image output, which has the
    following color-coding:

    -   End-point voxels: Gray value of 30, appearing blue.

    -   Junction voxels: Gray value 70, appearing purple.

    -   Slab voxels: Gray value 127, appearing red.

    Examine the output table which not only contains the number of
    voxels falling into the three different classes but also the total
    length of the skeleton as well as their total number of end-points
    and junctions. If there are several disconnected skeletons in the
    image the statistics are reported for each of them. Observe that the
    number of junctions is smaller than the number of junction voxels,
    because at each junction there may be more than one voxel with more
    than two neighbors.

Skeleton 3D visualization

:   \
    Visualize the analyzed skeleton in the 3D viewer. You may realize
    that it is not looking very nice, because it is only one voxel
    thick. Also the difference between slab, endpoint and branch voxels
    is not easy to see.

    : Figure out a way to alter the skeleton for 3D visualization
    purposes.

    : Change the value of the voxels by applying ; find an adequate
    combination of values and LUT, finally thicken the skeleton by
    dilating it in 3D. Be very careful when choosing the new values
    assigned to junction and end points as these voxels might be
    overwritten by close by slab voxels after dilation (local maximum
    operation).

Generate an ImageJ macro script
-------------------------------

Implement a macro performing above operations.
