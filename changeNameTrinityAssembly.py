from Bio import SeqIO
from Bio.Seq import Seq
import glob
import os


#this script renames trinity assembles with the extension *.trinity.fasta to *_trinity.fasta
#blast.list is a list of trinity assembly file names

with open('blast.list') as f:
	for line in f:
		taxaname=line.split(".",1)[0].strip()
		extra=line.split(".",1)[1].strip()
		newname=taxaname
		oldname=taxaname+"."+extra
		newFile=newname+".fasta"
		os.rename(oldname, newFile)
		

		



