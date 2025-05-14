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

  (data->localData[0]->realVars[253] /* u variable */) = data->simulationInfo->inputVars[0];
  
  TRACE_POP
  return 0;
}

int inerter_test3_input_function_init(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  data->simulationInfo->inputVars[0] = data->modelData->realVarsData[253].attribute.start;
  
  TRACE_POP
  return 0;
}

int inerter_test3_input_function_updateStartValues(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  data->modelData->realVarsData[253].attribute.start = data->simulationInfo->inputVars[0];
  
  TRACE_POP
  return 0;
}

int inerter_test3_inputNames(DATA *data, char ** names){
  TRACE_PUSH

  names[0] = (char *) data->modelData->realVarsData[253].info.name;
  
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

  data->simulationInfo->outputVars[0] = (data->localData[0]->realVars[645] /* y variable */);
  
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
equation index: 656
type: SIMPLE_ASSIGN
body.frame_a.r_0[2] = 0.0
*/
void inerter_test3_eqFunction_656(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,656};
  (data->localData[0]->realVars[43] /* body.frame_a.r_0[2] DUMMY_STATE */) = 0.0;
  TRACE_POP
}
/*
equation index: 657
type: SIMPLE_ASSIGN
body.frame_a.r_0[1] = 0.0
*/
void inerter_test3_eqFunction_657(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,657};
  (data->localData[0]->realVars[42] /* body.frame_a.r_0[1] DUMMY_STATE */) = 0.0;
  TRACE_POP
}
/*
equation index: 658
type: SIMPLE_ASSIGN
body.v_0[2] = 0.0
*/
void inerter_test3_eqFunction_658(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,658};
  (data->localData[0]->realVars[72] /* body.v_0[2] DUMMY_STATE */) = 0.0;
  TRACE_POP
}
/*
equation index: 659
type: SIMPLE_ASSIGN
body.v_0[1] = 0.0
*/
void inerter_test3_eqFunction_659(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,659};
  (data->localData[0]->realVars[71] /* body.v_0[1] DUMMY_STATE */) = 0.0;
  TRACE_POP
}
/*
equation index: 660
type: SIMPLE_ASSIGN
body.a_0[1] = 0.0
*/
void inerter_test3_eqFunction_660(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,660};
  (data->localData[0]->realVars[28] /* body.a_0[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 661
type: SIMPLE_ASSIGN
body.a_0[2] = 0.0
*/
void inerter_test3_eqFunction_661(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,661};
  (data->localData[0]->realVars[29] /* body.a_0[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 662
type: SIMPLE_ASSIGN
$DER.body.frame_a.r_0[1] = 0.0
*/
void inerter_test3_eqFunction_662(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,662};
  (data->localData[0]->realVars[4] /* der(body.frame_a.r_0[1]) DUMMY_DER */) = 0.0;
  TRACE_POP
}
/*
equation index: 663
type: SIMPLE_ASSIGN
$DER.body.frame_a.r_0[2] = 0.0
*/
void inerter_test3_eqFunction_663(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,663};
  (data->localData[0]->realVars[5] /* der(body.frame_a.r_0[2]) DUMMY_DER */) = 0.0;
  TRACE_POP
}
/*
equation index: 664
type: SIMPLE_ASSIGN
$DER.body.v_0[1] = 0.0
*/
void inerter_test3_eqFunction_664(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,664};
  (data->localData[0]->realVars[7] /* der(body.v_0[1]) DUMMY_DER */) = 0.0;
  TRACE_POP
}
/*
equation index: 665
type: SIMPLE_ASSIGN
$DER.body.v_0[2] = 0.0
*/
void inerter_test3_eqFunction_665(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,665};
  (data->localData[0]->realVars[8] /* der(body.v_0[2]) DUMMY_DER */) = 0.0;
  TRACE_POP
}
/*
equation index: 666
type: SIMPLE_ASSIGN
bodyShape.body.frame_a.f[1] = 0.0
*/
void inerter_test3_eqFunction_666(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,666};
  (data->localData[0]->realVars[90] /* bodyShape.body.frame_a.f[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 667
type: SIMPLE_ASSIGN
bodyShape.body.frame_a.f[2] = 0.0
*/
void inerter_test3_eqFunction_667(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,667};
  (data->localData[0]->realVars[91] /* bodyShape.body.frame_a.f[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 668
type: SIMPLE_ASSIGN
bodyShape.body.frame_a.f[3] = 0.0
*/
void inerter_test3_eqFunction_668(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,668};
  (data->localData[0]->realVars[92] /* bodyShape.body.frame_a.f[3] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 669
type: SIMPLE_ASSIGN
bodyShape.body.frame_a.t[1] = 0.0
*/
void inerter_test3_eqFunction_669(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,669};
  (data->localData[0]->realVars[93] /* bodyShape.body.frame_a.t[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 670
type: SIMPLE_ASSIGN
bodyShape.body.frame_a.t[2] = 0.0
*/
void inerter_test3_eqFunction_670(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,670};
  (data->localData[0]->realVars[94] /* bodyShape.body.frame_a.t[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 671
type: SIMPLE_ASSIGN
bodyShape.body.frame_a.t[3] = 0.0
*/
void inerter_test3_eqFunction_671(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,671};
  (data->localData[0]->realVars[95] /* bodyShape.body.frame_a.t[3] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 672
type: SIMPLE_ASSIGN
$DER.position.s = prismatic.v
*/
void inerter_test3_eqFunction_672(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,672};
  (data->localData[0]->realVars[13] /* der(position.s) DUMMY_DER */) = (data->localData[0]->realVars[1] /* prismatic.v STATE(1,body.a_0[3]) */);
  TRACE_POP
}
/*
equation index: 673
type: SIMPLE_ASSIGN
$DER.springDamper.s_rel = prismatic.v
*/
void inerter_test3_eqFunction_673(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,673};
  (data->localData[0]->realVars[20] /* der(springDamper.s_rel) DUMMY_DER */) = (data->localData[0]->realVars[1] /* prismatic.v STATE(1,body.a_0[3]) */);
  TRACE_POP
}
/*
equation index: 674
type: SIMPLE_ASSIGN
$DER.body.frame_a.r_0[3] = prismatic.v
*/
void inerter_test3_eqFunction_674(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,674};
  (data->localData[0]->realVars[6] /* der(body.frame_a.r_0[3]) DUMMY_DER */) = (data->localData[0]->realVars[1] /* prismatic.v STATE(1,body.a_0[3]) */);
  TRACE_POP
}
/*
equation index: 675
type: SIMPLE_ASSIGN
position.s_ref = u
*/
void inerter_test3_eqFunction_675(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,675};
  (data->localData[0]->realVars[204] /* position.s_ref variable */) = (data->localData[0]->realVars[253] /* u variable */);
  TRACE_POP
}
/*
equation index: 676
type: SIMPLE_ASSIGN
body.v_0[3] = prismatic.v
*/
void inerter_test3_eqFunction_676(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,676};
  (data->localData[0]->realVars[73] /* body.v_0[3] DUMMY_STATE */) = (data->localData[0]->realVars[1] /* prismatic.v STATE(1,body.a_0[3]) */);
  TRACE_POP
}
/*
equation index: 677
type: SIMPLE_ASSIGN
springDamper.v_rel = prismatic.v
*/
void inerter_test3_eqFunction_677(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,677};
  (data->localData[0]->realVars[252] /* springDamper.v_rel DUMMY_STATE */) = (data->localData[0]->realVars[1] /* prismatic.v STATE(1,body.a_0[3]) */);
  TRACE_POP
}
/*
equation index: 678
type: SIMPLE_ASSIGN
position.v = prismatic.v
*/
void inerter_test3_eqFunction_678(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,678};
  (data->localData[0]->realVars[206] /* position.v DUMMY_STATE */) = (data->localData[0]->realVars[1] /* prismatic.v STATE(1,body.a_0[3]) */);
  TRACE_POP
}
/*
equation index: 679
type: SIMPLE_ASSIGN
body.frame_a.r_0[3] = prismatic.s
*/
void inerter_test3_eqFunction_679(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,679};
  (data->localData[0]->realVars[44] /* body.frame_a.r_0[3] DUMMY_STATE */) = (data->localData[0]->realVars[0] /* prismatic.s STATE(1,prismatic.v) */);
  TRACE_POP
}
/*
equation index: 680
type: SIMPLE_ASSIGN
prismatic.box.length = if noEvent(abs(prismatic.s) > 1e-6) then prismatic.s else 1e-6
*/
void inerter_test3_eqFunction_680(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,680};
  modelica_boolean tmp0;
  tmp0 = Greater(fabs((data->localData[0]->realVars[0] /* prismatic.s STATE(1,prismatic.v) */)),1e-6);
  (data->localData[0]->realVars[212] /* prismatic.box.length variable */) = (tmp0?(data->localData[0]->realVars[0] /* prismatic.s STATE(1,prismatic.v) */):1e-6);
  TRACE_POP
}
/*
equation index: 681
type: SIMPLE_ASSIGN
springDamper.f_d = springDamper.d * prismatic.v
*/
void inerter_test3_eqFunction_681(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,681};
  (data->localData[0]->realVars[249] /* springDamper.f_d variable */) = ((data->simulationInfo->realParameter[233] /* springDamper.d PARAM */)) * ((data->localData[0]->realVars[1] /* prismatic.v STATE(1,body.a_0[3]) */));
  TRACE_POP
}
/*
equation index: 682
type: SIMPLE_ASSIGN
springDamper.lossPower = springDamper.f_d * prismatic.v
*/
void inerter_test3_eqFunction_682(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,682};
  (data->localData[0]->realVars[250] /* springDamper.lossPower variable */) = ((data->localData[0]->realVars[249] /* springDamper.f_d variable */)) * ((data->localData[0]->realVars[1] /* prismatic.v STATE(1,body.a_0[3]) */));
  TRACE_POP
}
/*
equation index: 683
type: SIMPLE_ASSIGN
$DER.prismatic.s = prismatic.v
*/
void inerter_test3_eqFunction_683(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,683};
  (data->localData[0]->realVars[2] /* der(prismatic.s) STATE_DER */) = (data->localData[0]->realVars[1] /* prismatic.v STATE(1,body.a_0[3]) */);
  TRACE_POP
}
/*
equation index: 684
type: SIMPLE_ASSIGN
revolute.w = idealGearR2T.ratio * prismatic.v
*/
void inerter_test3_eqFunction_684(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,684};
  (data->localData[0]->realVars[246] /* revolute.w DUMMY_STATE */) = ((data->simulationInfo->realParameter[188] /* idealGearR2T.ratio PARAM */)) * ((data->localData[0]->realVars[1] /* prismatic.v STATE(1,body.a_0[3]) */));
  TRACE_POP
}
/*
equation index: 685
type: SIMPLE_ASSIGN
body.w_a[3] = revolute.e[3] * revolute.w
*/
void inerter_test3_eqFunction_685(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,685};
  (data->localData[0]->realVars[76] /* body.w_a[3] DUMMY_STATE */) = ((data->simulationInfo->realParameter[224] /* revolute.e[3] PARAM */)) * ((data->localData[0]->realVars[246] /* revolute.w DUMMY_STATE */));
  TRACE_POP
}
/*
equation index: 686
type: SIMPLE_ASSIGN
revolute.R_rel.w[3] = body.w_a[3]
*/
void inerter_test3_eqFunction_686(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,686};
  (data->localData[0]->realVars[229] /* revolute.R_rel.w[3] DUMMY_STATE */) = (data->localData[0]->realVars[76] /* body.w_a[3] DUMMY_STATE */);
  TRACE_POP
}
/*
equation index: 687
type: SIMPLE_ASSIGN
body.w_a[2] = revolute.e[2] * revolute.w
*/
void inerter_test3_eqFunction_687(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,687};
  (data->localData[0]->realVars[75] /* body.w_a[2] DUMMY_STATE */) = ((data->simulationInfo->realParameter[223] /* revolute.e[2] PARAM */)) * ((data->localData[0]->realVars[246] /* revolute.w DUMMY_STATE */));
  TRACE_POP
}
/*
equation index: 688
type: SIMPLE_ASSIGN
revolute.R_rel.w[2] = body.w_a[2]
*/
void inerter_test3_eqFunction_688(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,688};
  (data->localData[0]->realVars[228] /* revolute.R_rel.w[2] DUMMY_STATE */) = (data->localData[0]->realVars[75] /* body.w_a[2] DUMMY_STATE */);
  TRACE_POP
}
/*
equation index: 689
type: SIMPLE_ASSIGN
body.w_a[1] = revolute.e[1] * revolute.w
*/
void inerter_test3_eqFunction_689(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,689};
  (data->localData[0]->realVars[74] /* body.w_a[1] DUMMY_STATE */) = ((data->simulationInfo->realParameter[222] /* revolute.e[1] PARAM */)) * ((data->localData[0]->realVars[246] /* revolute.w DUMMY_STATE */));
  TRACE_POP
}
/*
equation index: 690
type: SIMPLE_ASSIGN
revolute.R_rel.w[1] = body.w_a[1]
*/
void inerter_test3_eqFunction_690(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,690};
  (data->localData[0]->realVars[227] /* revolute.R_rel.w[1] DUMMY_STATE */) = (data->localData[0]->realVars[74] /* body.w_a[1] DUMMY_STATE */);
  TRACE_POP
}
/*
equation index: 691
type: SIMPLE_ASSIGN
$DER.revolute.phi = revolute.w
*/
void inerter_test3_eqFunction_691(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,691};
  (data->localData[0]->realVars[18] /* der(revolute.phi) DUMMY_DER */) = (data->localData[0]->realVars[246] /* revolute.w DUMMY_STATE */);
  TRACE_POP
}
/*
equation index: 692
type: SIMPLE_ASSIGN
revolute.phi = idealGearR2T.ratio * (prismatic.s - idealGearR2T.fixedT.s0) + idealGearR2T.fixedR.phi0
*/
void inerter_test3_eqFunction_692(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,692};
  (data->localData[0]->realVars[243] /* revolute.phi DUMMY_STATE */) = ((data->simulationInfo->realParameter[188] /* idealGearR2T.ratio PARAM */)) * ((data->localData[0]->realVars[0] /* prismatic.s STATE(1,prismatic.v) */) - (data->simulationInfo->realParameter[183] /* idealGearR2T.fixedT.s0 PARAM */)) + (data->simulationInfo->realParameter[181] /* idealGearR2T.fixedR.phi0 PARAM */);
  TRACE_POP
}
/*
equation index: 693
type: SIMPLE_ASSIGN
$cse2 = sin(revolute.phi)
*/
void inerter_test3_eqFunction_693(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,693};
  (data->localData[0]->realVars[23] /* $cse2 variable */) = sin((data->localData[0]->realVars[243] /* revolute.phi DUMMY_STATE */));
  TRACE_POP
}
/*
equation index: 694
type: SIMPLE_ASSIGN
$cse1 = cos(revolute.phi)
*/
void inerter_test3_eqFunction_694(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,694};
  (data->localData[0]->realVars[22] /* $cse1 variable */) = cos((data->localData[0]->realVars[243] /* revolute.phi DUMMY_STATE */));
  TRACE_POP
}
/*
equation index: 695
type: SIMPLE_ASSIGN
cutForce.frame_a.R.T[1,1] = revolute.e[1] ^ 2.0 + (1.0 - revolute.e[1] ^ 2.0) * $cse1
*/
void inerter_test3_eqFunction_695(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,695};
  modelica_real tmp1;
  modelica_real tmp2;
  tmp1 = (data->simulationInfo->realParameter[222] /* revolute.e[1] PARAM */);
  tmp2 = (data->simulationInfo->realParameter[222] /* revolute.e[1] PARAM */);
  (data->localData[0]->realVars[165] /* cutForce.frame_a.R.T[1,1] variable */) = (tmp1 * tmp1) + (1.0 - ((tmp2 * tmp2))) * ((data->localData[0]->realVars[22] /* $cse1 variable */));
  TRACE_POP
}
/*
equation index: 696
type: SIMPLE_ASSIGN
cutForce.frame_a.R.T[1,2] = (revolute.e[1] - revolute.e[1] * $cse1) * revolute.e[2] + revolute.e[3] * $cse2
*/
void inerter_test3_eqFunction_696(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,696};
  (data->localData[0]->realVars[166] /* cutForce.frame_a.R.T[1,2] variable */) = ((data->simulationInfo->realParameter[222] /* revolute.e[1] PARAM */) - (((data->simulationInfo->realParameter[222] /* revolute.e[1] PARAM */)) * ((data->localData[0]->realVars[22] /* $cse1 variable */)))) * ((data->simulationInfo->realParameter[223] /* revolute.e[2] PARAM */)) + ((data->simulationInfo->realParameter[224] /* revolute.e[3] PARAM */)) * ((data->localData[0]->realVars[23] /* $cse2 variable */));
  TRACE_POP
}
/*
equation index: 697
type: SIMPLE_ASSIGN
cutForce.frame_a.R.T[1,3] = (revolute.e[1] - revolute.e[1] * $cse1) * revolute.e[3] - revolute.e[2] * $cse2
*/
void inerter_test3_eqFunction_697(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,697};
  (data->localData[0]->realVars[167] /* cutForce.frame_a.R.T[1,3] variable */) = ((data->simulationInfo->realParameter[222] /* revolute.e[1] PARAM */) - (((data->simulationInfo->realParameter[222] /* revolute.e[1] PARAM */)) * ((data->localData[0]->realVars[22] /* $cse1 variable */)))) * ((data->simulationInfo->realParameter[224] /* revolute.e[3] PARAM */)) - (((data->simulationInfo->realParameter[223] /* revolute.e[2] PARAM */)) * ((data->localData[0]->realVars[23] /* $cse2 variable */)));
  TRACE_POP
}
/*
equation index: 698
type: SIMPLE_ASSIGN
cutForce.frame_a.R.T[2,1] = (revolute.e[2] - revolute.e[2] * $cse1) * revolute.e[1] - revolute.e[3] * $cse2
*/
void inerter_test3_eqFunction_698(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,698};
  (data->localData[0]->realVars[168] /* cutForce.frame_a.R.T[2,1] variable */) = ((data->simulationInfo->realParameter[223] /* revolute.e[2] PARAM */) - (((data->simulationInfo->realParameter[223] /* revolute.e[2] PARAM */)) * ((data->localData[0]->realVars[22] /* $cse1 variable */)))) * ((data->simulationInfo->realParameter[222] /* revolute.e[1] PARAM */)) - (((data->simulationInfo->realParameter[224] /* revolute.e[3] PARAM */)) * ((data->localData[0]->realVars[23] /* $cse2 variable */)));
  TRACE_POP
}
/*
equation index: 699
type: SIMPLE_ASSIGN
cutForce.frame_a.R.T[2,2] = revolute.e[2] ^ 2.0 + (1.0 - revolute.e[2] ^ 2.0) * $cse1
*/
void inerter_test3_eqFunction_699(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,699};
  modelica_real tmp3;
  modelica_real tmp4;
  tmp3 = (data->simulationInfo->realParameter[223] /* revolute.e[2] PARAM */);
  tmp4 = (data->simulationInfo->realParameter[223] /* revolute.e[2] PARAM */);
  (data->localData[0]->realVars[169] /* cutForce.frame_a.R.T[2,2] variable */) = (tmp3 * tmp3) + (1.0 - ((tmp4 * tmp4))) * ((data->localData[0]->realVars[22] /* $cse1 variable */));
  TRACE_POP
}
/*
equation index: 700
type: SIMPLE_ASSIGN
cutForce.frame_a.R.T[2,3] = (revolute.e[2] - revolute.e[2] * $cse1) * revolute.e[3] + revolute.e[1] * $cse2
*/
void inerter_test3_eqFunction_700(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,700};
  (data->localData[0]->realVars[170] /* cutForce.frame_a.R.T[2,3] variable */) = ((data->simulationInfo->realParameter[223] /* revolute.e[2] PARAM */) - (((data->simulationInfo->realParameter[223] /* revolute.e[2] PARAM */)) * ((data->localData[0]->realVars[22] /* $cse1 variable */)))) * ((data->simulationInfo->realParameter[224] /* revolute.e[3] PARAM */)) + ((data->simulationInfo->realParameter[222] /* revolute.e[1] PARAM */)) * ((data->localData[0]->realVars[23] /* $cse2 variable */));
  TRACE_POP
}
/*
equation index: 701
type: SIMPLE_ASSIGN
cutForce.frame_a.R.T[3,1] = (revolute.e[3] - revolute.e[3] * $cse1) * revolute.e[1] + revolute.e[2] * $cse2
*/
void inerter_test3_eqFunction_701(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,701};
  (data->localData[0]->realVars[171] /* cutForce.frame_a.R.T[3,1] variable */) = ((data->simulationInfo->realParameter[224] /* revolute.e[3] PARAM */) - (((data->simulationInfo->realParameter[224] /* revolute.e[3] PARAM */)) * ((data->localData[0]->realVars[22] /* $cse1 variable */)))) * ((data->simulationInfo->realParameter[222] /* revolute.e[1] PARAM */)) + ((data->simulationInfo->realParameter[223] /* revolute.e[2] PARAM */)) * ((data->localData[0]->realVars[23] /* $cse2 variable */));
  TRACE_POP
}
/*
equation index: 702
type: SIMPLE_ASSIGN
cutForce.frame_a.R.T[3,2] = (revolute.e[3] - revolute.e[3] * $cse1) * revolute.e[2] - revolute.e[1] * $cse2
*/
void inerter_test3_eqFunction_702(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,702};
  (data->localData[0]->realVars[172] /* cutForce.frame_a.R.T[3,2] variable */) = ((data->simulationInfo->realParameter[224] /* revolute.e[3] PARAM */) - (((data->simulationInfo->realParameter[224] /* revolute.e[3] PARAM */)) * ((data->localData[0]->realVars[22] /* $cse1 variable */)))) * ((data->simulationInfo->realParameter[223] /* revolute.e[2] PARAM */)) - (((data->simulationInfo->realParameter[222] /* revolute.e[1] PARAM */)) * ((data->localData[0]->realVars[23] /* $cse2 variable */)));
  TRACE_POP
}
/*
equation index: 703
type: SIMPLE_ASSIGN
cutForce.frame_a.R.T[3,3] = revolute.e[3] ^ 2.0 + (1.0 - revolute.e[3] ^ 2.0) * $cse1
*/
void inerter_test3_eqFunction_703(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,703};
  modelica_real tmp5;
  modelica_real tmp6;
  tmp5 = (data->simulationInfo->realParameter[224] /* revolute.e[3] PARAM */);
  tmp6 = (data->simulationInfo->realParameter[224] /* revolute.e[3] PARAM */);
  (data->localData[0]->realVars[173] /* cutForce.frame_a.R.T[3,3] variable */) = (tmp5 * tmp5) + (1.0 - ((tmp6 * tmp6))) * ((data->localData[0]->realVars[22] /* $cse1 variable */));
  TRACE_POP
}
/*
equation index: 704
type: SIMPLE_ASSIGN
springDamper.s_rel = prismatic.s - prismatic.fixed.s0
*/
void inerter_test3_eqFunction_704(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,704};
  (data->localData[0]->realVars[251] /* springDamper.s_rel DUMMY_STATE */) = (data->localData[0]->realVars[0] /* prismatic.s STATE(1,prismatic.v) */) - (data->simulationInfo->realParameter[207] /* prismatic.fixed.s0 PARAM */);
  TRACE_POP
}
/*
equation index: 705
type: SIMPLE_ASSIGN
springDamper.f_c = springDamper.c * (springDamper.s_rel - springDamper.s_rel0)
*/
void inerter_test3_eqFunction_705(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,705};
  (data->localData[0]->realVars[248] /* springDamper.f_c variable */) = ((data->simulationInfo->realParameter[232] /* springDamper.c PARAM */)) * ((data->localData[0]->realVars[251] /* springDamper.s_rel DUMMY_STATE */) - (data->simulationInfo->realParameter[236] /* springDamper.s_rel0 PARAM */));
  TRACE_POP
}
/*
equation index: 706
type: SIMPLE_ASSIGN
springDamper.f = springDamper.f_c + springDamper.f_d
*/
void inerter_test3_eqFunction_706(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,706};
  (data->localData[0]->realVars[247] /* springDamper.f variable */) = (data->localData[0]->realVars[248] /* springDamper.f_c variable */) + (data->localData[0]->realVars[249] /* springDamper.f_d variable */);
  TRACE_POP
}
/*
equation index: 707
type: SIMPLE_ASSIGN
position.s = prismatic.s - prismatic.fixed.s0
*/
void inerter_test3_eqFunction_707(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,707};
  (data->localData[0]->realVars[203] /* position.s DUMMY_STATE */) = (data->localData[0]->realVars[0] /* prismatic.s STATE(1,prismatic.v) */) - (data->simulationInfo->realParameter[207] /* prismatic.fixed.s0 PARAM */);
  TRACE_POP
}
/*
equation index: 708
type: SIMPLE_ASSIGN
body.a_0[3] = 1.6181229773462784 * ((u - position.s) * position.w_crit + (-1.3617) * prismatic.v) * position.w_crit
*/
void inerter_test3_eqFunction_708(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,708};
  (data->localData[0]->realVars[30] /* body.a_0[3] variable */) = (1.6181229773462784) * ((((data->localData[0]->realVars[253] /* u variable */) - (data->localData[0]->realVars[203] /* position.s DUMMY_STATE */)) * ((data->simulationInfo->realParameter[194] /* position.w_crit PARAM */)) + (-1.3617) * ((data->localData[0]->realVars[1] /* prismatic.v STATE(1,body.a_0[3]) */))) * ((data->simulationInfo->realParameter[194] /* position.w_crit PARAM */)));
  TRACE_POP
}
/*
equation index: 709
type: SIMPLE_ASSIGN
revolute.a = idealGearR2T.ratio * body.a_0[3]
*/
void inerter_test3_eqFunction_709(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,709};
  (data->localData[0]->realVars[230] /* revolute.a variable */) = ((data->simulationInfo->realParameter[188] /* idealGearR2T.ratio PARAM */)) * ((data->localData[0]->realVars[30] /* body.a_0[3] variable */));
  TRACE_POP
}
/*
equation index: 710
type: SIMPLE_ASSIGN
body.z_a[3] = revolute.e[3] * revolute.a
*/
void inerter_test3_eqFunction_710(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,710};
  (data->localData[0]->realVars[79] /* body.z_a[3] variable */) = ((data->simulationInfo->realParameter[224] /* revolute.e[3] PARAM */)) * ((data->localData[0]->realVars[230] /* revolute.a variable */));
  TRACE_POP
}
/*
equation index: 711
type: SIMPLE_ASSIGN
$DER.revolute.R_rel.w[3] = body.z_a[3]
*/
void inerter_test3_eqFunction_711(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,711};
  (data->localData[0]->realVars[17] /* der(revolute.R_rel.w[3]) DUMMY_DER */) = (data->localData[0]->realVars[79] /* body.z_a[3] variable */);
  TRACE_POP
}
/*
equation index: 712
type: SIMPLE_ASSIGN
$DER.body.w_a[3] = body.z_a[3]
*/
void inerter_test3_eqFunction_712(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,712};
  (data->localData[0]->realVars[12] /* der(body.w_a[3]) DUMMY_DER */) = (data->localData[0]->realVars[79] /* body.z_a[3] variable */);
  TRACE_POP
}
/*
equation index: 713
type: SIMPLE_ASSIGN
body.z_a[2] = revolute.e[2] * revolute.a
*/
void inerter_test3_eqFunction_713(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,713};
  (data->localData[0]->realVars[78] /* body.z_a[2] variable */) = ((data->simulationInfo->realParameter[223] /* revolute.e[2] PARAM */)) * ((data->localData[0]->realVars[230] /* revolute.a variable */));
  TRACE_POP
}
/*
equation index: 714
type: SIMPLE_ASSIGN
$DER.revolute.R_rel.w[2] = body.z_a[2]
*/
void inerter_test3_eqFunction_714(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,714};
  (data->localData[0]->realVars[16] /* der(revolute.R_rel.w[2]) DUMMY_DER */) = (data->localData[0]->realVars[78] /* body.z_a[2] variable */);
  TRACE_POP
}
/*
equation index: 715
type: SIMPLE_ASSIGN
$DER.body.w_a[2] = body.z_a[2]
*/
void inerter_test3_eqFunction_715(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,715};
  (data->localData[0]->realVars[11] /* der(body.w_a[2]) DUMMY_DER */) = (data->localData[0]->realVars[78] /* body.z_a[2] variable */);
  TRACE_POP
}
/*
equation index: 716
type: SIMPLE_ASSIGN
body.z_a[1] = revolute.e[1] * revolute.a
*/
void inerter_test3_eqFunction_716(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,716};
  (data->localData[0]->realVars[77] /* body.z_a[1] variable */) = ((data->simulationInfo->realParameter[222] /* revolute.e[1] PARAM */)) * ((data->localData[0]->realVars[230] /* revolute.a variable */));
  TRACE_POP
}
/*
equation index: 717
type: SIMPLE_ASSIGN
$DER.revolute.R_rel.w[1] = body.z_a[1]
*/
void inerter_test3_eqFunction_717(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,717};
  (data->localData[0]->realVars[15] /* der(revolute.R_rel.w[1]) DUMMY_DER */) = (data->localData[0]->realVars[77] /* body.z_a[1] variable */);
  TRACE_POP
}
/*
equation index: 718
type: SIMPLE_ASSIGN
$DER.body.w_a[1] = body.z_a[1]
*/
void inerter_test3_eqFunction_718(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,718};
  (data->localData[0]->realVars[10] /* der(body.w_a[1]) DUMMY_DER */) = (data->localData[0]->realVars[77] /* body.z_a[1] variable */);
  TRACE_POP
}
/*
equation index: 719
type: SIMPLE_ASSIGN
$DER.revolute.w = revolute.a
*/
void inerter_test3_eqFunction_719(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,719};
  (data->localData[0]->realVars[19] /* der(revolute.w) DUMMY_DER */) = (data->localData[0]->realVars[230] /* revolute.a variable */);
  TRACE_POP
}
/*
equation index: 720
type: SIMPLE_ASSIGN
cutForce.frame_a.f[3] = (cutForce.frame_a.R.T[3,3] * body.a_0[3] + body.z_a[1] * body.r_CM[2] + body.w_a[1] * (body.w_a[3] * body.r_CM[1] - body.w_a[1] * body.r_CM[3]) + body.w_a[2] * (body.w_a[3] * body.r_CM[2] - body.w_a[2] * body.r_CM[3]) - body.z_a[2] * body.r_CM[1]) * body.m
*/
void inerter_test3_eqFunction_720(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,720};
  (data->localData[0]->realVars[176] /* cutForce.frame_a.f[3] variable */) = (((data->localData[0]->realVars[173] /* cutForce.frame_a.R.T[3,3] variable */)) * ((data->localData[0]->realVars[30] /* body.a_0[3] variable */)) + ((data->localData[0]->realVars[77] /* body.z_a[1] variable */)) * ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)) + ((data->localData[0]->realVars[74] /* body.w_a[1] DUMMY_STATE */)) * (((data->localData[0]->realVars[76] /* body.w_a[3] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)) - (((data->localData[0]->realVars[74] /* body.w_a[1] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)))) + ((data->localData[0]->realVars[75] /* body.w_a[2] DUMMY_STATE */)) * (((data->localData[0]->realVars[76] /* body.w_a[3] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)) - (((data->localData[0]->realVars[75] /* body.w_a[2] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)))) - (((data->localData[0]->realVars[78] /* body.z_a[2] variable */)) * ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)))) * ((data->simulationInfo->realParameter[43] /* body.m PARAM */));
  TRACE_POP
}
/*
equation index: 721
type: SIMPLE_ASSIGN
y = cutForce.frame_a.f[3] * (*Real*)(cutForce.cutForce.csign)
*/
void inerter_test3_eqFunction_721(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,721};
  (data->localData[0]->realVars[645] /* y variable */) = ((data->localData[0]->realVars[176] /* cutForce.frame_a.f[3] variable */)) * (((modelica_real)(data->simulationInfo->integerParameter[18] /* cutForce.cutForce.csign PARAM */)));
  TRACE_POP
}
/*
equation index: 722
type: SIMPLE_ASSIGN
cutForce.forceArrow.r_head[3] = (-cutForce.frame_a.f[3]) * (if cutForce.positiveSign then 1.0 else -1.0)
*/
void inerter_test3_eqFunction_722(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,722};
  (data->localData[0]->realVars[161] /* cutForce.forceArrow.r_head[3] variable */) = ((-(data->localData[0]->realVars[176] /* cutForce.frame_a.f[3] variable */))) * (((data->simulationInfo->booleanParameter[22] /* cutForce.positiveSign PARAM */)?1.0:-1.0));
  TRACE_POP
}
/*
equation index: 723
type: SIMPLE_ASSIGN
cutForce.frame_a.f[2] = (cutForce.frame_a.R.T[2,3] * body.a_0[3] + body.z_a[3] * body.r_CM[1] + body.w_a[3] * (body.w_a[2] * body.r_CM[3] - body.w_a[3] * body.r_CM[2]) + body.w_a[1] * (body.w_a[2] * body.r_CM[1] - body.w_a[1] * body.r_CM[2]) - body.z_a[1] * body.r_CM[3]) * body.m
*/
void inerter_test3_eqFunction_723(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,723};
  (data->localData[0]->realVars[175] /* cutForce.frame_a.f[2] variable */) = (((data->localData[0]->realVars[170] /* cutForce.frame_a.R.T[2,3] variable */)) * ((data->localData[0]->realVars[30] /* body.a_0[3] variable */)) + ((data->localData[0]->realVars[79] /* body.z_a[3] variable */)) * ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)) + ((data->localData[0]->realVars[76] /* body.w_a[3] DUMMY_STATE */)) * (((data->localData[0]->realVars[75] /* body.w_a[2] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)) - (((data->localData[0]->realVars[76] /* body.w_a[3] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)))) + ((data->localData[0]->realVars[74] /* body.w_a[1] DUMMY_STATE */)) * (((data->localData[0]->realVars[75] /* body.w_a[2] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)) - (((data->localData[0]->realVars[74] /* body.w_a[1] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)))) - (((data->localData[0]->realVars[77] /* body.z_a[1] variable */)) * ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)))) * ((data->simulationInfo->realParameter[43] /* body.m PARAM */));
  TRACE_POP
}
/*
equation index: 724
type: SIMPLE_ASSIGN
cutForce.force[2] = cutForce.frame_a.f[2] * (*Real*)(cutForce.cutForce.csign)
*/
void inerter_test3_eqFunction_724(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,724};
  (data->localData[0]->realVars[158] /* cutForce.force[2] variable */) = ((data->localData[0]->realVars[175] /* cutForce.frame_a.f[2] variable */)) * (((modelica_real)(data->simulationInfo->integerParameter[18] /* cutForce.cutForce.csign PARAM */)));
  TRACE_POP
}
/*
equation index: 725
type: SIMPLE_ASSIGN
cutForce.forceArrow.r_head[2] = (-cutForce.frame_a.f[2]) * (if cutForce.positiveSign then 1.0 else -1.0)
*/
void inerter_test3_eqFunction_725(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,725};
  (data->localData[0]->realVars[160] /* cutForce.forceArrow.r_head[2] variable */) = ((-(data->localData[0]->realVars[175] /* cutForce.frame_a.f[2] variable */))) * (((data->simulationInfo->booleanParameter[22] /* cutForce.positiveSign PARAM */)?1.0:-1.0));
  TRACE_POP
}
/*
equation index: 726
type: SIMPLE_ASSIGN
cutForce.frame_a.t[1] = body.I[1,1] * body.z_a[1] + body.I[1,2] * body.z_a[2] + body.I[1,3] * body.z_a[3] + body.w_a[2] * (body.I[3,1] * body.w_a[1] + body.I[3,2] * body.w_a[2] + body.I[3,3] * body.w_a[3]) + body.r_CM[2] * cutForce.frame_a.f[3] + (-body.r_CM[3]) * cutForce.frame_a.f[2] - body.w_a[3] * (body.I[2,1] * body.w_a[1] + body.I[2,2] * body.w_a[2] + body.I[2,3] * body.w_a[3])
*/
void inerter_test3_eqFunction_726(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,726};
  (data->localData[0]->realVars[177] /* cutForce.frame_a.t[1] variable */) = ((data->simulationInfo->realParameter[2] /* body.I[1,1] PARAM */)) * ((data->localData[0]->realVars[77] /* body.z_a[1] variable */)) + ((data->simulationInfo->realParameter[3] /* body.I[1,2] PARAM */)) * ((data->localData[0]->realVars[78] /* body.z_a[2] variable */)) + ((data->simulationInfo->realParameter[4] /* body.I[1,3] PARAM */)) * ((data->localData[0]->realVars[79] /* body.z_a[3] variable */)) + ((data->localData[0]->realVars[75] /* body.w_a[2] DUMMY_STATE */)) * (((data->simulationInfo->realParameter[8] /* body.I[3,1] PARAM */)) * ((data->localData[0]->realVars[74] /* body.w_a[1] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[9] /* body.I[3,2] PARAM */)) * ((data->localData[0]->realVars[75] /* body.w_a[2] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[10] /* body.I[3,3] PARAM */)) * ((data->localData[0]->realVars[76] /* body.w_a[3] DUMMY_STATE */))) + ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)) * ((data->localData[0]->realVars[176] /* cutForce.frame_a.f[3] variable */)) + ((-(data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */))) * ((data->localData[0]->realVars[175] /* cutForce.frame_a.f[2] variable */)) - (((data->localData[0]->realVars[76] /* body.w_a[3] DUMMY_STATE */)) * (((data->simulationInfo->realParameter[5] /* body.I[2,1] PARAM */)) * ((data->localData[0]->realVars[74] /* body.w_a[1] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[6] /* body.I[2,2] PARAM */)) * ((data->localData[0]->realVars[75] /* body.w_a[2] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[7] /* body.I[2,3] PARAM */)) * ((data->localData[0]->realVars[76] /* body.w_a[3] DUMMY_STATE */))));
  TRACE_POP
}
/*
equation index: 727
type: SIMPLE_ASSIGN
cutForce.frame_a.f[1] = (cutForce.frame_a.R.T[1,3] * body.a_0[3] + body.z_a[2] * body.r_CM[3] + body.w_a[2] * (body.w_a[1] * body.r_CM[2] - body.w_a[2] * body.r_CM[1]) + body.w_a[3] * (body.w_a[1] * body.r_CM[3] - body.w_a[3] * body.r_CM[1]) - body.z_a[3] * body.r_CM[2]) * body.m
*/
void inerter_test3_eqFunction_727(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,727};
  (data->localData[0]->realVars[174] /* cutForce.frame_a.f[1] variable */) = (((data->localData[0]->realVars[167] /* cutForce.frame_a.R.T[1,3] variable */)) * ((data->localData[0]->realVars[30] /* body.a_0[3] variable */)) + ((data->localData[0]->realVars[78] /* body.z_a[2] variable */)) * ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)) + ((data->localData[0]->realVars[75] /* body.w_a[2] DUMMY_STATE */)) * (((data->localData[0]->realVars[74] /* body.w_a[1] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)) - (((data->localData[0]->realVars[75] /* body.w_a[2] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)))) + ((data->localData[0]->realVars[76] /* body.w_a[3] DUMMY_STATE */)) * (((data->localData[0]->realVars[74] /* body.w_a[1] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)) - (((data->localData[0]->realVars[76] /* body.w_a[3] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)))) - (((data->localData[0]->realVars[79] /* body.z_a[3] variable */)) * ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)))) * ((data->simulationInfo->realParameter[43] /* body.m PARAM */));
  TRACE_POP
}
/*
equation index: 728
type: SIMPLE_ASSIGN
cutForce.force[1] = cutForce.frame_a.f[1] * (*Real*)(cutForce.cutForce.csign)
*/
void inerter_test3_eqFunction_728(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,728};
  (data->localData[0]->realVars[157] /* cutForce.force[1] variable */) = ((data->localData[0]->realVars[174] /* cutForce.frame_a.f[1] variable */)) * (((modelica_real)(data->simulationInfo->integerParameter[18] /* cutForce.cutForce.csign PARAM */)));
  TRACE_POP
}
/*
equation index: 729
type: SIMPLE_ASSIGN
cutForce.forceArrow.r_head[1] = (-cutForce.frame_a.f[1]) * (if cutForce.positiveSign then 1.0 else -1.0)
*/
void inerter_test3_eqFunction_729(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,729};
  (data->localData[0]->realVars[159] /* cutForce.forceArrow.r_head[1] variable */) = ((-(data->localData[0]->realVars[174] /* cutForce.frame_a.f[1] variable */))) * (((data->simulationInfo->booleanParameter[22] /* cutForce.positiveSign PARAM */)?1.0:-1.0));
  TRACE_POP
}
/*
equation index: 730
type: SIMPLE_ASSIGN
cutForce.frame_a.t[3] = body.I[3,1] * body.z_a[1] + body.I[3,2] * body.z_a[2] + body.I[3,3] * body.z_a[3] + body.w_a[1] * (body.I[2,1] * body.w_a[1] + body.I[2,2] * body.w_a[2] + body.I[2,3] * body.w_a[3]) + body.r_CM[1] * cutForce.frame_a.f[2] + (-body.r_CM[2]) * cutForce.frame_a.f[1] - body.w_a[2] * (body.I[1,1] * body.w_a[1] + body.I[1,2] * body.w_a[2] + body.I[1,3] * body.w_a[3])
*/
void inerter_test3_eqFunction_730(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,730};
  (data->localData[0]->realVars[179] /* cutForce.frame_a.t[3] variable */) = ((data->simulationInfo->realParameter[8] /* body.I[3,1] PARAM */)) * ((data->localData[0]->realVars[77] /* body.z_a[1] variable */)) + ((data->simulationInfo->realParameter[9] /* body.I[3,2] PARAM */)) * ((data->localData[0]->realVars[78] /* body.z_a[2] variable */)) + ((data->simulationInfo->realParameter[10] /* body.I[3,3] PARAM */)) * ((data->localData[0]->realVars[79] /* body.z_a[3] variable */)) + ((data->localData[0]->realVars[74] /* body.w_a[1] DUMMY_STATE */)) * (((data->simulationInfo->realParameter[5] /* body.I[2,1] PARAM */)) * ((data->localData[0]->realVars[74] /* body.w_a[1] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[6] /* body.I[2,2] PARAM */)) * ((data->localData[0]->realVars[75] /* body.w_a[2] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[7] /* body.I[2,3] PARAM */)) * ((data->localData[0]->realVars[76] /* body.w_a[3] DUMMY_STATE */))) + ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)) * ((data->localData[0]->realVars[175] /* cutForce.frame_a.f[2] variable */)) + ((-(data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */))) * ((data->localData[0]->realVars[174] /* cutForce.frame_a.f[1] variable */)) - (((data->localData[0]->realVars[75] /* body.w_a[2] DUMMY_STATE */)) * (((data->simulationInfo->realParameter[2] /* body.I[1,1] PARAM */)) * ((data->localData[0]->realVars[74] /* body.w_a[1] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[3] /* body.I[1,2] PARAM */)) * ((data->localData[0]->realVars[75] /* body.w_a[2] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[4] /* body.I[1,3] PARAM */)) * ((data->localData[0]->realVars[76] /* body.w_a[3] DUMMY_STATE */))));
  TRACE_POP
}
/*
equation index: 731
type: SIMPLE_ASSIGN
cutForce.frame_a.t[2] = body.I[2,1] * body.z_a[1] + body.I[2,2] * body.z_a[2] + body.I[2,3] * body.z_a[3] + body.w_a[3] * (body.I[1,1] * body.w_a[1] + body.I[1,2] * body.w_a[2] + body.I[1,3] * body.w_a[3]) + body.r_CM[3] * cutForce.frame_a.f[1] + (-body.r_CM[1]) * cutForce.frame_a.f[3] - body.w_a[1] * (body.I[3,1] * body.w_a[1] + body.I[3,2] * body.w_a[2] + body.I[3,3] * body.w_a[3])
*/
void inerter_test3_eqFunction_731(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,731};
  (data->localData[0]->realVars[178] /* cutForce.frame_a.t[2] variable */) = ((data->simulationInfo->realParameter[5] /* body.I[2,1] PARAM */)) * ((data->localData[0]->realVars[77] /* body.z_a[1] variable */)) + ((data->simulationInfo->realParameter[6] /* body.I[2,2] PARAM */)) * ((data->localData[0]->realVars[78] /* body.z_a[2] variable */)) + ((data->simulationInfo->realParameter[7] /* body.I[2,3] PARAM */)) * ((data->localData[0]->realVars[79] /* body.z_a[3] variable */)) + ((data->localData[0]->realVars[76] /* body.w_a[3] DUMMY_STATE */)) * (((data->simulationInfo->realParameter[2] /* body.I[1,1] PARAM */)) * ((data->localData[0]->realVars[74] /* body.w_a[1] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[3] /* body.I[1,2] PARAM */)) * ((data->localData[0]->realVars[75] /* body.w_a[2] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[4] /* body.I[1,3] PARAM */)) * ((data->localData[0]->realVars[76] /* body.w_a[3] DUMMY_STATE */))) + ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)) * ((data->localData[0]->realVars[174] /* cutForce.frame_a.f[1] variable */)) + ((-(data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */))) * ((data->localData[0]->realVars[176] /* cutForce.frame_a.f[3] variable */)) - (((data->localData[0]->realVars[74] /* body.w_a[1] DUMMY_STATE */)) * (((data->simulationInfo->realParameter[8] /* body.I[3,1] PARAM */)) * ((data->localData[0]->realVars[74] /* body.w_a[1] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[9] /* body.I[3,2] PARAM */)) * ((data->localData[0]->realVars[75] /* body.w_a[2] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[10] /* body.I[3,3] PARAM */)) * ((data->localData[0]->realVars[76] /* body.w_a[3] DUMMY_STATE */))));
  TRACE_POP
}
/*
equation index: 732
type: SIMPLE_ASSIGN
revolute.tau = cutForce.frame_a.t[2] * revolute.e[2] + cutForce.frame_a.t[3] * revolute.e[3] + cutForce.frame_a.t[1] * revolute.e[1]
*/
void inerter_test3_eqFunction_732(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,732};
  (data->localData[0]->realVars[245] /* revolute.tau variable */) = ((data->localData[0]->realVars[178] /* cutForce.frame_a.t[2] variable */)) * ((data->simulationInfo->realParameter[223] /* revolute.e[2] PARAM */)) + ((data->localData[0]->realVars[179] /* cutForce.frame_a.t[3] variable */)) * ((data->simulationInfo->realParameter[224] /* revolute.e[3] PARAM */)) + ((data->localData[0]->realVars[177] /* cutForce.frame_a.t[1] variable */)) * ((data->simulationInfo->realParameter[222] /* revolute.e[1] PARAM */));
  TRACE_POP
}
/*
equation index: 733
type: SIMPLE_ASSIGN
idealGearR2T.flangeT.f = idealGearR2T.ratio * revolute.tau
*/
void inerter_test3_eqFunction_733(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,733};
  (data->localData[0]->realVars[201] /* idealGearR2T.flangeT.f variable */) = ((data->simulationInfo->realParameter[188] /* idealGearR2T.ratio PARAM */)) * ((data->localData[0]->realVars[245] /* revolute.tau variable */));
  TRACE_POP
}
/*
equation index: 734
type: SIMPLE_ASSIGN
bodyShape.frame_b.t[3] = (-cutForce.frame_a.R.T[1,3]) * cutForce.frame_a.t[1] - cutForce.frame_a.R.T[2,3] * cutForce.frame_a.t[2] - cutForce.frame_a.R.T[3,3] * cutForce.frame_a.t[3]
*/
void inerter_test3_eqFunction_734(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,734};
  (data->localData[0]->realVars[124] /* bodyShape.frame_b.t[3] variable */) = ((-(data->localData[0]->realVars[167] /* cutForce.frame_a.R.T[1,3] variable */))) * ((data->localData[0]->realVars[177] /* cutForce.frame_a.t[1] variable */)) - (((data->localData[0]->realVars[170] /* cutForce.frame_a.R.T[2,3] variable */)) * ((data->localData[0]->realVars[178] /* cutForce.frame_a.t[2] variable */))) - (((data->localData[0]->realVars[173] /* cutForce.frame_a.R.T[3,3] variable */)) * ((data->localData[0]->realVars[179] /* cutForce.frame_a.t[3] variable */)));
  TRACE_POP
}
/*
equation index: 735
type: SIMPLE_ASSIGN
bodyShape.frame_a.t[3] = -bodyShape.frame_b.t[3]
*/
void inerter_test3_eqFunction_735(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,735};
  (data->localData[0]->realVars[119] /* bodyShape.frame_a.t[3] variable */) = (-(data->localData[0]->realVars[124] /* bodyShape.frame_b.t[3] variable */));
  TRACE_POP
}
/*
equation index: 736
type: SIMPLE_ASSIGN
revolute.frame_a.t[2] = cutForce.frame_a.R.T[3,2] * cutForce.frame_a.t[3] + cutForce.frame_a.R.T[1,2] * cutForce.frame_a.t[1] + cutForce.frame_a.R.T[2,2] * cutForce.frame_a.t[2]
*/
void inerter_test3_eqFunction_736(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,736};
  (data->localData[0]->realVars[242] /* revolute.frame_a.t[2] variable */) = ((data->localData[0]->realVars[172] /* cutForce.frame_a.R.T[3,2] variable */)) * ((data->localData[0]->realVars[179] /* cutForce.frame_a.t[3] variable */)) + ((data->localData[0]->realVars[166] /* cutForce.frame_a.R.T[1,2] variable */)) * ((data->localData[0]->realVars[177] /* cutForce.frame_a.t[1] variable */)) + ((data->localData[0]->realVars[169] /* cutForce.frame_a.R.T[2,2] variable */)) * ((data->localData[0]->realVars[178] /* cutForce.frame_a.t[2] variable */));
  TRACE_POP
}
/*
equation index: 737
type: SIMPLE_ASSIGN
revolute.frame_a.t[1] = cutForce.frame_a.R.T[3,1] * cutForce.frame_a.t[3] + cutForce.frame_a.R.T[1,1] * cutForce.frame_a.t[1] + cutForce.frame_a.R.T[2,1] * cutForce.frame_a.t[2]
*/
void inerter_test3_eqFunction_737(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,737};
  (data->localData[0]->realVars[241] /* revolute.frame_a.t[1] variable */) = ((data->localData[0]->realVars[171] /* cutForce.frame_a.R.T[3,1] variable */)) * ((data->localData[0]->realVars[179] /* cutForce.frame_a.t[3] variable */)) + ((data->localData[0]->realVars[165] /* cutForce.frame_a.R.T[1,1] variable */)) * ((data->localData[0]->realVars[177] /* cutForce.frame_a.t[1] variable */)) + ((data->localData[0]->realVars[168] /* cutForce.frame_a.R.T[2,1] variable */)) * ((data->localData[0]->realVars[178] /* cutForce.frame_a.t[2] variable */));
  TRACE_POP
}
/*
equation index: 738
type: SIMPLE_ASSIGN
prismatic.f = cutForce.frame_a.R.T[3,3] * cutForce.frame_a.f[3] + cutForce.frame_a.R.T[1,3] * cutForce.frame_a.f[1] + cutForce.frame_a.R.T[2,3] * cutForce.frame_a.f[2]
*/
void inerter_test3_eqFunction_738(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,738};
  (data->localData[0]->realVars[222] /* prismatic.f variable */) = ((data->localData[0]->realVars[173] /* cutForce.frame_a.R.T[3,3] variable */)) * ((data->localData[0]->realVars[176] /* cutForce.frame_a.f[3] variable */)) + ((data->localData[0]->realVars[167] /* cutForce.frame_a.R.T[1,3] variable */)) * ((data->localData[0]->realVars[174] /* cutForce.frame_a.f[1] variable */)) + ((data->localData[0]->realVars[170] /* cutForce.frame_a.R.T[2,3] variable */)) * ((data->localData[0]->realVars[175] /* cutForce.frame_a.f[2] variable */));
  TRACE_POP
}
/*
equation index: 739
type: SIMPLE_ASSIGN
prismatic.support.f = (-idealGearR2T.flangeT.f) - prismatic.f
*/
void inerter_test3_eqFunction_739(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,739};
  (data->localData[0]->realVars[226] /* prismatic.support.f variable */) = (-(data->localData[0]->realVars[201] /* idealGearR2T.flangeT.f variable */)) - (data->localData[0]->realVars[222] /* prismatic.f variable */);
  TRACE_POP
}
/*
equation index: 740
type: SIMPLE_ASSIGN
position.support.f = springDamper.f + idealGearR2T.flangeT.f + prismatic.f
*/
void inerter_test3_eqFunction_740(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,740};
  (data->localData[0]->realVars[205] /* position.support.f variable */) = (data->localData[0]->realVars[247] /* springDamper.f variable */) + (data->localData[0]->realVars[201] /* idealGearR2T.flangeT.f variable */) + (data->localData[0]->realVars[222] /* prismatic.f variable */);
  TRACE_POP
}
/*
equation index: 741
type: SIMPLE_ASSIGN
bodyShape.frame_a.f[3] = prismatic.f
*/
void inerter_test3_eqFunction_741(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,741};
  (data->localData[0]->realVars[116] /* bodyShape.frame_a.f[3] variable */) = (data->localData[0]->realVars[222] /* prismatic.f variable */);
  TRACE_POP
}
/*
equation index: 742
type: SIMPLE_ASSIGN
bodyShape.frame_b.f[2] = (-cutForce.frame_a.R.T[1,2]) * cutForce.frame_a.f[1] - cutForce.frame_a.R.T[2,2] * cutForce.frame_a.f[2] - cutForce.frame_a.R.T[3,2] * cutForce.frame_a.f[3]
*/
void inerter_test3_eqFunction_742(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,742};
  (data->localData[0]->realVars[121] /* bodyShape.frame_b.f[2] variable */) = ((-(data->localData[0]->realVars[166] /* cutForce.frame_a.R.T[1,2] variable */))) * ((data->localData[0]->realVars[174] /* cutForce.frame_a.f[1] variable */)) - (((data->localData[0]->realVars[169] /* cutForce.frame_a.R.T[2,2] variable */)) * ((data->localData[0]->realVars[175] /* cutForce.frame_a.f[2] variable */))) - (((data->localData[0]->realVars[172] /* cutForce.frame_a.R.T[3,2] variable */)) * ((data->localData[0]->realVars[176] /* cutForce.frame_a.f[3] variable */)));
  TRACE_POP
}
/*
equation index: 743
type: SIMPLE_ASSIGN
bodyShape.frame_b.t[1] = (-bodyShape.frame_b.f[2]) * prismatic.s - revolute.frame_a.t[1]
*/
void inerter_test3_eqFunction_743(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,743};
  (data->localData[0]->realVars[122] /* bodyShape.frame_b.t[1] variable */) = ((-(data->localData[0]->realVars[121] /* bodyShape.frame_b.f[2] variable */))) * ((data->localData[0]->realVars[0] /* prismatic.s STATE(1,prismatic.v) */)) - (data->localData[0]->realVars[241] /* revolute.frame_a.t[1] variable */);
  TRACE_POP
}
/*
equation index: 744
type: SIMPLE_ASSIGN
bodyShape.frame_a.t[1] = -bodyShape.frame_b.t[1]
*/
void inerter_test3_eqFunction_744(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,744};
  (data->localData[0]->realVars[117] /* bodyShape.frame_a.t[1] variable */) = (-(data->localData[0]->realVars[122] /* bodyShape.frame_b.t[1] variable */));
  TRACE_POP
}
/*
equation index: 745
type: SIMPLE_ASSIGN
bodyShape.frame_a.f[2] = -bodyShape.frame_b.f[2]
*/
void inerter_test3_eqFunction_745(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,745};
  (data->localData[0]->realVars[115] /* bodyShape.frame_a.f[2] variable */) = (-(data->localData[0]->realVars[121] /* bodyShape.frame_b.f[2] variable */));
  TRACE_POP
}
/*
equation index: 746
type: SIMPLE_ASSIGN
bodyShape.frame_b.f[1] = (-cutForce.frame_a.R.T[1,1]) * cutForce.frame_a.f[1] - cutForce.frame_a.R.T[2,1] * cutForce.frame_a.f[2] - cutForce.frame_a.R.T[3,1] * cutForce.frame_a.f[3]
*/
void inerter_test3_eqFunction_746(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,746};
  (data->localData[0]->realVars[120] /* bodyShape.frame_b.f[1] variable */) = ((-(data->localData[0]->realVars[165] /* cutForce.frame_a.R.T[1,1] variable */))) * ((data->localData[0]->realVars[174] /* cutForce.frame_a.f[1] variable */)) - (((data->localData[0]->realVars[168] /* cutForce.frame_a.R.T[2,1] variable */)) * ((data->localData[0]->realVars[175] /* cutForce.frame_a.f[2] variable */))) - (((data->localData[0]->realVars[171] /* cutForce.frame_a.R.T[3,1] variable */)) * ((data->localData[0]->realVars[176] /* cutForce.frame_a.f[3] variable */)));
  TRACE_POP
}
/*
equation index: 747
type: SIMPLE_ASSIGN
bodyShape.frame_b.t[2] = bodyShape.frame_b.f[1] * prismatic.s - revolute.frame_a.t[2]
*/
void inerter_test3_eqFunction_747(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,747};
  (data->localData[0]->realVars[123] /* bodyShape.frame_b.t[2] variable */) = ((data->localData[0]->realVars[120] /* bodyShape.frame_b.f[1] variable */)) * ((data->localData[0]->realVars[0] /* prismatic.s STATE(1,prismatic.v) */)) - (data->localData[0]->realVars[242] /* revolute.frame_a.t[2] variable */);
  TRACE_POP
}
/*
equation index: 748
type: SIMPLE_ASSIGN
bodyShape.frame_a.t[2] = -bodyShape.frame_b.t[2]
*/
void inerter_test3_eqFunction_748(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,748};
  (data->localData[0]->realVars[118] /* bodyShape.frame_a.t[2] variable */) = (-(data->localData[0]->realVars[123] /* bodyShape.frame_b.t[2] variable */));
  TRACE_POP
}
/*
equation index: 749
type: SIMPLE_ASSIGN
bodyShape.frame_a.f[1] = -bodyShape.frame_b.f[1]
*/
void inerter_test3_eqFunction_749(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,749};
  (data->localData[0]->realVars[114] /* bodyShape.frame_a.f[1] variable */) = (-(data->localData[0]->realVars[120] /* bodyShape.frame_b.f[1] variable */));
  TRACE_POP
}
/*
equation index: 750
type: SIMPLE_ASSIGN
$DER.prismatic.v = body.a_0[3]
*/
void inerter_test3_eqFunction_750(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,750};
  (data->localData[0]->realVars[3] /* der(prismatic.v) STATE_DER */) = (data->localData[0]->realVars[30] /* body.a_0[3] variable */);
  TRACE_POP
}
/*
equation index: 751
type: SIMPLE_ASSIGN
$DER.position.v = body.a_0[3]
*/
void inerter_test3_eqFunction_751(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,751};
  (data->localData[0]->realVars[14] /* der(position.v) DUMMY_DER */) = (data->localData[0]->realVars[30] /* body.a_0[3] variable */);
  TRACE_POP
}
/*
equation index: 752
type: SIMPLE_ASSIGN
prismatic.a = body.a_0[3]
*/
void inerter_test3_eqFunction_752(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,752};
  (data->localData[0]->realVars[207] /* prismatic.a variable */) = (data->localData[0]->realVars[30] /* body.a_0[3] variable */);
  TRACE_POP
}
/*
equation index: 753
type: SIMPLE_ASSIGN
$DER.springDamper.v_rel = body.a_0[3]
*/
void inerter_test3_eqFunction_753(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,753};
  (data->localData[0]->realVars[21] /* der(springDamper.v_rel) DUMMY_DER */) = (data->localData[0]->realVars[30] /* body.a_0[3] variable */);
  TRACE_POP
}
/*
equation index: 754
type: SIMPLE_ASSIGN
position.a = body.a_0[3]
*/
void inerter_test3_eqFunction_754(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,754};
  (data->localData[0]->realVars[202] /* position.a variable */) = (data->localData[0]->realVars[30] /* body.a_0[3] variable */);
  TRACE_POP
}
/*
equation index: 755
type: SIMPLE_ASSIGN
$DER.body.v_0[3] = body.a_0[3]
*/
void inerter_test3_eqFunction_755(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,755};
  (data->localData[0]->realVars[9] /* der(body.v_0[3]) DUMMY_DER */) = (data->localData[0]->realVars[30] /* body.a_0[3] variable */);
  TRACE_POP
}
/*
equation index: 756
type: ARRAY_CALL_ASSIGN

world.z_label.R_lines = Modelica.Mechanics.MultiBody.Frames.TransformationMatrices.from_nxy({0.0, 0.0, 1.0}, {0.0, 1.0, 0.0})
*/
void inerter_test3_eqFunction_756(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,756};
  real_array tmp7;
  real_array_create(&tmp7, ((modelica_real*)&((&(data->localData[0]->realVars[580] /* world.z_label.R_lines[1,1] variable */))[(((modelica_integer) 1) - 1) * 3 + (((modelica_integer) 1)-1)])), 2, (_index_t)3, (_index_t)3);
  real_array_copy_data(omc_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_from__nxy(threadData, _OMC_LIT3, _OMC_LIT2), tmp7);
  TRACE_POP
}
/*
equation index: 757
type: SIMPLE_ASSIGN
world.z_label.cylinders[3].r[2] = world.z_label.R_lines[2,2] * world.scaledLabel
*/
void inerter_test3_eqFunction_757(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,757};
  (data->localData[0]->realVars[605] /* world.z_label.cylinders[3].r[2] variable */) = ((data->localData[0]->realVars[584] /* world.z_label.R_lines[2,2] variable */)) * ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 758
