#!/bin/bash
#SBATCH -J concatFasta
#SBATCH -o concatFasta_%A_%a.out
#SBATCH -e concatFasta_%A_%a.err
#SBATCH --array=1-2273
#SBATCH -n 20 -N 1
#SBATCH -A aphid_phylogenomics
#SBATCH -p short
#SBATCH	--mem=8G
#SBATCH -t 24:00:00
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=yelena.pacheco@usda.gov

infile=$(cat inputFasta.list | head -n ${SLURM_ARRAY_TASK_ID} | tail -n1)	#list all fasta files in working directory
base=$(basename ${infile} .fasta)
locusID=${base:7}		#remove fist 7 characters from base
echo  ${base}

if [ ! -d unAlignedFastaAll ]
then
   mkdir -p unAlignedFastaAll
fi

outDir='/90daydata/leafbeetle_phylogenomics/yelena/phyluceFasta/unAligned'	#output directory where new fasta files will go

cat ${infile} >> ${outDir}/L${locusID}.fasta