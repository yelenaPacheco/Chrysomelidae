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
6. Make a config file for the Phyluce assembly.
   * Move one directory up from ```trimmedReads```  
     ```cd ../```
   * Make a `directory.list` of all species directories with trimmed read files `ls -d */ > directory.list`
       * You will need to remove the trailing ```/``` from each line on directory.list
       * Do this using ```nano directory.list```
       * In nano ```cntrl + shift \``` then follow instruction at bottom a screen.
7. Make config file for assembly
   * Use [phyluce_config.py](phyluce_config.py) to make config file.
   * Change path in line 13 to path for your trimmedReads directory
9. Run [phyluceAssembly.sh](phyluceAssembly.sh)
