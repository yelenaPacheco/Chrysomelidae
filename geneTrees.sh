#!/bin/bash
#SBATCH -J iqtree
#SBATCH -o iqtree_%A_%a.out
#SBATCH -e iqtree_%A_%a.err
#SBATCH --array=1-941
#SBATCH -n 40 -N 1
#SBATCH -p short
#SBATCH -t 2-00:00:00
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=yelena.pacheco@usda.gov



##run in trees directory

module load iq_tree/2.2.0

alignments='/90daydata/leafbeetle_phylogenomics/yelena/publicData/concatFasta/AlignFasta/gblocks'

infile=$(cat loci2.list | head -n ${SLURM_ARRAY_TASK_ID} | tail -n1)
#base=$(basename ${infile} _P_R1.fastq)



iqtree2 -s ${alignments}/${infile} -m GTR+I+G -bb 1000 -nt 40