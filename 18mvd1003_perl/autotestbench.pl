open (outhandler,">>outfile.txt");
open (inhandler,"infile.txt");
while($line=<inhandler>)
{
if($line =~ /^module/)
{
@sep = split (/ / , $line);
@names = split(/\(/, @sep[1]);
$instantiation = join (" z\(", @names);
$line =~ s/\(.*\)/\(\)/;
print outhandler $line;
}
elsif($line =~ /^input/)
{
($inputs)=$line=~/input (.*)\;/;
@inseq= split(/\,/,$inputs);
$length =@inseq;
$line =~ s/input/reg/;
print outhandler $line;
}
elsif($line =~ /^output/)
{
$line =~ s/output/wire/;
print outhandler $line;
}
}
print outhandler "$instantiation";
print outhandler "initial\n";
print outhandler "begin\n";
$i=0;
while($i<$length)
{
print outhandler "$inseq[$i]=\$random\;\n";
$i++;
}
print outhandler "\#100 \$stop\;\n";
print outhandler "end\n";
print outhandler "endmodule\n";

