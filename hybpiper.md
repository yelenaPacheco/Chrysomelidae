# Hybpiper for sequence assembly
Hybpiper uses reference sequences from gene capture to map reads and then  assemble sequences.
Learn more about Hybpiper [here](https://github.com/mossmatters/HybPiper)

Your working directory will be the __trimmed_reads__ directory created with [fastp.sh](fastp.sh)

1. Make a list of all *_P_R1.fastq files called input2.list
2. Name file with reference sequences for read maping *refSequences.fasta* or change file name following `-t_dna` to reference sequence file.
     * This option is for nucleotide refrence sequences for amino acid reference sequences change `-t_dna` option to `t_aa`
     * Reference (target) sequence file should be in the following fasta format  
       \>SpeciesName-gene  
       Nucleotide or amino acid sequence  
     * Example:  
       `>Amborella-atpH`  
       `MNPLISAASVIAAGLAVGLASIGPGVGQGTA`

3. Run (hybpiperAssemble.sh)[hybpiperAssemble.sh]
   * This will output a directory for each taxon in input2.list
   * Within the taxon directory there will be multiple subdirectories for each gene/locus in the *refSequences.fasta* file
4. Make a list of all the taxon directories output from hybpiperAssemble.sh and name it *directory.list*
   You can do this using `ls -d */ > directory.list` You will have to removed the "/" from the direcotry name you can do this using nano
5. Run [hybpiperRetrieve.sh](hybpiperRetrieve.sh)
   * This will create a directory named __loci_fasta_files__ with a single fasta file for each locus in the *refSequences.fasta* file including all taxa where a contig was able to be assembled.
6. In your __trimmed_reads__ directory run [hybpiperStats.sh](hybpiperStats.sh). This will give you a .tsv file with statistics on the number of reads mapped, number of contigs, number of loci, etc. for each taxon in your sample.
7. In your __loci_fasta_files__ directory run [taxonCoverage.sh](taxonCoverage.sh) to create a .csv *taxonCoverage.csv* file that gives you the number of taxa in each gene/locus fasta file.

You are now ready to move onto [treeAssembly.md](treeAssebmly.md)
   
