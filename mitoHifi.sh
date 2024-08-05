#!/bin/bash
#SBATCH -J mitoHifi
#SBATCH -o mitoHifi_%A.out
#SBATCH -e mitoHifi_%A.err
#SBATCH -n 20 -N 1
#SBATCH -p atlas
#SBATCH -A aphid_phylogenomics
#SBATCH -t 2-00:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yelena.pacheco@usda.gov


ml miniconda3
source activate /project/aphid_phylogenomics/yelena/software_y

python src/mitohifi.py -r m84100_230830_180417_s4.hifi_reads.fastq.gz -f NC_064371.1.fasta  -g NC_064371.1.gb -t 10 -o 5


#MitoHiFi -r <reads>.fasta -c <assembly>.fasta \
#	-f <close-related mitogenome> -k <close-related species Mitogenome, genebank format> \ 
#	-t 40