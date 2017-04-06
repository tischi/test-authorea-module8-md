Extraction of biologically relevant parameters
==============================================

Introduction
------------

As was previously motivated in section \[sec:mod8lab0\] the density of
the vascularization and branching points and the thickness of the
vessels are crucial age indicators to understand how a tumour developed
and possibly necrosed. We will now estimate these parameters on the
segmented data.

Workflow
--------

Generate an ImageJ macro script

:   \
    The computation of the biologically relevant parameters cannot be
    achieved via the ImageJ menu, but you have to write an ImageJ macro.

Vessel length and number of branch points

:   \
    To compute the total vessel length you have to loop through the
    entries of the results table that you got from and add up and/or
    multiply the respective entries in the respective columns (”\#
    Branches”, ”Average Branch Length”). In addition to for-looping
    through the rows of the results table, you will need the macro
    function in order to extract the values from the table.

Vessel volume and total imaged volume

:   \
    To compute the total vessel volume you should use the information
    obtained from the ImageJ macro function . The volume can be
    expressed in voxel units or in physical unit. For the conversion the
    calibration can be retrieved with .

Density of vascularization

:   \
    To derive the density of vascularization one needs to compute the
    fraction of space occupied by the vessels. This can be done by
    dividing the volume previously computed by the total imaged volume,
    which you can compute using a combination of the following
    functions:

    -   -   -   

Vessel width

:   \
    The average vessel width can readily be computed from the parameters
    we previously extracted... can you figure out how?

Generate an ImageJ macro script
-------------------------------

Implement a macro perfroming the above operations.

**** : The easiest way is to estimate the average section of the vessels
and then only to derive their average thickness by assuming their
section is close to a disk.
