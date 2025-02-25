from Bio import SeqIO
from Bio.Seq import Seq
import glob
import os

#Converts a .tsv file with format probe number, probe sequence to a FASTA file, 
#output file will need further editing for Hybpiper or Phyluce

with open('Coleoptera_AHE_probes.tsv', 'r') as f:
	with open ('ColeopteraProbes.fasta', 'w') as fasta:
		for line in f:
			headerLine = f.readline()
			locus=line.split("\t")[0].strip()		#locus number value
			refTaxon=line.split("\t")[1].strip()	#taxon name
			sequence=line.split("\t")[2].strip()	#sequence
			fasta.write(">"+refTaxon+'.'+locus+'\n'+sequence+'\n')


