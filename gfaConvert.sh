#!/bin/bash
#SBATCH -J gfaConvert
#SBATCH -o gfaConvert_%A_%a.out
#SBATCH -e gfaConvert_%A_%a.err
#SBATCH -n 20 -N 1
#SBATCH -p scavenger
#SBATCH -t 24:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yelena.pacheco@usda.gov


#convert gfa file to fasta

awk '/^S/{print ">"$2"\n"$3}' N_clydesmithi.asm.bp.p_ctg.gfa | fold > output.fa