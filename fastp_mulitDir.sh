#!/bin/bash
#SBATCH -J fastp
#SBATCH -o fastp_%A_%a.out
#SBATCH -e fastp_%A_%a.err
#SBATCH --array=1-3
#SBATCH -n 20 -N 1
#SBATCH -p short
#SBATCH -t 24:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yelena.pacheco@usda.gov

#trimm adaptors from raw read fastq files 
#this script will do this for multiple directories with fastq sequencing files


#create output directories for trimmed reads and output files 
if [ ! -d trimmed_reads_FF ]
then
   mkdir -p trimmed_reads_FF
fi
 
 
 
if [ ! -d fastp_trimming_docs_FF ]
then
  mkdir -p fastp_trimming_docs_FF
fi
 
 

module load miniconda
source activate /project/leafbeetle_phylogenomics/yelena/hybpiper

#input.list is a list of all the R1_001 files in the directory
#made input.list with ls *R1_001.gz > input.list 
infile=$(cat input.list | head -n ${SLURM_ARRAY_TASK_ID} | tail -n1)
myDir=${infile%%/*}
base=$(basename ${infile} R1_001.fastq.gz)
infile1="${myDir}/${base}R1_001.fastq.gz"
infile2="${myDir}/${base}R2_001.fastq.gz"


fastp -w 4 --dont_overwrite --disable_quality_filtering --correction --length_required 21 \
--in1 ${infile1} --in2 ${infiel2}
--out1 trimmed_reads_FF/${base}P_R1.fastq --out2 trimmed_reads_FF/${base}P_R2.fastq \
--unpaired1 trimmed_reads_FF/${base}U.fastq --unpaired2 trimmed_reads_FF/${base}U.fastq \
--failed_out fastp_trimming_docs_FF/${base}_failed.fastq \
-j fastp_trimming_docs_FF/${base}.fastp_report.json \
-h fastp_trimming_docs_FF/${base}.fastp_report.html

conda deactivate
