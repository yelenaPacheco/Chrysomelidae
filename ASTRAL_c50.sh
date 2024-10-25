#!/bin/bash
#SBATCH --job-name=astral-pro
#SBATCH -p short,scavenger
#SBATCH -n 40 -N1
#SBATCH --mem=40gb
#SBATCH -t 2-00:00:00
#SBATCH --output=astral-pro.%j.out
#SBATCH --error=astral-pro.%j.error
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yelena.pacheco@usda.gov

module load java/17

#directory where consensus trees will be output to
mkdir c50_consensus
outDir="/90daydata/leafbeetle_phylogenomics/yelena/publicData/concatFasta/AlignFasta/gblocks/trees/c50_consensus"

## Concatenate bipartition trees into one file:
cat *.treefile >> $outDir/c50_allTrees.tre

## report number of gene trees input into species tree estimation
cat $outDir/c50_allTrees.tre | wc -l > $outDir/totalNumber_c50_geneTrees.txt

# message from GACRC help:
## newick-utils v1.6 is installed as a Singularity image on Sapelo2. Its full path on Sapelo2 is /apps/singularity-images/newick-utils-1.6.sif . Please use this software with singularity exec command, for example:    singularity exec /apps/singularity-images/newick-utils-1.6.sif nw_ed -h
## If you want to, you can take a look at other nw utilities with:    singularity exec /apps/singularity-images/newick-utils-1.6.sif ls /usr/local/bin
## You don't need to load any modules to use Singularity. For your reference:
#https://wiki.gacrc.uga.edu/wiki/Software_on_Sapelo2#Singularity_Containers
#https://wiki.gacrc.uga.edu/wiki/Running_Jobs_on_Sapelo2#Singularity_job

## collapse all nodes in each gene tree with >10% BS support - ASTRAL manual suggests this
#singularity exec /apps/singularity-images/newick-utils-1.6.sif nw_ed $outDir/c50_allTrees.tre 'i & b<=10' o > $outDir/BS10_c50_allTrees.tre

## change directories to astral
cd $outDir


## produces MSC tree using gene trees with low supported nodes collapsed into polytomies
#astral-pro -t 12 -i BS10_c50_allTrees.tre -o BS10_c50_consensusTree.tre 2>BS10_c50_consensusTree.log

## produces MSC tree using original gene trees from iqtree (ie, fully bifurcating)
java -jar /project/leafbeetle_phylogenomics/yelena/Astral/astral.5.7.8.jar  -t 12 -i c50_allTrees.tre -o c50_consensusTree.tre 2>c50_consensusTree.log