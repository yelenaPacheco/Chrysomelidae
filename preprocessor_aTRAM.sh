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
wrkDIR='/90daydata/leafbeetle_phylogenomics/yelena/test_phyluce/trimmed_reads/aTRAM'

${aTram}/atram_preprocessor.py \
  --blast-db=/90daydata/leafbeetle_phylogenomics/yelena/test_phyluce/trimmed_reads/aTRAM/test/CO2124 \
  --end-1=${wrkDIR}/new_CO2124_Microphotus_sp_P_R1.fastq \
  --end-2=${wrkDIR}/new_CO2124_Microphotus_sp_P_R1.fastq


conda deactivate


