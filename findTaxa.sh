#!/bin/bash
#SBATCH -J findLoci
#SBATCH -o findLoci_%A_%a.out
#SBATCH -e findLoci_%A_%a.err
#SBATCH --array=1-71
#SBATCH -n 10 -N 1
#SBATCH -p short
#SBATCH	--mem=8G
#SBATCH -t 24:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yelena.pacheco@usda.gov



#this script was used to find 'low loci taxa' in gene trees 

infile=$(cat lowLociTaxa_10.txt | head -n ${SLURM_ARRAY_TASK_ID} | tail -n1)

grep ${infile} *.treefile >> loci_with_lowLociTaxa.txt 