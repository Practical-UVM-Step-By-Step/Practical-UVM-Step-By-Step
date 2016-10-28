#!/usr/bin/perl -w 

my $i = 12;

open(FILE1,"d") || die "cannot open file d\n";
while(<FILE1>) {
my $address = sprintf("@\'h%04x",$i);
my $reset= sprintf("\'h%02x",$i);
	chop();
	$register = $_;
	$field = $register;
	$field =~ s/register/field/g;

print<<HERE;
	register $register $address \{
		field $field \{
		   bits 15;
		   access rw;
		   reset $reset;
	\}
	\}
HERE
;

$i = $i +4;
}
