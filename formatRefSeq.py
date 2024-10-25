from Bio import SeqIO
from Bio.Seq import Seq
import glob
import os


for file in glob.glob("*.fa"):
        loci=file.split('.',1)[0].strip()
        with open (file, 'r+') as f: 
                with open ('ref_seq.fasta', "a") as newf:
                        for line in f: 
                                if line.startswith('>')==True:
                                        newline=line.strip()+'-'+loci
                                        print(newline)
                                        newf.write(newline+'\n')
                                else:
                                     	newf.write(line.strip()+'\n')

