#!/bin/bash
#SBATCH -J container-test
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=1:00:00
#SBATCH --mem=4GB
#SBATCH --partition=batch

# Print key runtime properties for records
echo Master process running on `hostname`
echo Directory is `pwd`
echo Starting execution at `date`
echo Current PATH is $PATH

# Launch singularity container and execute python command to run tf_NN.py
singularity exec $HOME/container-test/container-test.simg Rscript $HOME/container-test/scripts/make-output.R
