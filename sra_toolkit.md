# Obtaining data from NCBI using SRA toolkit 
SRA toolkit allows you to directly download sequence data from NCBI to the cluster via the command line. 
More infomation about SRA toolkit can be found [here](https://hpc.nih.gov/apps/sratoolkit.html)

Make a srr.txt file with a list of your species/sample names and their SRR numbers. 
Example: 
```
Colaphellus_bowringi	SRR22371312
Monochamus_alternatus	SRR21992444
```

1. Run [sraFetch.sh](sraFetch.sh), this will download a directory for each SRR number with a .sra file in each directory.  
   This is an array job, so change the array range in the job header to the number of taxa in srr.txt.



2. Use [sra_fastqDump.sh](sra_fastpDump.sh) to convert .sra files to fastq files.  
  This will output two .fastq files per .sra file, one forward reads (*_1.fastq) and one reverse reads (*_2.fastq) file. 
4. Run [nameChange.py](nameChange.py) to change the name of each .fastq file to its taxon name from srr.txt.  
   Example: Taxon, Colaphellus_bowringi	SRR22371312
```
oldName SRR22371312_1.fastq   SRR22371312_2.fastq
newName Colaphellus_bowringi_1.fastq   Colaphellus_bowringi_2.fastq
```
