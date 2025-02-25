#!/bin/bash
#SBATCH -J busco
#SBATCH -o busco_%A_%a.out
#SBATCH -e busco_%A_%a.err
#SBATCH -n 40 -N 1
#SBATCH -p short, medium, scavenger
#SBATCH -t 7-00:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yelena.pacheco@usda.gov



#--- Starrt timer
t1=$(date +"%s")


#Identify BUSCO genes for genome assembly
#documentation @ https://busco.ezlab.org/busco_userguide.html#running-busco


module load busco5/5.4.5

busco -i N_clydesmithi_hifiasm_contigs.fa -m genome -l hemiptera_odb10  -c 40 --out BUSCO_

#--out = output prefix 

#---Complete job
t2=$(date +"%s")
diff=$(($t2-$t1))
echo "[---$SN---] ($(date)) $(($diff / 60)) minutes and $(($diff % 60)) seconds elapsed."
echo "[---$SN---] ($(date)) $SN COMPLETE."
