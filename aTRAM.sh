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


##second step of aTRAM

module load miniconda3
source activate /home/yelena.pacheco/.conda/envs/aTRAM

aTram='/project/aphid_phylogenomics/yelena/aTRAM'
wrkDIR='/90daydata/leafbeetle_phylogenomics/yelena/test_phyluce/trimmed_reads/aTRAM'


${aTram}/atram.py \
  --blast-db=//90daydata/leafbeetle_phylogenomics/yelena/test_phyluce/trimmed_reads/aTRAM/test/CO2124 \
  --query=${wrkDIR}/all_Loci.fa \
  --assembler=spades \
  --output-prefix=${wrkDIR}/test_output


conda deactivate


