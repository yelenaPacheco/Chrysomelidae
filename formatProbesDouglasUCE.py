outfile = open('chrysoUCE_probe_file.fasta', 'w')
with open('Coleoptera_AHE_probes.tsv', 'r') as f:#read file
    probe_cnt = 1	
    current_probe = '' #set as empty string, for probe #
    for line in f:#loop through line
        probe_name, probe_number, seq = line.rstrip().split('\t')#get each line item and remove the carriage return	#.rstrip gets rid of carriage return
        probe_abbrev = ''.join(probe_name.split('-')[1])	#''.join to convert to string
        if not current_probe:	#if the string is empty do something
            wanted_lines = ">%s |source:Faircloth:probes-locus:%s,probes-probes:%s\n%s\n" % (probe_abbrev, probe_abbrev, probe_cnt, seq)
            outfile.write(wanted_lines)
            probe_cnt+=1
            current_probe+=probe_abbrev
        elif probe_abbrev == current_probe:
            wanted_lines = ">%s |source:Faircloth:probes-locus:%s,probes-probes:%s\n%s\n" % (probe_abbrev, probe_abbrev, probe_cnt, seq)
            outfile.write(wanted_lines)
            probe_cnt+=1
        else:
            probe_cnt=1
            wanted_lines = ">%s |source:Faircloth:probes-locus:%s,probes-probes:%s\n%s\n" % (probe_abbrev, probe_abbrev, probe_cnt, seq)
            outfile.write(wanted_lines)
            current_probe=probe_abbrev
outfile.close()		#have to close file when only using '=open'



#output is >L1 |source:Faircloth:probes-locus:L1,probes-probes:9
##need to use grep and regex in bbedite to change sequence header to >uce-1_p9 |source:Faircloth:probes-locus:L1,probes-probes:9