type: SIMPLE_ASSIGN
world.z_label.cylinders[2].lengthDirection[1] = world.z_label.R_lines[1,1] * world.scaledLabel
*/
void inerter_test3_eqFunction_758(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,758};
  (data->localData[0]->realVars[598] /* world.z_label.cylinders[2].lengthDirection[1] variable */) = ((data->localData[0]->realVars[580] /* world.z_label.R_lines[1,1] variable */)) * ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 759
type: SIMPLE_ASSIGN
world.z_label.cylinders[3].r[1] = world.z_label.R_lines[2,1] * world.scaledLabel
*/
void inerter_test3_eqFunction_759(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,759};
  (data->localData[0]->realVars[604] /* world.z_label.cylinders[3].r[1] variable */) = ((data->localData[0]->realVars[583] /* world.z_label.R_lines[2,1] variable */)) * ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 760
type: SIMPLE_ASSIGN
world.z_label.cylinders[3].lengthDirection[1] = (world.z_label.R_lines[1,1] - world.z_label.R_lines[2,1]) * world.scaledLabel
*/
void inerter_test3_eqFunction_760(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,760};
  (data->localData[0]->realVars[601] /* world.z_label.cylinders[3].lengthDirection[1] variable */) = ((data->localData[0]->realVars[580] /* world.z_label.R_lines[1,1] variable */) - (data->localData[0]->realVars[583] /* world.z_label.R_lines[2,1] variable */)) * ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 761
