from Bio import SeqIO
from Bio.Seq import Seq
import glob
import os


#this script renames trinity assembles with the extension *.trinity.fasta to *_trinity.fasta
#blast.list is a list of trinity assembly file names

with open('blast.list') as f:
	for line in f:
		taxaname=line.split(".",1)[0].strip()	#take characters before the first '.'
		extra=line.split(".",1)[1].strip()		#take characters after the first '.'
		newname=taxaname						#newname = species name 
		oldname=taxaname+"."+extra				#oldname = 'species name'.tirnity.fasta, this could be the same as line
		newFile=newname+".fasta"				#newFile is the new name of the file = species name .fasta 
		os.rename(oldname, newFile)				#replace old file name with new file name 
		

		



