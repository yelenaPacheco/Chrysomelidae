#!/bin/bash
#SBATCH -J removeTrees
#SBATCH -n 20 -N 1
#SBATCH -p short,scavenger
#SBATCH -t 24:00:00
#SBATCH -e removeTrees_%A.err
#SBATCH -A aphid_phylogenomics
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yelena.pacheco@usda.gov



for f in $(cat removeTrees.list) ; do 
  rm ${f}
done