type: SIMPLE_ASSIGN
world.z_label.cylinders[2].lengthDirection[2] = world.z_label.R_lines[1,2] * world.scaledLabel
*/
void inerter_test3_eqFunction_761(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,761};
  (data->localData[0]->realVars[599] /* world.z_label.cylinders[2].lengthDirection[2] variable */) = ((data->localData[0]->realVars[581] /* world.z_label.R_lines[1,2] variable */)) * ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 762
type: SIMPLE_ASSIGN
world.z_label.cylinders[3].lengthDirection[2] = (world.z_label.R_lines[1,2] - world.z_label.R_lines[2,2]) * world.scaledLabel
*/
void inerter_test3_eqFunction_762(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,762};
  (data->localData[0]->realVars[602] /* world.z_label.cylinders[3].lengthDirection[2] variable */) = ((data->localData[0]->realVars[581] /* world.z_label.R_lines[1,2] variable */) - (data->localData[0]->realVars[584] /* world.z_label.R_lines[2,2] variable */)) * ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 763
type: SIMPLE_ASSIGN
world.z_label.cylinders[3].r[3] = world.labelStart + world.z_label.R_lines[2,3] * world.scaledLabel
*/
void inerter_test3_eqFunction_763(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,763};
  (data->localData[0]->realVars[606] /* world.z_label.cylinders[3].r[3] variable */) = (data->simulationInfo->realParameter[268] /* world.labelStart PARAM */) + ((data->localData[0]->realVars[585] /* world.z_label.R_lines[2,3] variable */)) * ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 764
