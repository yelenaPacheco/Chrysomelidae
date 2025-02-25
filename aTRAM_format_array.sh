#!/bin/bash
#SBATCH -J rename
#SBATCH -o rename_%A_%a.out
#SBATCH -e rename_%A_%a.err
#SBATCH --array=1-3
#SBATCH -n 10 -N 1
#SBATCH -p atlas
#SBATCH -t 2-00:00:00
#SBATCH --mem=1G
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yelena.pacheco@usda.gov


##reformat multiple fastq files so header is compatible for aTRAM precursor


#--- Starrt timer
t1=$(date +"%s")

#set up array
infile=$(cat format1.list | head -n ${SLURM_ARRAY_TASK_ID} | tail -n1)


ml miniconda3
source activate /project/aphid_phylogenomics/yelena/software_y

python aTRAM_formatFASTQ.py ${infile} new_${infile}


conda deactivate 



#---Complete job
t2=$(date +"%s")
diff=$(($t2-$t1))
echo "[---$SN---] ($(date)) $(($diff / 60)) minutes and $(($diff % 60)) seconds elapsed."
echo "[---$SN---] ($(date)) $SN COMPLETE."

## new_${infile} output file 