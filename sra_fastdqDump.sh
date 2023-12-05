#!/bin/bash
#SBATCH -J sra_prefectch_dump
#SBATCH -o sra_err/sra_prefectch_dump_%A_%a.out
#SBATCH -e sra_err/sra_prefectch_dump_%A_%a.err
#SBATCH --array=1-5
#SBATCH -n 6 -N 1
#SBATCH -p short
#SBATCH -t 2-00:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yelena.marlese@gmail.com


module load sratoolkit/3.0.2

line=$(sed -n "$SLURM_ARRAY_TASK_ID"p srr_list.txt)
sra_id=`echo "${line}"|cut -f1`
taxon=`echo "${line}"|cut -f2`
echo $sra_id
echo "$sra_id/${sra_id}.sra" 
fastq-dump "$sra_id/${sra_id}.sra" --split-3 --skip-technical