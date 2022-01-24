# Nudged Elastic Band Tutorial

 A simple walkthrough and template for NEB runs on VASP.

When I worked in a computational materials research group, I had to run Nudged Elastic Band simulations. Finding tutorials and/or templates for this on VASP where pretty diffuicult.

I decided to put together a simple template for VASP, which incloves NEB runs using the VTST packages and phonon frequency runs

## The Basics

We use NEB runs to find the transition state of a reaction pathway. We start with an initial and final state and choose how many points("images") in the pathway we would like to calculate. We interpolate between the points to give us a good inital guess, and run a standard VASP run in the same directory as all our NEB files albeit with a few modificiations to the INCAR input file.

At this point, a standard NEB run would output an NEB band of for example, an N2O bond dissociation on a Pt (100) surface scenario, might look like this:

![NEB run](C:\Users\12269\Downloads\Picture1.png)

The issue here is there is no one specific image that seems to correspond to the transition state, because a TS would be a saddle point in a band like this.

To overcome this, we use the Climbing Image-NEB method. Here, one single image is allowed to "climb" and you end up with a saddle point.

A successful CI-NEB run would look liek this:

![CI-NEB run](C:\Users\12269\Downloads\Picture2.png)
