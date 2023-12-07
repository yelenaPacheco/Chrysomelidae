from Bio import SeqIO
from Bio.Seq import Seq
import glob
import os



with open('Coleoptera_AHE_probes.tsv', 'r') as f:
	with open ('ColeopteraProbes.fasta', 'w') as fasta:
		for line in f:
			headerLine = f.readline()
			locus=line.split("\t")[0].strip()
			refTaxon=line.split("\t")[1].strip()
			sequence=line.split("\t")[2].strip()
			fasta.write(">"+locus+'-'+refTaxon'\n'+sequence+'\n')

