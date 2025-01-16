from Bio import SeqIO
from Bio.Seq import Seq
import glob
import os
import sys

##make assembly.conf file for phyluce

with open ('directory.list', 'r') as f:
        with open ('assembly.conf', 'w') as configFile:
                configFile.write('[samples]'+'\n')
                for line in f:
                        sampleName=line.strip()
                        configFile.write(sampleName+':/90daydata/leafbeetle_phylogenomics/yelena/publicDataPhyluce/mergedReads/'+sampleName+'\n')