#!/bin/bash
#SBATCH -J mvData
#SBATCH -n 20 -N 1
#SBATCH -p atlas
#SBATCH -t 24:00:00
#SBATCH -e mvDATA_%A.err
#SBATCH -A aphid_phylogenomics
#SBATCH --mail-type=END
#SBATCH --mail-user=yelena.pacheco@usda.gov


#this script puts all fasta files in the current dir into one fasta file. 

for file in *.fasta
do 
	cat ${file} >> new_${file}
done
