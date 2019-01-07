open(timingfile,"timing.txt");
open(netfile,"netlist.txt");
while($a=<timingfile>)
{
  if($a=~/([A-Z][A-Z][A-Z0-9][A-Z0-9]+) /)
  {
  print "$1\n";
    @x=(@x,$1);
  }
}
while($b=<netfile>)
{
  if($b=~/([A-Z][A-Z][A-Z0-9][A-Z0-9]+) /)
{
    @y=(@y,$1);
  }
}
print "@x\n\n\n";
print "@y\n\n\n";
for($i=0;$i<5;$i++)
{
for($j=0;$j<27;$j++)
{
if($x[$i] eq $y[$j])
{
@c=(@c,$x[$i]);
}
}
}

print "@c\n\n\n";
for($i=0;$i<2;$i++){
    $p[$i]=length $c[$i];
    $q[$i]=substr($c[$i],0,$p-2);
    print "$p[$i]\n";
    print "$q[$i]\n";
    close(timingfile);
    close(netfile);
    open(netfiles,"netlist.txt");
    open(new1,">new.txt");
    #while($y = <netfiles>){
    #   print new1 "$y\n";
   #  }
    while($y = <new1>){
    if($y =~ s/$c[$i]/$q[$i]X4/){
         print "$y\n";
              print new1 "$y\n";
     }
}
}
