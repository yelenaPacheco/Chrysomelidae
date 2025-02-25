#!/bin/bash
#SBATCH -J convert
#SBATCH -o conver_%A_%a.out
#SBATCH -e convert_%A_%a.err
#SBATCH --array=1-3
#SBATCH -n 20 -N 1
#SBATCH -p short
#SBATCH -t 2-00:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yelena.pacheco@usda.gov


#use convertNexusToFasta.py in an array for multiple files at once

ml miniconda
source activate /project/leafbeetle_phylogenomics/yelena/hybpiper


#input.list = list of all .nexus files 
infile=$(cat input1.list | head -n ${SLURM_ARRAY_TASK_ID} | tail -n1)
base=$(basename ${infile} .nexus)


python convertNexusToFasta.py ${infile} ${base}.fasta

conda deactivate 
