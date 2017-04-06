Skeleton pruning and holes closing (Optional)
=============================================

Introduction
------------

Depending on the roughness and thickness of the tubes in the raw data
the computed skeleton may contain false positive short branches and/or
false positive small loops. These can eventually be removed by a process
called “pruning”. We will test the different pruning algorithms
implemented in .

Workflow
--------

End-point pruning

:   \
    Remove all branches containing exactly one end-point by checking the
    “Prune ends” option in . Carefully examine the image and check
    whether the pruning is always working as you would expect (see also
    figure  \[fig:prune\]).

    ![Skeleton annotation and pruning. Slab voxels are white, junction
    voxels are red and end-point voxels are blue. Images are projections
    of 3D data and were subject to different processing steps: (Left)
    Skeletonization =&gt; Analysis. (Center Left) Skeletonization =&gt;
    Analysis with end-pruning. (Center Right) Skeletonization =&gt;
    Analysis with end-pruning =&gt; Analysis. (Right) Skeletonization
    =&gt; Analysis with end-pruning =&gt; Skeletonization =&gt;
    Analysis.[]{data-label="fig:prune"}](fig/PruningStack--Montage.jpg){width="100.00000%"}

Circular pruning

:   \
    Sometimes, especially when the cross-section of the tubes is large
    the skeletonization can lead to (small) false circular skeleton
    parts. If this is the case in your data try the “Prune cycle method”
    options of and check if it helped removing the false cycles.\
    : One may consider additional algorithms; for instance to only
    remove branches up to a specified minimum length, however this is
    currently not implemented in . You should be very cautious with the
    pruning as important features of the network such as real loops and
    end point segments may also be removed. Using it or not boils down
    to a trade-off between removing spurious branches and removing real
    network branches. It is always better to try to obtain a good
    segmentation mask in the first place but, as you will notice, it is
    not easy to properly segment small and large vessels with such a
    simple image processing pipeline.

Fill Holes

:   \
    The cycles in the large vessels usually originate from holes inside
    the segmented vessels, the problem can hence be mitigated by filling
    these holes in the binary mask before the skeletonization. This can
    be performed either in the 3D domain with or in 2D with . In this
    last case we must specify in the command call that the operation
    should be applied to the whole stack (slice by slice).

    : More pixels will always be filled when the operation is performed
    in 2D, as a 2D hole appearing in a particular slice (e.g. a disk
    inside a cylinder) is not necessarily part of a 3D hole (the
    converse being true). In turn, 2D hole filling can generate some
    artifacts if the vessels form closed loops.

Morphological Closing

:   Sometimes the large vessels of the binary mask are not only hollow
    but a hole is pierced in their outside. These defects can lead to
    spurious small branches in the skeleton (as we saw before). If the
    holes are not too large they can be filled in by morphological
    closing of the binary mask. If you have time you can try this out.

**** : The simple workflow proposed in this practical is working
reasonably well on the datasets we acquired, but, as we saw, it is
pretty limited when it comes to segment a mixture of thin and thick
vessels in the same stack. It cannot compete with some high accuracy
filament tracing methods, some of which are reviewed in
[@lesage2009review]. More specifically, a very clever method is
described in [@li2006vessels].
