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
      SC_CTHREAD (tff,clock.pos());
       reset_signal_is(reset,true);
    }
  
  };

 
