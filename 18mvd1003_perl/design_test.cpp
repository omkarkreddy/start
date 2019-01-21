//-----------------------------------------------------------------------------
//
// Title       : design_test
// Design      : firstpgm
// Author      : omkar
// Company     : omkar
//
//-----------------------------------------------------------------------------
//
// File        : design_test.cpp
// Generated   : 6:27:50 PM Monday, January 21, 2019
// From        : SystemC Source Wizard
// By          : SystemC Source Wizard ver. 1.0
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------

#include "design_test.h"  
void counter_test:: stimulus()
{
//clock cycle counter
int i;
//clear counter
clr.write(1);
for(i=0 ;i<=5 ;i++)
{
clk.write(1);
wait(10,SC_NS);
clk.write(0);
wait(10,SC_NS);
};
//start counting
clr.write(0);

for(i=0 ;i<=10 ;i++)
{
clk.write(1);
wait(10,SC_NS);
clk.write(0);
wait(10,SC_NS);
};						 
//clear counter
clr.write(1);
for(i=0 ;i<=3 ;i++)
{
clk.write(1);
wait(10,SC_NS);
clk.write(0);
wait(10,SC_NS);
};
//start counting 2 time
clr.write(0);
for(i=0 ;i<=5 ;i++)
{
clk.write(1);
wait(10,SC_NS);
clk.write(0);
wait(10,SC_NS);
};
sc_stop();
}
SC_MODULE_EXPORT( design_test )