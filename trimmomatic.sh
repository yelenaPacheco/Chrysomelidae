#!/bin/bash
#SBATCH -J trimmomatic
#SBATCH -o trimmomatic_%A_%a.out
#SBATCH -e trimmomatic_%A_%a.err
#SBATCH -p short
#SBATCH --mem=20G
#SBATCH -n 20 -N 1
#SBATCH -t 2-00:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yelena.pacheco@usda.gov

#trim and filter short reads

module load trimmomatic/0.39


java -jar /software/7/apps/trimmomatic/0.38/trimmomatic-0.38.jar PE -threads 20 -phred33 APHD00319_1.fq.gz APHD00319_2.fq.gz APHD00319_1_trimmed.fq APHD00319_1_trimmedSingles.fq APHD00319_2_trimmed.fq APHD00319_2_trimmedSingles.fq ILLUMINACLIP:/software/7/apps/trimmomatic/0.38/adapters/TruSeq3-PE-2.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36