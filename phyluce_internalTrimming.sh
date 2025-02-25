#!/bin/bash
#SBATCH -J intTrim
#SBATCH -o intTrim_%A.out
#SBATCH -e intTrim_%A.err
#SBATCH -n 20 -N 1
#SBATCH -p ceres
#SBATCH -A aphid_phylogenomics
#SBATCH -t 2:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yelena.pacheco@usda.gov

module load phyluce/1.7.3

# align the data - turn off trimming and output FASTA
phyluce_align_seqcap_align \
    --input all-taxa-incomplete.fasta \
    --output mafft-nexus-internal-trimmed \
    --taxa 100 \
    --aligner mafft \
    --cores 20 \
    --incomplete-matrix \
    --no-trim \
    --log-path log