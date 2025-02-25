from Bio import SeqIO
from Bio.Seq import Seq
import glob
import os


for file in glob.glob("*.fa"):								#for all the *.fa files do...
        loci=file.split('.',1)[0].strip()					#get the name of the files but remove .fa
        with open (file, 'r+') as f: 						#open the .fa file
                with open ('ref_seq.fasta', "a") as newf:	#set up to write all sequences in *.fa to a single file
                        for line in f: 			
                                if line.startswith('>')==True:				#file line starts with '>' do...
                                        newline=line.strip()+'-'+loci		#join the current line with the name of .fa file
                                        print(newline)						#print above output to double check
                                        newf.write(newline+'\n')			#write to the new file
                                else:
                                     	newf.write(line.strip()+'\n')		#if id doesn't start with '>' then write the the new file, this will be your sequence



#can use to make a reference sequence file from orthofinder output 