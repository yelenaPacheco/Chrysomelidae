#!/bin/bash
#SBATCH -J phyluce
#SBATCH -o phyluce_%A.out
#SBATCH -e phyluce_%A.err
#SBATCH -N 1 -n 20
#SBATCH -t 72:00:00
#SBATCH --mem=100G
#SBATCH -p short,scavenger
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yelena.pacheco@usda.gov

module load phyluce/1.7.3

# run the assembly
phyluce_assembly_assemblo_spades \
    --conf assembly.conf \
    --output spades-assembliesD \
    --cores 20 --memory 200
    
    
    