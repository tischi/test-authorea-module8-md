Prefiltering to enhance filamentous voxels
==========================================

Introduction
------------

The datasets used here exhibit a high contrast so that a simple
intensity based thresholding is almost sufficient to distinguish tube
from background voxels. However in case of higher noise and/or uneven
sample staining one may need to filter the data prior to thresholding. A
good criterion to follow for this operation is to notice that a voxel is
part of a filament if there is one direction along which the intensity
is quite constant (along the filament) and two perpendicular directions
along which the intensities quickly drop (perpendicular to the
filament). The ImageJ command computes a metric reflecting to what
extent a voxel and its local neighborhood fulfill this criterion. The
implemented algorithm is based on [@Sato1998].

Workflow
--------

Select the output image of above section (”Closed.tif”).

Enhance filamentous voxels

:   \
    Use the command on the data (after the morphological closing) and
    check the result for different “Sigma”, which controls the size of a
    Gaussian filter that is applied before the actual ”Tubeness”
    computation. This Gaussian pre-filtering indirectly determines the
    size of the neighbourhood taken into account for computation of the
    local intensity distribution.

    Sensible values are in the range of 6 to 8 micrometers but you can
    experiment with different values. It is in fact usually almost
    impossible to find a value that is optimal for both the smallest and
    the largest vessels.

    You will notice that the contrast is greatly enhanced after the
    filtering but voxels close to vessel branch points might be forced
    to zero as their neighborhood do not strictly follow the definition
    of being filamentous. If this problem is too pronounced it is
    possible to perform another pass of morphological closing after the
    pre-filtering to “repair” these gaps in the network.

Generate an ImageJ macro script
-------------------------------

Implement a macro performing above operations.
