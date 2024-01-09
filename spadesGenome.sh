#!/bin/bash
#SBATCH -J spades
#SBATCH -o spades_%A_%a.out
#SBATCH -e spades_%A_%a.err
#SBATCH -n 40 -N 1
#SBATCH -p short
#SBATCH -t 2-00:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yelena.marlese@gmail.com


module load spades/3.15.5

spades.py -1 <reads1> -2 <reads2> \
 	-o spades_test

 