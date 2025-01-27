#!/bin/bash
#SBATCH -J spades
#SBATCH -o spades_%A_%a.out
#SBATCH -e spades_%A_%a.err
#SBATCH --array=1-18
#SBATCH -n 40 -N 1
#SBATCH -p medium
#SBATch -t 7-00:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yelena.marlese@gmail.com




#set up array
infile=$(cat input1.list | head -n ${SLURM_ARRAY_TASK_ID} | tail -n1)
base=$(basename ${infile} -READ-singleton.fastq)


infile2=$(cat input2.list | head -n ${SLURM_ARRAY_TASK_ID} | tail -n1)
base2=$(basename ${infile2} -READ1.fastq)

module load spades/3.15.5


spades.py --merged ${base}_trimmed.fastq -1 ${base2}-READ1.fastq -2 ${base2}-READ2.fastq -o ${base}_spades -m 300

