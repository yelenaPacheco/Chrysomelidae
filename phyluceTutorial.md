# Phyluce tutorial
This tutorial goes of steps to prepare SRA data for the Phyluce pipeline and assemble UCE loci using the Phyluce pipeline.  
Original Phyluce tutorial can be foud [here](https://phyluce.readthedocs.io/en/latest/tutorials/tutorial-1.html)

1. Download SRA data. See [sra_toolkit.md](sra_toolkit.md)
   * Rename files with taxa names see [sra_toolkit.md](sra_toolkit.md)
   * Put all raw reads in a directory named ```rawReads```
3. Trimm and clean data. There is an option to do this with the Phyluce pipeline, but you need to know the squencing indicies used for each sample. Becuase we are using publicly available data we don't have the information.
   * I used [trimmomatic.sh](trimmomatic.sh) to trimm reads of adaptor sequences and quality filter.
   * Make a list of all forwards reads call it ```input1.list``` Forwards reads should all be labeled *_1.fastq.gz when downloaded using SRA toolkit.
   * Run trimmomatic.sh, output trimmed reads can be found in a new direcotry call ```trimmedReads```
   * The file endings ```*-READ1.fastq   *-READ2.fastq   *-READ-singleton.fastq ``` are needed for the trimmed reads based on Phyluce formating. 
4. Now we need to put all reads in subdirectories of their respecitive taxon names.
    * ```cd trimmedReads```
    * Make a `input2.list` of all `*-READ1.fastq` files `ls > *-READ1.fastq`
     - Use [make_subDirectories.sh](make_subDirectories.sh) to place trimmed read files into respective species directories.      
5. Make a config file for the Phyluce assembly.
   * Move one directory up from ```trimmedReads```  
     ```cd ../```
   * Make a `directory.list` of all species directories with trimmed read files `ls -d */ > directory.list`
       * You will need to remove the trailing ```/``` from each line on directory.list
       * Do this using ```nano directory.list```
       * In nano ```cntrl + shift \``` then follow instruction at bottom a screen.
   * Use [phyluce_config.py](phyluce_config.py) to make config file.
     * Change path in line 13 to path for your trimmedReads directory
     * This will produce a file called ```assembly.conf```
6. Run [phyluceAssembly.sh](phyluceAssembly.sh)
   * Assembly output can be found in ```spades-assemblies``` directory
   * Within the spades-assemblies directory you will see subdirectories labeld ```<taxonName>_spades``` and one directory called ```contigs```
   * The contigs directory contains symlinks to all the assembled contigs in the respective taxon subdirectories.
7. Format probe sequences for Phyluce
   * Make sure fasta headers for probes are formatted in this exact format. ```>uce-<locus#>_p<probe# |source:<probeCreator>,probes-loucs:uce<locus#>,probes-probe:<probe#>``` example ```>uce-18_p8 |source:faircloth,probes-loucs:uce18,probes-probe:8```
8. Match assembly contigs to probes
   * Use [phyluce_match_contigs.sh](phyluce_match_contigs.sh)
   * Change name of probe fasta files after  ```--probes```
   * Output files can be found in new directory call ```uce-results```
9. Extracting UCE loci
    * First make a list of all the taxa you would like to get the loci fasta files for. You can use the directory.list doc, copy ```directory.list``` to new files ```taxon-set.conf``` add ```[all]``` as first line to taxon-set.conf doc
    * Run [phyluceMatchCounts.sh](phyluceMatchCounts.sh)
    * Output will be in ```taxon-sets``` directory
10. Get fasta file
    * Run [phyluceGetFasta.sh](phyluceGetFasta.sh)
    * This will create three files in the ```taxon-sets/all``` directory and one file in a new ```taxon-sets/all/log``` direcotry
    * ```all-taxa-incomplete.fasta``` contaians sequences for each locus for each taxon
11. Get individual taxon fasta files
    * In the ```taxon-sets/all``` directory run [explodeFasta.sh](explodeFasta.sh)
    * This will make directory ```exploded-fastas``` where there will be a fasta file for each taxon.
    * An assembly summary for each taxon will also be produced a written to the stdout file.
12. To group fasta files my locus do the following steps.
    * Run [phyluce_edgeTrimming.sh](phyluce_edgeTrimming.sh), make sure to change --taxa to your number of taxa
        * You can determine the number of taxa with ```ls *.exploded-fastas | wc -l```
    * Run [phyluce_internalTrimming.sh](phyluce_internalTrimming.sh), this will align sequences using MAFFT  
    * Run [alignmentCleaning.sh](alignmentCleaning.sh), this will clean up the sequence headers so it is just the species names. The output will be a nexus file.
13. To convert the nexus files to fasta files use [convertNexusToFasta.sh](convertNexusToFasta.sh) and [convertNexusToFasta.py](convertNexusToFasta.py)
    * ```cd mafft-nexus-internal-trimmed-clean```
    * Make a list of all the nexus files ```ls *.nexus > input1.list```
    * Modify the --array range for convertNexusToFasta.sh to match the number of nexus files.
    * Modify convertNexusToFasta.sh to load python module or conda env as needed.
    * Run [convertNexusToFasta.sh](convertNexusToFasta.sh)
