#!/usr/bin/perl
print "enter your module name: \n";
$modname=<STDIN>;
print "enter your first input: \n";
chomp( $a=<STDIN>);
print "enter your second input :\n";
chomp ( $b=<STDIN>);
print "enter your output\n";
chomp ($c=<STDIN>);
$temp=";";
print "\n Module  $modname ($c,$a,$b) $temp";
print  "\n input $a,$b $temp";
print  "\noutput  $c;";
print  "\nassign $c=($a && $b);";
print "\n endmodule ";


