#!/bin/bash
#SBATCH -J blastn
#SBATCH -o blastn_%A_%a.out
#SBATCH -e blastn_%A_%a.err
#SBATCH -n 40 -N 1
#SBATCH -p medium
#SBATCH -t 7-00:00:00
#SBATCH --array=1-12
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yelena.pacheco@usda.gov


#blast search for multiple fasta files against the  NCBI nucleotide database



module load blast+/2.13.0

#query.list includes a list of files used for -query
infile=$(cat query.list | head -n ${SLURM_ARRAY_TASK_ID} | tail -n1)
base=$(basename ${infile} _trinity.fasta)

#path to nucleotide database on Ceres
dataBase="/reference/data/NCBI/blast/2023-08-31/nt"


blastn -query ${infile} -db ${dataBase} -out ${base}_blast.out -evalue 1e-5 -outfmt 7

