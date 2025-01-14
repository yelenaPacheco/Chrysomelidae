#!/bin/bash
#SBATCH -J phyluce
#SBATCH -o phyluce_%A.out
#SBATCH -e phyluce_%A.err
#SBATCH -N 1 -n 20
#SBATCH -t 7-00:00:00
#SBATCH -A aphid_phylogenomics
#SBATCH --mem=100G
#SBATCH -p medium
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yelena.pacheco@usda.gov

module load phyluce/1.7.3

mkdir -p taxon-sets70/all

# run the assembly
phyluce_assembly_get_match_counts \
    --locus-db uce-results/probe.matches.sqlite \
    --taxon-list-config  taxon-set.conf  \
    --taxon-group 'all' \
    --incomplete-matrix \
    --output taxon-sets/all/all-taxa-incomplete.conf