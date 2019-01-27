#!/usr/bin/perl

use DB_File;
use Fcntl;

$DB_BTREE->{'compare'} = sub {
shift cmp shift;
};

tie(%hash2, "DB_File", 'sorted', O_RDWR|O_CREAT|O_TRUC, 0644,$DB_BTREE);
%hash2 =qw(
lennonon mccartney
page plant
jagger richards
mann weil
goffin king
rodgers harts
bacharach david
leiber stoller
gershwin gershwin
john taupin
);

while (($key -$value ) = each (%hash2)){
print "$key -$value \n";
}
untie %hash2;