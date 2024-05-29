#!/bin/bash
#SBATCH --job-name=taxonCoverage
#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --mem=10gb
#SBATCH --time=20:00:00
#SBATCH --output=taxonCoverage.%j.out
#SBATCH --error=taxonCoverage.%j.error




for file in *.fa  ##for all files with the ending ".fa" do the followting... need * to get all .$

  do

    echo -n ${file}, >> taxonCoverage.csv
    grep ">" ${file} | wc -l  >> taxonCoverage.csv

done
