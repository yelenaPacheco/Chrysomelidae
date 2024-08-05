#!/bin/bash
#SBATCH -J purgeDups
#SBATCH -o purge_%A.out
#SBATCH -e purge_%A.err
#SBATCH -n 40 -N 1
#SBATCH -p atlas
#SBATCH -A aphid_phylogenomics
#SBATCH -t 2-00:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yelena.pacheco@usda.gov



#--- Starrt timer
t1=$(date +"%s")

module load minimap2/2.26

purgeDups='/90daydata/aphid_phylogenomics/yelena/aphid_revio/purge_dups'

## convert one of the haploid assembly .gfa files to .fa
minimap2 -xmap-pb full_asm.fa hap1_asm.fa | gzip -c - > full_asm.paf.gz
$purgeDups/bin/pbcstat full_asm.paf.gz
$purgeDups/bin/calcuts PB.stat > cutoffs 2>calcults.log

$purgeDups/bin/purge_dups -2 -T cutoffs -c PB.base.cov full_asm.paf.gz > dups.bed 2> purge_dups.log









#---Complete job
t2=$(date +"%s")
diff=$(($t2-$t1))
echo "[---$SN---] ($(date)) $(($diff / 60)) minutes and $(($diff % 60)) seconds elapsed."
echo "[---$SN---] ($(date)) $SN COMPLETE."
