#!/bin/bash
#SBATCH -J hybpiper_array_L8
#SBATCH -o hybpiper_array_L8_%A_%a.out
#SBATCH -e hybpiper_array_L8_%A_%a.err
#SBATCH --array=1-3
#SBATCH -n 40 -N 1
#SBATCH -p short
#SBATCH -t 2-00:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=XXXXXXXXXX



module load sratoolkit/3.0.2


##sets up array
line=$(sed -n "$SLURM_ARRAY_TASK_ID"p sra_fetch_dump_array.txt)
##get just the species names (removes first field)
## cut is applied to individual line -f = field, 
sra_id=`echo "${line}"|cut -f1`
##gets just the accession numbers 
taxon=`echo "${line}"|cut -f2`

echo $sra_id
echo $taxon

prefetch -X 9999999999999 $sra_id