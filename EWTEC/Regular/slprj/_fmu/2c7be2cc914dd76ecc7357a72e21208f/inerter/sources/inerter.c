/* Main Simulation File */

#if defined(__cplusplus)
extern "C" {
#endif

#include "inerter_model.h"
#include "simulation/solver/events.h"



/* dummy VARINFO and FILEINFO */
const VAR_INFO dummyVAR_INFO = omc_dummyVarInfo;

int inerter_input_function(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  (data->localData[0]->realVars[218] /* u variable */) = data->simulationInfo->inputVars[0];
  
  TRACE_POP
  return 0;
}

int inerter_input_function_init(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  data->simulationInfo->inputVars[0] = data->modelData->realVarsData[218].attribute.start;
  
  TRACE_POP
  return 0;
}

int inerter_input_function_updateStartValues(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  data->modelData->realVarsData[218].attribute.start = data->simulationInfo->inputVars[0];
  
  TRACE_POP
  return 0;
}

int inerter_inputNames(DATA *data, char ** names){
  TRACE_PUSH

  names[0] = (char *) data->modelData->realVarsData[218].info.name;
  
  TRACE_POP
  return 0;
}

int inerter_data_function(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  TRACE_POP
  return 0;
}

int inerter_dataReconciliationInputNames(DATA *data, char ** names){
  TRACE_PUSH

  
  TRACE_POP
  return 0;
}

int inerter_dataReconciliationUnmeasuredVariables(DATA *data, char ** names)
{
  TRACE_PUSH

  
  TRACE_POP
  return 0;
}

int inerter_output_function(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  
  TRACE_POP
  return 0;
}

int inerter_setc_function(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  
  TRACE_POP
  return 0;
}

int inerter_setb_function(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  
  TRACE_POP
  return 0;
}


/*
equation index: 615
type: SIMPLE_ASSIGN
body.frame_a.r_0[2] = 0.0
*/
void inerter_eqFunction_615(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,615};
  (data->localData[0]->realVars[55] /* body.frame_a.r_0[2] DUMMY_STATE */) = 0.0;
  TRACE_POP
}
/*
equation index: 616
type: SIMPLE_ASSIGN
body.frame_a.r_0[1] = 0.0
*/
void inerter_eqFunction_616(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,616};
  (data->localData[0]->realVars[54] /* body.frame_a.r_0[1] DUMMY_STATE */) = 0.0;
  TRACE_POP
}
/*
equation index: 617
type: SIMPLE_ASSIGN
body.v_0[2] = 0.0
*/
void inerter_eqFunction_617(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,617};
  (data->localData[0]->realVars[87] /* body.v_0[2] DUMMY_STATE */) = 0.0;
  TRACE_POP
}
/*
equation index: 618
type: SIMPLE_ASSIGN
body.v_0[1] = 0.0
*/
void inerter_eqFunction_618(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,618};
  (data->localData[0]->realVars[86] /* body.v_0[1] DUMMY_STATE */) = 0.0;
  TRACE_POP
}
/*
equation index: 619
type: SIMPLE_ASSIGN
body.a_0[1] = 0.0
*/
void inerter_eqFunction_619(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,619};
  (data->localData[0]->realVars[28] /* body.a_0[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 620
type: SIMPLE_ASSIGN
body.a_0[2] = 0.0
*/
void inerter_eqFunction_620(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,620};
  (data->localData[0]->realVars[29] /* body.a_0[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 621
type: SIMPLE_ASSIGN
bodyShape.body.frame_a.f[1] = 0.0
*/
void inerter_eqFunction_621(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,621};
  (data->localData[0]->realVars[105] /* bodyShape.body.frame_a.f[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 622
type: SIMPLE_ASSIGN
bodyShape.body.frame_a.f[2] = 0.0
*/
void inerter_eqFunction_622(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,622};
  (data->localData[0]->realVars[106] /* bodyShape.body.frame_a.f[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 623
type: SIMPLE_ASSIGN
bodyShape.body.frame_a.f[3] = 0.0
*/
void inerter_eqFunction_623(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,623};
  (data->localData[0]->realVars[107] /* bodyShape.body.frame_a.f[3] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 624
type: SIMPLE_ASSIGN
bodyShape.body.frame_a.t[1] = 0.0
*/
void inerter_eqFunction_624(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,624};
  (data->localData[0]->realVars[108] /* bodyShape.body.frame_a.t[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 625
type: SIMPLE_ASSIGN
bodyShape.body.frame_a.t[2] = 0.0
*/
void inerter_eqFunction_625(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,625};
  (data->localData[0]->realVars[109] /* bodyShape.body.frame_a.t[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 626
type: SIMPLE_ASSIGN
bodyShape.body.frame_a.t[3] = 0.0
*/
void inerter_eqFunction_626(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,626};
  (data->localData[0]->realVars[110] /* bodyShape.body.frame_a.t[3] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 627
type: SIMPLE_ASSIGN
$DER.body.frame_a.r_0[1] = 0.0
*/
void inerter_eqFunction_627(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,627};
  (data->localData[0]->realVars[4] /* der(body.frame_a.r_0[1]) DUMMY_DER */) = 0.0;
  TRACE_POP
}
/*
equation index: 628
type: SIMPLE_ASSIGN
$DER.body.frame_a.r_0[2] = 0.0
*/
void inerter_eqFunction_628(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,628};
  (data->localData[0]->realVars[5] /* der(body.frame_a.r_0[2]) DUMMY_DER */) = 0.0;
  TRACE_POP
}
/*
equation index: 629
type: SIMPLE_ASSIGN
$DER.body.v_0[1] = 0.0
*/
void inerter_eqFunction_629(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,629};
  (data->localData[0]->realVars[7] /* der(body.v_0[1]) DUMMY_DER */) = 0.0;
  TRACE_POP
}
/*
equation index: 630
type: SIMPLE_ASSIGN
$DER.body.v_0[2] = 0.0
*/
void inerter_eqFunction_630(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,630};
  (data->localData[0]->realVars[8] /* der(body.v_0[2]) DUMMY_DER */) = 0.0;
  TRACE_POP
}
/*
equation index: 631
type: SIMPLE_ASSIGN
$DER.body.frame_a.r_0[3] = prismatic.v
*/
void inerter_eqFunction_631(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,631};
  (data->localData[0]->realVars[6] /* der(body.frame_a.r_0[3]) DUMMY_DER */) = (data->localData[0]->realVars[1] /* prismatic.v STATE(1,body.a_0[3]) */);
  TRACE_POP
}
/*
equation index: 632
type: SIMPLE_ASSIGN
$DER.springDamper.s_rel = prismatic.v
*/
void inerter_eqFunction_632(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,632};
  (data->localData[0]->realVars[20] /* der(springDamper.s_rel) DUMMY_DER */) = (data->localData[0]->realVars[1] /* prismatic.v STATE(1,body.a_0[3]) */);
  TRACE_POP
}
/*
equation index: 633
type: SIMPLE_ASSIGN
$DER.position.s = prismatic.v
*/
void inerter_eqFunction_633(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,633};
  (data->localData[0]->realVars[13] /* der(position.s) DUMMY_DER */) = (data->localData[0]->realVars[1] /* prismatic.v STATE(1,body.a_0[3]) */);
  TRACE_POP
}
/*
equation index: 634
type: SIMPLE_ASSIGN
position.s_ref = u
*/
void inerter_eqFunction_634(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,634};
  (data->localData[0]->realVars[169] /* position.s_ref variable */) = (data->localData[0]->realVars[218] /* u variable */);
  TRACE_POP
}
/*
equation index: 635
type: SIMPLE_ASSIGN
body.v_0[3] = prismatic.v
*/
void inerter_eqFunction_635(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,635};
  (data->localData[0]->realVars[88] /* body.v_0[3] DUMMY_STATE */) = (data->localData[0]->realVars[1] /* prismatic.v STATE(1,body.a_0[3]) */);
  TRACE_POP
}
/*
equation index: 636
type: SIMPLE_ASSIGN
position.v = prismatic.v
*/
void inerter_eqFunction_636(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,636};
  (data->localData[0]->realVars[171] /* position.v DUMMY_STATE */) = (data->localData[0]->realVars[1] /* prismatic.v STATE(1,body.a_0[3]) */);
  TRACE_POP
}
/*
equation index: 637
type: SIMPLE_ASSIGN
springDamper.v_rel = prismatic.v
*/
void inerter_eqFunction_637(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,637};
  (data->localData[0]->realVars[217] /* springDamper.v_rel DUMMY_STATE */) = (data->localData[0]->realVars[1] /* prismatic.v STATE(1,body.a_0[3]) */);
  TRACE_POP
}
/*
equation index: 638
type: SIMPLE_ASSIGN
body.frame_a.r_0[3] = prismatic.s
*/
void inerter_eqFunction_638(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,638};
  (data->localData[0]->realVars[56] /* body.frame_a.r_0[3] DUMMY_STATE */) = (data->localData[0]->realVars[0] /* prismatic.s STATE(1,prismatic.v) */);
  TRACE_POP
}
/*
equation index: 639
type: SIMPLE_ASSIGN
prismatic.box.length = if noEvent(abs(prismatic.s) > 1e-6) then prismatic.s else 1e-6
*/
void inerter_eqFunction_639(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,639};
  modelica_boolean tmp0;
  tmp0 = Greater(fabs((data->localData[0]->realVars[0] /* prismatic.s STATE(1,prismatic.v) */)),1e-6);
  (data->localData[0]->realVars[177] /* prismatic.box.length variable */) = (tmp0?(data->localData[0]->realVars[0] /* prismatic.s STATE(1,prismatic.v) */):1e-6);
  TRACE_POP
}
/*
equation index: 640
type: SIMPLE_ASSIGN
springDamper.f_d = springDamper.d * prismatic.v
*/
void inerter_eqFunction_640(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,640};
  (data->localData[0]->realVars[214] /* springDamper.f_d variable */) = ((data->simulationInfo->realParameter[230] /* springDamper.d PARAM */)) * ((data->localData[0]->realVars[1] /* prismatic.v STATE(1,body.a_0[3]) */));
  TRACE_POP
}
/*
equation index: 641
type: SIMPLE_ASSIGN
springDamper.lossPower = springDamper.f_d * prismatic.v
*/
void inerter_eqFunction_641(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,641};
  (data->localData[0]->realVars[215] /* springDamper.lossPower variable */) = ((data->localData[0]->realVars[214] /* springDamper.f_d variable */)) * ((data->localData[0]->realVars[1] /* prismatic.v STATE(1,body.a_0[3]) */));
  TRACE_POP
}
/*
equation index: 642
type: SIMPLE_ASSIGN
$DER.prismatic.s = prismatic.v
*/
void inerter_eqFunction_642(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,642};
  (data->localData[0]->realVars[2] /* der(prismatic.s) STATE_DER */) = (data->localData[0]->realVars[1] /* prismatic.v STATE(1,body.a_0[3]) */);
  TRACE_POP
}
/*
equation index: 643
type: SIMPLE_ASSIGN
revolute.w = idealGearR2T.ratio * prismatic.v
*/
void inerter_eqFunction_643(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,643};
  (data->localData[0]->realVars[211] /* revolute.w DUMMY_STATE */) = ((data->simulationInfo->realParameter[185] /* idealGearR2T.ratio PARAM */)) * ((data->localData[0]->realVars[1] /* prismatic.v STATE(1,body.a_0[3]) */));
  TRACE_POP
}
/*
equation index: 644
type: SIMPLE_ASSIGN
body.w_a[3] = revolute.e[3] * revolute.w
*/
void inerter_eqFunction_644(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,644};
  (data->localData[0]->realVars[91] /* body.w_a[3] DUMMY_STATE */) = ((data->simulationInfo->realParameter[221] /* revolute.e[3] PARAM */)) * ((data->localData[0]->realVars[211] /* revolute.w DUMMY_STATE */));
  TRACE_POP
}
/*
equation index: 645
type: SIMPLE_ASSIGN
revolute.R_rel.w[3] = body.w_a[3]
*/
void inerter_eqFunction_645(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,645};
  (data->localData[0]->realVars[194] /* revolute.R_rel.w[3] DUMMY_STATE */) = (data->localData[0]->realVars[91] /* body.w_a[3] DUMMY_STATE */);
  TRACE_POP
}
/*
equation index: 646
type: SIMPLE_ASSIGN
body.w_a[2] = revolute.e[2] * revolute.w
*/
void inerter_eqFunction_646(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,646};
  (data->localData[0]->realVars[90] /* body.w_a[2] DUMMY_STATE */) = ((data->simulationInfo->realParameter[220] /* revolute.e[2] PARAM */)) * ((data->localData[0]->realVars[211] /* revolute.w DUMMY_STATE */));
  TRACE_POP
}
/*
equation index: 647
type: SIMPLE_ASSIGN
revolute.R_rel.w[2] = body.w_a[2]
*/
void inerter_eqFunction_647(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,647};
  (data->localData[0]->realVars[193] /* revolute.R_rel.w[2] DUMMY_STATE */) = (data->localData[0]->realVars[90] /* body.w_a[2] DUMMY_STATE */);
  TRACE_POP
}
/*
equation index: 648
type: SIMPLE_ASSIGN
body.w_a[1] = revolute.e[1] * revolute.w
*/
void inerter_eqFunction_648(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,648};
  (data->localData[0]->realVars[89] /* body.w_a[1] DUMMY_STATE */) = ((data->simulationInfo->realParameter[219] /* revolute.e[1] PARAM */)) * ((data->localData[0]->realVars[211] /* revolute.w DUMMY_STATE */));
  TRACE_POP
}
/*
equation index: 649
type: SIMPLE_ASSIGN
revolute.R_rel.w[1] = body.w_a[1]
*/
void inerter_eqFunction_649(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,649};
  (data->localData[0]->realVars[192] /* revolute.R_rel.w[1] DUMMY_STATE */) = (data->localData[0]->realVars[89] /* body.w_a[1] DUMMY_STATE */);
  TRACE_POP
}
/*
equation index: 650
type: SIMPLE_ASSIGN
$DER.revolute.phi = revolute.w
*/
void inerter_eqFunction_650(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,650};
  (data->localData[0]->realVars[18] /* der(revolute.phi) DUMMY_DER */) = (data->localData[0]->realVars[211] /* revolute.w DUMMY_STATE */);
  TRACE_POP
}
/*
equation index: 651
type: SIMPLE_ASSIGN
revolute.phi = idealGearR2T.ratio * (prismatic.s - idealGearR2T.fixedT.s0) + idealGearR2T.fixedR.phi0
*/
void inerter_eqFunction_651(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,651};
  (data->localData[0]->realVars[208] /* revolute.phi DUMMY_STATE */) = ((data->simulationInfo->realParameter[185] /* idealGearR2T.ratio PARAM */)) * ((data->localData[0]->realVars[0] /* prismatic.s STATE(1,prismatic.v) */) - (data->simulationInfo->realParameter[180] /* idealGearR2T.fixedT.s0 PARAM */)) + (data->simulationInfo->realParameter[178] /* idealGearR2T.fixedR.phi0 PARAM */);
  TRACE_POP
}
/*
equation index: 652
type: SIMPLE_ASSIGN
$cse2 = sin(revolute.phi)
*/
void inerter_eqFunction_652(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,652};
  (data->localData[0]->realVars[23] /* $cse2 variable */) = sin((data->localData[0]->realVars[208] /* revolute.phi DUMMY_STATE */));
  TRACE_POP
}
/*
equation index: 653
type: SIMPLE_ASSIGN
$cse1 = cos(revolute.phi)
*/
void inerter_eqFunction_653(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,653};
  (data->localData[0]->realVars[22] /* $cse1 variable */) = cos((data->localData[0]->realVars[208] /* revolute.phi DUMMY_STATE */));
  TRACE_POP
}
/*
equation index: 654
type: SIMPLE_ASSIGN
body.frame_a.R.T[1,1] = revolute.e[1] ^ 2.0 + (1.0 - revolute.e[1] ^ 2.0) * $cse1
*/
void inerter_eqFunction_654(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,654};
  modelica_real tmp1;
  modelica_real tmp2;
  tmp1 = (data->simulationInfo->realParameter[219] /* revolute.e[1] PARAM */);
  tmp2 = (data->simulationInfo->realParameter[219] /* revolute.e[1] PARAM */);
  (data->localData[0]->realVars[42] /* body.frame_a.R.T[1,1] variable */) = (tmp1 * tmp1) + (1.0 - ((tmp2 * tmp2))) * ((data->localData[0]->realVars[22] /* $cse1 variable */));
  TRACE_POP
}
/*
equation index: 655
type: SIMPLE_ASSIGN
body.frame_a.R.T[1,2] = (revolute.e[1] - revolute.e[1] * $cse1) * revolute.e[2] + revolute.e[3] * $cse2
*/
void inerter_eqFunction_655(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,655};
  (data->localData[0]->realVars[43] /* body.frame_a.R.T[1,2] variable */) = ((data->simulationInfo->realParameter[219] /* revolute.e[1] PARAM */) - (((data->simulationInfo->realParameter[219] /* revolute.e[1] PARAM */)) * ((data->localData[0]->realVars[22] /* $cse1 variable */)))) * ((data->simulationInfo->realParameter[220] /* revolute.e[2] PARAM */)) + ((data->simulationInfo->realParameter[221] /* revolute.e[3] PARAM */)) * ((data->localData[0]->realVars[23] /* $cse2 variable */));
  TRACE_POP
}
/*
equation index: 656
type: SIMPLE_ASSIGN
body.frame_a.R.T[1,3] = (revolute.e[1] - revolute.e[1] * $cse1) * revolute.e[3] - revolute.e[2] * $cse2
*/
void inerter_eqFunction_656(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,656};
  (data->localData[0]->realVars[44] /* body.frame_a.R.T[1,3] variable */) = ((data->simulationInfo->realParameter[219] /* revolute.e[1] PARAM */) - (((data->simulationInfo->realParameter[219] /* revolute.e[1] PARAM */)) * ((data->localData[0]->realVars[22] /* $cse1 variable */)))) * ((data->simulationInfo->realParameter[221] /* revolute.e[3] PARAM */)) - (((data->simulationInfo->realParameter[220] /* revolute.e[2] PARAM */)) * ((data->localData[0]->realVars[23] /* $cse2 variable */)));
  TRACE_POP
}
/*
equation index: 657
type: SIMPLE_ASSIGN
body.frame_a.R.T[2,1] = (revolute.e[2] - revolute.e[2] * $cse1) * revolute.e[1] - revolute.e[3] * $cse2
*/
void inerter_eqFunction_657(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,657};
  (data->localData[0]->realVars[45] /* body.frame_a.R.T[2,1] variable */) = ((data->simulationInfo->realParameter[220] /* revolute.e[2] PARAM */) - (((data->simulationInfo->realParameter[220] /* revolute.e[2] PARAM */)) * ((data->localData[0]->realVars[22] /* $cse1 variable */)))) * ((data->simulationInfo->realParameter[219] /* revolute.e[1] PARAM */)) - (((data->simulationInfo->realParameter[221] /* revolute.e[3] PARAM */)) * ((data->localData[0]->realVars[23] /* $cse2 variable */)));
  TRACE_POP
}
/*
equation index: 658
type: SIMPLE_ASSIGN
body.frame_a.R.T[2,2] = revolute.e[2] ^ 2.0 + (1.0 - revolute.e[2] ^ 2.0) * $cse1
*/
void inerter_eqFunction_658(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,658};
  modelica_real tmp3;
  modelica_real tmp4;
  tmp3 = (data->simulationInfo->realParameter[220] /* revolute.e[2] PARAM */);
  tmp4 = (data->simulationInfo->realParameter[220] /* revolute.e[2] PARAM */);
  (data->localData[0]->realVars[46] /* body.frame_a.R.T[2,2] variable */) = (tmp3 * tmp3) + (1.0 - ((tmp4 * tmp4))) * ((data->localData[0]->realVars[22] /* $cse1 variable */));
  TRACE_POP
}
/*
equation index: 659
type: SIMPLE_ASSIGN
body.frame_a.R.T[2,3] = (revolute.e[2] - revolute.e[2] * $cse1) * revolute.e[3] + revolute.e[1] * $cse2
*/
void inerter_eqFunction_659(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,659};
  (data->localData[0]->realVars[47] /* body.frame_a.R.T[2,3] variable */) = ((data->simulationInfo->realParameter[220] /* revolute.e[2] PARAM */) - (((data->simulationInfo->realParameter[220] /* revolute.e[2] PARAM */)) * ((data->localData[0]->realVars[22] /* $cse1 variable */)))) * ((data->simulationInfo->realParameter[221] /* revolute.e[3] PARAM */)) + ((data->simulationInfo->realParameter[219] /* revolute.e[1] PARAM */)) * ((data->localData[0]->realVars[23] /* $cse2 variable */));
  TRACE_POP
}
/*
equation index: 660
type: SIMPLE_ASSIGN
body.frame_a.R.T[3,1] = (revolute.e[3] - revolute.e[3] * $cse1) * revolute.e[1] + revolute.e[2] * $cse2
*/
void inerter_eqFunction_660(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,660};
  (data->localData[0]->realVars[48] /* body.frame_a.R.T[3,1] variable */) = ((data->simulationInfo->realParameter[221] /* revolute.e[3] PARAM */) - (((data->simulationInfo->realParameter[221] /* revolute.e[3] PARAM */)) * ((data->localData[0]->realVars[22] /* $cse1 variable */)))) * ((data->simulationInfo->realParameter[219] /* revolute.e[1] PARAM */)) + ((data->simulationInfo->realParameter[220] /* revolute.e[2] PARAM */)) * ((data->localData[0]->realVars[23] /* $cse2 variable */));
  TRACE_POP
}
/*
equation index: 661
type: SIMPLE_ASSIGN
body.frame_a.R.T[3,2] = (revolute.e[3] - revolute.e[3] * $cse1) * revolute.e[2] - revolute.e[1] * $cse2
*/
void inerter_eqFunction_661(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,661};
  (data->localData[0]->realVars[49] /* body.frame_a.R.T[3,2] variable */) = ((data->simulationInfo->realParameter[221] /* revolute.e[3] PARAM */) - (((data->simulationInfo->realParameter[221] /* revolute.e[3] PARAM */)) * ((data->localData[0]->realVars[22] /* $cse1 variable */)))) * ((data->simulationInfo->realParameter[220] /* revolute.e[2] PARAM */)) - (((data->simulationInfo->realParameter[219] /* revolute.e[1] PARAM */)) * ((data->localData[0]->realVars[23] /* $cse2 variable */)));
  TRACE_POP
}
/*
equation index: 662
type: SIMPLE_ASSIGN
body.frame_a.R.T[3,3] = revolute.e[3] ^ 2.0 + (1.0 - revolute.e[3] ^ 2.0) * $cse1
*/
void inerter_eqFunction_662(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,662};
  modelica_real tmp5;
  modelica_real tmp6;
  tmp5 = (data->simulationInfo->realParameter[221] /* revolute.e[3] PARAM */);
  tmp6 = (data->simulationInfo->realParameter[221] /* revolute.e[3] PARAM */);
  (data->localData[0]->realVars[50] /* body.frame_a.R.T[3,3] variable */) = (tmp5 * tmp5) + (1.0 - ((tmp6 * tmp6))) * ((data->localData[0]->realVars[22] /* $cse1 variable */));
  TRACE_POP
}
/*
equation index: 663
type: SIMPLE_ASSIGN
position.s = prismatic.s - prismatic.fixed.s0
*/
void inerter_eqFunction_663(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,663};
  (data->localData[0]->realVars[168] /* position.s DUMMY_STATE */) = (data->localData[0]->realVars[0] /* prismatic.s STATE(1,prismatic.v) */) - (data->simulationInfo->realParameter[204] /* prismatic.fixed.s0 PARAM */);
  TRACE_POP
}
/*
equation index: 664
type: SIMPLE_ASSIGN
body.a_0[3] = 1.6181229773462784 * ((u - position.s) * position.w_crit + (-1.3617) * prismatic.v) * position.w_crit
*/
void inerter_eqFunction_664(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,664};
  (data->localData[0]->realVars[30] /* body.a_0[3] variable */) = (1.6181229773462784) * ((((data->localData[0]->realVars[218] /* u variable */) - (data->localData[0]->realVars[168] /* position.s DUMMY_STATE */)) * ((data->simulationInfo->realParameter[191] /* position.w_crit PARAM */)) + (-1.3617) * ((data->localData[0]->realVars[1] /* prismatic.v STATE(1,body.a_0[3]) */))) * ((data->simulationInfo->realParameter[191] /* position.w_crit PARAM */)));
  TRACE_POP
}
/*
equation index: 665
type: SIMPLE_ASSIGN
revolute.a = idealGearR2T.ratio * body.a_0[3]
*/
void inerter_eqFunction_665(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,665};
  (data->localData[0]->realVars[195] /* revolute.a variable */) = ((data->simulationInfo->realParameter[185] /* idealGearR2T.ratio PARAM */)) * ((data->localData[0]->realVars[30] /* body.a_0[3] variable */));
  TRACE_POP
}
/*
equation index: 666
type: SIMPLE_ASSIGN
body.z_a[3] = revolute.e[3] * revolute.a
*/
void inerter_eqFunction_666(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,666};
  (data->localData[0]->realVars[94] /* body.z_a[3] variable */) = ((data->simulationInfo->realParameter[221] /* revolute.e[3] PARAM */)) * ((data->localData[0]->realVars[195] /* revolute.a variable */));
  TRACE_POP
}
/*
equation index: 667
type: SIMPLE_ASSIGN
$DER.revolute.R_rel.w[3] = body.z_a[3]
*/
void inerter_eqFunction_667(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,667};
  (data->localData[0]->realVars[17] /* der(revolute.R_rel.w[3]) DUMMY_DER */) = (data->localData[0]->realVars[94] /* body.z_a[3] variable */);
  TRACE_POP
}
/*
equation index: 668
type: SIMPLE_ASSIGN
$DER.body.w_a[3] = body.z_a[3]
*/
void inerter_eqFunction_668(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,668};
  (data->localData[0]->realVars[12] /* der(body.w_a[3]) DUMMY_DER */) = (data->localData[0]->realVars[94] /* body.z_a[3] variable */);
  TRACE_POP
}
/*
equation index: 669
type: SIMPLE_ASSIGN
body.z_a[2] = revolute.e[2] * revolute.a
*/
void inerter_eqFunction_669(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,669};
  (data->localData[0]->realVars[93] /* body.z_a[2] variable */) = ((data->simulationInfo->realParameter[220] /* revolute.e[2] PARAM */)) * ((data->localData[0]->realVars[195] /* revolute.a variable */));
  TRACE_POP
}
/*
equation index: 670
type: SIMPLE_ASSIGN
$DER.revolute.R_rel.w[2] = body.z_a[2]
*/
void inerter_eqFunction_670(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,670};
  (data->localData[0]->realVars[16] /* der(revolute.R_rel.w[2]) DUMMY_DER */) = (data->localData[0]->realVars[93] /* body.z_a[2] variable */);
  TRACE_POP
}
/*
equation index: 671
type: SIMPLE_ASSIGN
$DER.body.w_a[2] = body.z_a[2]
*/
void inerter_eqFunction_671(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,671};
  (data->localData[0]->realVars[11] /* der(body.w_a[2]) DUMMY_DER */) = (data->localData[0]->realVars[93] /* body.z_a[2] variable */);
  TRACE_POP
}
/*
equation index: 672
type: SIMPLE_ASSIGN
body.z_a[1] = revolute.e[1] * revolute.a
*/
void inerter_eqFunction_672(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,672};
  (data->localData[0]->realVars[92] /* body.z_a[1] variable */) = ((data->simulationInfo->realParameter[219] /* revolute.e[1] PARAM */)) * ((data->localData[0]->realVars[195] /* revolute.a variable */));
  TRACE_POP
}
/*
equation index: 673
type: SIMPLE_ASSIGN
$DER.revolute.R_rel.w[1] = body.z_a[1]
*/
void inerter_eqFunction_673(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,673};
  (data->localData[0]->realVars[15] /* der(revolute.R_rel.w[1]) DUMMY_DER */) = (data->localData[0]->realVars[92] /* body.z_a[1] variable */);
  TRACE_POP
}
/*
equation index: 674
type: SIMPLE_ASSIGN
$DER.body.w_a[1] = body.z_a[1]
*/
void inerter_eqFunction_674(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,674};
  (data->localData[0]->realVars[10] /* der(body.w_a[1]) DUMMY_DER */) = (data->localData[0]->realVars[92] /* body.z_a[1] variable */);
  TRACE_POP
}
/*
equation index: 675
type: SIMPLE_ASSIGN
$DER.revolute.w = revolute.a
*/
void inerter_eqFunction_675(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,675};
  (data->localData[0]->realVars[19] /* der(revolute.w) DUMMY_DER */) = (data->localData[0]->realVars[195] /* revolute.a variable */);
  TRACE_POP
}
/*
equation index: 676
type: SIMPLE_ASSIGN
$DER.prismatic.v = body.a_0[3]
*/
void inerter_eqFunction_676(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,676};
  (data->localData[0]->realVars[3] /* der(prismatic.v) STATE_DER */) = (data->localData[0]->realVars[30] /* body.a_0[3] variable */);
  TRACE_POP
}
/*
equation index: 677
type: SIMPLE_ASSIGN
body.frame_a.f[1] = (body.frame_a.R.T[1,3] * body.a_0[3] + body.z_a[2] * body.r_CM[3] + body.w_a[2] * (body.w_a[1] * body.r_CM[2] - body.w_a[2] * body.r_CM[1]) + body.w_a[3] * (body.w_a[1] * body.r_CM[3] - body.w_a[3] * body.r_CM[1]) - body.z_a[3] * body.r_CM[2]) * body.m
*/
void inerter_eqFunction_677(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,677};
  (data->localData[0]->realVars[51] /* body.frame_a.f[1] variable */) = (((data->localData[0]->realVars[44] /* body.frame_a.R.T[1,3] variable */)) * ((data->localData[0]->realVars[30] /* body.a_0[3] variable */)) + ((data->localData[0]->realVars[93] /* body.z_a[2] variable */)) * ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)) + ((data->localData[0]->realVars[90] /* body.w_a[2] DUMMY_STATE */)) * (((data->localData[0]->realVars[89] /* body.w_a[1] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)) - (((data->localData[0]->realVars[90] /* body.w_a[2] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)))) + ((data->localData[0]->realVars[91] /* body.w_a[3] DUMMY_STATE */)) * (((data->localData[0]->realVars[89] /* body.w_a[1] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)) - (((data->localData[0]->realVars[91] /* body.w_a[3] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)))) - (((data->localData[0]->realVars[94] /* body.z_a[3] variable */)) * ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)))) * ((data->simulationInfo->realParameter[43] /* body.m PARAM */));
  TRACE_POP
}
/*
equation index: 678
type: SIMPLE_ASSIGN
body.frame_a.f[2] = (body.frame_a.R.T[2,3] * body.a_0[3] + body.z_a[3] * body.r_CM[1] + body.w_a[3] * (body.w_a[2] * body.r_CM[3] - body.w_a[3] * body.r_CM[2]) + body.w_a[1] * (body.w_a[2] * body.r_CM[1] - body.w_a[1] * body.r_CM[2]) - body.z_a[1] * body.r_CM[3]) * body.m
*/
void inerter_eqFunction_678(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,678};
  (data->localData[0]->realVars[52] /* body.frame_a.f[2] variable */) = (((data->localData[0]->realVars[47] /* body.frame_a.R.T[2,3] variable */)) * ((data->localData[0]->realVars[30] /* body.a_0[3] variable */)) + ((data->localData[0]->realVars[94] /* body.z_a[3] variable */)) * ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)) + ((data->localData[0]->realVars[91] /* body.w_a[3] DUMMY_STATE */)) * (((data->localData[0]->realVars[90] /* body.w_a[2] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)) - (((data->localData[0]->realVars[91] /* body.w_a[3] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)))) + ((data->localData[0]->realVars[89] /* body.w_a[1] DUMMY_STATE */)) * (((data->localData[0]->realVars[90] /* body.w_a[2] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)) - (((data->localData[0]->realVars[89] /* body.w_a[1] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)))) - (((data->localData[0]->realVars[92] /* body.z_a[1] variable */)) * ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)))) * ((data->simulationInfo->realParameter[43] /* body.m PARAM */));
  TRACE_POP
}
/*
equation index: 679
type: SIMPLE_ASSIGN
body.frame_a.t[3] = body.I[3,1] * body.z_a[1] + body.I[3,2] * body.z_a[2] + body.I[3,3] * body.z_a[3] + body.w_a[1] * (body.I[2,1] * body.w_a[1] + body.I[2,2] * body.w_a[2] + body.I[2,3] * body.w_a[3]) + body.r_CM[1] * body.frame_a.f[2] - body.r_CM[2] * body.frame_a.f[1] - body.w_a[2] * (body.I[1,1] * body.w_a[1] + body.I[1,2] * body.w_a[2] + body.I[1,3] * body.w_a[3])
*/
void inerter_eqFunction_679(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,679};
  (data->localData[0]->realVars[59] /* body.frame_a.t[3] variable */) = ((data->simulationInfo->realParameter[8] /* body.I[3,1] PARAM */)) * ((data->localData[0]->realVars[92] /* body.z_a[1] variable */)) + ((data->simulationInfo->realParameter[9] /* body.I[3,2] PARAM */)) * ((data->localData[0]->realVars[93] /* body.z_a[2] variable */)) + ((data->simulationInfo->realParameter[10] /* body.I[3,3] PARAM */)) * ((data->localData[0]->realVars[94] /* body.z_a[3] variable */)) + ((data->localData[0]->realVars[89] /* body.w_a[1] DUMMY_STATE */)) * (((data->simulationInfo->realParameter[5] /* body.I[2,1] PARAM */)) * ((data->localData[0]->realVars[89] /* body.w_a[1] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[6] /* body.I[2,2] PARAM */)) * ((data->localData[0]->realVars[90] /* body.w_a[2] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[7] /* body.I[2,3] PARAM */)) * ((data->localData[0]->realVars[91] /* body.w_a[3] DUMMY_STATE */))) + ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)) * ((data->localData[0]->realVars[52] /* body.frame_a.f[2] variable */)) - (((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)) * ((data->localData[0]->realVars[51] /* body.frame_a.f[1] variable */))) - (((data->localData[0]->realVars[90] /* body.w_a[2] DUMMY_STATE */)) * (((data->simulationInfo->realParameter[2] /* body.I[1,1] PARAM */)) * ((data->localData[0]->realVars[89] /* body.w_a[1] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[3] /* body.I[1,2] PARAM */)) * ((data->localData[0]->realVars[90] /* body.w_a[2] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[4] /* body.I[1,3] PARAM */)) * ((data->localData[0]->realVars[91] /* body.w_a[3] DUMMY_STATE */))));
  TRACE_POP
}
/*
equation index: 680
type: SIMPLE_ASSIGN
body.frame_a.f[3] = (body.frame_a.R.T[3,3] * body.a_0[3] + body.z_a[1] * body.r_CM[2] + body.w_a[1] * (body.w_a[3] * body.r_CM[1] - body.w_a[1] * body.r_CM[3]) + body.w_a[2] * (body.w_a[3] * body.r_CM[2] - body.w_a[2] * body.r_CM[3]) - body.z_a[2] * body.r_CM[1]) * body.m
*/
void inerter_eqFunction_680(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,680};
  (data->localData[0]->realVars[53] /* body.frame_a.f[3] variable */) = (((data->localData[0]->realVars[50] /* body.frame_a.R.T[3,3] variable */)) * ((data->localData[0]->realVars[30] /* body.a_0[3] variable */)) + ((data->localData[0]->realVars[92] /* body.z_a[1] variable */)) * ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)) + ((data->localData[0]->realVars[89] /* body.w_a[1] DUMMY_STATE */)) * (((data->localData[0]->realVars[91] /* body.w_a[3] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)) - (((data->localData[0]->realVars[89] /* body.w_a[1] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)))) + ((data->localData[0]->realVars[90] /* body.w_a[2] DUMMY_STATE */)) * (((data->localData[0]->realVars[91] /* body.w_a[3] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)) - (((data->localData[0]->realVars[90] /* body.w_a[2] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)))) - (((data->localData[0]->realVars[93] /* body.z_a[2] variable */)) * ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)))) * ((data->simulationInfo->realParameter[43] /* body.m PARAM */));
  TRACE_POP
}
/*
equation index: 681
type: SIMPLE_ASSIGN
prismatic.f = body.frame_a.R.T[3,3] * body.frame_a.f[3] + body.frame_a.R.T[1,3] * body.frame_a.f[1] + body.frame_a.R.T[2,3] * body.frame_a.f[2]
*/
void inerter_eqFunction_681(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,681};
  (data->localData[0]->realVars[187] /* prismatic.f variable */) = ((data->localData[0]->realVars[50] /* body.frame_a.R.T[3,3] variable */)) * ((data->localData[0]->realVars[53] /* body.frame_a.f[3] variable */)) + ((data->localData[0]->realVars[44] /* body.frame_a.R.T[1,3] variable */)) * ((data->localData[0]->realVars[51] /* body.frame_a.f[1] variable */)) + ((data->localData[0]->realVars[47] /* body.frame_a.R.T[2,3] variable */)) * ((data->localData[0]->realVars[52] /* body.frame_a.f[2] variable */));
  TRACE_POP
}
/*
equation index: 682
type: SIMPLE_ASSIGN
bodyShape.frame_a.f[3] = prismatic.f
*/
void inerter_eqFunction_682(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,682};
  (data->localData[0]->realVars[131] /* bodyShape.frame_a.f[3] variable */) = (data->localData[0]->realVars[187] /* prismatic.f variable */);
  TRACE_POP
}
/*
equation index: 683
type: SIMPLE_ASSIGN
bodyShape.frame_b.f[2] = (-body.frame_a.R.T[1,2]) * body.frame_a.f[1] - body.frame_a.R.T[2,2] * body.frame_a.f[2] - body.frame_a.R.T[3,2] * body.frame_a.f[3]
*/
void inerter_eqFunction_683(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,683};
  (data->localData[0]->realVars[136] /* bodyShape.frame_b.f[2] variable */) = ((-(data->localData[0]->realVars[43] /* body.frame_a.R.T[1,2] variable */))) * ((data->localData[0]->realVars[51] /* body.frame_a.f[1] variable */)) - (((data->localData[0]->realVars[46] /* body.frame_a.R.T[2,2] variable */)) * ((data->localData[0]->realVars[52] /* body.frame_a.f[2] variable */))) - (((data->localData[0]->realVars[49] /* body.frame_a.R.T[3,2] variable */)) * ((data->localData[0]->realVars[53] /* body.frame_a.f[3] variable */)));
  TRACE_POP
}
/*
equation index: 684
type: SIMPLE_ASSIGN
bodyShape.frame_a.f[2] = -bodyShape.frame_b.f[2]
*/
void inerter_eqFunction_684(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,684};
  (data->localData[0]->realVars[130] /* bodyShape.frame_a.f[2] variable */) = (-(data->localData[0]->realVars[136] /* bodyShape.frame_b.f[2] variable */));
  TRACE_POP
}
/*
equation index: 685
type: SIMPLE_ASSIGN
bodyShape.frame_b.f[1] = (-body.frame_a.R.T[1,1]) * body.frame_a.f[1] - body.frame_a.R.T[2,1] * body.frame_a.f[2] - body.frame_a.R.T[3,1] * body.frame_a.f[3]
*/
void inerter_eqFunction_685(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,685};
  (data->localData[0]->realVars[135] /* bodyShape.frame_b.f[1] variable */) = ((-(data->localData[0]->realVars[42] /* body.frame_a.R.T[1,1] variable */))) * ((data->localData[0]->realVars[51] /* body.frame_a.f[1] variable */)) - (((data->localData[0]->realVars[45] /* body.frame_a.R.T[2,1] variable */)) * ((data->localData[0]->realVars[52] /* body.frame_a.f[2] variable */))) - (((data->localData[0]->realVars[48] /* body.frame_a.R.T[3,1] variable */)) * ((data->localData[0]->realVars[53] /* body.frame_a.f[3] variable */)));
  TRACE_POP
}
/*
equation index: 686
type: SIMPLE_ASSIGN
bodyShape.frame_a.f[1] = -bodyShape.frame_b.f[1]
*/
void inerter_eqFunction_686(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,686};
  (data->localData[0]->realVars[129] /* bodyShape.frame_a.f[1] variable */) = (-(data->localData[0]->realVars[135] /* bodyShape.frame_b.f[1] variable */));
  TRACE_POP
}
/*
equation index: 687
type: SIMPLE_ASSIGN
body.frame_a.t[1] = body.I[1,1] * body.z_a[1] + body.I[1,2] * body.z_a[2] + body.I[1,3] * body.z_a[3] + body.w_a[2] * (body.I[3,1] * body.w_a[1] + body.I[3,2] * body.w_a[2] + body.I[3,3] * body.w_a[3]) + body.r_CM[2] * body.frame_a.f[3] - body.r_CM[3] * body.frame_a.f[2] - body.w_a[3] * (body.I[2,1] * body.w_a[1] + body.I[2,2] * body.w_a[2] + body.I[2,3] * body.w_a[3])
*/
void inerter_eqFunction_687(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,687};
  (data->localData[0]->realVars[57] /* body.frame_a.t[1] variable */) = ((data->simulationInfo->realParameter[2] /* body.I[1,1] PARAM */)) * ((data->localData[0]->realVars[92] /* body.z_a[1] variable */)) + ((data->simulationInfo->realParameter[3] /* body.I[1,2] PARAM */)) * ((data->localData[0]->realVars[93] /* body.z_a[2] variable */)) + ((data->simulationInfo->realParameter[4] /* body.I[1,3] PARAM */)) * ((data->localData[0]->realVars[94] /* body.z_a[3] variable */)) + ((data->localData[0]->realVars[90] /* body.w_a[2] DUMMY_STATE */)) * (((data->simulationInfo->realParameter[8] /* body.I[3,1] PARAM */)) * ((data->localData[0]->realVars[89] /* body.w_a[1] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[9] /* body.I[3,2] PARAM */)) * ((data->localData[0]->realVars[90] /* body.w_a[2] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[10] /* body.I[3,3] PARAM */)) * ((data->localData[0]->realVars[91] /* body.w_a[3] DUMMY_STATE */))) + ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)) * ((data->localData[0]->realVars[53] /* body.frame_a.f[3] variable */)) - (((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)) * ((data->localData[0]->realVars[52] /* body.frame_a.f[2] variable */))) - (((data->localData[0]->realVars[91] /* body.w_a[3] DUMMY_STATE */)) * (((data->simulationInfo->realParameter[5] /* body.I[2,1] PARAM */)) * ((data->localData[0]->realVars[89] /* body.w_a[1] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[6] /* body.I[2,2] PARAM */)) * ((data->localData[0]->realVars[90] /* body.w_a[2] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[7] /* body.I[2,3] PARAM */)) * ((data->localData[0]->realVars[91] /* body.w_a[3] DUMMY_STATE */))));
  TRACE_POP
}
/*
equation index: 688
type: SIMPLE_ASSIGN
body.frame_a.t[2] = body.I[2,1] * body.z_a[1] + body.I[2,2] * body.z_a[2] + body.I[2,3] * body.z_a[3] + body.w_a[3] * (body.I[1,1] * body.w_a[1] + body.I[1,2] * body.w_a[2] + body.I[1,3] * body.w_a[3]) + body.r_CM[3] * body.frame_a.f[1] - body.r_CM[1] * body.frame_a.f[3] - body.w_a[1] * (body.I[3,1] * body.w_a[1] + body.I[3,2] * body.w_a[2] + body.I[3,3] * body.w_a[3])
*/
void inerter_eqFunction_688(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,688};
  (data->localData[0]->realVars[58] /* body.frame_a.t[2] variable */) = ((data->simulationInfo->realParameter[5] /* body.I[2,1] PARAM */)) * ((data->localData[0]->realVars[92] /* body.z_a[1] variable */)) + ((data->simulationInfo->realParameter[6] /* body.I[2,2] PARAM */)) * ((data->localData[0]->realVars[93] /* body.z_a[2] variable */)) + ((data->simulationInfo->realParameter[7] /* body.I[2,3] PARAM */)) * ((data->localData[0]->realVars[94] /* body.z_a[3] variable */)) + ((data->localData[0]->realVars[91] /* body.w_a[3] DUMMY_STATE */)) * (((data->simulationInfo->realParameter[2] /* body.I[1,1] PARAM */)) * ((data->localData[0]->realVars[89] /* body.w_a[1] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[3] /* body.I[1,2] PARAM */)) * ((data->localData[0]->realVars[90] /* body.w_a[2] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[4] /* body.I[1,3] PARAM */)) * ((data->localData[0]->realVars[91] /* body.w_a[3] DUMMY_STATE */))) + ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)) * ((data->localData[0]->realVars[51] /* body.frame_a.f[1] variable */)) - (((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)) * ((data->localData[0]->realVars[53] /* body.frame_a.f[3] variable */))) - (((data->localData[0]->realVars[89] /* body.w_a[1] DUMMY_STATE */)) * (((data->simulationInfo->realParameter[8] /* body.I[3,1] PARAM */)) * ((data->localData[0]->realVars[89] /* body.w_a[1] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[9] /* body.I[3,2] PARAM */)) * ((data->localData[0]->realVars[90] /* body.w_a[2] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[10] /* body.I[3,3] PARAM */)) * ((data->localData[0]->realVars[91] /* body.w_a[3] DUMMY_STATE */))));
  TRACE_POP
}
/*
equation index: 689
type: SIMPLE_ASSIGN
revolute.tau = body.frame_a.t[2] * revolute.e[2] + body.frame_a.t[3] * revolute.e[3] + body.frame_a.t[1] * revolute.e[1]
*/
void inerter_eqFunction_689(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,689};
  (data->localData[0]->realVars[210] /* revolute.tau variable */) = ((data->localData[0]->realVars[58] /* body.frame_a.t[2] variable */)) * ((data->simulationInfo->realParameter[220] /* revolute.e[2] PARAM */)) + ((data->localData[0]->realVars[59] /* body.frame_a.t[3] variable */)) * ((data->simulationInfo->realParameter[221] /* revolute.e[3] PARAM */)) + ((data->localData[0]->realVars[57] /* body.frame_a.t[1] variable */)) * ((data->simulationInfo->realParameter[219] /* revolute.e[1] PARAM */));
  TRACE_POP
}
/*
equation index: 690
type: SIMPLE_ASSIGN
idealGearR2T.flangeT.f = idealGearR2T.ratio * revolute.tau
*/
void inerter_eqFunction_690(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,690};
  (data->localData[0]->realVars[166] /* idealGearR2T.flangeT.f variable */) = ((data->simulationInfo->realParameter[185] /* idealGearR2T.ratio PARAM */)) * ((data->localData[0]->realVars[210] /* revolute.tau variable */));
  TRACE_POP
}
/*
equation index: 691
type: SIMPLE_ASSIGN
prismatic.support.f = (-idealGearR2T.flangeT.f) - prismatic.f
*/
void inerter_eqFunction_691(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,691};
  (data->localData[0]->realVars[191] /* prismatic.support.f variable */) = (-(data->localData[0]->realVars[166] /* idealGearR2T.flangeT.f variable */)) - (data->localData[0]->realVars[187] /* prismatic.f variable */);
  TRACE_POP
}
/*
equation index: 692
type: SIMPLE_ASSIGN
bodyShape.frame_b.t[3] = (-body.frame_a.R.T[1,3]) * body.frame_a.t[1] - body.frame_a.R.T[2,3] * body.frame_a.t[2] - body.frame_a.R.T[3,3] * body.frame_a.t[3]
*/
void inerter_eqFunction_692(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,692};
  (data->localData[0]->realVars[139] /* bodyShape.frame_b.t[3] variable */) = ((-(data->localData[0]->realVars[44] /* body.frame_a.R.T[1,3] variable */))) * ((data->localData[0]->realVars[57] /* body.frame_a.t[1] variable */)) - (((data->localData[0]->realVars[47] /* body.frame_a.R.T[2,3] variable */)) * ((data->localData[0]->realVars[58] /* body.frame_a.t[2] variable */))) - (((data->localData[0]->realVars[50] /* body.frame_a.R.T[3,3] variable */)) * ((data->localData[0]->realVars[59] /* body.frame_a.t[3] variable */)));
  TRACE_POP
}
/*
equation index: 693
type: SIMPLE_ASSIGN
bodyShape.frame_a.t[3] = -bodyShape.frame_b.t[3]
*/
void inerter_eqFunction_693(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,693};
  (data->localData[0]->realVars[134] /* bodyShape.frame_a.t[3] variable */) = (-(data->localData[0]->realVars[139] /* bodyShape.frame_b.t[3] variable */));
  TRACE_POP
}
/*
equation index: 694
type: SIMPLE_ASSIGN
revolute.frame_a.t[2] = body.frame_a.R.T[3,2] * body.frame_a.t[3] + body.frame_a.R.T[1,2] * body.frame_a.t[1] + body.frame_a.R.T[2,2] * body.frame_a.t[2]
*/
void inerter_eqFunction_694(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,694};
  (data->localData[0]->realVars[207] /* revolute.frame_a.t[2] variable */) = ((data->localData[0]->realVars[49] /* body.frame_a.R.T[3,2] variable */)) * ((data->localData[0]->realVars[59] /* body.frame_a.t[3] variable */)) + ((data->localData[0]->realVars[43] /* body.frame_a.R.T[1,2] variable */)) * ((data->localData[0]->realVars[57] /* body.frame_a.t[1] variable */)) + ((data->localData[0]->realVars[46] /* body.frame_a.R.T[2,2] variable */)) * ((data->localData[0]->realVars[58] /* body.frame_a.t[2] variable */));
  TRACE_POP
}
/*
equation index: 695
type: SIMPLE_ASSIGN
bodyShape.frame_b.t[2] = bodyShape.frame_b.f[1] * prismatic.s - revolute.frame_a.t[2]
*/
void inerter_eqFunction_695(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,695};
  (data->localData[0]->realVars[138] /* bodyShape.frame_b.t[2] variable */) = ((data->localData[0]->realVars[135] /* bodyShape.frame_b.f[1] variable */)) * ((data->localData[0]->realVars[0] /* prismatic.s STATE(1,prismatic.v) */)) - (data->localData[0]->realVars[207] /* revolute.frame_a.t[2] variable */);
  TRACE_POP
}
/*
equation index: 696
type: SIMPLE_ASSIGN
bodyShape.frame_a.t[2] = -bodyShape.frame_b.t[2]
*/
void inerter_eqFunction_696(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,696};
  (data->localData[0]->realVars[133] /* bodyShape.frame_a.t[2] variable */) = (-(data->localData[0]->realVars[138] /* bodyShape.frame_b.t[2] variable */));
  TRACE_POP
}
/*
equation index: 697
type: SIMPLE_ASSIGN
revolute.frame_a.t[1] = body.frame_a.R.T[3,1] * body.frame_a.t[3] + body.frame_a.R.T[1,1] * body.frame_a.t[1] + body.frame_a.R.T[2,1] * body.frame_a.t[2]
*/
void inerter_eqFunction_697(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,697};
  (data->localData[0]->realVars[206] /* revolute.frame_a.t[1] variable */) = ((data->localData[0]->realVars[48] /* body.frame_a.R.T[3,1] variable */)) * ((data->localData[0]->realVars[59] /* body.frame_a.t[3] variable */)) + ((data->localData[0]->realVars[42] /* body.frame_a.R.T[1,1] variable */)) * ((data->localData[0]->realVars[57] /* body.frame_a.t[1] variable */)) + ((data->localData[0]->realVars[45] /* body.frame_a.R.T[2,1] variable */)) * ((data->localData[0]->realVars[58] /* body.frame_a.t[2] variable */));
  TRACE_POP
}
/*
equation index: 698
type: SIMPLE_ASSIGN
bodyShape.frame_b.t[1] = (-bodyShape.frame_b.f[2]) * prismatic.s - revolute.frame_a.t[1]
*/
void inerter_eqFunction_698(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,698};
  (data->localData[0]->realVars[137] /* bodyShape.frame_b.t[1] variable */) = ((-(data->localData[0]->realVars[136] /* bodyShape.frame_b.f[2] variable */))) * ((data->localData[0]->realVars[0] /* prismatic.s STATE(1,prismatic.v) */)) - (data->localData[0]->realVars[206] /* revolute.frame_a.t[1] variable */);
  TRACE_POP
}
/*
equation index: 699
type: SIMPLE_ASSIGN
bodyShape.frame_a.t[1] = -bodyShape.frame_b.t[1]
*/
void inerter_eqFunction_699(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,699};
  (data->localData[0]->realVars[132] /* bodyShape.frame_a.t[1] variable */) = (-(data->localData[0]->realVars[137] /* bodyShape.frame_b.t[1] variable */));
  TRACE_POP
}
/*
equation index: 700
type: SIMPLE_ASSIGN
$DER.position.v = body.a_0[3]
*/
void inerter_eqFunction_700(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,700};
  (data->localData[0]->realVars[14] /* der(position.v) DUMMY_DER */) = (data->localData[0]->realVars[30] /* body.a_0[3] variable */);
  TRACE_POP
}
/*
equation index: 701
type: SIMPLE_ASSIGN
prismatic.a = body.a_0[3]
*/
void inerter_eqFunction_701(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,701};
  (data->localData[0]->realVars[172] /* prismatic.a variable */) = (data->localData[0]->realVars[30] /* body.a_0[3] variable */);
  TRACE_POP
}
/*
equation index: 702
type: SIMPLE_ASSIGN
position.a = body.a_0[3]
*/
void inerter_eqFunction_702(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,702};
  (data->localData[0]->realVars[167] /* position.a variable */) = (data->localData[0]->realVars[30] /* body.a_0[3] variable */);
  TRACE_POP
}
/*
equation index: 703
type: SIMPLE_ASSIGN
$DER.springDamper.v_rel = body.a_0[3]
*/
void inerter_eqFunction_703(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,703};
  (data->localData[0]->realVars[21] /* der(springDamper.v_rel) DUMMY_DER */) = (data->localData[0]->realVars[30] /* body.a_0[3] variable */);
  TRACE_POP
}
/*
equation index: 704
type: SIMPLE_ASSIGN
$DER.body.v_0[3] = body.a_0[3]
*/
void inerter_eqFunction_704(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,704};
  (data->localData[0]->realVars[9] /* der(body.v_0[3]) DUMMY_DER */) = (data->localData[0]->realVars[30] /* body.a_0[3] variable */);
  TRACE_POP
}
/*
equation index: 705
type: SIMPLE_ASSIGN
springDamper.s_rel = prismatic.s - prismatic.fixed.s0
*/
void inerter_eqFunction_705(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,705};
  (data->localData[0]->realVars[216] /* springDamper.s_rel DUMMY_STATE */) = (data->localData[0]->realVars[0] /* prismatic.s STATE(1,prismatic.v) */) - (data->simulationInfo->realParameter[204] /* prismatic.fixed.s0 PARAM */);
  TRACE_POP
}
/*
equation index: 706
type: SIMPLE_ASSIGN
springDamper.f_c = springDamper.c * (springDamper.s_rel - springDamper.s_rel0)
*/
void inerter_eqFunction_706(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,706};
  (data->localData[0]->realVars[213] /* springDamper.f_c variable */) = ((data->simulationInfo->realParameter[229] /* springDamper.c PARAM */)) * ((data->localData[0]->realVars[216] /* springDamper.s_rel DUMMY_STATE */) - (data->simulationInfo->realParameter[233] /* springDamper.s_rel0 PARAM */));
  TRACE_POP
}
/*
equation index: 707
type: SIMPLE_ASSIGN
springDamper.f = springDamper.f_c + springDamper.f_d
*/
void inerter_eqFunction_707(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,707};
  (data->localData[0]->realVars[212] /* springDamper.f variable */) = (data->localData[0]->realVars[213] /* springDamper.f_c variable */) + (data->localData[0]->realVars[214] /* springDamper.f_d variable */);
  TRACE_POP
}
/*
equation index: 708
type: SIMPLE_ASSIGN
position.support.f = springDamper.f + idealGearR2T.flangeT.f + prismatic.f
*/
void inerter_eqFunction_708(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,708};
  (data->localData[0]->realVars[170] /* position.support.f variable */) = (data->localData[0]->realVars[212] /* springDamper.f variable */) + (data->localData[0]->realVars[166] /* idealGearR2T.flangeT.f variable */) + (data->localData[0]->realVars[187] /* prismatic.f variable */);
  TRACE_POP
}
/*
equation index: 709
type: ARRAY_CALL_ASSIGN

world.z_label.R_lines = Modelica.Mechanics.MultiBody.Frames.TransformationMatrices.from_nxy({0.0, 0.0, 1.0}, {0.0, 1.0, 0.0})
*/
void inerter_eqFunction_709(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,709};
  real_array tmp7;
  real_array_create(&tmp7, ((modelica_real*)&((&(data->localData[0]->realVars[545] /* world.z_label.R_lines[1,1] variable */))[(((modelica_integer) 1) - 1) * 3 + (((modelica_integer) 1)-1)])), 2, (_index_t)3, (_index_t)3);
  real_array_copy_data(omc_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_from__nxy(threadData, _OMC_LIT3, _OMC_LIT2), tmp7);
  TRACE_POP
}
/*
equation index: 710
type: SIMPLE_ASSIGN
world.z_label.cylinders[3].r[2] = world.z_label.R_lines[2,2] * world.scaledLabel
*/
void inerter_eqFunction_710(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,710};
  (data->localData[0]->realVars[570] /* world.z_label.cylinders[3].r[2] variable */) = ((data->localData[0]->realVars[549] /* world.z_label.R_lines[2,2] variable */)) * ((data->simulationInfo->realParameter[273] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 711
type: SIMPLE_ASSIGN
world.z_label.cylinders[2].lengthDirection[1] = world.z_label.R_lines[1,1] * world.scaledLabel
*/
void inerter_eqFunction_711(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,711};
  (data->localData[0]->realVars[563] /* world.z_label.cylinders[2].lengthDirection[1] variable */) = ((data->localData[0]->realVars[545] /* world.z_label.R_lines[1,1] variable */)) * ((data->simulationInfo->realParameter[273] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 712
type: SIMPLE_ASSIGN
world.z_label.cylinders[3].r[1] = world.z_label.R_lines[2,1] * world.scaledLabel
*/
void inerter_eqFunction_712(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,712};
  (data->localData[0]->realVars[569] /* world.z_label.cylinders[3].r[1] variable */) = ((data->localData[0]->realVars[548] /* world.z_label.R_lines[2,1] variable */)) * ((data->simulationInfo->realParameter[273] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 713
type: SIMPLE_ASSIGN
world.z_label.cylinders[3].lengthDirection[1] = (world.z_label.R_lines[1,1] - world.z_label.R_lines[2,1]) * world.scaledLabel
*/
void inerter_eqFunction_713(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,713};
  (data->localData[0]->realVars[566] /* world.z_label.cylinders[3].lengthDirection[1] variable */) = ((data->localData[0]->realVars[545] /* world.z_label.R_lines[1,1] variable */) - (data->localData[0]->realVars[548] /* world.z_label.R_lines[2,1] variable */)) * ((data->simulationInfo->realParameter[273] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 714
type: SIMPLE_ASSIGN
world.z_label.cylinders[2].lengthDirection[2] = world.z_label.R_lines[1,2] * world.scaledLabel
*/
void inerter_eqFunction_714(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,714};
  (data->localData[0]->realVars[564] /* world.z_label.cylinders[2].lengthDirection[2] variable */) = ((data->localData[0]->realVars[546] /* world.z_label.R_lines[1,2] variable */)) * ((data->simulationInfo->realParameter[273] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 715
type: SIMPLE_ASSIGN
world.z_label.cylinders[3].lengthDirection[2] = (world.z_label.R_lines[1,2] - world.z_label.R_lines[2,2]) * world.scaledLabel
*/
void inerter_eqFunction_715(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,715};
  (data->localData[0]->realVars[567] /* world.z_label.cylinders[3].lengthDirection[2] variable */) = ((data->localData[0]->realVars[546] /* world.z_label.R_lines[1,2] variable */) - (data->localData[0]->realVars[549] /* world.z_label.R_lines[2,2] variable */)) * ((data->simulationInfo->realParameter[273] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 716
type: SIMPLE_ASSIGN
world.z_label.cylinders[3].r[3] = world.labelStart + world.z_label.R_lines[2,3] * world.scaledLabel
*/
void inerter_eqFunction_716(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,716};
  (data->localData[0]->realVars[571] /* world.z_label.cylinders[3].r[3] variable */) = (data->simulationInfo->realParameter[265] /* world.labelStart PARAM */) + ((data->localData[0]->realVars[550] /* world.z_label.R_lines[2,3] variable */)) * ((data->simulationInfo->realParameter[273] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 717
type: SIMPLE_ASSIGN
world.z_label.cylinders[2].lengthDirection[3] = world.z_label.R_lines[1,3] * world.scaledLabel
*/
void inerter_eqFunction_717(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,717};
  (data->localData[0]->realVars[565] /* world.z_label.cylinders[2].lengthDirection[3] variable */) = ((data->localData[0]->realVars[547] /* world.z_label.R_lines[1,3] variable */)) * ((data->simulationInfo->realParameter[273] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 718
type: SIMPLE_ASSIGN
world.z_label.cylinders[3].lengthDirection[3] = (world.z_label.R_lines[1,3] - world.z_label.R_lines[2,3]) * world.scaledLabel
*/
void inerter_eqFunction_718(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,718};
  (data->localData[0]->realVars[568] /* world.z_label.cylinders[3].lengthDirection[3] variable */) = ((data->localData[0]->realVars[547] /* world.z_label.R_lines[1,3] variable */) - (data->localData[0]->realVars[550] /* world.z_label.R_lines[2,3] variable */)) * ((data->simulationInfo->realParameter[273] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 719
type: ARRAY_CALL_ASSIGN

world.y_label.R_lines = Modelica.Mechanics.MultiBody.Frames.TransformationMatrices.from_nxy({0.0, 1.0, 0.0}, {-1.0, 0.0, 0.0})
*/
void inerter_eqFunction_719(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,719};
  real_array tmp8;
  real_array_create(&tmp8, ((modelica_real*)&((&(data->localData[0]->realVars[421] /* world.y_label.R_lines[1,1] variable */))[(((modelica_integer) 1) - 1) * 3 + (((modelica_integer) 1)-1)])), 2, (_index_t)3, (_index_t)3);
  real_array_copy_data(omc_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_from__nxy(threadData, _OMC_LIT2, _OMC_LIT4), tmp8);
  TRACE_POP
}
/*
equation index: 720
type: SIMPLE_ASSIGN
world.y_label.cylinders[2].r[2] = world.labelStart + world.y_label.R_lines[2,2] * world.y_label.lines[2,1,2]
*/
void inerter_eqFunction_720(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,720};
  (data->localData[0]->realVars[444] /* world.y_label.cylinders[2].r[2] variable */) = (data->simulationInfo->realParameter[265] /* world.labelStart PARAM */) + ((data->localData[0]->realVars[425] /* world.y_label.R_lines[2,2] variable */)) * ((data->localData[0]->realVars[462] /* world.y_label.lines[2,1,2] variable */));
  TRACE_POP
}
/*
equation index: 721
type: SIMPLE_ASSIGN
world.y_label.cylinders[1].lengthDirection[1] = world.y_label.R_lines[1,1] * world.scaledLabel + world.y_label.R_lines[2,1] * world.y_label.lines[1,2,2]
*/
void inerter_eqFunction_721(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,721};
  (data->localData[0]->realVars[437] /* world.y_label.cylinders[1].lengthDirection[1] variable */) = ((data->localData[0]->realVars[421] /* world.y_label.R_lines[1,1] variable */)) * ((data->simulationInfo->realParameter[273] /* world.scaledLabel PARAM */)) + ((data->localData[0]->realVars[424] /* world.y_label.R_lines[2,1] variable */)) * ((data->localData[0]->realVars[460] /* world.y_label.lines[1,2,2] variable */));
  TRACE_POP
}
/*
equation index: 722
type: SIMPLE_ASSIGN
world.y_label.cylinders[2].r[1] = world.y_label.R_lines[2,1] * world.y_label.lines[2,1,2]
*/
void inerter_eqFunction_722(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,722};
  (data->localData[0]->realVars[443] /* world.y_label.cylinders[2].r[1] variable */) = ((data->localData[0]->realVars[424] /* world.y_label.R_lines[2,1] variable */)) * ((data->localData[0]->realVars[462] /* world.y_label.lines[2,1,2] variable */));
  TRACE_POP
}
/*
equation index: 723
type: SIMPLE_ASSIGN
world.y_label.cylinders[2].lengthDirection[1] = world.y_label.R_lines[1,1] * world.y_label.lines[2,2,1] + world.y_label.R_lines[2,1] * (world.y_label.lines[2,2,2] - world.y_label.lines[2,1,2])
*/
void inerter_eqFunction_723(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,723};
  (data->localData[0]->realVars[440] /* world.y_label.cylinders[2].lengthDirection[1] variable */) = ((data->localData[0]->realVars[421] /* world.y_label.R_lines[1,1] variable */)) * ((data->localData[0]->realVars[463] /* world.y_label.lines[2,2,1] variable */)) + ((data->localData[0]->realVars[424] /* world.y_label.R_lines[2,1] variable */)) * ((data->localData[0]->realVars[464] /* world.y_label.lines[2,2,2] variable */) - (data->localData[0]->realVars[462] /* world.y_label.lines[2,1,2] variable */));
  TRACE_POP
}
/*
equation index: 724
type: SIMPLE_ASSIGN
world.y_label.cylinders[1].lengthDirection[2] = world.y_label.R_lines[1,2] * world.scaledLabel + world.y_label.R_lines[2,2] * world.y_label.lines[1,2,2]
*/
void inerter_eqFunction_724(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,724};
  (data->localData[0]->realVars[438] /* world.y_label.cylinders[1].lengthDirection[2] variable */) = ((data->localData[0]->realVars[422] /* world.y_label.R_lines[1,2] variable */)) * ((data->simulationInfo->realParameter[273] /* world.scaledLabel PARAM */)) + ((data->localData[0]->realVars[425] /* world.y_label.R_lines[2,2] variable */)) * ((data->localData[0]->realVars[460] /* world.y_label.lines[1,2,2] variable */));
  TRACE_POP
}
/*
equation index: 725
type: SIMPLE_ASSIGN
world.y_label.cylinders[2].lengthDirection[2] = world.y_label.R_lines[1,2] * world.y_label.lines[2,2,1] + world.y_label.R_lines[2,2] * (world.y_label.lines[2,2,2] - world.y_label.lines[2,1,2])
*/
void inerter_eqFunction_725(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,725};
  (data->localData[0]->realVars[441] /* world.y_label.cylinders[2].lengthDirection[2] variable */) = ((data->localData[0]->realVars[422] /* world.y_label.R_lines[1,2] variable */)) * ((data->localData[0]->realVars[463] /* world.y_label.lines[2,2,1] variable */)) + ((data->localData[0]->realVars[425] /* world.y_label.R_lines[2,2] variable */)) * ((data->localData[0]->realVars[464] /* world.y_label.lines[2,2,2] variable */) - (data->localData[0]->realVars[462] /* world.y_label.lines[2,1,2] variable */));
  TRACE_POP
}
/*
equation index: 726
type: SIMPLE_ASSIGN
world.y_label.cylinders[2].r[3] = world.y_label.R_lines[2,3] * world.y_label.lines[2,1,2]
*/
void inerter_eqFunction_726(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,726};
  (data->localData[0]->realVars[445] /* world.y_label.cylinders[2].r[3] variable */) = ((data->localData[0]->realVars[426] /* world.y_label.R_lines[2,3] variable */)) * ((data->localData[0]->realVars[462] /* world.y_label.lines[2,1,2] variable */));
  TRACE_POP
}
/*
equation index: 727
type: SIMPLE_ASSIGN
world.y_label.cylinders[1].lengthDirection[3] = world.y_label.R_lines[1,3] * world.scaledLabel + world.y_label.R_lines[2,3] * world.y_label.lines[1,2,2]
*/
void inerter_eqFunction_727(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,727};
  (data->localData[0]->realVars[439] /* world.y_label.cylinders[1].lengthDirection[3] variable */) = ((data->localData[0]->realVars[423] /* world.y_label.R_lines[1,3] variable */)) * ((data->simulationInfo->realParameter[273] /* world.scaledLabel PARAM */)) + ((data->localData[0]->realVars[426] /* world.y_label.R_lines[2,3] variable */)) * ((data->localData[0]->realVars[460] /* world.y_label.lines[1,2,2] variable */));
  TRACE_POP
}
/*
equation index: 728
type: SIMPLE_ASSIGN
world.y_label.cylinders[2].lengthDirection[3] = world.y_label.R_lines[1,3] * world.y_label.lines[2,2,1] + world.y_label.R_lines[2,3] * (world.y_label.lines[2,2,2] - world.y_label.lines[2,1,2])
*/
void inerter_eqFunction_728(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,728};
  (data->localData[0]->realVars[442] /* world.y_label.cylinders[2].lengthDirection[3] variable */) = ((data->localData[0]->realVars[423] /* world.y_label.R_lines[1,3] variable */)) * ((data->localData[0]->realVars[463] /* world.y_label.lines[2,2,1] variable */)) + ((data->localData[0]->realVars[426] /* world.y_label.R_lines[2,3] variable */)) * ((data->localData[0]->realVars[464] /* world.y_label.lines[2,2,2] variable */) - (data->localData[0]->realVars[462] /* world.y_label.lines[2,1,2] variable */));
  TRACE_POP
}
/*
equation index: 729
type: ARRAY_CALL_ASSIGN

world.x_label.R_lines = Modelica.Mechanics.MultiBody.Frames.TransformationMatrices.from_nxy({1.0, 0.0, 0.0}, {0.0, 1.0, 0.0})
*/
void inerter_eqFunction_729(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,729};
  real_array tmp9;
  real_array_create(&tmp9, ((modelica_real*)&((&(data->localData[0]->realVars[300] /* world.x_label.R_lines[1,1] variable */))[(((modelica_integer) 1) - 1) * 3 + (((modelica_integer) 1)-1)])), 2, (_index_t)3, (_index_t)3);
  real_array_copy_data(omc_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_from__nxy(threadData, _OMC_LIT1, _OMC_LIT2), tmp9);
  TRACE_POP
}
/*
equation index: 730
type: SIMPLE_ASSIGN
world.x_label.cylinders[2].r[2] = world.x_label.R_lines[2,2] * world.scaledLabel
*/
void inerter_eqFunction_730(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,730};
  (data->localData[0]->realVars[323] /* world.x_label.cylinders[2].r[2] variable */) = ((data->localData[0]->realVars[304] /* world.x_label.R_lines[2,2] variable */)) * ((data->simulationInfo->realParameter[273] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 731
type: SIMPLE_ASSIGN
world.x_label.cylinders[1].lengthDirection[1] = world.scaledLabel * (world.x_label.R_lines[1,1] + world.x_label.R_lines[2,1])
*/
void inerter_eqFunction_731(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,731};
  (data->localData[0]->realVars[316] /* world.x_label.cylinders[1].lengthDirection[1] variable */) = ((data->simulationInfo->realParameter[273] /* world.scaledLabel PARAM */)) * ((data->localData[0]->realVars[300] /* world.x_label.R_lines[1,1] variable */) + (data->localData[0]->realVars[303] /* world.x_label.R_lines[2,1] variable */));
  TRACE_POP
}
/*
equation index: 732
type: SIMPLE_ASSIGN
world.x_label.cylinders[2].r[1] = world.labelStart + world.x_label.R_lines[2,1] * world.scaledLabel
*/
void inerter_eqFunction_732(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,732};
  (data->localData[0]->realVars[322] /* world.x_label.cylinders[2].r[1] variable */) = (data->simulationInfo->realParameter[265] /* world.labelStart PARAM */) + ((data->localData[0]->realVars[303] /* world.x_label.R_lines[2,1] variable */)) * ((data->simulationInfo->realParameter[273] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 733
type: SIMPLE_ASSIGN
world.x_label.cylinders[2].lengthDirection[1] = (world.x_label.R_lines[1,1] - world.x_label.R_lines[2,1]) * world.scaledLabel
*/
void inerter_eqFunction_733(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,733};
  (data->localData[0]->realVars[319] /* world.x_label.cylinders[2].lengthDirection[1] variable */) = ((data->localData[0]->realVars[300] /* world.x_label.R_lines[1,1] variable */) - (data->localData[0]->realVars[303] /* world.x_label.R_lines[2,1] variable */)) * ((data->simulationInfo->realParameter[273] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 734
type: SIMPLE_ASSIGN
world.x_label.cylinders[1].lengthDirection[2] = world.scaledLabel * (world.x_label.R_lines[1,2] + world.x_label.R_lines[2,2])
*/
void inerter_eqFunction_734(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,734};
  (data->localData[0]->realVars[317] /* world.x_label.cylinders[1].lengthDirection[2] variable */) = ((data->simulationInfo->realParameter[273] /* world.scaledLabel PARAM */)) * ((data->localData[0]->realVars[301] /* world.x_label.R_lines[1,2] variable */) + (data->localData[0]->realVars[304] /* world.x_label.R_lines[2,2] variable */));
  TRACE_POP
}
/*
equation index: 735
type: SIMPLE_ASSIGN
world.x_label.cylinders[2].lengthDirection[2] = (world.x_label.R_lines[1,2] - world.x_label.R_lines[2,2]) * world.scaledLabel
*/
void inerter_eqFunction_735(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,735};
  (data->localData[0]->realVars[320] /* world.x_label.cylinders[2].lengthDirection[2] variable */) = ((data->localData[0]->realVars[301] /* world.x_label.R_lines[1,2] variable */) - (data->localData[0]->realVars[304] /* world.x_label.R_lines[2,2] variable */)) * ((data->simulationInfo->realParameter[273] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 736
type: SIMPLE_ASSIGN
world.x_label.cylinders[2].r[3] = world.x_label.R_lines[2,3] * world.scaledLabel
*/
void inerter_eqFunction_736(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,736};
  (data->localData[0]->realVars[324] /* world.x_label.cylinders[2].r[3] variable */) = ((data->localData[0]->realVars[305] /* world.x_label.R_lines[2,3] variable */)) * ((data->simulationInfo->realParameter[273] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 737
type: SIMPLE_ASSIGN
world.x_label.cylinders[1].lengthDirection[3] = world.scaledLabel * (world.x_label.R_lines[1,3] + world.x_label.R_lines[2,3])
*/
void inerter_eqFunction_737(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,737};
  (data->localData[0]->realVars[318] /* world.x_label.cylinders[1].lengthDirection[3] variable */) = ((data->simulationInfo->realParameter[273] /* world.scaledLabel PARAM */)) * ((data->localData[0]->realVars[302] /* world.x_label.R_lines[1,3] variable */) + (data->localData[0]->realVars[305] /* world.x_label.R_lines[2,3] variable */));
  TRACE_POP
}
/*
equation index: 738
type: SIMPLE_ASSIGN
world.x_label.cylinders[2].lengthDirection[3] = (world.x_label.R_lines[1,3] - world.x_label.R_lines[2,3]) * world.scaledLabel
*/
void inerter_eqFunction_738(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,738};
  (data->localData[0]->realVars[321] /* world.x_label.cylinders[2].lengthDirection[3] variable */) = ((data->localData[0]->realVars[302] /* world.x_label.R_lines[1,3] variable */) - (data->localData[0]->realVars[305] /* world.x_label.R_lines[2,3] variable */)) * ((data->simulationInfo->realParameter[273] /* world.scaledLabel PARAM */));
  TRACE_POP
}

OMC_DISABLE_OPT
int inerter_functionDAE(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  int equationIndexes[1] = {0};
#if !defined(OMC_MINIMAL_RUNTIME)
  if (measure_time_flag) rt_tick(SIM_TIMER_DAE);
#endif

  data->simulationInfo->needToIterate = 0;
  data->simulationInfo->discreteCall = 1;
  inerter_functionLocalKnownVars(data, threadData);
  inerter_eqFunction_615(data, threadData);

  inerter_eqFunction_616(data, threadData);

  inerter_eqFunction_617(data, threadData);

  inerter_eqFunction_618(data, threadData);

  inerter_eqFunction_619(data, threadData);

  inerter_eqFunction_620(data, threadData);

  inerter_eqFunction_621(data, threadData);

  inerter_eqFunction_622(data, threadData);

  inerter_eqFunction_623(data, threadData);

  inerter_eqFunction_624(data, threadData);

  inerter_eqFunction_625(data, threadData);

  inerter_eqFunction_626(data, threadData);

  inerter_eqFunction_627(data, threadData);

  inerter_eqFunction_628(data, threadData);

  inerter_eqFunction_629(data, threadData);

  inerter_eqFunction_630(data, threadData);

  inerter_eqFunction_631(data, threadData);

  inerter_eqFunction_632(data, threadData);

  inerter_eqFunction_633(data, threadData);

  inerter_eqFunction_634(data, threadData);

  inerter_eqFunction_635(data, threadData);

  inerter_eqFunction_636(data, threadData);

  inerter_eqFunction_637(data, threadData);

  inerter_eqFunction_638(data, threadData);

  inerter_eqFunction_639(data, threadData);

  inerter_eqFunction_640(data, threadData);

  inerter_eqFunction_641(data, threadData);

  inerter_eqFunction_642(data, threadData);

  inerter_eqFunction_643(data, threadData);

  inerter_eqFunction_644(data, threadData);

  inerter_eqFunction_645(data, threadData);

  inerter_eqFunction_646(data, threadData);

  inerter_eqFunction_647(data, threadData);

  inerter_eqFunction_648(data, threadData);

  inerter_eqFunction_649(data, threadData);

  inerter_eqFunction_650(data, threadData);

  inerter_eqFunction_651(data, threadData);

  inerter_eqFunction_652(data, threadData);

  inerter_eqFunction_653(data, threadData);

  inerter_eqFunction_654(data, threadData);

  inerter_eqFunction_655(data, threadData);

  inerter_eqFunction_656(data, threadData);

  inerter_eqFunction_657(data, threadData);

  inerter_eqFunction_658(data, threadData);

  inerter_eqFunction_659(data, threadData);

  inerter_eqFunction_660(data, threadData);

  inerter_eqFunction_661(data, threadData);

  inerter_eqFunction_662(data, threadData);

  inerter_eqFunction_663(data, threadData);

  inerter_eqFunction_664(data, threadData);

  inerter_eqFunction_665(data, threadData);

  inerter_eqFunction_666(data, threadData);

  inerter_eqFunction_667(data, threadData);

  inerter_eqFunction_668(data, threadData);

  inerter_eqFunction_669(data, threadData);

  inerter_eqFunction_670(data, threadData);

  inerter_eqFunction_671(data, threadData);

  inerter_eqFunction_672(data, threadData);

  inerter_eqFunction_673(data, threadData);

  inerter_eqFunction_674(data, threadData);

  inerter_eqFunction_675(data, threadData);

  inerter_eqFunction_676(data, threadData);

  inerter_eqFunction_677(data, threadData);

  inerter_eqFunction_678(data, threadData);

  inerter_eqFunction_679(data, threadData);

  inerter_eqFunction_680(data, threadData);

  inerter_eqFunction_681(data, threadData);

  inerter_eqFunction_682(data, threadData);

  inerter_eqFunction_683(data, threadData);

  inerter_eqFunction_684(data, threadData);

  inerter_eqFunction_685(data, threadData);

  inerter_eqFunction_686(data, threadData);

  inerter_eqFunction_687(data, threadData);

  inerter_eqFunction_688(data, threadData);

  inerter_eqFunction_689(data, threadData);

  inerter_eqFunction_690(data, threadData);

  inerter_eqFunction_691(data, threadData);

  inerter_eqFunction_692(data, threadData);

  inerter_eqFunction_693(data, threadData);

  inerter_eqFunction_694(data, threadData);

  inerter_eqFunction_695(data, threadData);

  inerter_eqFunction_696(data, threadData);

  inerter_eqFunction_697(data, threadData);

  inerter_eqFunction_698(data, threadData);

  inerter_eqFunction_699(data, threadData);

  inerter_eqFunction_700(data, threadData);

  inerter_eqFunction_701(data, threadData);

  inerter_eqFunction_702(data, threadData);

  inerter_eqFunction_703(data, threadData);

  inerter_eqFunction_704(data, threadData);

  inerter_eqFunction_705(data, threadData);

  inerter_eqFunction_706(data, threadData);

  inerter_eqFunction_707(data, threadData);

  inerter_eqFunction_708(data, threadData);

  inerter_eqFunction_709(data, threadData);

  inerter_eqFunction_710(data, threadData);

  inerter_eqFunction_711(data, threadData);

  inerter_eqFunction_712(data, threadData);

  inerter_eqFunction_713(data, threadData);

  inerter_eqFunction_714(data, threadData);

  inerter_eqFunction_715(data, threadData);

  inerter_eqFunction_716(data, threadData);

  inerter_eqFunction_717(data, threadData);

  inerter_eqFunction_718(data, threadData);

  inerter_eqFunction_719(data, threadData);

  inerter_eqFunction_720(data, threadData);

  inerter_eqFunction_721(data, threadData);

  inerter_eqFunction_722(data, threadData);

  inerter_eqFunction_723(data, threadData);

  inerter_eqFunction_724(data, threadData);

  inerter_eqFunction_725(data, threadData);

  inerter_eqFunction_726(data, threadData);

  inerter_eqFunction_727(data, threadData);

  inerter_eqFunction_728(data, threadData);

  inerter_eqFunction_729(data, threadData);

  inerter_eqFunction_730(data, threadData);

  inerter_eqFunction_731(data, threadData);

  inerter_eqFunction_732(data, threadData);

  inerter_eqFunction_733(data, threadData);

  inerter_eqFunction_734(data, threadData);

  inerter_eqFunction_735(data, threadData);

  inerter_eqFunction_736(data, threadData);

  inerter_eqFunction_737(data, threadData);

  inerter_eqFunction_738(data, threadData);
  data->simulationInfo->discreteCall = 0;
  
#if !defined(OMC_MINIMAL_RUNTIME)
  if (measure_time_flag) rt_accumulate(SIM_TIMER_DAE);
#endif
  TRACE_POP
  return 0;
}


int inerter_functionLocalKnownVars(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  
  TRACE_POP
  return 0;
}


/* forwarded equations */
extern void inerter_eqFunction_642(DATA* data, threadData_t *threadData);
extern void inerter_eqFunction_663(DATA* data, threadData_t *threadData);
extern void inerter_eqFunction_664(DATA* data, threadData_t *threadData);
extern void inerter_eqFunction_676(DATA* data, threadData_t *threadData);

static void functionODE_system0(DATA *data, threadData_t *threadData)
{
  {
    inerter_eqFunction_642(data, threadData);
    threadData->lastEquationSolved = 642;
  }
  {
    inerter_eqFunction_663(data, threadData);
    threadData->lastEquationSolved = 663;
  }
  {
    inerter_eqFunction_664(data, threadData);
    threadData->lastEquationSolved = 664;
  }
  {
    inerter_eqFunction_676(data, threadData);
    threadData->lastEquationSolved = 676;
  }
}

int inerter_functionODE(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
#if !defined(OMC_MINIMAL_RUNTIME)
  if (measure_time_flag) rt_tick(SIM_TIMER_FUNCTION_ODE);
#endif

  
  data->simulationInfo->callStatistics.functionODE++;
  
  inerter_functionLocalKnownVars(data, threadData);
  functionODE_system0(data, threadData);

#if !defined(OMC_MINIMAL_RUNTIME)
  if (measure_time_flag) rt_accumulate(SIM_TIMER_FUNCTION_ODE);
#endif

  TRACE_POP
  return 0;
}

/* forward the main in the simulation runtime */
extern int _main_SimulationRuntime(int argc, char**argv, DATA *data, threadData_t *threadData);

#include "inerter_12jac.h"
#include "inerter_13opt.h"

struct OpenModelicaGeneratedFunctionCallbacks inerter_callback = {
   NULL,    /* performSimulation */
   NULL,    /* performQSSSimulation */
   NULL,    /* updateContinuousSystem */
   inerter_callExternalObjectDestructors,    /* callExternalObjectDestructors */
   NULL,    /* initialNonLinearSystem */
   NULL,    /* initialLinearSystem */
   NULL,    /* initialMixedSystem */
   #if !defined(OMC_NO_STATESELECTION)
   inerter_initializeStateSets,
   #else
   NULL,
   #endif    /* initializeStateSets */
   inerter_initializeDAEmodeData,
   inerter_functionODE,
   inerter_functionAlgebraics,
   inerter_functionDAE,
   inerter_functionLocalKnownVars,
   inerter_input_function,
   inerter_input_function_init,
   inerter_input_function_updateStartValues,
   inerter_data_function,
   inerter_output_function,
   inerter_setc_function,
   inerter_setb_function,
   inerter_function_storeDelayed,
   inerter_function_storeSpatialDistribution,
   inerter_function_initSpatialDistribution,
   inerter_updateBoundVariableAttributes,
   inerter_functionInitialEquations,
   1, /* useHomotopy - 0: local homotopy (equidistant lambda), 1: global homotopy (equidistant lambda), 2: new global homotopy approach (adaptive lambda), 3: new local homotopy approach (adaptive lambda)*/
   NULL,
   inerter_functionRemovedInitialEquations,
   inerter_updateBoundParameters,
   inerter_checkForAsserts,
   inerter_function_ZeroCrossingsEquations,
   inerter_function_ZeroCrossings,
   inerter_function_updateRelations,
   inerter_zeroCrossingDescription,
   inerter_relationDescription,
   inerter_function_initSample,
   inerter_INDEX_JAC_A,
   inerter_INDEX_JAC_B,
   inerter_INDEX_JAC_C,
   inerter_INDEX_JAC_D,
   inerter_INDEX_JAC_F,
   inerter_INDEX_JAC_H,
   inerter_initialAnalyticJacobianA,
   inerter_initialAnalyticJacobianB,
   inerter_initialAnalyticJacobianC,
   inerter_initialAnalyticJacobianD,
   inerter_initialAnalyticJacobianF,
   inerter_initialAnalyticJacobianH,
   inerter_functionJacA_column,
   inerter_functionJacB_column,
   inerter_functionJacC_column,
   inerter_functionJacD_column,
   inerter_functionJacF_column,
   inerter_functionJacH_column,
   inerter_linear_model_frame,
   inerter_linear_model_datarecovery_frame,
   inerter_mayer,
   inerter_lagrange,
   inerter_pickUpBoundsForInputsInOptimization,
   inerter_setInputData,
   inerter_getTimeGrid,
   inerter_symbolicInlineSystem,
   inerter_function_initSynchronous,
   inerter_function_updateSynchronous,
   inerter_function_equationsSynchronous,
   inerter_inputNames,
   inerter_dataReconciliationInputNames,
   inerter_dataReconciliationUnmeasuredVariables,
   inerter_read_simulation_info,
   inerter_read_input_fmu,
   NULL,
   NULL,
   -1,
   NULL,
   NULL,
   -1

};

#define _OMC_LIT_RESOURCE_0_name_data "BuildingCase3"
#define _OMC_LIT_RESOURCE_0_dir_data "C:/Users/thogan1/Downloads"
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_0_name,13,_OMC_LIT_RESOURCE_0_name_data);
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_0_dir,26,_OMC_LIT_RESOURCE_0_dir_data);

#define _OMC_LIT_RESOURCE_1_name_data "Complex"
#define _OMC_LIT_RESOURCE_1_dir_data "C:/Users/thogan1/AppData/Roaming/.openmodelica/libraries/Complex 4.0.0+maint.om"
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_1_name,7,_OMC_LIT_RESOURCE_1_name_data);
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_1_dir,79,_OMC_LIT_RESOURCE_1_dir_data);

#define _OMC_LIT_RESOURCE_2_name_data "HelicalTwoBodyInerter"
#define _OMC_LIT_RESOURCE_2_dir_data "C:/Users/thogan1/Downloads"
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_2_name,21,_OMC_LIT_RESOURCE_2_name_data);
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_2_dir,26,_OMC_LIT_RESOURCE_2_dir_data);

#define _OMC_LIT_RESOURCE_3_name_data "Modelica"
#define _OMC_LIT_RESOURCE_3_dir_data "C:/Users/thogan1/AppData/Roaming/.openmodelica/libraries/Modelica 4.0.0+maint.om"
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_3_name,8,_OMC_LIT_RESOURCE_3_name_data);
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_3_dir,80,_OMC_LIT_RESOURCE_3_dir_data);

#define _OMC_LIT_RESOURCE_4_name_data "ModelicaServices"
#define _OMC_LIT_RESOURCE_4_dir_data "C:/Users/thogan1/AppData/Roaming/.openmodelica/libraries/ModelicaServices 4.0.0+maint.om"
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_4_name,16,_OMC_LIT_RESOURCE_4_name_data);
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_4_dir,88,_OMC_LIT_RESOURCE_4_dir_data);

#define _OMC_LIT_RESOURCE_5_name_data "PositionSource"
#define _OMC_LIT_RESOURCE_5_dir_data "C:/Users/thogan1/OneDrive - University of New Brunswick/Grad Studies/OpenModelica/FMI"
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_5_name,14,_OMC_LIT_RESOURCE_5_name_data);
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_5_dir,85,_OMC_LIT_RESOURCE_5_dir_data);

#define _OMC_LIT_RESOURCE_6_name_data "inerter"
#define _OMC_LIT_RESOURCE_6_dir_data "C:/Users/thogan1/OneDrive - University of New Brunswick/Grad Studies/OpenModelica/FMI"
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_6_name,7,_OMC_LIT_RESOURCE_6_name_data);
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_6_dir,85,_OMC_LIT_RESOURCE_6_dir_data);

