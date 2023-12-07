from Bio import SeqIO
from Bio.Seq import Seq
import glob
import os

# This script is for changing the names of the fastq files generated by sratoolkits fetch for the other genomes.
# Input: sra_fetch_dump_array_list.txt, fastq files in the format SRR9901306_1.fastq and SRR9901306_2.fastq
# Output: fastq files in the format other_ACRA_LBME_SRR9901306_1.fastq, other_ACRA_LBME_SRR9901306_2.fastq
# First, it should read in the sra_fetch_dump_array_list.txt. Then, for each line, it should name the first part SRA and the second part taxname. It should change the name of the file called SRA_1.fastq to "other_","newname","_1.fastq"


with open('Douglas_Chrysomelid.tsv') as f:
	for line in f:
		SRA=line.split("\t",1)[1].strip()
		taxname=line.split("\t",1)[0].strip()
		newname= taxname
		old1=SRA+"_1.fastq"
		new1=newname+ "_1.fastq"
		old2=SRA+"_2.fastq"
		new2=newname+ "_2.fastq"
		print(old1,new1)
		os.rename(old1, new1)
		print("Changed ", old1, " to ", new1, "/n")
		os.rename(old2, new2)
		print("Changed ", old2, " to ", new2, "/n")