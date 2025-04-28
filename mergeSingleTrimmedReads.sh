#!/bin/bash
#SBATCH -J mergeSingleReads
#SBATCH -o mergeSingleReads_%A_%a.out
#SBATCH -e mergeSingleReads_%A_%a.err
#SBATCH --array=1-100
#SBATCH -n 8 -N 1
#SBATCH -p short
#SBATCH	--mem=8G
#SBATCH -t 24:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yelena.pacheco@usda.gov


#set up array 
infile=$(cat input.list | head -n ${SLURM_ARRAY_TASK_ID} | tail -n1)
base=$(basename ${infile} -READ1.fastq

cat ${base}-READ1-singleton.fastq > ${base}-READ-singleton.fastq

cat ${base}-READ2-singleton.fastq > ${base}-READ-singleton.fastq