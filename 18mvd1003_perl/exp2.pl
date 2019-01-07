#!ur/bin/perl
@like =(1,2,3,4,,6,7,8,9,10);
@notlike = (A,B,C,D,E,F,G,H);
print "@like[0] @like[2] @like[4]\n";
print "@notlike[0] @notlike[2] @notlike[4]\n";
print "enter the liked item\n";
chomp($like1=<STDIN>);
push (@notlike,$like1);
print "notlike array @notlike\n";
pop(@notlike);
print "notlike array @notlike\n";
push (@like,$like1);
$size1=@notlike;
$size2=@like;
foreach $temp (@like)
{
print "$temp\t";
}
print "\n";
foreach $temp1 (@notlike)
{
print "$temp1\t";
}
print "\n";
