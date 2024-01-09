#!/bin/bash
#SBATCH -J hybpiperRetrieve
#SBATCH -o hybpiperRetrieve_%A_%a.out
#SBATCH -e hybpiperRetrieve_%A_%a.err
#SBATCH -n 20 -N 1
#SBATCH -p short
#SBATCH -t 2-00:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yelena.marlese@gmail.com


module load miniconda
source activate /project/leafbeetle_phylogenomics/yelena/hybpiper



hybpiper retrieve_sequences -t_dna ColeopteraProbes.fasta --sample_names directory.list --fasta_dir Douglas_sequences
