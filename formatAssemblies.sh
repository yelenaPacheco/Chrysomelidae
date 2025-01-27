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


assemblies='/90daydata/leafbeetle_phylogenomics/yelena/publicDataPhyluce/round2_merged/mergedReads/trimmedReadsM/assembliesMerged'

infile=$(cat spadesDir.list | head -n ${SLURM_ARRAY_TASK_ID} | tail -n1)
base=$(basename ${infile} _spades)


cp ${infile}/contigs.fasta ${base}.contigs.fasta
mv ${infile}/${base}.contigs.fasta ${assemblies}