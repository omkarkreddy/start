#include <systemc.h>
#include "design.cpp"
#include "design_test.cpp"

SC_MODULE(SYSTEM) {
	design *design0;
	design_test *design_test0;
	
	sc_signal<bool> data ;
	sc_signal<bool> q;
	sc_signal<bool> reset;
	sc_clock clock;
	
	SC_CTOR(SYSTEM)
	:clock ("clock",10,SC_NS)
	{
		*design0 =new design("design0");
		design0->data(data);
		design0->q(q);
		design0->reset(reset);
		design0->clock(clock);
		
		design_test0 =new design_test("design_test");
		design_test0->clock(clock);
		design_test0->q(q);
		design_test0->reset(reset);
		design_test0->data(data);
		
		~SYSTEM(){
			delete design0;
			delete design_test0;
		}
	};
	  SYSTEM *top=NULL;
	  int sc_main(int argc,char* argv[])
	  {
		  top =new SYSTEM("top");
		  sc_start();
		  return 0;
	  }
}