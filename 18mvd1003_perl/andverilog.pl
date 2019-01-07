#!/usr/bin/perl
print "enter your module name: \n";
chomp($modname=<STDIN>);
print "enter your first input: \n";
chomp( $a=<STDIN>);
print "enter your second input :\n";
chomp ( $b=<STDIN>);
print "enter your output\n";
chomp ($c=<STDIN>);
open (vlog,">$modname".".v");
print vlog  " module $modname($c,$a,$b);\n";
print vlog  " input $a,$b;\n ";
print vlog  "output  $c;\n";
print vlog  "assign $c=($a && $b);\n";
print vlog  " endmodule \n";
close vlog;

