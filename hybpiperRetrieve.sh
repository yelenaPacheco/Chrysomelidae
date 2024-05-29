#!/bin/bash
#SBATCH -J hybpiperRetrieve
#SBATCH -o hybpiperRetrieve_%A_%a.out
#SBATCH -e hybpiperRetrieve_%A_%a.err
#SBATCH -n 20 -N 1
#SBATCH -p short
#SBATCH -t 2-00:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yelena.pacheco@usda.gov


#second step in Hybpiper pipline, gathers all contigs for each locus for all taxa in --sample_names file 
#output is a fasta file for each locus


#--- Starrt timer
t1=$(date +"%s")

module load miniconda
source activate /project/leafbeetle_phylogenomics/yelena/hybpiper



hybpiper retrieve_sequences -t_dna refSequences.fasta dna --sample_names directory.list --fasta_dir loci_fasta_files

conda deactivate

#---Complete job
t2=$(date +"%s")
diff=$(($t2-$t1))
echo "[---$SN---] ($(date)) $(($diff / 60)) minutes and $(($diff % 60)) seconds elapsed."
echo "[---$SN---] ($(date)) $SN COMPLETE."


# -t_dna fasta w/reference sequences 
# --sample_names list of all directories produced by hybpiperAssemble.sh
# --fasta_dir output directory name 