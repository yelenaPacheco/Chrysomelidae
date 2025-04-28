#!/bin/bash

while read line
do 
	base=(basename ${line} _spades)
	ln -s /90daydata/leafbeetle_phylogenomics/yelena/chrysomelid_seqPlate01/round2_assemblies/${base}/${base}.contigs.fasta
done <spadesDir.list 