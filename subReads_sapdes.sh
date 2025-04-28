#!/bin/bash
#SBATCH -J spades
#SBATCH -o spades_%A_%a.out
#SBATCH -e spades_%A_%a.err
#SBATCH --array=1-40
#SBATCH -n 40 -N 1
#SBATCH -p short
#SBATCH -t 2-00:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yelena.marlese@gmail.com


module load spades/3.15.5

singleReads1=$(cat round2Taxa.list | head -n ${SLURM_ARRAY_TASK_ID} | tail -n1)

infile=$(cat subReads.list | head -n ${SLURM_ARRAY_TASK_ID} | tail -n1)
base=$(basename ${infile} -READ1.fastq)


spades.py -1 ${infile} -2 ${base}-READ2.fastq \ 
	-s ${singleReads1}/${singleReads1}-READ-singleton.fastq
	
	