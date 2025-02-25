from Bio import SeqIO
import sys

orig_stdout = sys.stdout
f = open(sys.argv[2], 'w')
sys.stdout = f

for record in SeqIO.parse(sys.argv[1], "fasta"):
	#print(">", record.id, "\n", record.seq.ungap("-"), sep="")
	ungapped_seq = record.seq.replace("-", "")
	print(f">{record.id}\n{ungapped_seq}")
sys.stdout = orig_stdout
f.close()

#myseq.replace(gap, "") 

### unalign2.py
