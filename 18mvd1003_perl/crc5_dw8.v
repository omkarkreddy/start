// polynomial : 1 0 1 0 0 1
// data_width : 8  
// data_in_dir: d[8 -1] first
module crc5_dw8 ( );

    function [5 -1:0] gen_crc5_dw8;
        input      [8 -1:0]  data_input;
        input      [5 -1:0]  last_crc;
        reg        [5 -1:0]  r;
        reg        [8 -1:0]  d;
        reg        [5 -1:0]  crc_out;

        begin
            d = data_input;
            r = last_crc; 

            crc_out[0] = d[0]^d[3]^d[5]^d[6]^r[0]^r[2]^r[3];
            crc_out[1] = d[1]^d[4]^d[6]^d[7]^r[1]^r[3]^r[4];
            crc_out[2] = d[0]^d[2]^d[3]^d[6]^d[7]^r[0]^r[3]^r[4];
            crc_out[3] = d[1]^d[3]^d[4]^d[7]^r[0]^r[1]^r[4];
            crc_out[4] = d[2]^d[4]^d[5]^r[1]^r[2];
            gen_crc5_dw8 = crc_out; 
        end
    endfunction 
endmodule
