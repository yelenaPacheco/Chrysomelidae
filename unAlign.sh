#!/bin/bash
#SBATCH -J unAlign
#SBATCH -o unAlign_%A_%a.out
#SBATCH -e unAlign_%A_%a.err
#SBATCH --array=1-466
#SBATCH -n 40 -N 1
#SBATCH -p atlas
#SBATCH -A aphid_phylogenomics
#SBATCH -t 2-00:00:00
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=yelena.pacheco@usda.gov


module load miniconda3
source activate /project/aphid_phylogenomics/yelena/software_y

infile=$(cat input2.list | head -n ${SLURM_ARRAY_TASK_ID} | tail -n1)
base=$(basename ${infile} .fasta)

echo ${base}
echo ${infile}

python unAlign2.py ${infile} 2${base}.fasta

conda deactivate
