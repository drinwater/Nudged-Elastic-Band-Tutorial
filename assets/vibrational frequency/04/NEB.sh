#!/bin/sh
#SBATCH -J phonon
#SBATCH -A DFT_XinLab
#SBATCH -p normal_q
#SBATCH -N 1 -n 128 # this requests 1 node, 1 core. 
#SBATCH --get-user-env
#SBATCH -t 1-00:00:00
mpirun vasp_std
