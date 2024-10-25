#!/bin/bash
#SBATCH --job-name=taxonCoverage
#SBATCH -p short         
#SBATCH -n 20 -N 1
#SBATCH --mem=10gb
#SBATCH --time=20:00:00
#SBATCH --output=taxonCoverage.%j.out
#SBATCH --error=taxonCoverage.%j.error




for file in *.FNA  ##for all files with the ending ".FNA" do the followting... need * to get all .$

  do

    echo -n ${file}, >> taxonCoverage.csv
    grep ">" ${file} | wc -l  >> taxonCoverage.csv

done
