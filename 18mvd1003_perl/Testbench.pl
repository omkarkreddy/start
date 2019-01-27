#!/usr/bin/perl


print "Enter the file name:";
$fn = <stdin>;
chomp($fn);
open(File,"$fn.v");
@l = <File>;
print "@l";
$f = <stdin>;
close(File);

open(File,'>'."$fn"."_tb.v");
print File "module $fn"."_tb();\n\n";

@fin = grep(/input/,@l);

foreach $li(@fin)
{
$li =~ s/input/reg/;
print File $li;
}

@fot = grep(/output/,@l);

foreach $li(@fot)
{
$li =~ s/output/wire/;
print File $li;
}

@mn  = grep(/module/,@l);
@smn = split(' ',$mn[0]);
print" @smn\n\n";
print "$#smn\n";
print File "\n$smn[1] I1 $smn[2]  $smn[3] $smn[4]\n\ninitial\nbegin\n\n\t//Testcase\n\nend\n\nendmodule";

close(File);