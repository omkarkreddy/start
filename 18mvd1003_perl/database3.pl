#!/usr/bin/perl


use Fcntl;
use DB_File;

tie(@array1, "DB_File", 'file1.txt', O_RDWR|O_CREAT,0644, $DB_RECNO) );;

@array1 = qw(my text file database is this only);


untie @array1;
exit;