type: SIMPLE_ASSIGN
world.z_label.cylinders[2].lengthDirection[3] = world.z_label.R_lines[1,3] * world.scaledLabel
*/
void inerter_test3_eqFunction_764(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,764};
  (data->localData[0]->realVars[600] /* world.z_label.cylinders[2].lengthDirection[3] variable */) = ((data->localData[0]->realVars[582] /* world.z_label.R_lines[1,3] variable */)) * ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 765
type: SIMPLE_ASSIGN
world.z_label.cylinders[3].lengthDirection[3] = (world.z_label.R_lines[1,3] - world.z_label.R_lines[2,3]) * world.scaledLabel
*/
void inerter_test3_eqFunction_765(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,765};
  (data->localData[0]->realVars[603] /* world.z_label.cylinders[3].lengthDirection[3] variable */) = ((data->localData[0]->realVars[582] /* world.z_label.R_lines[1,3] variable */) - (data->localData[0]->realVars[585] /* world.z_label.R_lines[2,3] variable */)) * ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 766
type: ARRAY_CALL_ASSIGN

world.y_label.R_lines = Modelica.Mechanics.MultiBody.Frames.TransformationMatrices.from_nxy({0.0, 1.0, 0.0}, {-1.0, 0.0, 0.0})
*/
void inerter_test3_eqFunction_766(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,766};
  real_array tmp8;
  real_array_create(&tmp8, ((modelica_real*)&((&(data->localData[0]->realVars[456] /* world.y_label.R_lines[1,1] variable */))[(((modelica_integer) 1) - 1) * 3 + (((modelica_integer) 1)-1)])), 2, (_index_t)3, (_index_t)3);
  real_array_copy_data(omc_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_from__nxy(threadData, _OMC_LIT2, _OMC_LIT4), tmp8);
  TRACE_POP
}
/*
equation index: 767
type: SIMPLE_ASSIGN
world.y_label.cylinders[2].r[2] = world.labelStart + world.y_label.R_lines[2,2] * world.y_label.lines[2,1,2]
*/
void inerter_test3_eqFunction_767(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,767};
  (data->localData[0]->realVars[479] /* world.y_label.cylinders[2].r[2] variable */) = (data->simulationInfo->realParameter[268] /* world.labelStart PARAM */) + ((data->localData[0]->realVars[460] /* world.y_label.R_lines[2,2] variable */)) * ((data->localData[0]->realVars[497] /* world.y_label.lines[2,1,2] variable */));
  TRACE_POP
}
/*
equation index: 768
type: SIMPLE_ASSIGN
world.y_label.cylinders[1].lengthDirection[1] = world.y_label.R_lines[1,1] * world.scaledLabel + world.y_label.R_lines[2,1] * world.y_label.lines[1,2,2]
*/
void inerter_test3_eqFunction_768(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,768};
  (data->localData[0]->realVars[472] /* world.y_label.cylinders[1].lengthDirection[1] variable */) = ((data->localData[0]->realVars[456] /* world.y_label.R_lines[1,1] variable */)) * ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */)) + ((data->localData[0]->realVars[459] /* world.y_label.R_lines[2,1] variable */)) * ((data->localData[0]->realVars[495] /* world.y_label.lines[1,2,2] variable */));
  TRACE_POP
}
/*
equation index: 769
type: SIMPLE_ASSIGN
world.y_label.cylinders[2].r[1] = world.y_label.R_lines[2,1] * world.y_label.lines[2,1,2]
*/
void inerter_test3_eqFunction_769(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,769};
  (data->localData[0]->realVars[478] /* world.y_label.cylinders[2].r[1] variable */) = ((data->localData[0]->realVars[459] /* world.y_label.R_lines[2,1] variable */)) * ((data->localData[0]->realVars[497] /* world.y_label.lines[2,1,2] variable */));
  TRACE_POP
}
/*
equation index: 770
type: SIMPLE_ASSIGN
world.y_label.cylinders[2].lengthDirection[1] = world.y_label.R_lines[1,1] * world.y_label.lines[2,2,1] + world.y_label.R_lines[2,1] * (world.y_label.lines[2,2,2] - world.y_label.lines[2,1,2])
*/
void inerter_test3_eqFunction_770(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,770};
  (data->localData[0]->realVars[475] /* world.y_label.cylinders[2].lengthDirection[1] variable */) = ((data->localData[0]->realVars[456] /* world.y_label.R_lines[1,1] variable */)) * ((data->localData[0]->realVars[498] /* world.y_label.lines[2,2,1] variable */)) + ((data->localData[0]->realVars[459] /* world.y_label.R_lines[2,1] variable */)) * ((data->localData[0]->realVars[499] /* world.y_label.lines[2,2,2] variable */) - (data->localData[0]->realVars[497] /* world.y_label.lines[2,1,2] variable */));
  TRACE_POP
}
/*
equation index: 771
type: SIMPLE_ASSIGN
world.y_label.cylinders[1].lengthDirection[2] = world.y_label.R_lines[1,2] * world.scaledLabel + world.y_label.R_lines[2,2] * world.y_label.lines[1,2,2]
*/
void inerter_test3_eqFunction_771(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,771};
  (data->localData[0]->realVars[473] /* world.y_label.cylinders[1].lengthDirection[2] variable */) = ((data->localData[0]->realVars[457] /* world.y_label.R_lines[1,2] variable */)) * ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */)) + ((data->localData[0]->realVars[460] /* world.y_label.R_lines[2,2] variable */)) * ((data->localData[0]->realVars[495] /* world.y_label.lines[1,2,2] variable */));
  TRACE_POP
}
/*
equation index: 772
type: SIMPLE_ASSIGN
world.y_label.cylinders[2].lengthDirection[2] = world.y_label.R_lines[1,2] * world.y_label.lines[2,2,1] + world.y_label.R_lines[2,2] * (world.y_label.lines[2,2,2] - world.y_label.lines[2,1,2])
*/
void inerter_test3_eqFunction_772(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,772};
  (data->localData[0]->realVars[476] /* world.y_label.cylinders[2].lengthDirection[2] variable */) = ((data->localData[0]->realVars[457] /* world.y_label.R_lines[1,2] variable */)) * ((data->localData[0]->realVars[498] /* world.y_label.lines[2,2,1] variable */)) + ((data->localData[0]->realVars[460] /* world.y_label.R_lines[2,2] variable */)) * ((data->localData[0]->realVars[499] /* world.y_label.lines[2,2,2] variable */) - (data->localData[0]->realVars[497] /* world.y_label.lines[2,1,2] variable */));
  TRACE_POP
}
/*
equation index: 773
type: SIMPLE_ASSIGN
world.y_label.cylinders[2].r[3] = world.y_label.R_lines[2,3] * world.y_label.lines[2,1,2]
*/
void inerter_test3_eqFunction_773(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,773};
  (data->localData[0]->realVars[480] /* world.y_label.cylinders[2].r[3] variable */) = ((data->localData[0]->realVars[461] /* world.y_label.R_lines[2,3] variable */)) * ((data->localData[0]->realVars[497] /* world.y_label.lines[2,1,2] variable */));
  TRACE_POP
}
/*
equation index: 774
type: SIMPLE_ASSIGN
world.y_label.cylinders[1].lengthDirection[3] = world.y_label.R_lines[1,3] * world.scaledLabel + world.y_label.R_lines[2,3] * world.y_label.lines[1,2,2]
*/
void inerter_test3_eqFunction_774(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,774};
  (data->localData[0]->realVars[474] /* world.y_label.cylinders[1].lengthDirection[3] variable */) = ((data->localData[0]->realVars[458] /* world.y_label.R_lines[1,3] variable */)) * ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */)) + ((data->localData[0]->realVars[461] /* world.y_label.R_lines[2,3] variable */)) * ((data->localData[0]->realVars[495] /* world.y_label.lines[1,2,2] variable */));
  TRACE_POP
}
/*
equation index: 775
type: SIMPLE_ASSIGN
world.y_label.cylinders[2].lengthDirection[3] = world.y_label.R_lines[1,3] * world.y_label.lines[2,2,1] + world.y_label.R_lines[2,3] * (world.y_label.lines[2,2,2] - world.y_label.lines[2,1,2])
*/
void inerter_test3_eqFunction_775(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,775};
  (data->localData[0]->realVars[477] /* world.y_label.cylinders[2].lengthDirection[3] variable */) = ((data->localData[0]->realVars[458] /* world.y_label.R_lines[1,3] variable */)) * ((data->localData[0]->realVars[498] /* world.y_label.lines[2,2,1] variable */)) + ((data->localData[0]->realVars[461] /* world.y_label.R_lines[2,3] variable */)) * ((data->localData[0]->realVars[499] /* world.y_label.lines[2,2,2] variable */) - (data->localData[0]->realVars[497] /* world.y_label.lines[2,1,2] variable */));
  TRACE_POP
}
/*
equation index: 776
type: ARRAY_CALL_ASSIGN

world.x_label.R_lines = Modelica.Mechanics.MultiBody.Frames.TransformationMatrices.from_nxy({1.0, 0.0, 0.0}, {0.0, 1.0, 0.0})
*/
void inerter_test3_eqFunction_776(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,776};
  real_array tmp9;
  real_array_create(&tmp9, ((modelica_real*)&((&(data->localData[0]->realVars[335] /* world.x_label.R_lines[1,1] variable */))[(((modelica_integer) 1) - 1) * 3 + (((modelica_integer) 1)-1)])), 2, (_index_t)3, (_index_t)3);
  real_array_copy_data(omc_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_from__nxy(threadData, _OMC_LIT1, _OMC_LIT2), tmp9);
  TRACE_POP
}
/*
equation index: 777
type: SIMPLE_ASSIGN
world.x_label.cylinders[2].r[2] = world.x_label.R_lines[2,2] * world.scaledLabel
*/
void inerter_test3_eqFunction_777(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,777};
  (data->localData[0]->realVars[358] /* world.x_label.cylinders[2].r[2] variable */) = ((data->localData[0]->realVars[339] /* world.x_label.R_lines[2,2] variable */)) * ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 778
