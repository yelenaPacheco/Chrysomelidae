from Bio import SeqIO
from Bio.Seq import Seq
import glob
import os


##rename read files with taxon ID and species names

with open('fileNames.txt') as f:
	for line in f:
		seqName=line.split(",",1)[0].strip()
		newseqName=line.split(",",1)[1].strip()
		old1=seqName+"_P_R1.fastq"
		old2=seqName+"_P_R2.fastq"
		new1=newseqName+'_P_R1.fastq'
		new2=newseqName+'_P_R2.fastq'
		print(old1,new1)
		os.rename(old1, new1)
		print("Changed ", old1, " to ", new1, "/n")
		os.rename(old2, new2)
		print("Changed ", old2, " to ", new2, "/n")