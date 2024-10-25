#!/bin/bash
#SBATCH -J hybpiperStats   
#SBATCH -o hybpiperStats_%A_%a.out
#SBATCH -e hybpiperStats_%A_%a.err
#SBATCH -n 20 -N 1
#SBATCH -p short
#SBATCH -t 2-00:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yelena.pacheco@usda.gov

#optional step 3 in hyhbpiper pipeline
#output gives a .tsv file with the number of reads mapped, number of contigs, etc. per sample

#--- Starrt timer
t1=$(date +"%s")



module load miniconda
source activate /project/leafbeetle_phylogenomics/yelena/hybpiper


hybpiper stats --targetfile_dna ../ColeopteraProbes.fasta   gene directory.list 


conda deactivate


#---Complete job
t2=$(date +"%s")
diff=$(($t2-$t1))
echo "[---$SN---] ($(date)) $(($diff / 60)) minutes and $(($diff % 60)) seconds elapsed."
echo "[---$SN---] ($(date)) $SN COMPLETE."


# --targetfile_dna fasta file w/reference sequences
# gene list of all directories output from hybpiperAssemble.sh
