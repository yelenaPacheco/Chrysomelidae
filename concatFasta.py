from Bio import SeqIO

# List of input FASTA files
input_files = ['file1.fasta', 'file2.fasta', 'file3.fasta']

# Dictionary to store sequences for each taxon
taxon_sequences = {}

# Read sequences from each file and store them in the dictionary
for file in input_files:
    for record in SeqIO.parse(file, 'fasta'):
        taxon = record.id.split('|')[0]  # Modify this line based on your header format
        sequence = str(record.seq)
        
        if taxon not in taxon_sequences:
            taxon_sequences[taxon] = sequence
        else:
            taxon_sequences[taxon] += sequence

# Write combined sequences to a new FASTA file
with open('combined.fasta', 'w') as output_file:
    for taxon, sequence in taxon_sequences.items():
        output_file.write(f'>{taxon}\n{sequence}\n')
        


###########################
###########################
#not sure I ever used this, got it online, use modifications of ...
