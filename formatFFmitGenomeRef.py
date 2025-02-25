from Bio import SeqIO
from Bio.Seq import Seq
import glob
import os



#reformats coding sequence fasta files from genbank to just incude accession number and gene name

with open('mitoGenes.fasta', 'r') as f:				#This is the file downloaded from genebank
        with open ('FF_mitoGenes.fasta', 'w') as fasta:			#name of new file 
                for line in f:
                        if line.startswith('>')==True:					#if line starts with '>' then do the following
                                gene=line.split(' ',2)[1].strip()		#divide line two times based on spaces (results in three elements per line), take the second/middle element
                                gene2=gene[1:-1]						#removes 2st and last character from gene string, this is your sequence 
                                gene3=gene2.replace('=','-')			#replaces '=' with '-'  in gene2 string
                                taxonID=line.split('|',1)[1].strip()	#gets taxonID from the element after the '|'
                                if taxonID.startswith('NC_')==True:											#if the taxonID starts with 'NC_' do the following, this was needed because taxonIDs were formated in multiple different ways 
                                        second_underscore_index=taxonID.find('_', taxonID.find('_')+1)		#gets character index # for the second '_'
                                        taxonID2=taxonID[:second_underscore_index]							#sets taxonID2 to characters before the 2nd '_' including the first '_'
                                #       print(taxonID2)
                                else:
                                     	taxonID2=taxonID.split('_',1)[0].strip()			#for all other taxonIDs take the element before the '_'
                                #       print(taxonID2)
                        
                                with open('names.txt', 'r') as species:					#names.txt is a file with geneBank/taxonIDs and species names in .tsv format
                                        for line_species in species:
                                                columns = line_species.strip().split('\t')		#separate line based on tabs
                                        #       print(str(columns))
                                                if columns[0]==taxonID2:						#if the first column values = the taxonID2 then do ...
                                                        print("found: ", str(columns[1]))			#print ('found' column value) 
                                                        speciesName=str(columns[1])					#get the species name from column two 
                                                        fasta.write(">"+speciesName+'-'+gene3+'\n')		#write speciesName and gene3(sequence) to fasta format
                        else: 
                              	fasta.write(line.strip()+'\n')			#start a new line