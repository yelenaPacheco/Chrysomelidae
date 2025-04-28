#!/bin/bash
#SBATCH -J seqtk
#SBATCH -o seqtk_%A_%a.out
#SBATCH -e seqtk_%A_%a.err
#SBATCH -n 40 -N 1
#SBATCH -p short
#SBATCH -t 2-00:00:00
#SBATCH --array=1-40
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yelena.pacheco@usda.gov


module load seqtk/1.3


infile=$(cat round2Taxa.list | head -n ${SLURM_ARRAY_TASK_ID} | tail -n1)



seqtk sample -s100 ${infile}/${infile}-READ1.fastq 1000000 > sub_${infile}-READ1.fastq
seqtk sample -s100 ${infile}/${infile}-READ2.fastq 1000000 > sub_${infile}-READ2.fastq