type: SIMPLE_ASSIGN
world.x_label.cylinders[1].lengthDirection[1] = world.scaledLabel * (world.x_label.R_lines[1,1] + world.x_label.R_lines[2,1])
*/
void inerter_test3_eqFunction_778(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,778};
  (data->localData[0]->realVars[351] /* world.x_label.cylinders[1].lengthDirection[1] variable */) = ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */)) * ((data->localData[0]->realVars[335] /* world.x_label.R_lines[1,1] variable */) + (data->localData[0]->realVars[338] /* world.x_label.R_lines[2,1] variable */));
  TRACE_POP
}
/*
equation index: 779
type: SIMPLE_ASSIGN
world.x_label.cylinders[2].r[1] = world.labelStart + world.x_label.R_lines[2,1] * world.scaledLabel
*/
void inerter_test3_eqFunction_779(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,779};
  (data->localData[0]->realVars[357] /* world.x_label.cylinders[2].r[1] variable */) = (data->simulationInfo->realParameter[268] /* world.labelStart PARAM */) + ((data->localData[0]->realVars[338] /* world.x_label.R_lines[2,1] variable */)) * ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 780
type: SIMPLE_ASSIGN
world.x_label.cylinders[2].lengthDirection[1] = (world.x_label.R_lines[1,1] - world.x_label.R_lines[2,1]) * world.scaledLabel
*/
void inerter_test3_eqFunction_780(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,780};
  (data->localData[0]->realVars[354] /* world.x_label.cylinders[2].lengthDirection[1] variable */) = ((data->localData[0]->realVars[335] /* world.x_label.R_lines[1,1] variable */) - (data->localData[0]->realVars[338] /* world.x_label.R_lines[2,1] variable */)) * ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 781
