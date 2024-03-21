#!/bin/bash
#SBATCH -J gfastats
#SBATCH -o gfastats_%A_%a.out
#SBATCH -e gfastats_%A_%a.err
#SBATCH -n 20 -N 1
#SBATCH -p short
#SBATCH -t 24:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yelena.pacheco@usda.gov

module load miniconda
source activate /project/leafbeetle_phylogenomics/yelena/hybpiper

gfastats  N_clydesmithi.asm.bp.p_ctg.gfa -j 20

conda deactivate