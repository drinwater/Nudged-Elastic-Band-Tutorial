# NEB runs

## Pre-run checks

For problematic cases like our example, the first step would be to re-relax the end-points with minimal precision settings. Set ```IOPT=0```, ```IBRION = 3```, ```EDIFFG = -0.01``` ev/A, and ```POTIM = 0.1```.

Now that the end-points are re-relaxed, this would help us reach convergence in our NEB runs faster and better.

## NEB run

Create a new directory titled 'NEB' and change into it:

```$ mkdir NEB```

```$ cd NEB```

Create directories named 00, 01, 02, etc. upto n+2 directories, where n  is the number of images of interest. For our example, we shall choose 5 images.

```$ for i in {0..6}; do mkdir 0$i; done```

Copy the CONTCAR and OUTCAR files from the endpoint runs into the 00/ and 06/ directories.

```$ cp ../path/to/initial/run/CONTCAR 00/POSCAR```

```$ cp ../path/to/initial/run/OUTCAR 00/```

```$ cp ../path/to/final/run/CONTCAR 06/POSCAR```

```$ cp ../path/to/final/run/OUTCAR 06/```

Interpolate between the endpoints using the ```nebmake.pl``` script from the VTST package. Note: you need to have the Perl software installed.

```$ nebmake.pl 00/POSCAR 06/POSCAR 5```

Set up the KPOINTS file as usual, make sure to generate the POTCAR file. Generate the INCAR file as usual, albeit with a few additions. Set ```LCLIMB = .TRUE.``` to turn on the Climbing Image NEB method. Set ```IOPT = 3``` to use the force-based QM optimizer tht comes with the VTST version of VASP. Set ```TIMESTEP = 0.1```, ```IMAGES = 5```, ```IBRION = 3```, ```POTIM = 0.0``` and ```SPRING = -5```.

Run VASP as usual in the NEB home directory.

```$ mpirun vasp_std```

This will run the NEB calculations and relax every image to below the convergence criterion. Note that the endpoints are NOT relaxed! Each directory will have the usual set of VASP output files. The ones of interest to us now are the OUTCAR files.

## Post-processing

Once the run is complete and VASP has exited without errors, we can go ahead and plot our NEB band. We can make use of the ```nebef.pl``` script from the VTST package to obtain the energies and forces of the images, and further use the energies to plot the NEB band.

```$ nebef.pl```

![Picture2](https://user-images.githubusercontent.com/97717818/150759808-ce092e86-46cd-4821-8152-5e93854bf2c1.png)

We now see two peaks and need to confirm the first peak is the TS using vibrational frequency calculations.