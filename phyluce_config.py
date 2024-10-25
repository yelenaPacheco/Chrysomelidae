from Bio import SeqIO
from Bio.Seq import Seq
import glob
import os
import sys

##make assembly.conf file for phyluce

with open ('directory.list', 'r') as f:
	with open ('assembly.conf', 'w') as configFile:
		for line in f:
			sampleName=line.split('/',1)[0].strip()
            configFile.write(sampleName+':/90daydata/leafbeetle_phylogenomics/yelena/Douglas_phyluce/trimmed_reads/'+sampleName+'\n')