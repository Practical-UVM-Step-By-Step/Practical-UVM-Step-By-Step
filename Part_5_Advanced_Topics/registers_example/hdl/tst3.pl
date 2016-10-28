#!/usr/bin/perl -w 

my $i = 12;

open(FILE1,"d") || die "cannot open file d\n";
while(<FILE1>) {


my $address = sprintf("0x%02x",$i);
my $reset= sprintf("\'h%02x",$i);
	chop();
	$register = $_;
	$field = $register;
	$field =~ s/register/field/g;

	# $register <= $reset;
print<<HERE2;
   $address:   $register 
HERE2
;


$i = $i +4;
}