type: SIMPLE_ASSIGN
world.x_label.cylinders[1].lengthDirection[2] = world.scaledLabel * (world.x_label.R_lines[1,2] + world.x_label.R_lines[2,2])
*/
void inerter_test3_eqFunction_781(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,781};
  (data->localData[0]->realVars[352] /* world.x_label.cylinders[1].lengthDirection[2] variable */) = ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */)) * ((data->localData[0]->realVars[336] /* world.x_label.R_lines[1,2] variable */) + (data->localData[0]->realVars[339] /* world.x_label.R_lines[2,2] variable */));
  TRACE_POP
}
/*
equation index: 782
type: SIMPLE_ASSIGN
world.x_label.cylinders[2].lengthDirection[2] = (world.x_label.R_lines[1,2] - world.x_label.R_lines[2,2]) * world.scaledLabel
*/
void inerter_test3_eqFunction_782(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,782};
  (data->localData[0]->realVars[355] /* world.x_label.cylinders[2].lengthDirection[2] variable */) = ((data->localData[0]->realVars[336] /* world.x_label.R_lines[1,2] variable */) - (data->localData[0]->realVars[339] /* world.x_label.R_lines[2,2] variable */)) * ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 783
type: SIMPLE_ASSIGN
world.x_label.cylinders[2].r[3] = world.x_label.R_lines[2,3] * world.scaledLabel
*/
void inerter_test3_eqFunction_783(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,783};
  (data->localData[0]->realVars[359] /* world.x_label.cylinders[2].r[3] variable */) = ((data->localData[0]->realVars[340] /* world.x_label.R_lines[2,3] variable */)) * ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 784
