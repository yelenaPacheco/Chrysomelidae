#!/bin/bash
#SBATCH -J ortho
#SBATCH -o ortho_%A.out
#SBATCH -e ortho_%A.err
#SBATCH -n 40 -N 1
#SBATCH -p short,scavenger
#SBATCH -t 7-00:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yelena.pacheco@usda.gov


module load orthofinder/2.5.5

orthofinder -f orthoFinder -t 40