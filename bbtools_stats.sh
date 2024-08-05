#!/bin/bash
#SBATCH -J bbtools_stats
#SBATCH -o bbtoolsStats_%A_%a.out
#SBATCH -e bbtoolsStats_%A_%a.err
#SBATCH -N 1 -n 20
#SBATCH -t 2-00:00:00
#SBATCH -p short,scavenger
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yelena.pacheco@usda.gov

###########################################################################
###Didn't use, ran in interactive session instead#####


#--- Starrt timer
t1=$(date +"%s")


module load bbtools/39.01

bash stats.sh in=N_clydesmithi_hifiasm_contigs.fa > [output file name]

#---Complete job
t2=$(date +"%s")
diff=$(($t2-$t1))
echo "[---$SN---] ($(date)) $(($diff / 60)) minutes and $(($diff % 60)) seconds elapsed."
echo "[---$SN---] ($(date)) $SN COMPLETE."


