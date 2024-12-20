#!/bin/bash                                                                                                                                                        
#SBATCH -J smudge                                                                                                                                               
#SBATCH -o smudge_%A.out                                                                                                                                            
#SBATCH -e smudge_%A.err                                                                                                                                            
#SBATCH -n 20 -N 1
#SBATCH -p atlas
#SBATCH -A aphid_phylogenomics
#SBATCH -t 2-00:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yelena.pacheco@usda.gov


ml miniconda3
source activate /project/aphid_phylogenomics/yelena/software_y

FastK -v -t20 -k21 -M16 -T4 m84100_230830_180417_s4.hifi_reads.fastq.gz -NFastK_table

smudgeplot.py hetmers -L 12 -t 4 -o kmerpairs --verbose FastK_table
smudgeplot.py all -o trial_run kmerpairs_text.smu

ls data/Scer/trial_run_*

conda deactivate