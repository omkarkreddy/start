#! /usr/bin/perl -w

print "#####################################################################\n";
print "this is an crc verilog code auto-gen generator\n";
print "#####################################################################\n";
while ($#ARGV ne 1) {
    print "input format ERROR!!!\n";
    print "format : gen_crc.pl data_width  crc_poly(x0x1x2...xn) \n";
    print "example: gen_crc.pl 8 101001\n";
    print "#####################################################################\n";
    exit;
}
print "##########   get argvs  ##########\n";
$data_w = $ARGV[0];                 #data width per calculate
$poly   = $ARGV[1];                 #crc poly
@poly_ini = split "", $poly;
$crc_w    = $#poly_ini;
print "poly    = @poly_ini \n";
print "crc wid = $crc_w\n";
print "data wid= $data_w  \n";

print "##### gen rough crc value #####\n";
for ($i=0; $i<$crc_w; $i++) {
    $r[$i] = "r".$i;
    print "Reg$i->$r[$i] ";
}
print "\n";
for ($i=$data_w -1; $i>=0; $i--) {
    $din = "d".$i."^".$r[$#poly_ini -1];
    print "--------------- din = $din\n";
    for ($j=@poly_ini -2; $j>=0; $j--) {
        if ($poly_ini[$j] == 1) {
            $r[$j] = ($j == 0) ? $din : $r[$j-1]."^".$din;
        }
        else {
            $r[$j] = $r[$j-1];
        }
        print "r$j = $r[$j]\n";
    }
}
print "###### del same element ######\n";
$name = "crc$crc_w"."_dw$data_w";
open (VLOG, ">$name".".v") or die ("create file failed!\n");
    print VLOG "// polynomial : @poly_ini\n";
    print VLOG "// data_width : $data_w  \n";
    print VLOG "// data_in_dir: d[$data_w -1] first\n";
    print VLOG "module $name ( );\n\n";
    print VLOG "    function [$crc_w -1:0] gen_$name;\n";
    print VLOG "        input      [$data_w -1:0]  data_input;\n";
    print VLOG "        input      [$crc_w -1:0]  last_crc;\n";
    print VLOG "        reg        [$crc_w -1:0]  r;\n";
    print VLOG "        reg        [$data_w -1:0]  d;\n";
    print VLOG "        reg        [$crc_w -1:0]  crc_out;\n\n";
    print VLOG "        begin\n";
    print VLOG "            d = data_input;\n            r = last_crc; \n\n";

    for ($k=0; $k<@r; $k++) {
        @array = sort(split /\^/, $r[$k]);
        push @array, "z9999";
        @tmp = undef;
        $m=0;
        for ($i=0; $i<@array -1; $i++) {
            if ($array[$i] ne $array[$i +1]) {
                $tmp[$m] = $array[$i];
                $m ++;
            }
            else {
                $i++;
            }
        }
        print "-----  write crc[$k]\n";
        print VLOG "            crc_out[$k] = ";
        for ($l=0; $l<@tmp; $l++) {
            $tmp[$l] =~ /(\D)(\d+)/;
            print VLOG "$1"."\[$2]";
            if ($l<@tmp -1) {
                print VLOG "^";
            }
        }
        print VLOG ";\n";
    }
    print VLOG "            gen_$name = crc_out; \n";
    print VLOG "        end\n    endfunction \nendmodule\n";
close VLOG;
#system "gvim $name".".v";
exit;