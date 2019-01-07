#!/usr/bin/perl

print "welcome to ip generator\n";
print "enter the combo logic name\n";
chomp($temp=<stdin>);
if($temp=~ /And/)
{
&And();
}
if($temp=~ /Or/)
{
&Or();
}
if($temp=~ /Nand/)
{
&Nand();
}
if($temp=~ /Nor/)
{
&Nor();
}
if($temp=~ /Xor/)
{
&Xor();
}
if($temp=~ /Xnor/)
{
&Xnor();
}
print "went and came from the suroutine\n";


sub And
{
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
print vlog  "assign $c=($a & $b);\n";
print vlog  " endmodule \n";
close vlog;
}

sub Or
{
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
print vlog  "assign $c=($a | $b);\n";
print vlog  " endmodule \n";
close vlog;
}

sub Nand
{
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
print vlog  "assign $c=~($a & $b);\n";
print vlog  " endmodule \n";
close vlog;
}

sub Nor
{
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
print vlog  "assign $c=~($a | $b);\n";
print vlog  " endmodule \n";
close vlog;
}

sub Xor
{
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
print vlog  "assign $c=($a ^ $b);\n";
print vlog  " endmodule \n";
close vlog;
}

sub Xnor
{
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
print vlog  "assign $c=~($a ^ $b);\n";
print vlog  " endmodule \n";
close vlog;
}
