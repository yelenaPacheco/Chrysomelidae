#!/bin/bash
#SBATCH -J blastn
#SBATCH -o blastn_%A_%a.out
#SBATCH -e blastn_%A_%a.err
#SBATCH -n 40 -N 1
#SBATCH -p medium
#SBATCH -t 7-00:00:00
#SBATCH --array=1-12
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yelena.marlese@gmail.com\

module load blast+/2.13.0


infile=$(cat query.list | head -n ${SLURM_ARRAY_TASK_ID} | tail -n1)

base=$(basename ${infile} _trinity.fasta)

dataBase="/reference/data/NCBI/blast/2023-08-31/nt"


blastn -query ${infile} -db ${dataBase} -out ${base}_blast.out -evalue 1e-5 -outfmt 7

