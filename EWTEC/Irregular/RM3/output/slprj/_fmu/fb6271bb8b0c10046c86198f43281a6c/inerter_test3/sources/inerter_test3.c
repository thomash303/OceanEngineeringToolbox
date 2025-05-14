/* Main Simulation File */

#if defined(__cplusplus)
extern "C" {
#endif

#include "inerter_test3_model.h"
#include "simulation/solver/events.h"



/* dummy VARINFO and FILEINFO */
const VAR_INFO dummyVAR_INFO = omc_dummyVarInfo;

int inerter_test3_input_function(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  (data->localData[0]->realVars[286] /* u variable */) = data->simulationInfo->inputVars[0];
  
  TRACE_POP
  return 0;
}

int inerter_test3_input_function_init(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  data->simulationInfo->inputVars[0] = data->modelData->realVarsData[286].attribute.start;
  
  TRACE_POP
  return 0;
}

int inerter_test3_input_function_updateStartValues(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  data->modelData->realVarsData[286].attribute.start = data->simulationInfo->inputVars[0];
  
  TRACE_POP
  return 0;
}

int inerter_test3_inputNames(DATA *data, char ** names){
  TRACE_PUSH

  names[0] = (char *) data->modelData->realVarsData[286].info.name;
  
  TRACE_POP
  return 0;
}

int inerter_test3_data_function(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  TRACE_POP
  return 0;
}

int inerter_test3_dataReconciliationInputNames(DATA *data, char ** names){
  TRACE_PUSH

  
  TRACE_POP
  return 0;
}

int inerter_test3_dataReconciliationUnmeasuredVariables(DATA *data, char ** names)
{
  TRACE_PUSH

  
  TRACE_POP
  return 0;
}

int inerter_test3_output_function(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  data->simulationInfo->outputVars[0] = (data->localData[0]->realVars[678] /* y variable */);
  
  TRACE_POP
  return 0;
}

int inerter_test3_setc_function(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  
  TRACE_POP
  return 0;
}

int inerter_test3_setb_function(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  
  TRACE_POP
  return 0;
}


/*
equation index: 707
type: SIMPLE_ASSIGN
body.frame_a.r_0[2] = 0.0
*/
void inerter_test3_eqFunction_707(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,707};
  (data->localData[0]->realVars[44] /* body.frame_a.r_0[2] DUMMY_STATE */) = 0.0;
  TRACE_POP
}
/*
equation index: 708
type: SIMPLE_ASSIGN
body.frame_a.r_0[1] = 0.0
*/
void inerter_test3_eqFunction_708(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,708};
  (data->localData[0]->realVars[43] /* body.frame_a.r_0[1] DUMMY_STATE */) = 0.0;
  TRACE_POP
}
/*
equation index: 709
type: SIMPLE_ASSIGN
body.v_0[2] = 0.0
*/
void inerter_test3_eqFunction_709(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,709};
  (data->localData[0]->realVars[76] /* body.v_0[2] DUMMY_STATE */) = 0.0;
  TRACE_POP
}
/*
equation index: 710
type: SIMPLE_ASSIGN
body.v_0[1] = 0.0
*/
void inerter_test3_eqFunction_710(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,710};
  (data->localData[0]->realVars[75] /* body.v_0[1] DUMMY_STATE */) = 0.0;
  TRACE_POP
}
/*
equation index: 711
type: SIMPLE_ASSIGN
body.a_0[1] = 0.0
*/
void inerter_test3_eqFunction_711(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,711};
  (data->localData[0]->realVars[26] /* body.a_0[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 712
type: SIMPLE_ASSIGN
body.a_0[2] = 0.0
*/
void inerter_test3_eqFunction_712(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,712};
  (data->localData[0]->realVars[27] /* body.a_0[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 713
type: SIMPLE_ASSIGN
$DER.body.frame_a.r_0[1] = 0.0
*/
void inerter_test3_eqFunction_713(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,713};
  (data->localData[0]->realVars[4] /* der(body.frame_a.r_0[1]) DUMMY_DER */) = 0.0;
  TRACE_POP
}
/*
equation index: 714
type: SIMPLE_ASSIGN
$DER.body.frame_a.r_0[2] = 0.0
*/
void inerter_test3_eqFunction_714(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,714};
  (data->localData[0]->realVars[5] /* der(body.frame_a.r_0[2]) DUMMY_DER */) = 0.0;
  TRACE_POP
}
/*
equation index: 715
type: SIMPLE_ASSIGN
$DER.body.v_0[1] = 0.0
*/
void inerter_test3_eqFunction_715(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,715};
  (data->localData[0]->realVars[7] /* der(body.v_0[1]) DUMMY_DER */) = 0.0;
  TRACE_POP
}
/*
equation index: 716
type: SIMPLE_ASSIGN
$DER.body.v_0[2] = 0.0
*/
void inerter_test3_eqFunction_716(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,716};
  (data->localData[0]->realVars[8] /* der(body.v_0[2]) DUMMY_DER */) = 0.0;
  TRACE_POP
}
/*
equation index: 717
type: SIMPLE_ASSIGN
bodyShape.body.frame_a.f[1] = 0.0
*/
void inerter_test3_eqFunction_717(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,717};
  (data->localData[0]->realVars[94] /* bodyShape.body.frame_a.f[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 718
type: SIMPLE_ASSIGN
bodyShape.body.frame_a.f[2] = 0.0
*/
void inerter_test3_eqFunction_718(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,718};
  (data->localData[0]->realVars[95] /* bodyShape.body.frame_a.f[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 719
type: SIMPLE_ASSIGN
bodyShape.body.frame_a.f[3] = 0.0
*/
void inerter_test3_eqFunction_719(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,719};
  (data->localData[0]->realVars[96] /* bodyShape.body.frame_a.f[3] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 720
type: SIMPLE_ASSIGN
bodyShape.body.frame_a.t[1] = 0.0
*/
void inerter_test3_eqFunction_720(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,720};
  (data->localData[0]->realVars[97] /* bodyShape.body.frame_a.t[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 721
type: SIMPLE_ASSIGN
bodyShape.body.frame_a.t[2] = 0.0
*/
void inerter_test3_eqFunction_721(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,721};
  (data->localData[0]->realVars[98] /* bodyShape.body.frame_a.t[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 722
type: SIMPLE_ASSIGN
bodyShape.body.frame_a.t[3] = 0.0
*/
void inerter_test3_eqFunction_722(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,722};
  (data->localData[0]->realVars[99] /* bodyShape.body.frame_a.t[3] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 723
type: SIMPLE_ASSIGN
$DER.springDamper.s_rel = prismatic.v
*/
void inerter_test3_eqFunction_723(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,723};
  (data->localData[0]->realVars[18] /* der(springDamper.s_rel) DUMMY_DER */) = (data->localData[0]->realVars[1] /* prismatic.v STATE(1,body.a_0[3]) */);
  TRACE_POP
}
/*
equation index: 724
type: SIMPLE_ASSIGN
$DER.body.frame_a.r_0[3] = prismatic.v
*/
void inerter_test3_eqFunction_724(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,724};
  (data->localData[0]->realVars[6] /* der(body.frame_a.r_0[3]) DUMMY_DER */) = (data->localData[0]->realVars[1] /* prismatic.v STATE(1,body.a_0[3]) */);
  TRACE_POP
}
/*
equation index: 725
type: SIMPLE_ASSIGN
body.v_0[3] = prismatic.v
*/
void inerter_test3_eqFunction_725(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,725};
  (data->localData[0]->realVars[77] /* body.v_0[3] DUMMY_STATE */) = (data->localData[0]->realVars[1] /* prismatic.v STATE(1,body.a_0[3]) */);
  TRACE_POP
}
/*
equation index: 726
type: SIMPLE_ASSIGN
springDamper.v_rel = prismatic.v
*/
void inerter_test3_eqFunction_726(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,726};
  (data->localData[0]->realVars[285] /* springDamper.v_rel DUMMY_STATE */) = (data->localData[0]->realVars[1] /* prismatic.v STATE(1,body.a_0[3]) */);
  TRACE_POP
}
/*
equation index: 727
type: SIMPLE_ASSIGN
body.frame_a.r_0[3] = prismatic.s
*/
void inerter_test3_eqFunction_727(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,727};
  (data->localData[0]->realVars[45] /* body.frame_a.r_0[3] DUMMY_STATE */) = (data->localData[0]->realVars[0] /* prismatic.s STATE(1,prismatic.v) */);
  TRACE_POP
}
/*
equation index: 728
type: SIMPLE_ASSIGN
prismatic.box.length = if noEvent(abs(prismatic.s) > 1e-6) then prismatic.s else 1e-6
*/
void inerter_test3_eqFunction_728(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,728};
  modelica_boolean tmp0;
  tmp0 = Greater(fabs((data->localData[0]->realVars[0] /* prismatic.s STATE(1,prismatic.v) */)),1e-6);
  (data->localData[0]->realVars[246] /* prismatic.box.length variable */) = (tmp0?(data->localData[0]->realVars[0] /* prismatic.s STATE(1,prismatic.v) */):1e-6);
  TRACE_POP
}
/*
equation index: 729
type: SIMPLE_ASSIGN
springDamper.f_d = springDamper.d * prismatic.v
*/
void inerter_test3_eqFunction_729(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,729};
  (data->localData[0]->realVars[282] /* springDamper.f_d variable */) = ((data->simulationInfo->realParameter[232] /* springDamper.d PARAM */)) * ((data->localData[0]->realVars[1] /* prismatic.v STATE(1,body.a_0[3]) */));
  TRACE_POP
}
/*
equation index: 730
type: SIMPLE_ASSIGN
springDamper.lossPower = springDamper.f_d * prismatic.v
*/
void inerter_test3_eqFunction_730(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,730};
  (data->localData[0]->realVars[283] /* springDamper.lossPower variable */) = ((data->localData[0]->realVars[282] /* springDamper.f_d variable */)) * ((data->localData[0]->realVars[1] /* prismatic.v STATE(1,body.a_0[3]) */));
  TRACE_POP
}
/*
equation index: 731
type: SIMPLE_ASSIGN
$DER.prismatic.s = prismatic.v
*/
void inerter_test3_eqFunction_731(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,731};
  (data->localData[0]->realVars[2] /* der(prismatic.s) STATE_DER */) = (data->localData[0]->realVars[1] /* prismatic.v STATE(1,body.a_0[3]) */);
  TRACE_POP
}
/*
equation index: 732
type: SIMPLE_ASSIGN
revolute.w = idealGearR2T.ratio * prismatic.v
*/
void inerter_test3_eqFunction_732(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,732};
  (data->localData[0]->realVars[279] /* revolute.w DUMMY_STATE */) = ((data->simulationInfo->realParameter[191] /* idealGearR2T.ratio PARAM */)) * ((data->localData[0]->realVars[1] /* prismatic.v STATE(1,body.a_0[3]) */));
  TRACE_POP
}
/*
equation index: 733
type: SIMPLE_ASSIGN
body.w_a[3] = revolute.e[3] * revolute.w
*/
void inerter_test3_eqFunction_733(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,733};
  (data->localData[0]->realVars[80] /* body.w_a[3] DUMMY_STATE */) = ((data->simulationInfo->realParameter[223] /* revolute.e[3] PARAM */)) * ((data->localData[0]->realVars[279] /* revolute.w DUMMY_STATE */));
  TRACE_POP
}
/*
equation index: 734
type: SIMPLE_ASSIGN
revolute.R_rel.w[3] = body.w_a[3]
*/
void inerter_test3_eqFunction_734(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,734};
  (data->localData[0]->realVars[262] /* revolute.R_rel.w[3] DUMMY_STATE */) = (data->localData[0]->realVars[80] /* body.w_a[3] DUMMY_STATE */);
  TRACE_POP
}
/*
equation index: 735
type: SIMPLE_ASSIGN
body.w_a[2] = revolute.e[2] * revolute.w
*/
void inerter_test3_eqFunction_735(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,735};
  (data->localData[0]->realVars[79] /* body.w_a[2] DUMMY_STATE */) = ((data->simulationInfo->realParameter[222] /* revolute.e[2] PARAM */)) * ((data->localData[0]->realVars[279] /* revolute.w DUMMY_STATE */));
  TRACE_POP
}
/*
equation index: 736
type: SIMPLE_ASSIGN
revolute.R_rel.w[2] = body.w_a[2]
*/
void inerter_test3_eqFunction_736(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,736};
  (data->localData[0]->realVars[261] /* revolute.R_rel.w[2] DUMMY_STATE */) = (data->localData[0]->realVars[79] /* body.w_a[2] DUMMY_STATE */);
  TRACE_POP
}
/*
equation index: 737
type: SIMPLE_ASSIGN
body.w_a[1] = revolute.e[1] * revolute.w
*/
void inerter_test3_eqFunction_737(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,737};
  (data->localData[0]->realVars[78] /* body.w_a[1] DUMMY_STATE */) = ((data->simulationInfo->realParameter[221] /* revolute.e[1] PARAM */)) * ((data->localData[0]->realVars[279] /* revolute.w DUMMY_STATE */));
  TRACE_POP
}
/*
equation index: 738
type: SIMPLE_ASSIGN
revolute.R_rel.w[1] = body.w_a[1]
*/
void inerter_test3_eqFunction_738(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,738};
  (data->localData[0]->realVars[260] /* revolute.R_rel.w[1] DUMMY_STATE */) = (data->localData[0]->realVars[78] /* body.w_a[1] DUMMY_STATE */);
  TRACE_POP
}
/*
equation index: 739
type: SIMPLE_ASSIGN
$DER.revolute.phi = revolute.w
*/
void inerter_test3_eqFunction_739(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,739};
  (data->localData[0]->realVars[16] /* der(revolute.phi) DUMMY_DER */) = (data->localData[0]->realVars[279] /* revolute.w DUMMY_STATE */);
  TRACE_POP
}
/*
equation index: 740
type: SIMPLE_ASSIGN
revolute.phi = idealGearR2T.ratio * (prismatic.s - idealGearR2T.fixedT.s0) + idealGearR2T.fixedR.phi0
*/
void inerter_test3_eqFunction_740(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,740};
  (data->localData[0]->realVars[276] /* revolute.phi DUMMY_STATE */) = ((data->simulationInfo->realParameter[191] /* idealGearR2T.ratio PARAM */)) * ((data->localData[0]->realVars[0] /* prismatic.s STATE(1,prismatic.v) */) - (data->simulationInfo->realParameter[186] /* idealGearR2T.fixedT.s0 PARAM */)) + (data->simulationInfo->realParameter[184] /* idealGearR2T.fixedR.phi0 PARAM */);
  TRACE_POP
}
/*
equation index: 741
type: SIMPLE_ASSIGN
$cse2 = sin(revolute.phi)
*/
void inerter_test3_eqFunction_741(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,741};
  (data->localData[0]->realVars[21] /* $cse2 variable */) = sin((data->localData[0]->realVars[276] /* revolute.phi DUMMY_STATE */));
  TRACE_POP
}
/*
equation index: 742
type: SIMPLE_ASSIGN
$cse1 = cos(revolute.phi)
*/
void inerter_test3_eqFunction_742(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,742};
  (data->localData[0]->realVars[20] /* $cse1 variable */) = cos((data->localData[0]->realVars[276] /* revolute.phi DUMMY_STATE */));
  TRACE_POP
}
/*
equation index: 743
type: SIMPLE_ASSIGN
force.frame_b.R.T[1,1] = revolute.e[1] ^ 2.0 + (1.0 - revolute.e[1] ^ 2.0) * $cse1
*/
void inerter_test3_eqFunction_743(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,743};
  modelica_real tmp1;
  modelica_real tmp2;
  tmp1 = (data->simulationInfo->realParameter[221] /* revolute.e[1] PARAM */);
  tmp2 = (data->simulationInfo->realParameter[221] /* revolute.e[1] PARAM */);
  (data->localData[0]->realVars[207] /* force.frame_b.R.T[1,1] variable */) = (tmp1 * tmp1) + (1.0 - ((tmp2 * tmp2))) * ((data->localData[0]->realVars[20] /* $cse1 variable */));
  TRACE_POP
}
/*
equation index: 744
type: SIMPLE_ASSIGN
force.frame_b.R.T[1,2] = (revolute.e[1] - revolute.e[1] * $cse1) * revolute.e[2] + revolute.e[3] * $cse2
*/
void inerter_test3_eqFunction_744(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,744};
  (data->localData[0]->realVars[208] /* force.frame_b.R.T[1,2] variable */) = ((data->simulationInfo->realParameter[221] /* revolute.e[1] PARAM */) - (((data->simulationInfo->realParameter[221] /* revolute.e[1] PARAM */)) * ((data->localData[0]->realVars[20] /* $cse1 variable */)))) * ((data->simulationInfo->realParameter[222] /* revolute.e[2] PARAM */)) + ((data->simulationInfo->realParameter[223] /* revolute.e[3] PARAM */)) * ((data->localData[0]->realVars[21] /* $cse2 variable */));
  TRACE_POP
}
/*
equation index: 745
type: SIMPLE_ASSIGN
force.frame_b.R.T[1,3] = (revolute.e[1] - revolute.e[1] * $cse1) * revolute.e[3] - revolute.e[2] * $cse2
*/
void inerter_test3_eqFunction_745(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,745};
  (data->localData[0]->realVars[209] /* force.frame_b.R.T[1,3] variable */) = ((data->simulationInfo->realParameter[221] /* revolute.e[1] PARAM */) - (((data->simulationInfo->realParameter[221] /* revolute.e[1] PARAM */)) * ((data->localData[0]->realVars[20] /* $cse1 variable */)))) * ((data->simulationInfo->realParameter[223] /* revolute.e[3] PARAM */)) - (((data->simulationInfo->realParameter[222] /* revolute.e[2] PARAM */)) * ((data->localData[0]->realVars[21] /* $cse2 variable */)));
  TRACE_POP
}
/*
equation index: 746
type: SIMPLE_ASSIGN
force.frame_b.f[1] = (-force.frame_b.R.T[1,1]) - force.frame_b.R.T[1,3] * u
*/
void inerter_test3_eqFunction_746(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,746};
  (data->localData[0]->realVars[216] /* force.frame_b.f[1] variable */) = (-(data->localData[0]->realVars[207] /* force.frame_b.R.T[1,1] variable */)) - (((data->localData[0]->realVars[209] /* force.frame_b.R.T[1,3] variable */)) * ((data->localData[0]->realVars[286] /* u variable */)));
  TRACE_POP
}
/*
equation index: 747
type: SIMPLE_ASSIGN
force.frame_b.R.T[2,1] = (revolute.e[2] - revolute.e[2] * $cse1) * revolute.e[1] - revolute.e[3] * $cse2
*/
void inerter_test3_eqFunction_747(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,747};
  (data->localData[0]->realVars[210] /* force.frame_b.R.T[2,1] variable */) = ((data->simulationInfo->realParameter[222] /* revolute.e[2] PARAM */) - (((data->simulationInfo->realParameter[222] /* revolute.e[2] PARAM */)) * ((data->localData[0]->realVars[20] /* $cse1 variable */)))) * ((data->simulationInfo->realParameter[221] /* revolute.e[1] PARAM */)) - (((data->simulationInfo->realParameter[223] /* revolute.e[3] PARAM */)) * ((data->localData[0]->realVars[21] /* $cse2 variable */)));
  TRACE_POP
}
/*
equation index: 748
type: SIMPLE_ASSIGN
force.frame_b.R.T[2,2] = revolute.e[2] ^ 2.0 + (1.0 - revolute.e[2] ^ 2.0) * $cse1
*/
void inerter_test3_eqFunction_748(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,748};
  modelica_real tmp3;
  modelica_real tmp4;
  tmp3 = (data->simulationInfo->realParameter[222] /* revolute.e[2] PARAM */);
  tmp4 = (data->simulationInfo->realParameter[222] /* revolute.e[2] PARAM */);
  (data->localData[0]->realVars[211] /* force.frame_b.R.T[2,2] variable */) = (tmp3 * tmp3) + (1.0 - ((tmp4 * tmp4))) * ((data->localData[0]->realVars[20] /* $cse1 variable */));
  TRACE_POP
}
/*
equation index: 749
type: SIMPLE_ASSIGN
force.frame_b.R.T[2,3] = (revolute.e[2] - revolute.e[2] * $cse1) * revolute.e[3] + revolute.e[1] * $cse2
*/
void inerter_test3_eqFunction_749(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,749};
  (data->localData[0]->realVars[212] /* force.frame_b.R.T[2,3] variable */) = ((data->simulationInfo->realParameter[222] /* revolute.e[2] PARAM */) - (((data->simulationInfo->realParameter[222] /* revolute.e[2] PARAM */)) * ((data->localData[0]->realVars[20] /* $cse1 variable */)))) * ((data->simulationInfo->realParameter[223] /* revolute.e[3] PARAM */)) + ((data->simulationInfo->realParameter[221] /* revolute.e[1] PARAM */)) * ((data->localData[0]->realVars[21] /* $cse2 variable */));
  TRACE_POP
}
/*
equation index: 750
type: SIMPLE_ASSIGN
force.frame_b.f[2] = (-force.frame_b.R.T[2,1]) - force.frame_b.R.T[2,3] * u
*/
void inerter_test3_eqFunction_750(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,750};
  (data->localData[0]->realVars[217] /* force.frame_b.f[2] variable */) = (-(data->localData[0]->realVars[210] /* force.frame_b.R.T[2,1] variable */)) - (((data->localData[0]->realVars[212] /* force.frame_b.R.T[2,3] variable */)) * ((data->localData[0]->realVars[286] /* u variable */)));
  TRACE_POP
}
/*
equation index: 751
type: SIMPLE_ASSIGN
force.frame_b.R.T[3,1] = (revolute.e[3] - revolute.e[3] * $cse1) * revolute.e[1] + revolute.e[2] * $cse2
*/
void inerter_test3_eqFunction_751(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,751};
  (data->localData[0]->realVars[213] /* force.frame_b.R.T[3,1] variable */) = ((data->simulationInfo->realParameter[223] /* revolute.e[3] PARAM */) - (((data->simulationInfo->realParameter[223] /* revolute.e[3] PARAM */)) * ((data->localData[0]->realVars[20] /* $cse1 variable */)))) * ((data->simulationInfo->realParameter[221] /* revolute.e[1] PARAM */)) + ((data->simulationInfo->realParameter[222] /* revolute.e[2] PARAM */)) * ((data->localData[0]->realVars[21] /* $cse2 variable */));
  TRACE_POP
}
/*
equation index: 752
type: SIMPLE_ASSIGN
force.frame_b.R.T[3,2] = (revolute.e[3] - revolute.e[3] * $cse1) * revolute.e[2] - revolute.e[1] * $cse2
*/
void inerter_test3_eqFunction_752(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,752};
  (data->localData[0]->realVars[214] /* force.frame_b.R.T[3,2] variable */) = ((data->simulationInfo->realParameter[223] /* revolute.e[3] PARAM */) - (((data->simulationInfo->realParameter[223] /* revolute.e[3] PARAM */)) * ((data->localData[0]->realVars[20] /* $cse1 variable */)))) * ((data->simulationInfo->realParameter[222] /* revolute.e[2] PARAM */)) - (((data->simulationInfo->realParameter[221] /* revolute.e[1] PARAM */)) * ((data->localData[0]->realVars[21] /* $cse2 variable */)));
  TRACE_POP
}
/*
equation index: 753
type: SIMPLE_ASSIGN
force.frame_b.R.T[3,3] = revolute.e[3] ^ 2.0 + (1.0 - revolute.e[3] ^ 2.0) * $cse1
*/
void inerter_test3_eqFunction_753(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,753};
  modelica_real tmp5;
  modelica_real tmp6;
  tmp5 = (data->simulationInfo->realParameter[223] /* revolute.e[3] PARAM */);
  tmp6 = (data->simulationInfo->realParameter[223] /* revolute.e[3] PARAM */);
  (data->localData[0]->realVars[215] /* force.frame_b.R.T[3,3] variable */) = (tmp5 * tmp5) + (1.0 - ((tmp6 * tmp6))) * ((data->localData[0]->realVars[20] /* $cse1 variable */));
  TRACE_POP
}
/*
equation index: 754
type: SIMPLE_ASSIGN
force.frame_b.f[3] = (-force.frame_b.R.T[3,1]) - force.frame_b.R.T[3,3] * u
*/
void inerter_test3_eqFunction_754(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,754};
  (data->localData[0]->realVars[218] /* force.frame_b.f[3] variable */) = (-(data->localData[0]->realVars[213] /* force.frame_b.R.T[3,1] variable */)) - (((data->localData[0]->realVars[215] /* force.frame_b.R.T[3,3] variable */)) * ((data->localData[0]->realVars[286] /* u variable */)));
  TRACE_POP
}
/*
equation index: 755
type: SIMPLE_ASSIGN
springDamper.s_rel = prismatic.s - prismatic.fixed.s0
*/
void inerter_test3_eqFunction_755(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,755};
  (data->localData[0]->realVars[284] /* springDamper.s_rel DUMMY_STATE */) = (data->localData[0]->realVars[0] /* prismatic.s STATE(1,prismatic.v) */) - (data->simulationInfo->realParameter[206] /* prismatic.fixed.s0 PARAM */);
  TRACE_POP
}
/*
equation index: 756
type: SIMPLE_ASSIGN
springDamper.f_c = springDamper.c * (springDamper.s_rel - springDamper.s_rel0)
*/
void inerter_test3_eqFunction_756(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,756};
  (data->localData[0]->realVars[281] /* springDamper.f_c variable */) = ((data->simulationInfo->realParameter[231] /* springDamper.c PARAM */)) * ((data->localData[0]->realVars[284] /* springDamper.s_rel DUMMY_STATE */) - (data->simulationInfo->realParameter[235] /* springDamper.s_rel0 PARAM */));
  TRACE_POP
}
/*
equation index: 757
type: SIMPLE_ASSIGN
springDamper.f = springDamper.f_c + springDamper.f_d
*/
void inerter_test3_eqFunction_757(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,757};
  (data->localData[0]->realVars[280] /* springDamper.f variable */) = (data->localData[0]->realVars[281] /* springDamper.f_c variable */) + (data->localData[0]->realVars[282] /* springDamper.f_d variable */);
  TRACE_POP
}
/*
equation index: 788
type: LINEAR

<var>revolute.a</var>
<row>

</row>
<matrix>
</matrix>
*/
OMC_DISABLE_OPT
void inerter_test3_eqFunction_788(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,788};
  /* Linear equation system */
  int retValue;
  double aux_x[1] = { (data->localData[1]->realVars[263] /* revolute.a variable */) };
  if(ACTIVE_STREAM(LOG_DT))
  {
    infoStreamPrint(LOG_DT, 1, "Solving linear system 788 (STRICT TEARING SET if tearing enabled) at time = %18.10e", data->localData[0]->timeValue);
    messageClose(LOG_DT);
  }
  
  retValue = solve_linear_system(data, threadData, 1, &aux_x[0]);
  
  /* check if solution process was successful */
  if (retValue > 0){
    const int indexes[2] = {1,788};
    throwStreamPrintWithEquationIndexes(threadData, omc_dummyFileInfo, indexes, "Solving linear system 788 failed at time=%.15g.\nFor more information please use -lv LOG_LS.", data->localData[0]->timeValue);
  }
  /* write solution */
  (data->localData[0]->realVars[263] /* revolute.a variable */) = aux_x[0];

  TRACE_POP
}
/*
equation index: 789
type: SIMPLE_ASSIGN
cutForce.force[1] = cutForce.frame_a.f[1] * (*Real*)(cutForce.cutForce.csign)
*/
void inerter_test3_eqFunction_789(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,789};
  (data->localData[0]->realVars[161] /* cutForce.force[1] variable */) = ((data->localData[0]->realVars[169] /* cutForce.frame_a.f[1] variable */)) * (((modelica_real)(data->simulationInfo->integerParameter[18] /* cutForce.cutForce.csign PARAM */)));
  TRACE_POP
}
/*
equation index: 790
type: SIMPLE_ASSIGN
cutForce.forceArrow.r_head[1] = (-cutForce.frame_a.f[1]) * (if cutForce.positiveSign then 1.0 else -1.0)
*/
void inerter_test3_eqFunction_790(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,790};
  (data->localData[0]->realVars[163] /* cutForce.forceArrow.r_head[1] variable */) = ((-(data->localData[0]->realVars[169] /* cutForce.frame_a.f[1] variable */))) * (((data->simulationInfo->booleanParameter[22] /* cutForce.positiveSign PARAM */)?1.0:-1.0));
  TRACE_POP
}
/*
equation index: 791
type: SIMPLE_ASSIGN
$DER.revolute.R_rel.w[3] = body.z_a[3]
*/
void inerter_test3_eqFunction_791(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,791};
  (data->localData[0]->realVars[15] /* der(revolute.R_rel.w[3]) DUMMY_DER */) = (data->localData[0]->realVars[83] /* body.z_a[3] variable */);
  TRACE_POP
}
/*
equation index: 792
type: SIMPLE_ASSIGN
$DER.body.w_a[3] = body.z_a[3]
*/
void inerter_test3_eqFunction_792(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,792};
  (data->localData[0]->realVars[12] /* der(body.w_a[3]) DUMMY_DER */) = (data->localData[0]->realVars[83] /* body.z_a[3] variable */);
  TRACE_POP
}
/*
equation index: 793
type: SIMPLE_ASSIGN
$DER.revolute.R_rel.w[1] = body.z_a[1]
*/
void inerter_test3_eqFunction_793(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,793};
  (data->localData[0]->realVars[13] /* der(revolute.R_rel.w[1]) DUMMY_DER */) = (data->localData[0]->realVars[81] /* body.z_a[1] variable */);
  TRACE_POP
}
/*
equation index: 794
type: SIMPLE_ASSIGN
$DER.body.w_a[1] = body.z_a[1]
*/
void inerter_test3_eqFunction_794(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,794};
  (data->localData[0]->realVars[10] /* der(body.w_a[1]) DUMMY_DER */) = (data->localData[0]->realVars[81] /* body.z_a[1] variable */);
  TRACE_POP
}
/*
equation index: 795
type: SIMPLE_ASSIGN
cutForce.force[2] = cutForce.frame_a.f[2] * (*Real*)(cutForce.cutForce.csign)
*/
void inerter_test3_eqFunction_795(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,795};
  (data->localData[0]->realVars[162] /* cutForce.force[2] variable */) = ((data->localData[0]->realVars[170] /* cutForce.frame_a.f[2] variable */)) * (((modelica_real)(data->simulationInfo->integerParameter[18] /* cutForce.cutForce.csign PARAM */)));
  TRACE_POP
}
/*
equation index: 796
type: SIMPLE_ASSIGN
cutForce.forceArrow.r_head[2] = (-cutForce.frame_a.f[2]) * (if cutForce.positiveSign then 1.0 else -1.0)
*/
void inerter_test3_eqFunction_796(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,796};
  (data->localData[0]->realVars[164] /* cutForce.forceArrow.r_head[2] variable */) = ((-(data->localData[0]->realVars[170] /* cutForce.frame_a.f[2] variable */))) * (((data->simulationInfo->booleanParameter[22] /* cutForce.positiveSign PARAM */)?1.0:-1.0));
  TRACE_POP
}
/*
equation index: 797
type: SIMPLE_ASSIGN
$DER.prismatic.v = body.a_0[3]
*/
void inerter_test3_eqFunction_797(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,797};
  (data->localData[0]->realVars[3] /* der(prismatic.v) STATE_DER */) = (data->localData[0]->realVars[28] /* body.a_0[3] variable */);
  TRACE_POP
}
/*
equation index: 798
type: SIMPLE_ASSIGN
prismatic.a = body.a_0[3]
*/
void inerter_test3_eqFunction_798(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,798};
  (data->localData[0]->realVars[241] /* prismatic.a variable */) = (data->localData[0]->realVars[28] /* body.a_0[3] variable */);
  TRACE_POP
}
/*
equation index: 799
type: SIMPLE_ASSIGN
$DER.body.v_0[3] = body.a_0[3]
*/
void inerter_test3_eqFunction_799(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,799};
  (data->localData[0]->realVars[9] /* der(body.v_0[3]) DUMMY_DER */) = (data->localData[0]->realVars[28] /* body.a_0[3] variable */);
  TRACE_POP
}
/*
equation index: 800
type: SIMPLE_ASSIGN
$DER.springDamper.v_rel = body.a_0[3]
*/
void inerter_test3_eqFunction_800(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,800};
  (data->localData[0]->realVars[19] /* der(springDamper.v_rel) DUMMY_DER */) = (data->localData[0]->realVars[28] /* body.a_0[3] variable */);
  TRACE_POP
}
/*
equation index: 801
type: SIMPLE_ASSIGN
$DER.revolute.w = revolute.a
*/
void inerter_test3_eqFunction_801(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,801};
  (data->localData[0]->realVars[17] /* der(revolute.w) DUMMY_DER */) = (data->localData[0]->realVars[263] /* revolute.a variable */);
  TRACE_POP
}
/*
equation index: 802
type: SIMPLE_ASSIGN
bodyShape.frame_a.f[3] = prismatic.f
*/
void inerter_test3_eqFunction_802(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,802};
  (data->localData[0]->realVars[120] /* bodyShape.frame_a.f[3] variable */) = (data->localData[0]->realVars[256] /* prismatic.f variable */);
  TRACE_POP
}
/*
equation index: 803
type: SIMPLE_ASSIGN
y = cutForce.frame_a.f[3] * (*Real*)(cutForce.cutForce.csign)
*/
void inerter_test3_eqFunction_803(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,803};
  (data->localData[0]->realVars[678] /* y variable */) = ((data->localData[0]->realVars[171] /* cutForce.frame_a.f[3] variable */)) * (((modelica_real)(data->simulationInfo->integerParameter[18] /* cutForce.cutForce.csign PARAM */)));
  TRACE_POP
}
/*
equation index: 804
type: SIMPLE_ASSIGN
cutForce.forceArrow.r_head[3] = (-cutForce.frame_a.f[3]) * (if cutForce.positiveSign then 1.0 else -1.0)
*/
void inerter_test3_eqFunction_804(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,804};
  (data->localData[0]->realVars[165] /* cutForce.forceArrow.r_head[3] variable */) = ((-(data->localData[0]->realVars[171] /* cutForce.frame_a.f[3] variable */))) * (((data->simulationInfo->booleanParameter[22] /* cutForce.positiveSign PARAM */)?1.0:-1.0));
  TRACE_POP
}
/*
equation index: 805
type: SIMPLE_ASSIGN
bodyShape.frame_b.f[2] = (-force.frame_b.R.T[1,2]) * cutForce.frame_a.f[1] - force.frame_b.R.T[2,2] * cutForce.frame_a.f[2] - force.frame_b.R.T[3,2] * cutForce.frame_a.f[3]
*/
void inerter_test3_eqFunction_805(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,805};
  (data->localData[0]->realVars[125] /* bodyShape.frame_b.f[2] variable */) = ((-(data->localData[0]->realVars[208] /* force.frame_b.R.T[1,2] variable */))) * ((data->localData[0]->realVars[169] /* cutForce.frame_a.f[1] variable */)) - (((data->localData[0]->realVars[211] /* force.frame_b.R.T[2,2] variable */)) * ((data->localData[0]->realVars[170] /* cutForce.frame_a.f[2] variable */))) - (((data->localData[0]->realVars[214] /* force.frame_b.R.T[3,2] variable */)) * ((data->localData[0]->realVars[171] /* cutForce.frame_a.f[3] variable */)));
  TRACE_POP
}
/*
equation index: 806
type: SIMPLE_ASSIGN
bodyShape.frame_a.f[2] = -bodyShape.frame_b.f[2]
*/
void inerter_test3_eqFunction_806(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,806};
  (data->localData[0]->realVars[119] /* bodyShape.frame_a.f[2] variable */) = (-(data->localData[0]->realVars[125] /* bodyShape.frame_b.f[2] variable */));
  TRACE_POP
}
/*
equation index: 807
type: SIMPLE_ASSIGN
bodyShape.frame_b.f[1] = (-force.frame_b.R.T[1,1]) * cutForce.frame_a.f[1] - force.frame_b.R.T[2,1] * cutForce.frame_a.f[2] - force.frame_b.R.T[3,1] * cutForce.frame_a.f[3]
*/
void inerter_test3_eqFunction_807(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,807};
  (data->localData[0]->realVars[124] /* bodyShape.frame_b.f[1] variable */) = ((-(data->localData[0]->realVars[207] /* force.frame_b.R.T[1,1] variable */))) * ((data->localData[0]->realVars[169] /* cutForce.frame_a.f[1] variable */)) - (((data->localData[0]->realVars[210] /* force.frame_b.R.T[2,1] variable */)) * ((data->localData[0]->realVars[170] /* cutForce.frame_a.f[2] variable */))) - (((data->localData[0]->realVars[213] /* force.frame_b.R.T[3,1] variable */)) * ((data->localData[0]->realVars[171] /* cutForce.frame_a.f[3] variable */)));
  TRACE_POP
}
/*
equation index: 808
type: SIMPLE_ASSIGN
bodyShape.frame_a.f[1] = -bodyShape.frame_b.f[1]
*/
void inerter_test3_eqFunction_808(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,808};
  (data->localData[0]->realVars[118] /* bodyShape.frame_a.f[1] variable */) = (-(data->localData[0]->realVars[124] /* bodyShape.frame_b.f[1] variable */));
  TRACE_POP
}
/*
equation index: 809
type: SIMPLE_ASSIGN
$DER.revolute.R_rel.w[2] = body.z_a[2]
*/
void inerter_test3_eqFunction_809(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,809};
  (data->localData[0]->realVars[14] /* der(revolute.R_rel.w[2]) DUMMY_DER */) = (data->localData[0]->realVars[82] /* body.z_a[2] variable */);
  TRACE_POP
}
/*
equation index: 810
type: SIMPLE_ASSIGN
$DER.body.w_a[2] = body.z_a[2]
*/
void inerter_test3_eqFunction_810(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,810};
  (data->localData[0]->realVars[11] /* der(body.w_a[2]) DUMMY_DER */) = (data->localData[0]->realVars[82] /* body.z_a[2] variable */);
  TRACE_POP
}
/*
equation index: 811
type: SIMPLE_ASSIGN
bodyShape.frame_b.t[3] = (-force.frame_b.R.T[1,3]) * body.frame_a.t[1] - force.frame_b.R.T[2,3] * body.frame_a.t[2] - force.frame_b.R.T[3,3] * body.frame_a.t[3]
*/
void inerter_test3_eqFunction_811(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,811};
  (data->localData[0]->realVars[128] /* bodyShape.frame_b.t[3] variable */) = ((-(data->localData[0]->realVars[209] /* force.frame_b.R.T[1,3] variable */))) * ((data->localData[0]->realVars[46] /* body.frame_a.t[1] variable */)) - (((data->localData[0]->realVars[212] /* force.frame_b.R.T[2,3] variable */)) * ((data->localData[0]->realVars[47] /* body.frame_a.t[2] variable */))) - (((data->localData[0]->realVars[215] /* force.frame_b.R.T[3,3] variable */)) * ((data->localData[0]->realVars[48] /* body.frame_a.t[3] variable */)));
  TRACE_POP
}
/*
equation index: 812
type: SIMPLE_ASSIGN
bodyShape.frame_a.t[3] = -bodyShape.frame_b.t[3]
*/
void inerter_test3_eqFunction_812(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,812};
  (data->localData[0]->realVars[123] /* bodyShape.frame_a.t[3] variable */) = (-(data->localData[0]->realVars[128] /* bodyShape.frame_b.t[3] variable */));
  TRACE_POP
}
/*
equation index: 813
type: SIMPLE_ASSIGN
revolute.frame_a.t[2] = force.frame_b.R.T[3,2] * body.frame_a.t[3] + force.frame_b.R.T[1,2] * body.frame_a.t[1] + force.frame_b.R.T[2,2] * body.frame_a.t[2]
*/
void inerter_test3_eqFunction_813(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,813};
  (data->localData[0]->realVars[275] /* revolute.frame_a.t[2] variable */) = ((data->localData[0]->realVars[214] /* force.frame_b.R.T[3,2] variable */)) * ((data->localData[0]->realVars[48] /* body.frame_a.t[3] variable */)) + ((data->localData[0]->realVars[208] /* force.frame_b.R.T[1,2] variable */)) * ((data->localData[0]->realVars[46] /* body.frame_a.t[1] variable */)) + ((data->localData[0]->realVars[211] /* force.frame_b.R.T[2,2] variable */)) * ((data->localData[0]->realVars[47] /* body.frame_a.t[2] variable */));
  TRACE_POP
}
/*
equation index: 814
type: SIMPLE_ASSIGN
bodyShape.frame_b.t[2] = bodyShape.frame_b.f[1] * prismatic.s - revolute.frame_a.t[2]
*/
void inerter_test3_eqFunction_814(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,814};
  (data->localData[0]->realVars[127] /* bodyShape.frame_b.t[2] variable */) = ((data->localData[0]->realVars[124] /* bodyShape.frame_b.f[1] variable */)) * ((data->localData[0]->realVars[0] /* prismatic.s STATE(1,prismatic.v) */)) - (data->localData[0]->realVars[275] /* revolute.frame_a.t[2] variable */);
  TRACE_POP
}
/*
equation index: 815
type: SIMPLE_ASSIGN
bodyShape.frame_a.t[2] = -bodyShape.frame_b.t[2]
*/
void inerter_test3_eqFunction_815(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,815};
  (data->localData[0]->realVars[122] /* bodyShape.frame_a.t[2] variable */) = (-(data->localData[0]->realVars[127] /* bodyShape.frame_b.t[2] variable */));
  TRACE_POP
}
/*
equation index: 816
type: SIMPLE_ASSIGN
revolute.frame_a.t[1] = force.frame_b.R.T[3,1] * body.frame_a.t[3] + force.frame_b.R.T[1,1] * body.frame_a.t[1] + force.frame_b.R.T[2,1] * body.frame_a.t[2]
*/
void inerter_test3_eqFunction_816(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,816};
  (data->localData[0]->realVars[274] /* revolute.frame_a.t[1] variable */) = ((data->localData[0]->realVars[213] /* force.frame_b.R.T[3,1] variable */)) * ((data->localData[0]->realVars[48] /* body.frame_a.t[3] variable */)) + ((data->localData[0]->realVars[207] /* force.frame_b.R.T[1,1] variable */)) * ((data->localData[0]->realVars[46] /* body.frame_a.t[1] variable */)) + ((data->localData[0]->realVars[210] /* force.frame_b.R.T[2,1] variable */)) * ((data->localData[0]->realVars[47] /* body.frame_a.t[2] variable */));
  TRACE_POP
}
/*
equation index: 817
type: SIMPLE_ASSIGN
bodyShape.frame_b.t[1] = (-bodyShape.frame_b.f[2]) * prismatic.s - revolute.frame_a.t[1]
*/
void inerter_test3_eqFunction_817(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,817};
  (data->localData[0]->realVars[126] /* bodyShape.frame_b.t[1] variable */) = ((-(data->localData[0]->realVars[125] /* bodyShape.frame_b.f[2] variable */))) * ((data->localData[0]->realVars[0] /* prismatic.s STATE(1,prismatic.v) */)) - (data->localData[0]->realVars[274] /* revolute.frame_a.t[1] variable */);
  TRACE_POP
}
/*
equation index: 818
type: SIMPLE_ASSIGN
bodyShape.frame_a.t[1] = -bodyShape.frame_b.t[1]
*/
void inerter_test3_eqFunction_818(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,818};
  (data->localData[0]->realVars[121] /* bodyShape.frame_a.t[1] variable */) = (-(data->localData[0]->realVars[126] /* bodyShape.frame_b.t[1] variable */));
  TRACE_POP
}
/*
equation index: 819
type: ARRAY_CALL_ASSIGN

world.z_label.R_lines = Modelica.Mechanics.MultiBody.Frames.TransformationMatrices.from_nxy({0.0, 0.0, 1.0}, {0.0, 1.0, 0.0})
*/
void inerter_test3_eqFunction_819(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,819};
  real_array tmp7;
  real_array_create(&tmp7, ((modelica_real*)&((&(data->localData[0]->realVars[613] /* world.z_label.R_lines[1,1] variable */))[(((modelica_integer) 1) - 1) * 3 + (((modelica_integer) 1)-1)])), 2, (_index_t)3, (_index_t)3);
  real_array_copy_data(omc_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_from__nxy(threadData, _OMC_LIT3, _OMC_LIT2), tmp7);
  TRACE_POP
}
/*
equation index: 820
type: SIMPLE_ASSIGN
world.z_label.cylinders[3].r[2] = world.z_label.R_lines[2,2] * world.scaledLabel
*/
void inerter_test3_eqFunction_820(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,820};
  (data->localData[0]->realVars[638] /* world.z_label.cylinders[3].r[2] variable */) = ((data->localData[0]->realVars[617] /* world.z_label.R_lines[2,2] variable */)) * ((data->simulationInfo->realParameter[275] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 821
type: SIMPLE_ASSIGN
world.z_label.cylinders[2].lengthDirection[1] = world.z_label.R_lines[1,1] * world.scaledLabel
*/
void inerter_test3_eqFunction_821(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,821};
  (data->localData[0]->realVars[631] /* world.z_label.cylinders[2].lengthDirection[1] variable */) = ((data->localData[0]->realVars[613] /* world.z_label.R_lines[1,1] variable */)) * ((data->simulationInfo->realParameter[275] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 822
type: SIMPLE_ASSIGN
world.z_label.cylinders[3].r[1] = world.z_label.R_lines[2,1] * world.scaledLabel
*/
void inerter_test3_eqFunction_822(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,822};
  (data->localData[0]->realVars[637] /* world.z_label.cylinders[3].r[1] variable */) = ((data->localData[0]->realVars[616] /* world.z_label.R_lines[2,1] variable */)) * ((data->simulationInfo->realParameter[275] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 823
type: SIMPLE_ASSIGN
world.z_label.cylinders[3].lengthDirection[1] = (world.z_label.R_lines[1,1] - world.z_label.R_lines[2,1]) * world.scaledLabel
*/
void inerter_test3_eqFunction_823(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,823};
  (data->localData[0]->realVars[634] /* world.z_label.cylinders[3].lengthDirection[1] variable */) = ((data->localData[0]->realVars[613] /* world.z_label.R_lines[1,1] variable */) - (data->localData[0]->realVars[616] /* world.z_label.R_lines[2,1] variable */)) * ((data->simulationInfo->realParameter[275] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 824
type: SIMPLE_ASSIGN
world.z_label.cylinders[2].lengthDirection[2] = world.z_label.R_lines[1,2] * world.scaledLabel
*/
void inerter_test3_eqFunction_824(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,824};
  (data->localData[0]->realVars[632] /* world.z_label.cylinders[2].lengthDirection[2] variable */) = ((data->localData[0]->realVars[614] /* world.z_label.R_lines[1,2] variable */)) * ((data->simulationInfo->realParameter[275] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 825
type: SIMPLE_ASSIGN
world.z_label.cylinders[3].lengthDirection[2] = (world.z_label.R_lines[1,2] - world.z_label.R_lines[2,2]) * world.scaledLabel
*/
void inerter_test3_eqFunction_825(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,825};
  (data->localData[0]->realVars[635] /* world.z_label.cylinders[3].lengthDirection[2] variable */) = ((data->localData[0]->realVars[614] /* world.z_label.R_lines[1,2] variable */) - (data->localData[0]->realVars[617] /* world.z_label.R_lines[2,2] variable */)) * ((data->simulationInfo->realParameter[275] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 826
type: SIMPLE_ASSIGN
world.z_label.cylinders[3].r[3] = world.labelStart + world.z_label.R_lines[2,3] * world.scaledLabel
*/
void inerter_test3_eqFunction_826(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,826};
  (data->localData[0]->realVars[639] /* world.z_label.cylinders[3].r[3] variable */) = (data->simulationInfo->realParameter[267] /* world.labelStart PARAM */) + ((data->localData[0]->realVars[618] /* world.z_label.R_lines[2,3] variable */)) * ((data->simulationInfo->realParameter[275] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 827
type: SIMPLE_ASSIGN
world.z_label.cylinders[2].lengthDirection[3] = world.z_label.R_lines[1,3] * world.scaledLabel
*/
void inerter_test3_eqFunction_827(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,827};
  (data->localData[0]->realVars[633] /* world.z_label.cylinders[2].lengthDirection[3] variable */) = ((data->localData[0]->realVars[615] /* world.z_label.R_lines[1,3] variable */)) * ((data->simulationInfo->realParameter[275] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 828
type: SIMPLE_ASSIGN
world.z_label.cylinders[3].lengthDirection[3] = (world.z_label.R_lines[1,3] - world.z_label.R_lines[2,3]) * world.scaledLabel
*/
void inerter_test3_eqFunction_828(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,828};
  (data->localData[0]->realVars[636] /* world.z_label.cylinders[3].lengthDirection[3] variable */) = ((data->localData[0]->realVars[615] /* world.z_label.R_lines[1,3] variable */) - (data->localData[0]->realVars[618] /* world.z_label.R_lines[2,3] variable */)) * ((data->simulationInfo->realParameter[275] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 829
type: ARRAY_CALL_ASSIGN

world.y_label.R_lines = Modelica.Mechanics.MultiBody.Frames.TransformationMatrices.from_nxy({0.0, 1.0, 0.0}, {-1.0, 0.0, 0.0})
*/
void inerter_test3_eqFunction_829(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,829};
  real_array tmp8;
  real_array_create(&tmp8, ((modelica_real*)&((&(data->localData[0]->realVars[489] /* world.y_label.R_lines[1,1] variable */))[(((modelica_integer) 1) - 1) * 3 + (((modelica_integer) 1)-1)])), 2, (_index_t)3, (_index_t)3);
  real_array_copy_data(omc_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_from__nxy(threadData, _OMC_LIT2, _OMC_LIT4), tmp8);
  TRACE_POP
}
/*
equation index: 830
type: SIMPLE_ASSIGN
world.y_label.cylinders[2].r[2] = world.labelStart + world.y_label.R_lines[2,2] * world.y_label.lines[2,1,2]
*/
void inerter_test3_eqFunction_830(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,830};
  (data->localData[0]->realVars[512] /* world.y_label.cylinders[2].r[2] variable */) = (data->simulationInfo->realParameter[267] /* world.labelStart PARAM */) + ((data->localData[0]->realVars[493] /* world.y_label.R_lines[2,2] variable */)) * ((data->localData[0]->realVars[530] /* world.y_label.lines[2,1,2] variable */));
  TRACE_POP
}
/*
equation index: 831
type: SIMPLE_ASSIGN
world.y_label.cylinders[1].lengthDirection[1] = world.y_label.R_lines[1,1] * world.scaledLabel + world.y_label.R_lines[2,1] * world.y_label.lines[1,2,2]
*/
void inerter_test3_eqFunction_831(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,831};
  (data->localData[0]->realVars[505] /* world.y_label.cylinders[1].lengthDirection[1] variable */) = ((data->localData[0]->realVars[489] /* world.y_label.R_lines[1,1] variable */)) * ((data->simulationInfo->realParameter[275] /* world.scaledLabel PARAM */)) + ((data->localData[0]->realVars[492] /* world.y_label.R_lines[2,1] variable */)) * ((data->localData[0]->realVars[528] /* world.y_label.lines[1,2,2] variable */));
  TRACE_POP
}
/*
equation index: 832
type: SIMPLE_ASSIGN
world.y_label.cylinders[2].r[1] = world.y_label.R_lines[2,1] * world.y_label.lines[2,1,2]
*/
void inerter_test3_eqFunction_832(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,832};
  (data->localData[0]->realVars[511] /* world.y_label.cylinders[2].r[1] variable */) = ((data->localData[0]->realVars[492] /* world.y_label.R_lines[2,1] variable */)) * ((data->localData[0]->realVars[530] /* world.y_label.lines[2,1,2] variable */));
  TRACE_POP
}
/*
equation index: 833
type: SIMPLE_ASSIGN
world.y_label.cylinders[2].lengthDirection[1] = world.y_label.R_lines[1,1] * world.y_label.lines[2,2,1] + world.y_label.R_lines[2,1] * (world.y_label.lines[2,2,2] - world.y_label.lines[2,1,2])
*/
void inerter_test3_eqFunction_833(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,833};
  (data->localData[0]->realVars[508] /* world.y_label.cylinders[2].lengthDirection[1] variable */) = ((data->localData[0]->realVars[489] /* world.y_label.R_lines[1,1] variable */)) * ((data->localData[0]->realVars[531] /* world.y_label.lines[2,2,1] variable */)) + ((data->localData[0]->realVars[492] /* world.y_label.R_lines[2,1] variable */)) * ((data->localData[0]->realVars[532] /* world.y_label.lines[2,2,2] variable */) - (data->localData[0]->realVars[530] /* world.y_label.lines[2,1,2] variable */));
  TRACE_POP
}
/*
equation index: 834
type: SIMPLE_ASSIGN
world.y_label.cylinders[1].lengthDirection[2] = world.y_label.R_lines[1,2] * world.scaledLabel + world.y_label.R_lines[2,2] * world.y_label.lines[1,2,2]
*/
void inerter_test3_eqFunction_834(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,834};
  (data->localData[0]->realVars[506] /* world.y_label.cylinders[1].lengthDirection[2] variable */) = ((data->localData[0]->realVars[490] /* world.y_label.R_lines[1,2] variable */)) * ((data->simulationInfo->realParameter[275] /* world.scaledLabel PARAM */)) + ((data->localData[0]->realVars[493] /* world.y_label.R_lines[2,2] variable */)) * ((data->localData[0]->realVars[528] /* world.y_label.lines[1,2,2] variable */));
  TRACE_POP
}
/*
equation index: 835
type: SIMPLE_ASSIGN
world.y_label.cylinders[2].lengthDirection[2] = world.y_label.R_lines[1,2] * world.y_label.lines[2,2,1] + world.y_label.R_lines[2,2] * (world.y_label.lines[2,2,2] - world.y_label.lines[2,1,2])
*/
void inerter_test3_eqFunction_835(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,835};
  (data->localData[0]->realVars[509] /* world.y_label.cylinders[2].lengthDirection[2] variable */) = ((data->localData[0]->realVars[490] /* world.y_label.R_lines[1,2] variable */)) * ((data->localData[0]->realVars[531] /* world.y_label.lines[2,2,1] variable */)) + ((data->localData[0]->realVars[493] /* world.y_label.R_lines[2,2] variable */)) * ((data->localData[0]->realVars[532] /* world.y_label.lines[2,2,2] variable */) - (data->localData[0]->realVars[530] /* world.y_label.lines[2,1,2] variable */));
  TRACE_POP
}
/*
equation index: 836
type: SIMPLE_ASSIGN
world.y_label.cylinders[2].r[3] = world.y_label.R_lines[2,3] * world.y_label.lines[2,1,2]
*/
void inerter_test3_eqFunction_836(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,836};
  (data->localData[0]->realVars[513] /* world.y_label.cylinders[2].r[3] variable */) = ((data->localData[0]->realVars[494] /* world.y_label.R_lines[2,3] variable */)) * ((data->localData[0]->realVars[530] /* world.y_label.lines[2,1,2] variable */));
  TRACE_POP
}
/*
equation index: 837
type: SIMPLE_ASSIGN
world.y_label.cylinders[1].lengthDirection[3] = world.y_label.R_lines[1,3] * world.scaledLabel + world.y_label.R_lines[2,3] * world.y_label.lines[1,2,2]
*/
void inerter_test3_eqFunction_837(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,837};
  (data->localData[0]->realVars[507] /* world.y_label.cylinders[1].lengthDirection[3] variable */) = ((data->localData[0]->realVars[491] /* world.y_label.R_lines[1,3] variable */)) * ((data->simulationInfo->realParameter[275] /* world.scaledLabel PARAM */)) + ((data->localData[0]->realVars[494] /* world.y_label.R_lines[2,3] variable */)) * ((data->localData[0]->realVars[528] /* world.y_label.lines[1,2,2] variable */));
  TRACE_POP
}
/*
equation index: 838
type: SIMPLE_ASSIGN
world.y_label.cylinders[2].lengthDirection[3] = world.y_label.R_lines[1,3] * world.y_label.lines[2,2,1] + world.y_label.R_lines[2,3] * (world.y_label.lines[2,2,2] - world.y_label.lines[2,1,2])
*/
void inerter_test3_eqFunction_838(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,838};
  (data->localData[0]->realVars[510] /* world.y_label.cylinders[2].lengthDirection[3] variable */) = ((data->localData[0]->realVars[491] /* world.y_label.R_lines[1,3] variable */)) * ((data->localData[0]->realVars[531] /* world.y_label.lines[2,2,1] variable */)) + ((data->localData[0]->realVars[494] /* world.y_label.R_lines[2,3] variable */)) * ((data->localData[0]->realVars[532] /* world.y_label.lines[2,2,2] variable */) - (data->localData[0]->realVars[530] /* world.y_label.lines[2,1,2] variable */));
  TRACE_POP
}
/*
equation index: 839
type: ARRAY_CALL_ASSIGN

world.x_label.R_lines = Modelica.Mechanics.MultiBody.Frames.TransformationMatrices.from_nxy({1.0, 0.0, 0.0}, {0.0, 1.0, 0.0})
*/
void inerter_test3_eqFunction_839(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,839};
  real_array tmp9;
  real_array_create(&tmp9, ((modelica_real*)&((&(data->localData[0]->realVars[368] /* world.x_label.R_lines[1,1] variable */))[(((modelica_integer) 1) - 1) * 3 + (((modelica_integer) 1)-1)])), 2, (_index_t)3, (_index_t)3);
  real_array_copy_data(omc_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_from__nxy(threadData, _OMC_LIT1, _OMC_LIT2), tmp9);
  TRACE_POP
}
/*
equation index: 840
type: SIMPLE_ASSIGN
world.x_label.cylinders[2].r[2] = world.x_label.R_lines[2,2] * world.scaledLabel
*/
void inerter_test3_eqFunction_840(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,840};
  (data->localData[0]->realVars[391] /* world.x_label.cylinders[2].r[2] variable */) = ((data->localData[0]->realVars[372] /* world.x_label.R_lines[2,2] variable */)) * ((data->simulationInfo->realParameter[275] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 841
type: SIMPLE_ASSIGN
world.x_label.cylinders[1].lengthDirection[1] = world.scaledLabel * (world.x_label.R_lines[1,1] + world.x_label.R_lines[2,1])
*/
void inerter_test3_eqFunction_841(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,841};
  (data->localData[0]->realVars[384] /* world.x_label.cylinders[1].lengthDirection[1] variable */) = ((data->simulationInfo->realParameter[275] /* world.scaledLabel PARAM */)) * ((data->localData[0]->realVars[368] /* world.x_label.R_lines[1,1] variable */) + (data->localData[0]->realVars[371] /* world.x_label.R_lines[2,1] variable */));
  TRACE_POP
}
/*
equation index: 842
type: SIMPLE_ASSIGN
world.x_label.cylinders[2].r[1] = world.labelStart + world.x_label.R_lines[2,1] * world.scaledLabel
*/
void inerter_test3_eqFunction_842(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,842};
  (data->localData[0]->realVars[390] /* world.x_label.cylinders[2].r[1] variable */) = (data->simulationInfo->realParameter[267] /* world.labelStart PARAM */) + ((data->localData[0]->realVars[371] /* world.x_label.R_lines[2,1] variable */)) * ((data->simulationInfo->realParameter[275] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 843
type: SIMPLE_ASSIGN
world.x_label.cylinders[2].lengthDirection[1] = (world.x_label.R_lines[1,1] - world.x_label.R_lines[2,1]) * world.scaledLabel
*/
void inerter_test3_eqFunction_843(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,843};
  (data->localData[0]->realVars[387] /* world.x_label.cylinders[2].lengthDirection[1] variable */) = ((data->localData[0]->realVars[368] /* world.x_label.R_lines[1,1] variable */) - (data->localData[0]->realVars[371] /* world.x_label.R_lines[2,1] variable */)) * ((data->simulationInfo->realParameter[275] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 844
type: SIMPLE_ASSIGN
world.x_label.cylinders[1].lengthDirection[2] = world.scaledLabel * (world.x_label.R_lines[1,2] + world.x_label.R_lines[2,2])
*/
void inerter_test3_eqFunction_844(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,844};
  (data->localData[0]->realVars[385] /* world.x_label.cylinders[1].lengthDirection[2] variable */) = ((data->simulationInfo->realParameter[275] /* world.scaledLabel PARAM */)) * ((data->localData[0]->realVars[369] /* world.x_label.R_lines[1,2] variable */) + (data->localData[0]->realVars[372] /* world.x_label.R_lines[2,2] variable */));
  TRACE_POP
}
/*
equation index: 845
type: SIMPLE_ASSIGN
world.x_label.cylinders[2].lengthDirection[2] = (world.x_label.R_lines[1,2] - world.x_label.R_lines[2,2]) * world.scaledLabel
*/
void inerter_test3_eqFunction_845(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,845};
  (data->localData[0]->realVars[388] /* world.x_label.cylinders[2].lengthDirection[2] variable */) = ((data->localData[0]->realVars[369] /* world.x_label.R_lines[1,2] variable */) - (data->localData[0]->realVars[372] /* world.x_label.R_lines[2,2] variable */)) * ((data->simulationInfo->realParameter[275] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 846
type: SIMPLE_ASSIGN
world.x_label.cylinders[2].r[3] = world.x_label.R_lines[2,3] * world.scaledLabel
*/
void inerter_test3_eqFunction_846(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,846};
  (data->localData[0]->realVars[392] /* world.x_label.cylinders[2].r[3] variable */) = ((data->localData[0]->realVars[373] /* world.x_label.R_lines[2,3] variable */)) * ((data->simulationInfo->realParameter[275] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 847
type: SIMPLE_ASSIGN
world.x_label.cylinders[1].lengthDirection[3] = world.scaledLabel * (world.x_label.R_lines[1,3] + world.x_label.R_lines[2,3])
*/
void inerter_test3_eqFunction_847(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,847};
  (data->localData[0]->realVars[386] /* world.x_label.cylinders[1].lengthDirection[3] variable */) = ((data->simulationInfo->realParameter[275] /* world.scaledLabel PARAM */)) * ((data->localData[0]->realVars[370] /* world.x_label.R_lines[1,3] variable */) + (data->localData[0]->realVars[373] /* world.x_label.R_lines[2,3] variable */));
  TRACE_POP
}
/*
equation index: 848
type: SIMPLE_ASSIGN
world.x_label.cylinders[2].lengthDirection[3] = (world.x_label.R_lines[1,3] - world.x_label.R_lines[2,3]) * world.scaledLabel
*/
void inerter_test3_eqFunction_848(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,848};
  (data->localData[0]->realVars[389] /* world.x_label.cylinders[2].lengthDirection[3] variable */) = ((data->localData[0]->realVars[370] /* world.x_label.R_lines[1,3] variable */) - (data->localData[0]->realVars[373] /* world.x_label.R_lines[2,3] variable */)) * ((data->simulationInfo->realParameter[275] /* world.scaledLabel PARAM */));
  TRACE_POP
}

OMC_DISABLE_OPT
int inerter_test3_functionDAE(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  int equationIndexes[1] = {0};
#if !defined(OMC_MINIMAL_RUNTIME)
  if (measure_time_flag) rt_tick(SIM_TIMER_DAE);
#endif

  data->simulationInfo->needToIterate = 0;
  data->simulationInfo->discreteCall = 1;
  inerter_test3_functionLocalKnownVars(data, threadData);
  inerter_test3_eqFunction_707(data, threadData);

  inerter_test3_eqFunction_708(data, threadData);

  inerter_test3_eqFunction_709(data, threadData);

  inerter_test3_eqFunction_710(data, threadData);

  inerter_test3_eqFunction_711(data, threadData);

  inerter_test3_eqFunction_712(data, threadData);

  inerter_test3_eqFunction_713(data, threadData);

  inerter_test3_eqFunction_714(data, threadData);

  inerter_test3_eqFunction_715(data, threadData);

  inerter_test3_eqFunction_716(data, threadData);

  inerter_test3_eqFunction_717(data, threadData);

  inerter_test3_eqFunction_718(data, threadData);

  inerter_test3_eqFunction_719(data, threadData);

  inerter_test3_eqFunction_720(data, threadData);

  inerter_test3_eqFunction_721(data, threadData);

  inerter_test3_eqFunction_722(data, threadData);

  inerter_test3_eqFunction_723(data, threadData);

  inerter_test3_eqFunction_724(data, threadData);

  inerter_test3_eqFunction_725(data, threadData);

  inerter_test3_eqFunction_726(data, threadData);

  inerter_test3_eqFunction_727(data, threadData);

  inerter_test3_eqFunction_728(data, threadData);

  inerter_test3_eqFunction_729(data, threadData);

  inerter_test3_eqFunction_730(data, threadData);

  inerter_test3_eqFunction_731(data, threadData);

  inerter_test3_eqFunction_732(data, threadData);

  inerter_test3_eqFunction_733(data, threadData);

  inerter_test3_eqFunction_734(data, threadData);

  inerter_test3_eqFunction_735(data, threadData);

  inerter_test3_eqFunction_736(data, threadData);

  inerter_test3_eqFunction_737(data, threadData);

  inerter_test3_eqFunction_738(data, threadData);

  inerter_test3_eqFunction_739(data, threadData);

  inerter_test3_eqFunction_740(data, threadData);

  inerter_test3_eqFunction_741(data, threadData);

  inerter_test3_eqFunction_742(data, threadData);

  inerter_test3_eqFunction_743(data, threadData);

  inerter_test3_eqFunction_744(data, threadData);

  inerter_test3_eqFunction_745(data, threadData);

  inerter_test3_eqFunction_746(data, threadData);

  inerter_test3_eqFunction_747(data, threadData);

  inerter_test3_eqFunction_748(data, threadData);

  inerter_test3_eqFunction_749(data, threadData);

  inerter_test3_eqFunction_750(data, threadData);

  inerter_test3_eqFunction_751(data, threadData);

  inerter_test3_eqFunction_752(data, threadData);

  inerter_test3_eqFunction_753(data, threadData);

  inerter_test3_eqFunction_754(data, threadData);

  inerter_test3_eqFunction_755(data, threadData);

  inerter_test3_eqFunction_756(data, threadData);

  inerter_test3_eqFunction_757(data, threadData);

  inerter_test3_eqFunction_788(data, threadData);

  inerter_test3_eqFunction_789(data, threadData);

  inerter_test3_eqFunction_790(data, threadData);

  inerter_test3_eqFunction_791(data, threadData);

  inerter_test3_eqFunction_792(data, threadData);

  inerter_test3_eqFunction_793(data, threadData);

  inerter_test3_eqFunction_794(data, threadData);

  inerter_test3_eqFunction_795(data, threadData);

  inerter_test3_eqFunction_796(data, threadData);

  inerter_test3_eqFunction_797(data, threadData);

  inerter_test3_eqFunction_798(data, threadData);

  inerter_test3_eqFunction_799(data, threadData);

  inerter_test3_eqFunction_800(data, threadData);

  inerter_test3_eqFunction_801(data, threadData);

  inerter_test3_eqFunction_802(data, threadData);

  inerter_test3_eqFunction_803(data, threadData);

  inerter_test3_eqFunction_804(data, threadData);

  inerter_test3_eqFunction_805(data, threadData);

  inerter_test3_eqFunction_806(data, threadData);

  inerter_test3_eqFunction_807(data, threadData);

  inerter_test3_eqFunction_808(data, threadData);

  inerter_test3_eqFunction_809(data, threadData);

  inerter_test3_eqFunction_810(data, threadData);

  inerter_test3_eqFunction_811(data, threadData);

  inerter_test3_eqFunction_812(data, threadData);

  inerter_test3_eqFunction_813(data, threadData);

  inerter_test3_eqFunction_814(data, threadData);

  inerter_test3_eqFunction_815(data, threadData);

  inerter_test3_eqFunction_816(data, threadData);

  inerter_test3_eqFunction_817(data, threadData);

  inerter_test3_eqFunction_818(data, threadData);

  inerter_test3_eqFunction_819(data, threadData);

  inerter_test3_eqFunction_820(data, threadData);

  inerter_test3_eqFunction_821(data, threadData);

  inerter_test3_eqFunction_822(data, threadData);

  inerter_test3_eqFunction_823(data, threadData);

  inerter_test3_eqFunction_824(data, threadData);

  inerter_test3_eqFunction_825(data, threadData);

  inerter_test3_eqFunction_826(data, threadData);

  inerter_test3_eqFunction_827(data, threadData);

  inerter_test3_eqFunction_828(data, threadData);

  inerter_test3_eqFunction_829(data, threadData);

  inerter_test3_eqFunction_830(data, threadData);

  inerter_test3_eqFunction_831(data, threadData);

  inerter_test3_eqFunction_832(data, threadData);

  inerter_test3_eqFunction_833(data, threadData);

  inerter_test3_eqFunction_834(data, threadData);

  inerter_test3_eqFunction_835(data, threadData);

  inerter_test3_eqFunction_836(data, threadData);

  inerter_test3_eqFunction_837(data, threadData);

  inerter_test3_eqFunction_838(data, threadData);

  inerter_test3_eqFunction_839(data, threadData);

  inerter_test3_eqFunction_840(data, threadData);

  inerter_test3_eqFunction_841(data, threadData);

  inerter_test3_eqFunction_842(data, threadData);

  inerter_test3_eqFunction_843(data, threadData);

  inerter_test3_eqFunction_844(data, threadData);

  inerter_test3_eqFunction_845(data, threadData);

  inerter_test3_eqFunction_846(data, threadData);

  inerter_test3_eqFunction_847(data, threadData);

  inerter_test3_eqFunction_848(data, threadData);
  data->simulationInfo->discreteCall = 0;
  
#if !defined(OMC_MINIMAL_RUNTIME)
  if (measure_time_flag) rt_accumulate(SIM_TIMER_DAE);
#endif
  TRACE_POP
  return 0;
}


int inerter_test3_functionLocalKnownVars(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  
  TRACE_POP
  return 0;
}


/* forwarded equations */
extern void inerter_test3_eqFunction_729(DATA* data, threadData_t *threadData);
extern void inerter_test3_eqFunction_731(DATA* data, threadData_t *threadData);
extern void inerter_test3_eqFunction_732(DATA* data, threadData_t *threadData);
extern void inerter_test3_eqFunction_733(DATA* data, threadData_t *threadData);
extern void inerter_test3_eqFunction_735(DATA* data, threadData_t *threadData);
extern void inerter_test3_eqFunction_737(DATA* data, threadData_t *threadData);
extern void inerter_test3_eqFunction_740(DATA* data, threadData_t *threadData);
extern void inerter_test3_eqFunction_741(DATA* data, threadData_t *threadData);
extern void inerter_test3_eqFunction_742(DATA* data, threadData_t *threadData);
extern void inerter_test3_eqFunction_743(DATA* data, threadData_t *threadData);
extern void inerter_test3_eqFunction_745(DATA* data, threadData_t *threadData);
extern void inerter_test3_eqFunction_746(DATA* data, threadData_t *threadData);
extern void inerter_test3_eqFunction_747(DATA* data, threadData_t *threadData);
extern void inerter_test3_eqFunction_749(DATA* data, threadData_t *threadData);
extern void inerter_test3_eqFunction_750(DATA* data, threadData_t *threadData);
extern void inerter_test3_eqFunction_751(DATA* data, threadData_t *threadData);
extern void inerter_test3_eqFunction_753(DATA* data, threadData_t *threadData);
extern void inerter_test3_eqFunction_754(DATA* data, threadData_t *threadData);
extern void inerter_test3_eqFunction_755(DATA* data, threadData_t *threadData);
extern void inerter_test3_eqFunction_756(DATA* data, threadData_t *threadData);
extern void inerter_test3_eqFunction_757(DATA* data, threadData_t *threadData);
extern void inerter_test3_eqFunction_788(DATA* data, threadData_t *threadData);
extern void inerter_test3_eqFunction_797(DATA* data, threadData_t *threadData);

static void functionODE_system0(DATA *data, threadData_t *threadData)
{
  {
    inerter_test3_eqFunction_729(data, threadData);
    threadData->lastEquationSolved = 729;
  }
  {
    inerter_test3_eqFunction_731(data, threadData);
    threadData->lastEquationSolved = 731;
  }
  {
    inerter_test3_eqFunction_732(data, threadData);
    threadData->lastEquationSolved = 732;
  }
  {
    inerter_test3_eqFunction_733(data, threadData);
    threadData->lastEquationSolved = 733;
  }
  {
    inerter_test3_eqFunction_735(data, threadData);
    threadData->lastEquationSolved = 735;
  }
  {
    inerter_test3_eqFunction_737(data, threadData);
    threadData->lastEquationSolved = 737;
  }
  {
    inerter_test3_eqFunction_740(data, threadData);
    threadData->lastEquationSolved = 740;
  }
  {
    inerter_test3_eqFunction_741(data, threadData);
    threadData->lastEquationSolved = 741;
  }
  {
    inerter_test3_eqFunction_742(data, threadData);
    threadData->lastEquationSolved = 742;
  }
  {
    inerter_test3_eqFunction_743(data, threadData);
    threadData->lastEquationSolved = 743;
  }
  {
    inerter_test3_eqFunction_745(data, threadData);
    threadData->lastEquationSolved = 745;
  }
  {
    inerter_test3_eqFunction_746(data, threadData);
    threadData->lastEquationSolved = 746;
  }
  {
    inerter_test3_eqFunction_747(data, threadData);
    threadData->lastEquationSolved = 747;
  }
  {
    inerter_test3_eqFunction_749(data, threadData);
    threadData->lastEquationSolved = 749;
  }
  {
    inerter_test3_eqFunction_750(data, threadData);
    threadData->lastEquationSolved = 750;
  }
  {
    inerter_test3_eqFunction_751(data, threadData);
    threadData->lastEquationSolved = 751;
  }
  {
    inerter_test3_eqFunction_753(data, threadData);
    threadData->lastEquationSolved = 753;
  }
  {
    inerter_test3_eqFunction_754(data, threadData);
    threadData->lastEquationSolved = 754;
  }
  {
    inerter_test3_eqFunction_755(data, threadData);
    threadData->lastEquationSolved = 755;
  }
  {
    inerter_test3_eqFunction_756(data, threadData);
    threadData->lastEquationSolved = 756;
  }
  {
    inerter_test3_eqFunction_757(data, threadData);
    threadData->lastEquationSolved = 757;
  }
  {
    inerter_test3_eqFunction_788(data, threadData);
    threadData->lastEquationSolved = 788;
  }
  {
    inerter_test3_eqFunction_797(data, threadData);
    threadData->lastEquationSolved = 797;
  }
}

int inerter_test3_functionODE(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
#if !defined(OMC_MINIMAL_RUNTIME)
  if (measure_time_flag) rt_tick(SIM_TIMER_FUNCTION_ODE);
#endif

  
  data->simulationInfo->callStatistics.functionODE++;
  
  inerter_test3_functionLocalKnownVars(data, threadData);
  functionODE_system0(data, threadData);

#if !defined(OMC_MINIMAL_RUNTIME)
  if (measure_time_flag) rt_accumulate(SIM_TIMER_FUNCTION_ODE);
#endif

  TRACE_POP
  return 0;
}

/* forward the main in the simulation runtime */
extern int _main_SimulationRuntime(int argc, char**argv, DATA *data, threadData_t *threadData);

#include "inerter_test3_12jac.h"
#include "inerter_test3_13opt.h"

struct OpenModelicaGeneratedFunctionCallbacks inerter_test3_callback = {
   NULL,    /* performSimulation */
   NULL,    /* performQSSSimulation */
   NULL,    /* updateContinuousSystem */
   inerter_test3_callExternalObjectDestructors,    /* callExternalObjectDestructors */
   NULL,    /* initialNonLinearSystem */
   inerter_test3_initialLinearSystem,    /* initialLinearSystem */
   NULL,    /* initialMixedSystem */
   #if !defined(OMC_NO_STATESELECTION)
   inerter_test3_initializeStateSets,
   #else
   NULL,
   #endif    /* initializeStateSets */
   inerter_test3_initializeDAEmodeData,
   inerter_test3_functionODE,
   inerter_test3_functionAlgebraics,
   inerter_test3_functionDAE,
   inerter_test3_functionLocalKnownVars,
   inerter_test3_input_function,
   inerter_test3_input_function_init,
   inerter_test3_input_function_updateStartValues,
   inerter_test3_data_function,
   inerter_test3_output_function,
   inerter_test3_setc_function,
   inerter_test3_setb_function,
   inerter_test3_function_storeDelayed,
   inerter_test3_function_storeSpatialDistribution,
   inerter_test3_function_initSpatialDistribution,
   inerter_test3_updateBoundVariableAttributes,
   inerter_test3_functionInitialEquations,
   1, /* useHomotopy - 0: local homotopy (equidistant lambda), 1: global homotopy (equidistant lambda), 2: new global homotopy approach (adaptive lambda), 3: new local homotopy approach (adaptive lambda)*/
   NULL,
   inerter_test3_functionRemovedInitialEquations,
   inerter_test3_updateBoundParameters,
   inerter_test3_checkForAsserts,
   inerter_test3_function_ZeroCrossingsEquations,
   inerter_test3_function_ZeroCrossings,
   inerter_test3_function_updateRelations,
   inerter_test3_zeroCrossingDescription,
   inerter_test3_relationDescription,
   inerter_test3_function_initSample,
   inerter_test3_INDEX_JAC_A,
   inerter_test3_INDEX_JAC_B,
   inerter_test3_INDEX_JAC_C,
   inerter_test3_INDEX_JAC_D,
   inerter_test3_INDEX_JAC_F,
   inerter_test3_INDEX_JAC_H,
   inerter_test3_initialAnalyticJacobianA,
   inerter_test3_initialAnalyticJacobianB,
   inerter_test3_initialAnalyticJacobianC,
   inerter_test3_initialAnalyticJacobianD,
   inerter_test3_initialAnalyticJacobianF,
   inerter_test3_initialAnalyticJacobianH,
   inerter_test3_functionJacA_column,
   inerter_test3_functionJacB_column,
   inerter_test3_functionJacC_column,
   inerter_test3_functionJacD_column,
   inerter_test3_functionJacF_column,
   inerter_test3_functionJacH_column,
   inerter_test3_linear_model_frame,
   inerter_test3_linear_model_datarecovery_frame,
   inerter_test3_mayer,
   inerter_test3_lagrange,
   inerter_test3_pickUpBoundsForInputsInOptimization,
   inerter_test3_setInputData,
   inerter_test3_getTimeGrid,
   inerter_test3_symbolicInlineSystem,
   inerter_test3_function_initSynchronous,
   inerter_test3_function_updateSynchronous,
   inerter_test3_function_equationsSynchronous,
   inerter_test3_inputNames,
   inerter_test3_dataReconciliationInputNames,
   inerter_test3_dataReconciliationUnmeasuredVariables,
   inerter_test3_read_simulation_info,
   inerter_test3_read_input_fmu,
   NULL,
   NULL,
   -1,
   NULL,
   NULL,
   -1

};

#define _OMC_LIT_RESOURCE_0_name_data "Complex"
#define _OMC_LIT_RESOURCE_0_dir_data "C:/Users/thogan1/AppData/Roaming/.openmodelica/libraries/Complex 4.0.0+maint.om"
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_0_name,7,_OMC_LIT_RESOURCE_0_name_data);
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_0_dir,79,_OMC_LIT_RESOURCE_0_dir_data);

#define _OMC_LIT_RESOURCE_1_name_data "Modelica"
#define _OMC_LIT_RESOURCE_1_dir_data "C:/Users/thogan1/AppData/Roaming/.openmodelica/libraries/Modelica 4.0.0+maint.om"
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_1_name,8,_OMC_LIT_RESOURCE_1_name_data);
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_1_dir,80,_OMC_LIT_RESOURCE_1_dir_data);

#define _OMC_LIT_RESOURCE_2_name_data "ModelicaServices"
#define _OMC_LIT_RESOURCE_2_dir_data "C:/Users/thogan1/AppData/Roaming/.openmodelica/libraries/ModelicaServices 4.0.0+maint.om"
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_2_name,16,_OMC_LIT_RESOURCE_2_name_data);
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_2_dir,88,_OMC_LIT_RESOURCE_2_dir_data);

#define _OMC_LIT_RESOURCE_3_name_data "inerter_test3"
#define _OMC_LIT_RESOURCE_3_dir_data "C:/Users/thogan1/OneDrive - University of New Brunswick/Grad Studies/OpenModelica/FMI"
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_3_name,13,_OMC_LIT_RESOURCE_3_name_data);
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_3_dir,85,_OMC_LIT_RESOURCE_3_dir_data);

static const MMC_DEFSTRUCTLIT(_OMC_LIT_RESOURCES,8,MMC_ARRAY_TAG) {MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_0_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_0_dir), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_1_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_1_dir), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_2_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_2_dir), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_3_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_3_dir)}};
void inerter_test3_setupDataStruc(DATA *data, threadData_t *threadData)
{
  assertStreamPrint(threadData,0!=data, "Error while initialize Data");
  threadData->localRoots[LOCAL_ROOT_SIMULATION_DATA] = data;
  data->callback = &inerter_test3_callback;
  OpenModelica_updateUriMapping(threadData, MMC_REFSTRUCTLIT(_OMC_LIT_RESOURCES));
  data->modelData->modelName = "inerter_test3";
  data->modelData->modelFilePrefix = "inerter_test3";
  data->modelData->resultFileName = NULL;
  data->modelData->modelDir = "C:/Users/thogan1/OneDrive - University of New Brunswick/Grad Studies/OpenModelica/FMI";
  data->modelData->modelGUID = "{45cb9b0b-9990-4ca5-b8de-16843af7b527}";
  data->modelData->initXMLData = NULL;
  data->modelData->modelDataXml.infoXMLData = NULL;
  GC_asprintf(&data->modelData->modelDataXml.fileName, "%s/inerter_test3_info.json", data->modelData->resourcesDir);
  data->modelData->runTestsuite = 0;
  data->modelData->nStates = 2;
  data->modelData->nVariablesReal = 679;
  data->modelData->nDiscreteReal = 0;
  data->modelData->nVariablesInteger = 36;
  data->modelData->nVariablesBoolean = 4;
  data->modelData->nVariablesString = 0;
  data->modelData->nParametersReal = 334;
  data->modelData->nParametersInteger = 37;
  data->modelData->nParametersBoolean = 37;
  data->modelData->nParametersString = 23;
  data->modelData->nInputVars = 1;
  data->modelData->nOutputVars = 1;
  data->modelData->nAliasReal = 697;
  data->modelData->nAliasInteger = 36;
  data->modelData->nAliasBoolean = 2;
  data->modelData->nAliasString = 0;
  data->modelData->nZeroCrossings = 0;
  data->modelData->nSamples = 0;
  data->modelData->nRelations = 0;
  data->modelData->nMathEvents = 0;
  data->modelData->nExtObjs = 0;
  data->modelData->modelDataXml.modelInfoXmlLength = 0;
  data->modelData->modelDataXml.nFunctions = 5;
  data->modelData->modelDataXml.nProfileBlocks = 0;
  data->modelData->modelDataXml.nEquations = 1870;
  data->modelData->nMixedSystems = 0;
  data->modelData->nLinearSystems = 2;
  data->modelData->nNonLinearSystems = 0;
  data->modelData->nStateSets = 0;
  data->modelData->nJacobians = 8;
  data->modelData->nOptimizeConstraints = 0;
  data->modelData->nOptimizeFinalConstraints = 0;
  data->modelData->nDelayExpressions = 0;
  data->modelData->nBaseClocks = 0;
  data->modelData->nSpatialDistributions = 0;
  data->modelData->nSensitivityVars = 0;
  data->modelData->nSensitivityParamVars = 0;
  data->modelData->nSetcVars = 0;
  data->modelData->ndataReconVars = 0;
  data->modelData->nSetbVars = 0;
  data->modelData->nRelatedBoundaryConditions = 0;
  data->modelData->linearizationDumpLanguage = OMC_LINEARIZE_DUMP_LANGUAGE_MODELICA;
}

static int rml_execution_failed()
{
  fflush(NULL);
  fprintf(stderr, "Execution failed!\n");
  fflush(NULL);
  return 1;
}

