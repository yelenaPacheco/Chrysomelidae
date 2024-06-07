#!/bin/bash
#SBATCH -J adaptFilt
#SBATCH -o adaptFilt_%A.out
#SBATCH -e adaptFilt_%A.err
#SBATCH -n 20 -N 1
#SBATCH -p short,scavenger
#SBATCH -t 20:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yelena.pacheco@usda.gov


module load bamtools/2.5.2
module load blast+/2.15.0


bash hifiadapterfilt.sh -p minimap -t 20 -o filter_2

