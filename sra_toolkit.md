# Obtaining data from NCBI using SRA toolkit 
SRA toolkit allows you to directly download sequence data from NCBI to the cluster via the command line. 
More infomation about SRA toolkit can be found [here](https://hpc.nih.gov/apps/sratoolkit.html)

First you will need a .txt file with a list of your species/sample names and their SRR numbers. 
Example: 
```
Colaphellus_bowringi	SRR22371312
Monochamus_alternatus	SRR21992444
```

Use [sraFetch.sh](Chrysomelidae/sraFetch.sh) and replace the file name on line 22 (Douglas_Chrysomelid.tsv) with the name of your file containing species names and SRR numbers

