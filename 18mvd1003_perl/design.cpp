//-----------------------------------------------------------------------------
//
// Title       : design
// Design      : firstpgm
// Author      : omkar
// Company     : omkar
//
//-----------------------------------------------------------------------------
//
// File        : design.cpp
// Generated   : 4:41:00 PM Monday, January 21, 2019
// From        : SystemC Source Wizard
// By          : SystemC Source Wizard ver. 1.0
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------

#include "design.h"
void counter::up_count() 
{
if(clr)
internal_count=0;
else
{
if(internal_count==15)
  internal_count=0;
  else
    internal_count++;
}
count=internal_count;
}

void counter::data()
{
count<<sc_simulation_time()/1000<<"NS CLR: "<<clr<<"CLK:"<<clk<<"COUNT:"<<internal_count<<"\n";