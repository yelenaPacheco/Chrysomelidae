#!/bin/bash
#SBATCH -J hybpiperAssemble
#SBATCH -o hybpiperAssemble_%A_%a.out
#SBATCH -e hybpiperAssemble_%A_%a.err
#SBATCH --array=1-3
#SBATCH -n 40 -N 1
#SBATCH -p short
#SBATCH -t 2-00:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yelena.pacheco@usda.gov

#First step of hybpiper piperline, assembles individual loci contigs from raw reads for each individual taxon


#--- Starrt timer
t1=$(date +"%s")

module load miniconda
source activate /project/leafbeetle_phylogenomics/yelena/hybpiper



infile=$(cat input2.list | head -n ${SLURM_ARRAY_TASK_ID} | tail -n1)

base=$(basename ${infile} _P_R1.fastq)


hybpiper assemble \
-r ${base}_P_R1* ${base}_P_R2* \
--unpaired ${base}_U* \
-t_dna refSequences.fasta \
--prefix ${base} \
--bwa \
--cpu 40 --bbmap_memory 10 --bbmap_threads 40


conda deactivate


#---Complete job
t2=$(date +"%s")
diff=$(($t2-$t1))
echo "[---$SN---] ($(date)) $(($diff / 60)) minutes and $(($diff % 60)) seconds elapsed."
echo "[---$SN---] ($(date)) $SN COMPLETE."


# test1.list list of al P_R1.fastq files
# -r forward and reverse paired reads 
# --unpaired unpaired reads
# -t_dna fasta with reference loci
# --prefix output directory name
# match cpu and bbmap_threads to # of cores