#define _OMC_LIT_RESOURCE_7_name_data "inerter_test2"
#define _OMC_LIT_RESOURCE_7_dir_data "C:/Users/thogan1/OneDrive - University of New Brunswick/Grad Studies/OpenModelica/FMI"
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_7_name,13,_OMC_LIT_RESOURCE_7_name_data);
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_7_dir,85,_OMC_LIT_RESOURCE_7_dir_data);

#define _OMC_LIT_RESOURCE_8_name_data "inerter_testing"
#define _OMC_LIT_RESOURCE_8_dir_data "C:/Users/thogan1/OneDrive - University of New Brunswick/Grad Studies/OpenModelica/FMI"
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_8_name,15,_OMC_LIT_RESOURCE_8_name_data);
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_8_dir,85,_OMC_LIT_RESOURCE_8_dir_data);

#define _OMC_LIT_RESOURCE_9_name_data "positionConverter"
#define _OMC_LIT_RESOURCE_9_dir_data "C:/Users/thogan1/OneDrive - University of New Brunswick/Grad Studies/OpenModelica/FMI"
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_9_name,17,_OMC_LIT_RESOURCE_9_name_data);
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_9_dir,85,_OMC_LIT_RESOURCE_9_dir_data);

#define _OMC_LIT_RESOURCE_10_name_data "quad_test"
#define _OMC_LIT_RESOURCE_10_dir_data "C:/Users/thogan1/OneDrive - University of New Brunswick/Grad Studies/OpenModelica/FMI"
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_10_name,9,_OMC_LIT_RESOURCE_10_name_data);
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_10_dir,85,_OMC_LIT_RESOURCE_10_dir_data);

