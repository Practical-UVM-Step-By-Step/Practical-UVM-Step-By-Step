#!/usr/bin/perl -w 

my $i = 12;

open(FILE1,"d") || die "cannot open file d\n";
while(<FILE1>) {


my $address = sprintf("\'h%02x",$i);
my $reset= sprintf("\'h%02x",$i);
	chop();
	$register = $_;
	$field = $register;
	$field =~ s/register/field/g;

	# $register <= $reset;
print<<HERE2;
   $address:  begin
   		if(WE_I) begin
		 $register <= DAT_I[15:0];	
		end
		else begin
		DAT_O <= {16'b0, $register};

		end
	      end

HERE2
;


$i = $i +4;
}