type: SIMPLE_ASSIGN
world.x_label.cylinders[1].lengthDirection[3] = world.scaledLabel * (world.x_label.R_lines[1,3] + world.x_label.R_lines[2,3])
*/
void inerter_test3_eqFunction_784(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,784};
  (data->localData[0]->realVars[353] /* world.x_label.cylinders[1].lengthDirection[3] variable */) = ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */)) * ((data->localData[0]->realVars[337] /* world.x_label.R_lines[1,3] variable */) + (data->localData[0]->realVars[340] /* world.x_label.R_lines[2,3] variable */));
  TRACE_POP
}
/*
equation index: 785
type: SIMPLE_ASSIGN
world.x_label.cylinders[2].lengthDirection[3] = (world.x_label.R_lines[1,3] - world.x_label.R_lines[2,3]) * world.scaledLabel
*/
void inerter_test3_eqFunction_785(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,785};
  (data->localData[0]->realVars[356] /* world.x_label.cylinders[2].lengthDirection[3] variable */) = ((data->localData[0]->realVars[337] /* world.x_label.R_lines[1,3] variable */) - (data->localData[0]->realVars[340] /* world.x_label.R_lines[2,3] variable */)) * ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */));
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
  inerter_test3_eqFunction_656(data, threadData);

  inerter_test3_eqFunction_657(data, threadData);

  inerter_test3_eqFunction_658(data, threadData);

  inerter_test3_eqFunction_659(data, threadData);

  inerter_test3_eqFunction_660(data, threadData);

  inerter_test3_eqFunction_661(data, threadData);

  inerter_test3_eqFunction_662(data, threadData);

  inerter_test3_eqFunction_663(data, threadData);

  inerter_test3_eqFunction_664(data, threadData);

  inerter_test3_eqFunction_665(data, threadData);

  inerter_test3_eqFunction_666(data, threadData);

  inerter_test3_eqFunction_667(data, threadData);

  inerter_test3_eqFunction_668(data, threadData);

  inerter_test3_eqFunction_669(data, threadData);

  inerter_test3_eqFunction_670(data, threadData);

  inerter_test3_eqFunction_671(data, threadData);

  inerter_test3_eqFunction_672(data, threadData);

  inerter_test3_eqFunction_673(data, threadData);

  inerter_test3_eqFunction_674(data, threadData);

  inerter_test3_eqFunction_675(data, threadData);

  inerter_test3_eqFunction_676(data, threadData);

  inerter_test3_eqFunction_677(data, threadData);

  inerter_test3_eqFunction_678(data, threadData);

  inerter_test3_eqFunction_679(data, threadData);

  inerter_test3_eqFunction_680(data, threadData);

  inerter_test3_eqFunction_681(data, threadData);

  inerter_test3_eqFunction_682(data, threadData);

  inerter_test3_eqFunction_683(data, threadData);

  inerter_test3_eqFunction_684(data, threadData);

  inerter_test3_eqFunction_685(data, threadData);

  inerter_test3_eqFunction_686(data, threadData);

  inerter_test3_eqFunction_687(data, threadData);

  inerter_test3_eqFunction_688(data, threadData);

  inerter_test3_eqFunction_689(data, threadData);

  inerter_test3_eqFunction_690(data, threadData);

  inerter_test3_eqFunction_691(data, threadData);

  inerter_test3_eqFunction_692(data, threadData);

  inerter_test3_eqFunction_693(data, threadData);

  inerter_test3_eqFunction_694(data, threadData);

  inerter_test3_eqFunction_695(data, threadData);

  inerter_test3_eqFunction_696(data, threadData);

  inerter_test3_eqFunction_697(data, threadData);

  inerter_test3_eqFunction_698(data, threadData);

  inerter_test3_eqFunction_699(data, threadData);

  inerter_test3_eqFunction_700(data, threadData);

  inerter_test3_eqFunction_701(data, threadData);

  inerter_test3_eqFunction_702(data, threadData);

  inerter_test3_eqFunction_703(data, threadData);

  inerter_test3_eqFunction_704(data, threadData);

  inerter_test3_eqFunction_705(data, threadData);

  inerter_test3_eqFunction_706(data, threadData);

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

  inerter_test3_eqFunction_758(data, threadData);

  inerter_test3_eqFunction_759(data, threadData);

  inerter_test3_eqFunction_760(data, threadData);

  inerter_test3_eqFunction_761(data, threadData);

  inerter_test3_eqFunction_762(data, threadData);

  inerter_test3_eqFunction_763(data, threadData);

  inerter_test3_eqFunction_764(data, threadData);

  inerter_test3_eqFunction_765(data, threadData);

  inerter_test3_eqFunction_766(data, threadData);

  inerter_test3_eqFunction_767(data, threadData);

  inerter_test3_eqFunction_768(data, threadData);

  inerter_test3_eqFunction_769(data, threadData);

  inerter_test3_eqFunction_770(data, threadData);

  inerter_test3_eqFunction_771(data, threadData);

  inerter_test3_eqFunction_772(data, threadData);

  inerter_test3_eqFunction_773(data, threadData);

  inerter_test3_eqFunction_774(data, threadData);

  inerter_test3_eqFunction_775(data, threadData);

  inerter_test3_eqFunction_776(data, threadData);

  inerter_test3_eqFunction_777(data, threadData);

  inerter_test3_eqFunction_778(data, threadData);

  inerter_test3_eqFunction_779(data, threadData);

  inerter_test3_eqFunction_780(data, threadData);

  inerter_test3_eqFunction_781(data, threadData);

  inerter_test3_eqFunction_782(data, threadData);

  inerter_test3_eqFunction_783(data, threadData);

  inerter_test3_eqFunction_784(data, threadData);

  inerter_test3_eqFunction_785(data, threadData);
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
extern void inerter_test3_eqFunction_683(DATA* data, threadData_t *threadData);
extern void inerter_test3_eqFunction_707(DATA* data, threadData_t *threadData);
extern void inerter_test3_eqFunction_708(DATA* data, threadData_t *threadData);
extern void inerter_test3_eqFunction_750(DATA* data, threadData_t *threadData);

