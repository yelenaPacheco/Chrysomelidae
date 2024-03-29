## Use fastp to trimm Illumina adaptors from reads. Learn more about [fastp](https://github.com/OpenGene/fastp)


1. Make a file called input.list that includes all the *_1.fastq files
2. Run [fastp.sh](fastp.shn)  
   This will create two directories  
   * **trimmed_reads** that contains all the read trimmed of adaptor sequences
   * **fastp_trimming_doc** that contains report files about reads that failed trimming/quality control. 
