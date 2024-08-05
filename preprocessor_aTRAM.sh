#!/bin/bash
#SBATCH -J atram
#SBATCH -o atram_%A.out
#SBATCH -e atram_%A.err
#SBATCH -n 20 -N 1
#SBATCH -p atlas
#SBATCH -t 72:00:00
#SBATCH -A aphid_phylogenomics
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yelena.pacheco@usda.gov


##create blast dbs needed for atram assembly 

module load miniconda3
source activate /home/yelena.pacheco/.conda/envs/aTRAM

aTram='/project/aphid_phylogenomics/yelena/aTRAM'


${aTram}/python atram_preprocessor.py \
  --blast-db=/90daydata/leafbeetel_phylogenomics/yelena/test_phyluce/trimmed_reads/aTRAM/P002_WG03/P002_WG03 \
  --end-1=/90daydata/leafbeetle_phylogenomics/yelena/test_phyluce/trimmed_reads/aTRAM/RAPiD-Genomics_F293_BYU_105604_P002_WG03_i5-536_i7-22_S5205_L001_P_R1.fastq \
  --end-2=/90daydata/leafbeetle_phylogenomics/yelena/test_phyluce/trimmed_reads/aTRAM/RAPiD-Genomics_F293_BYU_105604_P002_WG03_i5-536_i7-22_S5205_L001_P_R2.fastq


conda deactivate


