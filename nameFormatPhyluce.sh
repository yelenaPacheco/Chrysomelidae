#!/bin/bash
#SBATCH -J nameFormat
#SBATCH -o nameFormat_%A.out
#SBATCH -e nameFormat_%A.err
#SBATCH --array=1-100
#SBATCH -n 20 -N 1
#SBATCH -p short
#SBATCH	--mem=8G
#SBATCH -t 24:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yelena.pacheco@usda.gov


infile=$(cat input.list | head -n ${SLURM_ARRAY_TASK_ID} | tail -n1)

base=$(basename ${infile} _P_R1.fastq)

mv ${base}_P_R1.fastq ${base}-READ1.fastq
mv ${base}_P_R2.fastq ${base}-READ2.fastq
mv ${base}_U.fastq ${base}-READ-singleton.fastq

