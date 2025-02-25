#!/bin/bash
#SBATCH -J spades
#SBATCH -o spades_%A_%a.out
#SBATCH -e spades_%A_%a.err
#SBATCH --array=1-18
#SBATCH -n 10 -N 1
#SBATCH -p short
#SBATCH -t 2-00:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yelena.marlese@gmail.com


#formats spades assembly directory structure to Phyluce structure
#spades assemblies were run outside of Phyluce pipeline 

assemblies='/90daydata/leafbeetle_phylogenomics/yelena/publicDataPhyluce/round2_merged/mergedReads/trimmedReadsM/assembliesMerged'

infile=$(cat spadesDir.list | head -n ${SLURM_ARRAY_TASK_ID} | tail -n1)		#spadesDir.list contains all spades assembly directores
base=$(basename ${infile} _spades)												#remove _spades from directory name so that you just have species name


cp ${infile}/contigs.fasta ${infile}/${base}.contigs.fasta		#copy the contigs.fasta files from species directory to species_spades directory and rename species.contigs.fasta
mv ${infile}/${base}.contigs.fasta ${assemblies}		#move the species.contigs.fasta to assemblies directory
														#once contigs are moved to assemblies dir use make_subDir.sh to put in directories with respective species names 
														#you will still need to make a 'contigs' directory in assembly dir with soft links to species contig files 