#!/bin/bash
#SBATCH -J trimmomatic
#SBATCH -o trimmomatic_%A_%a.out
#SBATCH -e trimmomatic_%A_%a.err
#SBATCH -p short
#SBATCH --array=1-18
#SBATCH --mem=20G
#SBATCH -n 20 -N 1
#SBATCH -t 2-00:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yelena.pacheco@usda.gov

#trim and filter short reads

module load trimmomatic/0.39


#create output directories for trimmed reads and output files 
if [ ! -d trimmedReads_p64 ]
then
   mkdir -p trimmedReads_p64
fi


trimmed="/90daydata/leafbeetle_phylogenomics/yelena/publicDataPhyluce/trimmedReads_p64"
raw="/90daydata/leafbeetle_phylogenomics/yelena/publicDataPhyluce/rawReads"

infile=$(cat input1.list | head -n ${SLURM_ARRAY_TASK_ID} | tail -n1)
base=$(basename ${infile} _1.fastq.gz)

java -jar /software/7/apps/trimmomatic/0.38/trimmomatic-0.38.jar PE -threads 20 -phred40 \
${raw}/${base}_1.fastq.gz ${raw}/${base}_2.fastq.gz \
${trimmed}/${base}-READ1.fastq ${trimmed}/${base}-READ1_singleton.fastq \
${trimmed}/${base}-READ2.fastq ${trimmed}/${base}-READ2_singleton.fastq \
ILLUMINACLIP:/software/7/apps/trimmomatic/0.38/adapters/TruSeq3-PE-2.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36