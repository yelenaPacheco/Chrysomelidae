#!/bin/bash
#SBATCH -J phyluce_QC
#SBATCH -ophyluce_QC_%A_%a.out
#SBATCH -e phyluce_QC_%A_%a.err
#SBATCH --array=1-3
#SBATCH -n 8 -N 1
#SBATCH -p short
#SBATCH -t 24:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yelena.marlese@gmail.com


module load phyluce


for i in contigs/*.fasta;
do
    phyluce_assembly_get_fasta_lengths --input $i --csv;
done
