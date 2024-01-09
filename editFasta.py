from Bio import SeqIO
from Bio.Seq import Seq
import glob
import os


with open('Coleoptera_AHE_probes.tsv', 'r') as f:
	with open ('ColeopteraProbes.fasta', 'w') as fasta:
		for line in f:
			if line.startswith('>')==TRUE:
				locus1=line.split('-')[0].strip()
				locus2=locus1[1:]
				refTax1=line.split('-')[1].strip()
				refTax2=refTax1.split(' ')[0].strip()
				fasta.write(">"+refTax2+"-"+locus2+'n')
			else: 
				fasta.write(line.strip()+'\n')
				

