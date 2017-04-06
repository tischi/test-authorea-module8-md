Morphological closing of tubular structures
===========================================

Introduction
------------

As the overall aim of the project is to trace the blood vessel network,
we are not interested in the tubes’ hollow structure. In fact, for
segmentation it would be easier if the tubes were plain, because then we
would not have to deal with dark ”none-tube-voxels” inside bright
”tube-voxels”. Our first task is thus to try to ”fill” the tubes, using
grayscale morphological closing ([@vincent1993morphological].

Workflow
--------

\
Open and view the data in Fiji using the following commands:

Open file: ”../bloodvessels\_small.tif”

View in 3D:

Change brightness (in 3D viewer menu):

\
As the resolution of the dataset can be assumed reasonably isotropic and
since the tubes can have any orientation we will use a spherical
structuring element for the morphological closing. Select the CloseGray
filter in with same kernel radius in all dimensions. A closing radius of
6 to 8 micrometers (3 to 4 voxels) is a sensible value for the dataset.
This will not completely close the largest vessels however increasing
the closing radius might merge the closest small vessels, so you have to
go for a compromise here. If you have time it is very instructive to
also perform this grayscale closing operation by manually performing
first a Maximum filter followed by Minimum filter.

Generate an ImageJ macro
------------------------

Implement a macro performing above operations.

: In the dialog box of the filters it is possible to input the radius in
physical units or in pixels but only the radius in pixel shows up in the
macro recorder. As it is convenient to input a radius in physical units
you could write code to convert from micrometers to pixel units before
calling the filter. For this you will require the macro function . In
general, to combine numbers with the text strings as ImageJ plugin
arguments you need , which converts a number m to a string keeping n
decimals.
