#!/bin/bash
#SBATCH -J hybpiperRetrieve
#SBATCH -o hybpiperRetrieve_%A_%a.out
#SBATCH -e hybpiperRetrieve_%A_%a.err
#SBATCH -n 20 -N 1
#SBATCH -p short
#SBATCH -t 2-00:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yelena.marlese@gmail.com


#second step in Hybpiper pipline, gathers all contigs for each locus for all taxa in --sample_names file 
#output is a fasta file for each locus


module load miniconda
source activate /project/leafbeetle_phylogenomics/yelena/hybpiper



hybpiper retrieve_sequences -t_dna ColeopteraProbes.fasta dna --sample_names directory.list --fasta_dir Douglas_sequences

conda deactivate



# -t_dna fasta w/reference sequences 
# --sample_names list of all directories produced by hybpiperAssemble.sh
# --fasta_dir output directory name 