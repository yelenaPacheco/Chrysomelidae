#!/bin/bash
#SBATCH -J match_contigs
#SBATCH -o match_contigs_%A.out
#SBATCH -e match_contigs_%A.err
#SBATCH -N 1 -n 40
#SBATCH -t 7-00:00:00
#SBATCH -p medium
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yelena.pacheco@usda.gov



module load phyluce/1.7.3

phyluce_assembly_match_contigs_to_probes  --contigs spades-assemblies/contigs  --probes phyluceProbesFormat.fasta --output uce-results80 \
--min-coverage 50 \
--min-identity 80