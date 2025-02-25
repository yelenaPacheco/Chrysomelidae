from Bio import SeqIO
from Bio.Seq import Seq
import glob
import os

#reformats probe fasta headers to work with Phyluce
## Coleoptera-UCE-2.1k.-v1_test.fasta is the full beetle probe list, this is not the same as the Douglas Probe list 
#for Douglas probes use formatProbesDouglasUCE.py



with open('Coleoptera-UCE-1.1K-v1_test.fasta', 'r') as f:
	with open ('phyluceProbesFormat.fasta', 'w') as fasta:
		for line in f:
			if line.startswith('>')==True:
				startText=line.split(' ')[0].strip()
				source1=line.split(":",3)[2].strip()
				source2=source1.split(',')[0].strip()
				locus1=line.split('probeslocus:')[1].strip()
				locus2=locus1.split(',')[0].strip()
				probe1=lines.split('probesprobe:'),[1].strip()
				probe2=probe1.split(',')[0].strip()
				fasta.write(startText+' |source:'+source2+',probes-loucs:'+locus2+',probes-probe:'+probe2='\n')
			else: 
				fasta.write(line.strip()+'\n')
				

