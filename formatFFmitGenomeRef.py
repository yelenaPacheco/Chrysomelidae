from Bio import SeqIO
from Bio.Seq import Seq
import glob
import os



#reformats coding sequence fasta files from genbank to just incude accession number and gene name

with open('mitoGenes.fasta', 'r') as f:
        with open ('FF_mitoGenes.fasta', 'w') as fasta:
                for line in f:
                        if line.startswith('>')==True:
                                gene=line.split(' ',2)[1].strip()
                                gene2=gene[1:-1]
                                gene3=gene2.replace('=','-')
                                taxonID=line.split('|',1)[1].strip()
                                if taxonID.startswith('NC_')==True:
                                        second_underscore_index=taxonID.find('_', taxonID.find('_')+1)
                                        taxonID2=taxonID[:second_underscore_index]
                                #       print(taxonID2)
                                else:
                                     	taxonID2=taxonID.split('_',1)[0].strip()
                                #       print(taxonID2)
                        
                                with open('names.txt', 'r') as species:
                                        for line_species in species:
                                                columns = line_species.strip().split('\t')
                                        #       print(str(columns))
                                                if columns[0]==taxonID2:
                                                        print("found: ", str(columns[1]))
                                                        speciesName=str(columns[1])
                                                        fasta.write(">"+speciesName+'-'+gene3+'\n')
                        else: 
                              	fasta.write(line.strip()+'\n')