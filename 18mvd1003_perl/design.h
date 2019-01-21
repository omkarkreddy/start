//-----------------------------------------------------------------------------
//
// Title       : design
// Design      : firstpgm
// Author      : omkar
// Company     : omkar
//
//-----------------------------------------------------------------------------
//
// File        : design.h
// Generated   : 4:41:00 PM Monday, January 21, 2019
// From        : SystemC Source Wizard
// By          : SystemC Source Wizard ver. 1.0
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------



#include <systemc.h>

SC_MODULE( design )
{
   sc_in<bool> clk;
   sc_in <bool> clr;
   sc_out<sc_uint<4>> count;
   
   int internal_count;
   void up_count();
   void data();

	SC_CTOR( design )
	{
		  internal_count=0;
		  SC_METHOD	(up_count);
		    sensitive_pos <<clk;
			sensitive_pos<<clr;
		  SC_METHOD	(data);
		   sensitive_pos <<clk;
		   sensitive<<clr;
	}

	
};





