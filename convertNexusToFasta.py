from Bio import SeqIO
import sys


inputFile = sys.argv[1]		#input nexus file
outputFile = sys.argv[2]	#output fasta file



count = SeqIO.convert(inputFile, "nexus", outputFile, "fasta")
print("Converted %i records" % count + '\t' +  inputFile)

