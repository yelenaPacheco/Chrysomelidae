#!/bin/bash
#SBATCH -J phyluceAssemble
#SBATCH -o phyluceAssemble_%A_%a.out
#SBATCH -e phyluceAssemble_%A_%a.err
#SBATCH --array=1-3
#SBATCH -n 40 -N 1
#SBATCH -p short
#SBATCH -t 2-00:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yelena.marlese@gmail.com


module load phyluce


phyluce_assembly_assemblo_spades \
    --conf assembly.conf \
    --output spades-assemblies \
    --cores 12