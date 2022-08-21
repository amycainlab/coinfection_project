#!/usr/bin/perl

use strict;

open(GFF,$ARGV[0]);

print "GeneID\tChr\tStart\tEnd\tStrand\n";

while(<GFF>)
{
	chomp($_);
	next if ($_!~/\tgene\t/);
	my @line = split(/\t/,$_);
	my $chrom = $line[0];
	my $start = $line[3];
	my $end = $line[4];
	my $strand = $line[6];

	my @name_info = split(/\;/,$line[8]);

	my $gene_name;

	for(my $i=0;$i<@name_info;$i++)
	{
		if($name_info[$i]=~/^Name\=(\S+)/)
		{
			$gene_name=$1;
			last;
		}
	}
	print "$gene_name\t$chrom\t$start\t$end\t$strand\n";
}
close(GFF);
