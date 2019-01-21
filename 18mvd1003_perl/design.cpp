  #include "systemc.h"
  
  SC_MODULE (design) {
    sc_in    <bool> data, clock, reset  ;
    sc_out   <bool> q;
    bool     q_l;
    void tff () {
      if (~reset.read()) {
        q_l = 0;
      } else if (data.read()) {
        q_l =  ! q_l;
      }
      q.write(q_l);
	  cout<<"@" << sc_time_stamp() <<" :: Incremented  " <<q.read()<<endl;
    }
  
    SC_CTOR(design) {
      SC_METHOD (tff);
        sensitive << clk.pos();
    }
  
  };

 
 
 int sc_main (int argc, char* argv[]) {
   sc_signal<bool>   clock;
   sc_signal<bool>   reset;
   sc_signal<bool>   data;
   sc_signal<bool>  q;
   int i = 0;
   // Connect the DUT
   design counter("COUNTER");
     counter.clock(clock);
     counter.reset(reset);
     counter.data(data);
     counter.q(q);
 
   sc_start(1);
 
   // Open VCD file
   sc_trace_file *wf = sc_create_vcd_trace_file("counter");
   // Dump the desired signals
   sc_trace(wf, clock, "clock");
   sc_trace(wf, reset, "reset");
   sc_trace(wf, data, "data");
   sc_trace(wf, q, "q");
 
   // Initialize all variables
   reset = 0;       // initial value of reset
   data = 0;      // initial value of enable
   for (i=0;i<5;i++) {
     clock = 0; 
     sc_start(1);
     clock = 1; 
     sc_start(1);
   }
   reset = 1;    // Assert the reset
   cout << "@" << sc_time_stamp() <<" Asserting reset\n" << endl;
   for (i=0;i<10;i++) {
     clock = 0; 
     sc_start(1);
     clock = 1; 
     sc_start(1);
   }
   reset = 0;    // De-assert the reset
   cout << "@" << sc_time_stamp() <<" De-Asserting reset\n" << endl;
   for (i=0;i<5;i++) {
     clock = 0; 
     sc_start(1);
     clock = 1; 
     sc_start(1);
   }
   cout << "@" << sc_time_stamp() <<" Asserting Enable\n" << endl;
   data = 1;  // Assert enable
   for (i=0;i<20;i++) {
     clock = 0; 
     sc_start(1);
     clock = 1; 
     sc_start(1);
   }
   cout << "@" << sc_time_stamp() <<" De-Asserting Enable\n" << endl;
   data = 0; // De-assert enable
 
   cout << "@" << sc_time_stamp() <<" Terminating simulation\n" << endl;
   sc_close_vcd_trace_file(wf);
   return 0;// Terminate simulation
 
  }