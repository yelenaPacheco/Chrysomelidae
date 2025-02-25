#!/bin/bash
#SBATCH -J fastQC
#SBATCH -o fastQC_%A_%a.out
#SBATCH -e fastQC_%A_%a.err
#SBATCH --array=1-97
#SBATCH -n 20 -N 1
#SBATCH -p short
#SBATCH -t 24:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yelena.pacheco@usda.gov


#quality check for read files


 ml fastqc/0.12.1
 
 
 
 fastqc -o fastqc_out -t 20 *.fastq.gz 
 
 #runs fastqc for any *.fastq.gz files in current directory 