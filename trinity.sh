#!/bin/bash
#SBATCH -J trinity
#SBATCH -o trinity_%A_%a.out
#SBATCH -e trinity_%A_%a.err
#SBATCH --array=1-2
#SBATCH -n 40 -N 1
#SBATCH -p short
#SBATCH -t 2-00:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yelena.marlese@gmail.com



infile=$(cat input.list | head -n ${SLURM_ARRAY_TASK_ID} | tail -n1)

base=$(basename ${infile} _1.fastq)

module load trinityrnaseq/2.15.1

Trinity --seqType fq  --max_memory 50G --trimmomatic \
	--left ${base}_1.fastq --right ${base}_2.fastq  --CPU 40  --output ${base}_trinity --full_cleanup