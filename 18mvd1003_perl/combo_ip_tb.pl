#!/usr/bin/perl

print "welcome to ip generator\n";
print "enter the combo logic name\n";
chomp($temp=<stdin>);
if($temp=~ /And/)
{
&And();
}
print "went and came from the suroutine\n";




sub And
{
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
@line=split(" ",$temp[0]);
print "my line $line[1]";
@line1=split(\(,$line[1]);
print "line1 $line1[0]";
@fin=grep(/input/,@temp);
print "$fin\n";
foreach $li(@fin)
{
$li=~ s/input/reg/;
print File "$li\n";
}
@fin=grep(/output/,@temp);
print "$fin\n";
foreach $li(@fin)
{
$li=~ s/output/wire/;
print File "$li\n";
}
print File "$fn andtemp();\n";
print File "initial\n";
print File "begin\n";
print File "end\n";
print File "endmodule\n";
}
