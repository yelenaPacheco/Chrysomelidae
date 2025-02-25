#!/bin/bash
#SBATCH -J alignClean
#SBATCH -o alignClean_%A.out
#SBATCH -e alignClean_%A.err
#SBATCH -n 20 -N 1
#SBATCH -p short
#SBATCH -A aphid_phylogenomics
#SBATCH -t 2:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yelena.pacheco@usda.gov

module load phyluce/1.7.3

#part of Phyluce pipeline
# align the data - turn off trimming and remove header descriptions
phyluce_align_remove_locus_name_from_files \
    --alignments mafft-nexus-internal-trimmed \
    --output mafft-nexus-internal-trimmed-clean \
    --cores 20 \
    --log-path log