# Nudged Elastic Band Tutorial

A simple walkthrough and template for NEB runs on VASP.

When I worked in a computational materials research group, I had to run Nudged Elastic Band simulations. Finding tutorials and/or templates for this on VASP were pretty diffuicult.

I decided to put together a simple template for VASP, which includes NEB runs using the VTST packages and phonon frequency runs.

## The Basics

We use NEB runs to find the transition state and energy barrier of a reaction pathway. We start with an initial and final state and choose how many points("images") in the pathway we would like to calculate. We interpolate between the points to give us a good initial guess, and run a standard VASP run in the same directory as all our NEB files albeit with a few modificiations to the INCAR input file.

An NEB band of for example, an N2O bond dissociation on a Pt (111) surface scenario, might look like this:

![Picture1](https://user-images.githubusercontent.com/97717818/150759260-808f9c90-c2c8-4703-817d-5cffe4634e89.png)

The issue here is there is no one specific image that seems to correspond to the transition state, because a TS would be a saddle point.

To overcome this, we use the Climbing Image-NEB method. Here, one single image is allowed to "climb" and you end up with a saddle point.

A successful CI-NEB run would generate an NEB band like this:

![Picture2](https://user-images.githubusercontent.com/97717818/150759808-ce092e86-46cd-4821-8152-5e93854bf2c1.png)

In this case, there appear to be two saddle points. To confirm which one is the TS, we conduct vibrational frequency calculations at the two images. A TS has exactly one imaginary frequency, so that would be a indicator of which of the two saddle points is the real TS.
