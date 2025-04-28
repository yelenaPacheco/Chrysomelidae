#!/bin/bash
#SBATCH -J edgeTrim
#SBATCH -o edgeTrim_%A.out
#SBATCH -e edgeTrim_%A.err
#SBATCH -n 40 -N 1
#SBATCH -p short
#SBATCH -A aphid_phylogenomics
#SBATCH -t 2-00:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yelena.pacheco@usda.gov

module load phyluce/1.7.3

# align the data
phyluce_align_seqcap_align \
    --input all-taxa-incomplete.fasta \
    --output mafft-nexus-edge-trimmed \
    --taxa 100 \
    --aligner mafft \
    --cores 40\
    --incomplete-matrix \
    --log-path log
