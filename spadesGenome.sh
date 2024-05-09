#!/bin/bash
#SBATCH -J spades
#SBATCH -o spades_%A_%a.out
#SBATCH -e spades_%A_%a.err
#SBATCH --array=1-4
#SBATCH -n 40 -N 1
#SBATCH -p short
#SBATCH -t 2-00:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yelena.marlese@gmail.com


#spades genome assembly
#for short reads 

#set up array
#inputReads2.list includes a list of all R1 reads 
infile=$(cat inputReads2.list | head -n ${SLURM_ARRAY_TASK_ID} | tail -n1)

base=$(basename ${infile} _P_R1.fastq)


module load spades/3.15.5

spades.py -1 ${base}_P_R1.fastq  -2 ${base}_P_R2.fastq \
        -s ${base}_U.fastq -o ${base}2_spades -m 560


