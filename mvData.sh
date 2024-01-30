#!/bin/bash
#SBATCH -J blastn
#SBATCH -o blastn_%A_%a.out
#SBATCH -e blastn_%A_%a.err
#SBATCH -n 20 -N 1
#SBATCH -p short
#SBATCH -t 2-00:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yelena.marlese@gmail.com\


cp *.fastq  rawReads_transcripts  

gzip -r  rawReads_transcripts  

gzip -r /90daydata/leafbeetle_phylogenomics/yelena/chryso_transcripts/trimmed_reads_Transcripts/hybpiper/transcript_sequences

cp -r rawReads_transcripts /project/leafbeetle_phylogenomics/yelena/transcript_sequences

cp -r /90daydata/leafbeetle_phylogenomics/yelena/chryso_transcripts/trimmed_reads_Transcripts/hybpiper/transcript_sequences /project/leafbeetle_phylogenomics/yelena/transcript_sequences