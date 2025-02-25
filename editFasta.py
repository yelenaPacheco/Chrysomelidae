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
			if line.startswith('>')==True:				#if the line starts with '>' do the following
				locus1=line.split('-')[0].strip()		#takes characters before the '-', double check it doesn't just take '>Coleoptera' 
				locus2=locus1[1:]						#remove '>'
				refTax1=line.split('-')[1].strip()		#take characters after '-' this should be the taxonID, double check it takes right split  
				refTax2=refTax1.split(' ')[0].strip()	#removes trailing spaces
				fasta.write(">"+refTax2+"-"+locus2+'\n')	#rewrite to needed format (see above)
			else: 
				fasta.write(line.strip()+'\n')			#if the line is a DNA sequence then write to file 
				

