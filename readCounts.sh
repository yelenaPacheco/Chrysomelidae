#!/bin/bash
#SBATCH -J readCounts
#SBATCH -o readCounts_%A.out
#SBATCH -e readCounts_%A.err
#SBATCH -n 20 -N 1
#SBATCH -p short
#SBATCH -t 2:00:00




while read line
do 
	echo ${line} >> readCounts.txt
	grep -c '^@' ${line}-READ1.fastq >> readCounts.txt
	grep -c '^@' ${line}-READ2.fastq >> readCounts.txt
	grep -c '^@' ${line}-READ-singleton.fastq >> readCounts.txt
done <directory.list
	