#define _OMC_LIT_RESOURCE_11_name_data "quadratic"
#define _OMC_LIT_RESOURCE_11_dir_data "C:/Users/thogan1/OneDrive - University of New Brunswick/Grad Studies/OpenModelica/FMI"
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_11_name,9,_OMC_LIT_RESOURCE_11_name_data);
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_11_dir,85,_OMC_LIT_RESOURCE_11_dir_data);

static const MMC_DEFSTRUCTLIT(_OMC_LIT_RESOURCES,24,MMC_ARRAY_TAG) {MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_0_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_0_dir), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_1_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_1_dir), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_2_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_2_dir), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_3_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_3_dir), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_4_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_4_dir), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_5_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_5_dir), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_6_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_6_dir), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_7_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_7_dir), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_8_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_8_dir), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_9_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_9_dir), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_10_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_10_dir), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_11_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_11_dir)}};
void inerter_setupDataStruc(DATA *data, threadData_t *threadData)
{
  assertStreamPrint(threadData,0!=data, "Error while initialize Data");
  threadData->localRoots[LOCAL_ROOT_SIMULATION_DATA] = data;
  data->callback = &inerter_callback;
  OpenModelica_updateUriMapping(threadData, MMC_REFSTRUCTLIT(_OMC_LIT_RESOURCES));
  data->modelData->modelName = "inerter";
  data->modelData->modelFilePrefix = "inerter";
  data->modelData->resultFileName = NULL;
  data->modelData->modelDir = "C:/Users/thogan1/OneDrive - University of New Brunswick/Grad Studies/OpenModelica/FMI";
  data->modelData->modelGUID = "{5a2dbab2-9398-498a-9c52-63491797cd63}";
  data->modelData->initXMLData = NULL;
  data->modelData->modelDataXml.infoXMLData = NULL;
  GC_asprintf(&data->modelData->modelDataXml.fileName, "%s/inerter_info.json", data->modelData->resourcesDir);
  data->modelData->runTestsuite = 0;
  data->modelData->nStates = 2;
  data->modelData->nVariablesReal = 610;
  data->modelData->nDiscreteReal = 0;
  data->modelData->nVariablesInteger = 30;
  data->modelData->nVariablesBoolean = 0;
  data->modelData->nVariablesString = 0;
  data->modelData->nParametersReal = 332;
  data->modelData->nParametersInteger = 28;
  data->modelData->nParametersBoolean = 35;
  data->modelData->nParametersString = 23;
  data->modelData->nInputVars = 1;
  data->modelData->nOutputVars = 0;
  data->modelData->nAliasReal = 467;
  data->modelData->nAliasInteger = 24;
  data->modelData->nAliasBoolean = 0;
  data->modelData->nAliasString = 0;
  data->modelData->nZeroCrossings = 0;
  data->modelData->nSamples = 0;
  data->modelData->nRelations = 0;
  data->modelData->nMathEvents = 0;
  data->modelData->nExtObjs = 0;
  data->modelData->modelDataXml.modelInfoXmlLength = 0;
  data->modelData->modelDataXml.nFunctions = 5;
  data->modelData->modelDataXml.nProfileBlocks = 0;
  data->modelData->modelDataXml.nEquations = 1658;
  data->modelData->nMixedSystems = 0;
  data->modelData->nLinearSystems = 0;
  data->modelData->nNonLinearSystems = 0;
  data->modelData->nStateSets = 0;
  data->modelData->nJacobians = 6;
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

