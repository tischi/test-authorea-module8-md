Overview
========

Aim
---

In this module we will implement a simple ImageJ macro to segment and
analyze the blood vessel network of a subcutaneous tumor (see figure
 \[fig:bloodvessels\]). The analysis is fully performed in 3D and
possible strategies to extract statistics of the network geometry and
interactively visualize the results are also discussed and implemented.

Introduction {#sec:mod8lab0}
------------

Segmenting and extracting the geometry of the blood vessel network
inside specific sub-regions of a tumor is a powerful investigation tool:
The density of the vascularization and vessel branching points and the
thickness of the vessels are for instance crucial age indicators to
understand how the structure developed and possibly necrosed. With the
help of a simple ImageJ macro these statistics can be extracted and the
network 3D rendered with judicious color/transparency to provide
insights on its organization.

datasets
--------

The blood vessel datasets were acquired by a custom made (IRB Barcelona)
macroSPIM allowing to image large (up to 1 cm), fixed and optically
cleared samples (pieces of organs, tumors, whole organisms...). The
preparation protocol and the imaging are similar to [@jahrling20093d].
For this project mice developing some specific tumors are injected a
rhodamine-lectin construct to stain their blood vessels before
sacrificing. **Important note** : Two stacks cropped from the original
dataset are provided, namely ”BloodVessels\_small.tif” and
”BloodVessels\_med.tif”. It is **highly recommended** to first work on
the smaller stack as processing time is not negligible. You may test the
final ImageJ macro on the larger stack.
