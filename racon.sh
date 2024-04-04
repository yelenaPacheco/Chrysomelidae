#!/bin/bash
#SBATCH -J racon
#SBATCH -o racon_%A.out
#SBATCH -e racon_%A.err
#SBATCH -n 40 -N 1
#SBATCH -p short
#SBATCH -t 2-00:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yelena.pacheco@usda.gov



#--- Starrt timer
t1=$(date +"%s")

direct="/90daydata/aphid_phylogenomics/yelena/aphid_revio/canu/test"

module load racon/1.5.0

racon -t 40 m84100_230830_180417_s4.hifi_reads.fastq.gz  canu_asm.sam  ${direct}/N_clydesmithi_asm.contigs.fasta



#---Complete job
t2=$(date +"%s")
diff=$(($t2-$t1))
echo "[---$SN---] ($(date)) $(($diff / 60)) minutes and $(($diff % 60)) seconds elapsed."
echo "[---$SN---] ($(date)) $SN COMPLETE."
