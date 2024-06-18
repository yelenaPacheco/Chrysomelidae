#!/bin/bash
#SBATCH -J purge
#SBATCH -o purge%A.out
#SBATCH -e purge%A.err
#SBATCH -n 40 -N 1
#SBATCH -p debug
#SBATCH -t 1:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yelena.pacheco@usda.gov

################################################
#I don't think I usedthis, instead clone repository and follow directions on github 
#https://github.com/dfguan/purge_dups


module load purge_dups/1.2.6


pd_config.py test/N_clydesmithi_asm.contigs.fasta m84100_230830_180417_s4.hifi_reads.fastq.gz \
-n purge_dups_config.json -l purge_dups_output
