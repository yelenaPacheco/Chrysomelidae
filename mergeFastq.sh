#!/bin/bash
#SBATCH -J fastp
#SBATCH -n 8 -N 1
#SBATCH -p short
#SBATCH -t 24:00:00


#This script merges multiple raw read libraries into two files, one for forward read and one for reverse. 


for file in *_1.fastq
do
	cp ${file} >> Anoplophora_glabripennis_all_1.fastq
	
done


for file in *_2.fastq
do
	cp ${file} >> Anoplophora_glabripennis_all_2.fastq

done



