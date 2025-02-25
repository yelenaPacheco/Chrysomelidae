from Bio import SeqIO
import sys

inputFile = sys.argv[1]
outputFile = sys.argv[2]

wanted_recs =[]
with open(inputFile) as handle:
    for record in SeqIO.parse(handle, "fasta"):
        record.description=''
        wanted_recs.append(record)
SeqIO.write(wanted_recs, outputFile, 'fasta-2line')