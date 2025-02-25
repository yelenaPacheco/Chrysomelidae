#!/bin/bash
#SBATCH -J rmDescript
#SBATCH -o rmDescript_%A_%a.out
#SBATCH -e rmDescript_%A_%a.err
#SBATCH --array=1-516
#SBATCH -A aphid_phylogenomics
#SBATCH -n 20 -N 1
#SBATCH -p atlas
#SBATCH	--mem=8G
#SBATCH -t 24:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yelena.pacheco@usda.gov

ml miniconda3
source activate /project/aphid_phylogenomics/yelena/software_y

infile=$(cat input.list | head -n ${SLURM_ARRAY_TASK_ID} | tail -n1)
base=$(basename ${infile} .fasta)

python removeDescription.py ${infile} 2${infile}

conda deactivate
