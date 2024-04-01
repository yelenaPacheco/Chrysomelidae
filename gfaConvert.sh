#!/bin/bash
#SBATCH -J gfaConvert
#SBATCH -o gfaConvert_%A_%a.out
#SBATCH -e gfaConvert_%A_%a.err
#SBATCH -n 20 -N 1
#SBATCH -p scavenger
#SBATCH -t 24:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yelena.pacheco@usda.gov



###DONT USE YET, doesn't work, will update

module load miniconda
source activate /project/leafbeetle_phylogenomics/yelena/hybpiper

gfastats -f  N_clydesmithi.asm.bp.p_ctg.gfa -o fa -j 20

conda deactivate