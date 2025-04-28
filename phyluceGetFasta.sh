#!/bin/bash
#SBATCH -J getFasta
#SBATCH -o getFasta_%A.out
#SBATCH -e getFasta_%A.err
#SBATCH -N 1 -n 40
#SBATCH -t 7-00:00:00
#SBATCH --mem=30G
#SBATCH -p short,medium
#SBATCH -A aphid_phylogenomics
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yelena.pacheco@usda.gov

module load phyluce/1.7.3
cd taxon-sets/all
mkdir log

# run the assembly
phyluce_assembly_get_fastas_from_match_counts \
    --contigs ../../spades-assemblies/contigs \
    --locus-db ../../uce-results/probe.matches.sqlite \
    --match-count-output all-taxa-incomplete.conf \
    --output all-taxa-incomplete.fasta \
    --incomplete-matrix all-taxa-incomplete.incomplete \
    --log-path log
