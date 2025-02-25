#!/bin/bash
#SBATCH -J canu
#SBATCH -o canu_%A.out
#SBATCH -e canu_%A.err
#SBATCH -n 40 -N 1
#SBATCH -p scavenger
#SBATCH -t 2-00:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yelena.pacheco@usda.gov



#canu genome assembly


module load canu/2.2

canu -p N_clydesmithi_asm -d test \
genomeSize=6m \
-pacbio-hifi  m84100_230830_180417_s4.hifi_reads.fastq.gz

# -p = output prefix
# genomeSize is an estimate based on other aphids
# -pacbio-hifi long reads fastq 

# -p Prefix
# -d output directory



