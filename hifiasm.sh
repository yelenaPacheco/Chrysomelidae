#!/bin/bash
#SBATCH -J hifiasm
#SBATCH -o hifiasm_%A_%a.out
#SBATCH -e hifiasm_%A_%a.err
#SBATCH -n 40 -N 1
#SBATCH -p short
#SBATCH -t 2-00:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yelena.pacheco@usda.gov


module load miniconda
source activate /project/leafbeetle_phylogenomics/yelena/hybpiper

hifiasm -o N_clydesmithi.asm -t 40 m84100_230830_180417_s4.hifi_reads.fastq.gz

conda deactivate