#!/bin/bash
#SBATCH -J make_sub
#SBATCH -o make_sub_%A_%a.out
#SBATCH -e make_sub_%A_%a.err
#SBATCH --array=1-100
#SBATCH -n 20 -N 1
#SBATCH -p short
#SBATCH -t 2:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yelena.pacheco@usda.gov


##use to make taxa directories and move read files into their respective directories for need Phyluce format


infile=$(cat input2.list | head -n ${SLURM_ARRAY_TASK_ID} | tail -n1)

base=$(basename ${infile} -READ1.fastq)


mkdir ${base}
mv ${base}-READ1.fastq ${base}
mv ${base}-READ2.fastq ${base}
mv ${base}-READ-singleton.fastq ${base}