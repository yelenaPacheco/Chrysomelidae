Steps for Hifi long-read Pacbio Revio genome assembly

1. use (hifiasm.sh)[hifiasm.sh] for initial assembly
   * Hifiasm will automaticaly remove duplicates
   * Output includes 3 .gfa files onfe fore the paired alleles and one fore each haploid

2. Convert the .gfa files for the paired alleles to fasta files using  
   ```awk '/^S/{print ">"$2"\n"$3}' N_clydesmithi.asm.bp.p_ctg.gfa | fold > output.fa ```

3. Use (minimap.sh)[minimap.sh] to map raw reads to assembly for coverage.
    Minimap outputs a .sam file but minimapCov.sh will convert to a .bam file.
    I generated both a .sam and .bam files to use the .sam file for polishing withe racon later on.
   
