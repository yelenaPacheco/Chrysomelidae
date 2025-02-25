from Bio import SeqIO

nuc_header = []
with open('cds_from_genomic.fna') as handle:
    for record in SeqIO.parse(handle, 'fasta'):
        wanted_id = record.id.split('_')[-2]
        nuc_header.append(wanted_id)

prot_header = []
with open('protein.faa') as handle:
	for record in SeqIO.parse(handle, 'fasta'):
		prot_header.append(record.id)
		



missingCDSseq = list(set(nuc_header) - set(prot_header))

print(str(missingCDSseq))    

