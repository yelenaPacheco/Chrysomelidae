#!/bin/bash
#SBATCH -J mafft
#SBATCH -o mafft_%A_%a.out
#SBATCH -e mafft_%A_%a.err
#SBATCH --array=1-2
#SBATCH -n 40 -N 1
#SBATCH -p short,scavenger
#SBATCH -t 2-00:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yelena.pacheco@usda.gov

#Align loci fasta files in mafft





module load mafft/7.505

wrkDIR='/90daydata/leafbeetle_phylogenomics/yelena/publicData/concatFasta'


#create output directory for aligned files
if [ ! -d ${wrkDIR}/AlignFasta ]
then
  mkdir -p ${wrkDIR}/AlignFasta 
fi


aligned='/90daydata/leafbeetle_phylogenomics/yelena/publicData/concatFasta/AlignFasta'


infile=$(cat loci.list | head -n ${SLURM_ARRAY_TASK_ID} | tail -n1)
base=$(basename ${infile} .FNA)


mafft --auto ${infile} >${aligned}/aln_${base}.fasta
echo ${infile}
echo aln_${base}


