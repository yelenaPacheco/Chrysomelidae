#!/bin/bash
#SBATCH -J genome
#SBATCH -o genome_%A.out
#SBATCH -e genome_%A.err
#SBATCH -N 1 -n 40
#SBATCH -t 2-00:00:00
#SBATCH -p atlas
#SBATCH -A aphid_phylogenomics
#SBATCH --array=1-4
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yelena.pacheco@usda.gov



##download genome files to cluster with accession numbers 

#--- Starrt timer
t1=$(date +"%s")

module load miniconda3/24.3.0
source activate /project/aphid_phylogenomics/yelena/software_y



datasets download genome accession --inputfile genomeInput.list

conda deactivate


#---Complete job
t2=$(date +"%s")
diff=$(($t2-$t1))
echo "[---$SN---] ($(date)) $(($diff / 60)) minutes and $(($diff % 60)) seconds elapsed."
echo "[---$SN---] ($(date)) $SN COMPLETE."

