#!/usr/bin/perl
print "enter the file name\n";
chomp($fn=<STDIN>);
print "enter the extension\n";
chomp($ext=<STDIN>);
open(File,"$fn".".$ext");
print "$ext\n";
@temp=<File>;
print "program contect \n @temp\n";
close(File);
open(File,'>'."$fn"."_tb".".$ext");
print File "module $fn"."_tb(); \n\n";
@fin=grep(/input/,@temp);
print "@fin\n";
foreach $li(@fin)
{
$li =~ s/input/reg/;
print File "$li\n";
print "$li\n";
}
@fout=grep(/output/,@temp);
print "@fout\n";
foreach $li(@fout)
{
$li =~ s/output/wire/;
print File "$li\n";
print "$li\n";
}
@mn=grep(/module /,@temp);
@mns=split(" ",$mn[0]);
#print "@mns";
#@var=~ s/\(/" "/;;#grep(/(/,$mns[1]);
chop($mns[1]);
chop($mns[1]);
$size1=length(fn)+1;
print "size is \n $size1\n";
@var=$mns[1];
foreach $li(@var)
{
print "$li\n";
}
my $var1=reverse ($mns[1]);

chop($var1);
chop($var1);
chop($var1);
chop($var1);
chop($var1);
print "\n $var1";
my @fileparts = split(/\,/, $var1);
print "\n @fileparts";
print File "\n$fn I1 (.$fileparts[0]\($fileparts[0]\),.$fileparts[1]\($fileparts[1]\),.$fileparts[2]\($fileparts[2]\)
);\n\n initial \n begin \n\n end\n\n endmodule\n\n ";

