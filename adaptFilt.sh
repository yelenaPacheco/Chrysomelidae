#!/bin/bash
#SBATCH -J adaptFilt
#SBATCH -o adaptFilt_%A.out
#SBATCH -e adaptFilt_%A.err
#SBATCH -n 20 -N 1
#SBATCH -p atlas
#SBATCH -t 20:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yelena.pacheco@usda.gov


##Trimm adaptor sequences from long reads 


#--- Starrt timer
t1=$(date +"%s")



module load bamtools/2.5.2
module load blast-plus/2.14.1

export PATH=$PATH:/90daydata/aphid_phylogenomics/yelena/aphid_revio/round2/HiFiAdapterFilt
export PATH=$PATH:/90daydata/aphid_phylogenomics/yelena/aphid_revio/round2/HiFiAdapterFilt/DB


bash hifiadapterfilt.sh -p trimmedReads_cyldesmithi -t 20 -o filtered_reads



#---Complete job
t2=$(date +"%s")
diff=$(($t2-$t1))
echo "[---$SN---] ($(date)) $(($diff / 60)) minutes and $(($diff % 60)) seconds elapsed."
echo "[---$SN---] ($(date)) $SN COMPLETE."

