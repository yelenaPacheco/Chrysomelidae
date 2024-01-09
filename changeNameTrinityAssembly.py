from Bio import SeqIO
from Bio.Seq import Seq
import glob
import os


with open('blast.list') as f:
	for line in f:
		taxaname=line.split(".",1)[0].strip()
		extra=line.split(".",1)[1].strip()
		newname=taxaname
		oldname=taxaname+"."+extra
		newFile=newname+".fasta"
		os.rename(oldname, newFile)
		

		



