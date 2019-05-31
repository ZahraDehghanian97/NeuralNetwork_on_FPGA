/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_2666(char*, char *);
extern void execute_2750(char*, char *);
extern void execute_2532(char*, char *);
extern void execute_2533(char*, char *);
extern void execute_2534(char*, char *);
extern void execute_2535(char*, char *);
extern void execute_2536(char*, char *);
extern void execute_677(char*, char *);
extern void execute_606(char*, char *);
extern void execute_607(char*, char *);
extern void execute_608(char*, char *);
extern void execute_609(char*, char *);
extern void execute_610(char*, char *);
extern void execute_611(char*, char *);
extern void execute_612(char*, char *);
extern void execute_41(char*, char *);
extern void execute_42(char*, char *);
extern void execute_43(char*, char *);
extern void execute_48(char*, char *);
extern void execute_161(char*, char *);
extern void execute_1319(char*, char *);
extern void execute_683(char*, char *);
extern void execute_684(char*, char *);
extern void execute_685(char*, char *);
extern void execute_1961(char*, char *);
extern void execute_1325(char*, char *);
extern void execute_1326(char*, char *);
extern void execute_1327(char*, char *);
extern void execute_2587(char*, char *);
extern void execute_1967(char*, char *);
extern void execute_1968(char*, char *);
extern void execute_1969(char*, char *);
extern void transaction_0(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[34] = {(funcp)execute_2666, (funcp)execute_2750, (funcp)execute_2532, (funcp)execute_2533, (funcp)execute_2534, (funcp)execute_2535, (funcp)execute_2536, (funcp)execute_677, (funcp)execute_606, (funcp)execute_607, (funcp)execute_608, (funcp)execute_609, (funcp)execute_610, (funcp)execute_611, (funcp)execute_612, (funcp)execute_41, (funcp)execute_42, (funcp)execute_43, (funcp)execute_48, (funcp)execute_161, (funcp)execute_1319, (funcp)execute_683, (funcp)execute_684, (funcp)execute_685, (funcp)execute_1961, (funcp)execute_1325, (funcp)execute_1326, (funcp)execute_1327, (funcp)execute_2587, (funcp)execute_1967, (funcp)execute_1968, (funcp)execute_1969, (funcp)transaction_0, (funcp)vhdl_transfunc_eventcallback};
const int NumRelocateId= 34;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/LSTM_Cell_behav/xsim.reloc",  (void **)funcTab, 34);
	iki_vhdl_file_variable_register(dp + 166920);
	iki_vhdl_file_variable_register(dp + 166976);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/LSTM_Cell_behav/xsim.reloc");
}

void simulate(char *dp)
{
	iki_schedule_processes_at_time_zero(dp, "xsim.dir/LSTM_Cell_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/LSTM_Cell_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/LSTM_Cell_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/LSTM_Cell_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
