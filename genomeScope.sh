#!/bin/bash
#SBATCH -J genomeScope
#SBATCH -o genomeScope_%A.out
#SBATCH -e genomeScope_%A.err
#SBATCH -n 20 -N 1
#SBATCH -p atlas
#SBATCH -A aphid_phylogenomics
#SBATCH -t 2-00:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yelena.pacheco@usda.gov



#--- Starrt timer
t1=$(date +"%s")

module load jellyfish/2.3.0

mkdir genomeScope

jellyfish count -m 21 -s 2G -t 2 -C ../m84100_230830_180417_s4.hifi_reads.fastq.gz -o genomeScope/reads_clean.jf


jellyfish histo -t 10 genomeScope/reads_clean.jf > genomeScope/reads_clean.histo



#---Complete job
t2=$(date +"%s")
diff=$(($t2-$t1))
echo "[---$SN---] ($(date)) $(($diff / 60)) minutes and $(($diff % 60)) seconds elapsed."
echo "[---$SN---] ($(date)) $SN COMPLETE."
