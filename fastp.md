## Use fastp to trimm Illumina adaptors from reads. Learn more about [fastp](https://github.com/OpenGene/fastp)


1. Make a file called input.list that includes all the *_1.fastq files from ssr toolkit downloads. 
2. Run [fastp.sh](fastp.shn), in the directory with ssr reads.  
   This will create two directories  
   * **trimmed_reads** that contains all the read trimmed of adaptor sequences
   *    2-3 trimmed read files will be output depending on the presence of unpaired reads
   *    Paired reads: *_P_R1.fastq, *_P_R2.fastq
   *    Unpaired reads: *_U.fastq
   * **fastp_trimming_doc** that contains report files about reads that failed trimming/quality control. 

Next step is Hybpiper read assembly [hybpiper.md](hybpiper.md)
