#!/usr/bin/perl

use strict;

open(D,"many2many_fastaniAcB.out.matrix") || die "$!\n";

while(<D>)
{
	chomp($_);
	$_=~s/\r//g;
	$_=~s/^\/\S+\///;
	$_=~s/\.fna//;
	$_=~s/\_genomic//;
	$_=~s/_HGAP\S+|_ASM\S+//g;
	my @line = split(/\t/,$_);

	my $new_line="";
	for(my $i=0;$i<@line;$i++)
	{
		if($line[$i]=~/(\d+\.\d+)/ & $line[$i]!~/[A-Za-z]/)
		{
			my $perc = $1;
			my $dist = 100 - $perc;
			$new_line = $new_line . $dist . "\t";
		}
		else
		{
			$new_line = $new_line . $line[$i] . "\t";
		}
	}
	$new_line=~s/\t$//;
	print "$new_line\n";
}

