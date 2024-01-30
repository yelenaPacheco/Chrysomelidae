from Bio import SeqIO
from Bio.Seq import Seq
import glob
import os

#reformats fasta headers to work with Hybpiper
#the locus number needs to be the last thing listed in the fasta header
#original header format >Coleoptera-L1-Col1.8.56
#new header format >Col1.8.56.Coleoptera-L1


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
				

