from Bio import SeqIO
from Bio.Seq import Seq
import glob
import os
import sys

##format fastq headers for aTRAM
##run seprately for each read file, first run use '/1' for forward reads (line 19), change to '/2' for reverse reads


inputFile = sys.argv[1]
outputFile = sys.argv[2]


with open (inputFile, 'r') as f: 
        with open (outputFile, 'w') as fasta: 
                for line in f: 
                        if line.startswith('@')==True:
                                headerName=line.split(' ')[0].strip()
                                fasta.write(headerName+'/1'+'\n')
                        else:
                                fasta.write(line.strip()+'\n')
