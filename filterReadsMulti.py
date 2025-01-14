from Bio import SeqIO
import glob 
import os
import sys


inputFile = sys.argv[1]



file_handle= open(inputFile, "r")
good_reads = (
	rec
	for rec in SeqIO.parse(file_handle, "fastq")
	if min(rec.letter_annotations["phred_quality"]) >= 36
)
count = SeqIO.write(good_reads, "new_"+inputFile, "fastq")
print(f"Saved {count} reads.")
file_handle.close()



#modified from Lan Dominkovic 12 days of Python  https://www.youtube.com/watch?v=Go0IATSC1uE&t=157sRea