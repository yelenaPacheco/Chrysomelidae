#!/bin/bash
#SBATCH -J sra_Fetch
#SBATCH -o sra_err/sra_Fetch_%A_%a.out
#SBATCH -e sra_err/sra_Fetch_%A_%a.err
#SBATCH --array=1-5
#SBATCH -n 40 -N 1
#SBATCH -p short
#SBATCH -t 2-00:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yelena.marlese@gmail.com



module load sratoolkit/3.0.2


##sets up array
##sra_fetch_dump_array.txt includes list of sra accession numbers and species names 
line=$(sed -n "$SLURM_ARRAY_TASK_ID"p sra_fetch_dump_array.txt)
##get just the species names (removes first field)
## cut is applied to individual line -f = field, 
sra_id=`echo "${line}"|cut -f1`
##gets just the accession numbers 
taxon=`echo "${line}"|cut -f2`

echo $sra_id
echo $taxon

prefetch -X 9999999999999 $sra_id