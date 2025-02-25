from Bio import SeqIO
import glob 
import os
import sys


##filteres short reads based on phred score

inputFile = sys.argv[1]		#input read file



file_handle= open(inputFile, "r")
good_reads = (
	rec
	for rec in SeqIO.parse(file_handle, "fastq")			#indicating that input file is a fastq
	if min(rec.letter_annotations["phred_quality"]) >= 36	#filtering individual reads based ona minimum phred score of 36
)
count = SeqIO.write(good_reads, "new_"+inputFile, "fastq")	#writing reads with >36 phred score to new fastq file
print(f"Saved {count} reads.")
file_handle.close()



#modified from Lan Dominkovic 12 days of Python  https://www.youtube.com/watch?v=Go0IATSC1uE&t=157sRea