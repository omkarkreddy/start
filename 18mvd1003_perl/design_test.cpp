  SC_MODULE (design_test) {
    sc_in    <bool> clock,q ;
    sc_out   <bool> data,reset;
    
    void stimulus() {
		   int i = 0;
		   reset.write(1);
		   data.write(0);
		   wait();
		   wait();
		    reset.write(0);
		   data.write(1);
		    wait();
			 wait();
			 data.write(1);
			 wait();
	}
  
    SC_CTOR(design_test) {
      SC_CTHREAD (stimulus,clock.pos());
     
    }
  
    sc_stop();
  };
