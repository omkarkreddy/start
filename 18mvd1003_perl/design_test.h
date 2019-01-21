//-----------------------------------------------------------------------------
//
// Title       : design_test
// Design      : firstpgm
// Author      : omkar
// Company     : omkar
//
//-----------------------------------------------------------------------------
//
// File        : design_test.h
// Generated   : 6:27:50 PM Monday, January 21, 2019
// From        : SystemC Source Wizard
// By          : SystemC Source Wizard ver. 1.0
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------


#include <systemc.h>
#include "design.h"
SC_MODULE( design_test )
{
   sc_signal <bool> clr;
   sc_signal<bool> clk;
   sc_signal <sc_uint<4>> count;
   sc_trace_file *pTraceFile;
   design uut;
   //calling stimulas
   void stimulus();
	SC_CTOR( design_test ):
		clr("clr").
		clk("clk").
		count("count").
		uut("uut").		   
	{
	  //defining and identifying signals
	   uut.clr(clr);
	   uut.clk(clk);
	   uut.count(count);
	   //trace file
	  pTraceFile=sc_create_vcd_trace_file("design_sim");
	  //tracing signals to waveform
	  sc_trace (pTraceFile,clr,"clr");
	  sc_trace (pTraceFile,clk,"clk");
	  sc_trace (pTraceFile,count,"count");
	  
		SC_THREAD (stimulus)
	}
	 //ending simulation,closing trace file
	~design_test()
	{
	  sc_close_vcd_trace_file (pTraceFile);
	}

};




