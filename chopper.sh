#!/bin/bash
#SBATCH -J chopper
#SBATCH -o chopper_%A.out
#SBATCH -e chopper_%A.err
#SBATCH -n 20 -N 1
#SBATCH -p atlas
#SBATCH -A aphid_phylogenomics
#SBATCH -t 2-00:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yelena.pacheco@usda.gov



##use to trimm longread sequence files

software=/90daydata/shared/GenomeAssemblyWorkshop/software

reads=/90daydata/aphid_phylogenomics/yelena/aphid_revio/round2/m84100_230830_180417_s4.hifi_reads.fastq.gz

#--- Starrt timer
t1=$(date +"%s")

zcat $reads | $software/chopper -q 12 -l 100 \
--headcrop 50 | pigz > trimmedReads_cyldesmithi.fastq.gz

less trimmedReads_cyldesmithi.fastq.gz | grep "^@SRR" -c

#---Complete job
t2=$(date +"%s")
diff=$(($t2-$t1))
echo "[---$SN---] ($(date)) $(($diff / 60)) minutes and $(($diff % 60)) seconds elapsed."
echo "[---$SN---] ($(date)) $SN COMPLETE."