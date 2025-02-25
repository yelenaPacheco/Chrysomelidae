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


## makes gne trees from alignments, used for coalescent tree
##run in trees directory

module load iq_tree/2.2.0

alignments='/90daydata/leafbeetle_phylogenomics/yelena/publicData/concatFasta/AlignFasta/gblocks'  	#set to directory with all alignment files you want to make trees with, this isn't needed if running directly from alignment dir

infile=$(cat loci2.list | head -n ${SLURM_ARRAY_TASK_ID} | tail -n1)		#list of all the alignments 


iqtree2 -s ${alignments}/${infile} -m MFP -bb 1000 -nt 40			

## -s input file
## -m substitution model
	##  MFP = use model finder 
## -bb number of bootstrap replicates
## -nt number of threads, this value should match -n value in job submission above