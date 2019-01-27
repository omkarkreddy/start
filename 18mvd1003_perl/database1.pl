#!/usr/bin/perl

use Fcntl;
use SDBM_File;# ODBM,GDBM,NDBM
#write
tie %hash1, "SDBM_File", 'data2',O_RDWR|O_CREAT|O_EXEL, 0644;
#append
#tie %hash1, "SDBM_File", 'data1',O_APPEND ,0644;
#TRUNCATE
#tie %hash1, "SDBM_File", 'data1',O_WRONLY|O_TRUNC ,0644;
#read
#tie %hash1, "SDBM_File", 'data1',O_RDWR ,0644;

%hash1 =qw(
hello sakthi
welcome vit
hai database
new new1
);

print "$hash1{'welcome'}\n";

#$hash1{'scripting'}= "perl";
#delete($hash1{'scripting'});
while(($key,$value) = each(%hash1))
{
print "$key - $value \n";
}

untie %hash1;

exit;