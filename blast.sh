#!/bin/bash
#SBATCH -J blastn
#SBATCH -o blastn_%A_%a.out
#SBATCH -e blastn_%A_%a.err
#SBATCH -n 20 -N 1
#SBATCH -p short
#SBATCH -t 2-00:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yelena.marlese@gmail.com\

module load blast+/2.13.0


blastn -query <example.fasta> -out <results.out> -db nt

