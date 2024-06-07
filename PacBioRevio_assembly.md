Steps for Hifi long-read Pacbio Revio genome assembly

1. use [hifiasm.sh](hifiasm.sh) for initial assembly
   * Hifiasm will automaticaly remove duplicates
   * Output includes 3 .gfa files onfe fore the paired alleles and one fore each haploid

2. Convert the .gfa files for the paired alleles to fasta files using  
   ```awk '/^S/{print ">"$2"\n"$3}' N_clydesmithi.asm.bp.p_ctg.gfa | fold > output.fa ```

3. Use [minimap.sh](minimap.sh) to map raw reads to assembly for coverage.
    Minimap outputs a .sam file but minimapCov.sh will convert to a .bam file.
    I generated both a .sam and .bam files to use the .sam file for polishing withe racon later on.
   
6. Run [blobBlast.sh](blobBlast.sh) that uses megaBlast, need output of this for blobTools
7. Run [blobdb.sh](blobdb.sh) to make circle and snail plots of assembly  
    The circle plots show which genera the reads blasted to.

8. Ran stats.sh with BBtools/BBmap, ran in interactive session and piped output to .txt file, parameteris in .sh script
    Documentationa here: https://github.com/BioInfoTools/BBMap  
     Output: hifiasim_asm_stats.txt
9. Check assembly for completeness using BUSCO genes
   Run [busco.sh](busco.sh)

10. Filtered .bam assebmly file for adaptor sedquences using [adaptFilt.sh](adaptfilt.sh)
      This script uses [hifiadapterfilt.sh](https://github.com/sheinasim/HiFiAdapterFilt)
