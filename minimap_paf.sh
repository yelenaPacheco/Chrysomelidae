#!/bin/bash
#SBATCH -J asm_cov
#SBATCH -o asm_cov_%A.out
#SBATCH -e asm_cov_%A.err
#SBATCH -n 20 -N 1
#SBATCH -p scavenger
#SBATCH -t 2-00:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yelena.pacheco@usda.gov

#make a .paf file with minimap

#--- Starrt timer
t1=$(date +"%s")

module load singularityCE/3.11.4
module load minimap2/2.24


minimap2 -x map-bp -t 20 test/N_clydesmithi_asm.contigs.fasta m84100_230830_180417_s4.hifi_reads.fastq.gz | gzip -c - > canu_minimap.paf.gz 


#---Complete job
t2=$(date +"%s")
diff=$(($t2-$t1))
echo "[---$SN---] ($(date)) $(($diff / 60)) minutes and $(($diff % 60)) seconds elapsed."
echo "[---$SN---] ($(date)) $SN COMPLETE."