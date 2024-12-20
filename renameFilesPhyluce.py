from Bio import SeqIO
from Bio.Seq import Seq
import glob
import os


##rename read files with taxon ID and species names

with open('names3.txt') as f:
	for line in f:
		seqName=line.split(",",1)[0].strip()
		newseqName=line.split(",",1)[1].strip()
		old1=seqName+"_P_R1.fastq.gz"
		old2=seqName+"_P_R2.fastq.gz"
		old3=seqName+'_U.fastq.gz'
		new1=newseqName+'-READ1.fastq.gz'
		new2=newseqName+'-READ2.fastq.gz'
		new3=newseqName+'-READ-singleton.fastq.gz'
		print(old1,new1)
		os.rename(old1, new1)
		print("Changed ", old1, " to ", new1, "/n")
		os.rename(old2, new2)
		print("Changed ", old2, " to ", new2, "/n")
		os.rename(old3, new3)
		print("Changed ", old3, " to ", new3, "/n")