#!/bin/bash
#SBATCH -J hybpiperAssemble
#SBATCH -o hybpiperAssemble_%A_%a.out
#SBATCH -e hybpiperAssemble_%A_%a.err
#SBATCH --array=1-3
#SBATCH -n 40 -N 1
#SBATCH -p short
#SBATCH -t 2-00:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yelena.marlese@gmail.com

module load miniconda
source activate /project/leafbeetle_phylogenomics/yelena/hybpiper



infile=$(cat test1.list | head -n ${SLURM_ARRAY_TASK_ID} | tail -n1)

base=$(basename ${infile} _P_R1.fastq)


hybpiper assemble \
-r ${base}_P_R1* ${base}_P_R2* \
--unpaired ${base}_U* \
-t_dna ColeopteraProbes.fasta \
--prefix ${base} \
--bwa \
--cpu 40 --bbmap_memory 10 --bbmap_threads 40

-

conda deactivate

