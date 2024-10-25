# Phyluce tutorial
This tutorial goes of steps to prepare SRA data for the Phyluce pipeline and assemble UCE loci using the Phyluce pipeline.  
Original Phyluce tutorial can be foud [here](https://phyluce.readthedocs.io/en/latest/tutorials/tutorial-1.html)

1. Download SRA data. See [sra_toolkit.md](sra_toolkit.md)
2. Trimm and clean data. There is an option to do this with the Phyluce pipeline, but you need to know the squencing indicies used for each sample. Becuase we are using publicly available data we don't have the information.
   * I used [fastp.sh](fastp.sh) to trimm reads of adaptor sequences.
3. Now we need to change the names of the trimmed files to match the Phyluce format.
   * Make a `input.list` of all `R1` read files. `ls > *_P_R1.fastq`
     - Use [nameFormatPhhyluce.sh](nameFormatPhyluce.sh) to change the file names.
    * Make a `input2.list` of all `1-READ1.fastq` files `ls > *-READ1.fastq`
     - Use [make_subDirectories.sh](make_subDirectories.sh) to place trimmed read files into respective species directories.      
4. Make a config file for the Phyluce assembly.
   * Make a `directory.list` of all species directories with trimmed read files `ls -d */ > directory.list`
   * Use [phyluce_config.py](phyluce_config.py) to make config file. 
5. Run [phyluceAssembly.sh](phyluceAssembly.sh)