static void functionODE_system0(DATA *data, threadData_t *threadData)
{
  {
    inerter_test3_eqFunction_683(data, threadData);
    threadData->lastEquationSolved = 683;
  }
  {
    inerter_test3_eqFunction_707(data, threadData);
    threadData->lastEquationSolved = 707;
  }
  {
    inerter_test3_eqFunction_708(data, threadData);
    threadData->lastEquationSolved = 708;
  }
  {
    inerter_test3_eqFunction_750(data, threadData);
    threadData->lastEquationSolved = 750;
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
   NULL,    /* initialLinearSystem */
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
  data->modelData->modelGUID = "{b59a6bc9-a0cf-4000-818c-563a2125baaf}";
  data->modelData->initXMLData = NULL;
  data->modelData->modelDataXml.infoXMLData = NULL;
  GC_asprintf(&data->modelData->modelDataXml.fileName, "%s/inerter_test3_info.json", data->modelData->resourcesDir);
  data->modelData->runTestsuite = 0;
  data->modelData->nStates = 2;
  data->modelData->nVariablesReal = 646;
  data->modelData->nDiscreteReal = 0;
  data->modelData->nVariablesInteger = 33;
  data->modelData->nVariablesBoolean = 2;
  data->modelData->nVariablesString = 0;
  data->modelData->nParametersReal = 335;
  data->modelData->nParametersInteger = 33;
  data->modelData->nParametersBoolean = 38;
  data->modelData->nParametersString = 23;
  data->modelData->nInputVars = 1;
  data->modelData->nOutputVars = 1;
  data->modelData->nAliasReal = 607;
  data->modelData->nAliasInteger = 30;
  data->modelData->nAliasBoolean = 1;
  data->modelData->nAliasString = 0;
  data->modelData->nZeroCrossings = 0;
  data->modelData->nSamples = 0;
  data->modelData->nRelations = 0;
  data->modelData->nMathEvents = 0;
  data->modelData->nExtObjs = 0;
  data->modelData->modelDataXml.modelInfoXmlLength = 0;
  data->modelData->modelDataXml.nFunctions = 5;
  data->modelData->modelDataXml.nProfileBlocks = 0;
  data->modelData->modelDataXml.nEquations = 1757;
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

