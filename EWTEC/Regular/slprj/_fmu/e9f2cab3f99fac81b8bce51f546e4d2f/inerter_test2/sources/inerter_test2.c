/* Main Simulation File */

#if defined(__cplusplus)
extern "C" {
#endif

#include "inerter_test2_model.h"
#include "simulation/solver/events.h"



/* dummy VARINFO and FILEINFO */
const VAR_INFO dummyVAR_INFO = omc_dummyVarInfo;

int inerter_test2_input_function(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  (data->localData[0]->realVars[615] /* u variable */) = data->simulationInfo->inputVars[0];
  
  TRACE_POP
  return 0;
}

int inerter_test2_input_function_init(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  data->simulationInfo->inputVars[0] = data->modelData->realVarsData[615].attribute.start;
  
  TRACE_POP
  return 0;
}

int inerter_test2_input_function_updateStartValues(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  data->modelData->realVarsData[615].attribute.start = data->simulationInfo->inputVars[0];
  
  TRACE_POP
  return 0;
}

int inerter_test2_inputNames(DATA *data, char ** names){
  TRACE_PUSH

  names[0] = (char *) data->modelData->realVarsData[615].info.name;
  
  TRACE_POP
  return 0;
}

int inerter_test2_data_function(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  TRACE_POP
  return 0;
}

int inerter_test2_dataReconciliationInputNames(DATA *data, char ** names){
  TRACE_PUSH

  
  TRACE_POP
  return 0;
}

int inerter_test2_dataReconciliationUnmeasuredVariables(DATA *data, char ** names)
{
  TRACE_PUSH

  
  TRACE_POP
  return 0;
}

int inerter_test2_output_function(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  data->simulationInfo->outputVars[0] = (data->localData[0]->realVars[1013] /* y variable */);
  data->simulationInfo->outputVars[1] = (data->localData[0]->realVars[1014] /* y1 variable */);
  data->simulationInfo->outputVars[2] = (data->localData[0]->realVars[1015] /* y11 variable */);
  
  TRACE_POP
  return 0;
}

int inerter_test2_setc_function(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  
  TRACE_POP
  return 0;
}

int inerter_test2_setb_function(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  
  TRACE_POP
  return 0;
}


/*
equation index: 984
type: SIMPLE_ASSIGN
prismatic.frame_b.t[1] = 0.0
*/
void inerter_test2_eqFunction_984(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,984};
  (data->localData[0]->realVars[577] /* prismatic.frame_b.t[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 985
type: SIMPLE_ASSIGN
prismatic.frame_b.t[2] = 0.0
*/
void inerter_test2_eqFunction_985(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,985};
  (data->localData[0]->realVars[578] /* prismatic.frame_b.t[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 986
type: SIMPLE_ASSIGN
world.frame_b.f[1] = 0.0
*/
void inerter_test2_eqFunction_986(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,986};
  (data->localData[0]->realVars[628] /* world.frame_b.f[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 987
type: SIMPLE_ASSIGN
world.frame_b.f[2] = 0.0
*/
void inerter_test2_eqFunction_987(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,987};
  (data->localData[0]->realVars[629] /* world.frame_b.f[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 988
type: SIMPLE_ASSIGN
world.frame_b.f[3] = 0.0
*/
void inerter_test2_eqFunction_988(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,988};
  (data->localData[0]->realVars[630] /* world.frame_b.f[3] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 989
type: SIMPLE_ASSIGN
world.frame_b.t[1] = 0.0
*/
void inerter_test2_eqFunction_989(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,989};
  (data->localData[0]->realVars[634] /* world.frame_b.t[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 990
type: SIMPLE_ASSIGN
world.frame_b.t[2] = 0.0
*/
void inerter_test2_eqFunction_990(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,990};
  (data->localData[0]->realVars[635] /* world.frame_b.t[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 991
type: SIMPLE_ASSIGN
world.frame_b.t[3] = 0.0
*/
void inerter_test2_eqFunction_991(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,991};
  (data->localData[0]->realVars[636] /* world.frame_b.t[3] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 992
type: SIMPLE_ASSIGN
bodyShape.frameTranslation.frame_a.f[1] = 0.0
*/
void inerter_test2_eqFunction_992(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,992};
  (data->localData[0]->realVars[442] /* bodyShape.frameTranslation.frame_a.f[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 993
type: SIMPLE_ASSIGN
revolute.frame_a.f[1] = 0.0
*/
void inerter_test2_eqFunction_993(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,993};
  (data->localData[0]->realVars[594] /* revolute.frame_a.f[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 994
type: SIMPLE_ASSIGN
prismatic.frame_a.f[1] = 0.0
*/
void inerter_test2_eqFunction_994(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,994};
  (data->localData[0]->realVars[568] /* prismatic.frame_a.f[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 995
type: SIMPLE_ASSIGN
bodyShape.frameTranslation.frame_a.f[2] = 0.0
*/
void inerter_test2_eqFunction_995(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,995};
  (data->localData[0]->realVars[443] /* bodyShape.frameTranslation.frame_a.f[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 996
type: SIMPLE_ASSIGN
revolute.frame_a.f[2] = 0.0
*/
void inerter_test2_eqFunction_996(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,996};
  (data->localData[0]->realVars[595] /* revolute.frame_a.f[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 997
type: SIMPLE_ASSIGN
prismatic.frame_a.f[2] = 0.0
*/
void inerter_test2_eqFunction_997(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,997};
  (data->localData[0]->realVars[569] /* prismatic.frame_a.f[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 998
type: SIMPLE_ASSIGN
bodyShape.frameTranslation.frame_a.t[1] = 0.0
*/
void inerter_test2_eqFunction_998(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,998};
  (data->localData[0]->realVars[444] /* bodyShape.frameTranslation.frame_a.t[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 999
type: SIMPLE_ASSIGN
prismatic.frame_a.t[1] = 0.0
*/
void inerter_test2_eqFunction_999(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,999};
  (data->localData[0]->realVars[573] /* prismatic.frame_a.t[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1000
type: SIMPLE_ASSIGN
bodyShape.frameTranslation.frame_a.t[2] = 0.0
*/
void inerter_test2_eqFunction_1000(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1000};
  (data->localData[0]->realVars[445] /* bodyShape.frameTranslation.frame_a.t[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1001
type: SIMPLE_ASSIGN
prismatic.frame_a.t[2] = 0.0
*/
void inerter_test2_eqFunction_1001(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1001};
  (data->localData[0]->realVars[574] /* prismatic.frame_a.t[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1002
type: SIMPLE_ASSIGN
bodyShape.frameTranslation.frame_a.t[3] = 0.0
*/
void inerter_test2_eqFunction_1002(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1002};
  (data->localData[0]->realVars[446] /* bodyShape.frameTranslation.frame_a.t[3] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1003
type: SIMPLE_ASSIGN
revolute.frame_a.t[3] = 0.0
*/
void inerter_test2_eqFunction_1003(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1003};
  (data->localData[0]->realVars[598] /* revolute.frame_a.t[3] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1004
type: SIMPLE_ASSIGN
prismatic.frame_a.t[3] = 0.0
*/
void inerter_test2_eqFunction_1004(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1004};
  (data->localData[0]->realVars[575] /* prismatic.frame_a.t[3] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1005
type: SIMPLE_ASSIGN
revolute.frame_b.f[1] = 0.0
*/
void inerter_test2_eqFunction_1005(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1005};
  (data->localData[0]->realVars[599] /* revolute.frame_b.f[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1006
type: SIMPLE_ASSIGN
cutForce.frame_b.f[1] = 0.0
*/
void inerter_test2_eqFunction_1006(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1006};
  (data->localData[0]->realVars[515] /* cutForce.frame_b.f[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1007
type: SIMPLE_ASSIGN
cutForce.cutForce.frame_b.f[1] = 0.0
*/
void inerter_test2_eqFunction_1007(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1007};
  (data->localData[0]->realVars[486] /* cutForce.cutForce.frame_b.f[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1008
type: SIMPLE_ASSIGN
revolute.frame_b.f[2] = 0.0
*/
void inerter_test2_eqFunction_1008(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1008};
  (data->localData[0]->realVars[600] /* revolute.frame_b.f[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1009
type: SIMPLE_ASSIGN
cutForce.frame_b.f[2] = 0.0
*/
void inerter_test2_eqFunction_1009(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1009};
  (data->localData[0]->realVars[516] /* cutForce.frame_b.f[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1010
type: SIMPLE_ASSIGN
cutForce.cutForce.frame_b.f[2] = 0.0
*/
void inerter_test2_eqFunction_1010(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1010};
  (data->localData[0]->realVars[487] /* cutForce.cutForce.frame_b.f[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1011
type: SIMPLE_ASSIGN
revolute.frame_b.f[3] = 0.0
*/
void inerter_test2_eqFunction_1011(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1011};
  (data->localData[0]->realVars[601] /* revolute.frame_b.f[3] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1012
type: SIMPLE_ASSIGN
cutForce.frame_b.f[3] = 0.0
*/
void inerter_test2_eqFunction_1012(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1012};
  (data->localData[0]->realVars[517] /* cutForce.frame_b.f[3] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1013
type: SIMPLE_ASSIGN
cutForce.cutForce.frame_b.f[3] = 0.0
*/
void inerter_test2_eqFunction_1013(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1013};
  (data->localData[0]->realVars[488] /* cutForce.cutForce.frame_b.f[3] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1014
type: SIMPLE_ASSIGN
revolute.frame_b.t[1] = 0.0
*/
void inerter_test2_eqFunction_1014(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1014};
  (data->localData[0]->realVars[602] /* revolute.frame_b.t[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1015
type: SIMPLE_ASSIGN
cutForce.frame_b.t[1] = 0.0
*/
void inerter_test2_eqFunction_1015(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1015};
  (data->localData[0]->realVars[518] /* cutForce.frame_b.t[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1016
type: SIMPLE_ASSIGN
cutForce.cutForce.frame_b.t[1] = 0.0
*/
void inerter_test2_eqFunction_1016(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1016};
  (data->localData[0]->realVars[489] /* cutForce.cutForce.frame_b.t[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1017
type: SIMPLE_ASSIGN
revolute.frame_b.t[2] = 0.0
*/
void inerter_test2_eqFunction_1017(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1017};
  (data->localData[0]->realVars[603] /* revolute.frame_b.t[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1018
type: SIMPLE_ASSIGN
cutForce.frame_b.t[2] = 0.0
*/
void inerter_test2_eqFunction_1018(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1018};
  (data->localData[0]->realVars[519] /* cutForce.frame_b.t[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1019
type: SIMPLE_ASSIGN
cutForce.cutForce.frame_b.t[2] = 0.0
*/
void inerter_test2_eqFunction_1019(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1019};
  (data->localData[0]->realVars[490] /* cutForce.cutForce.frame_b.t[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1020
type: SIMPLE_ASSIGN
revolute.frame_b.t[3] = 0.0
*/
void inerter_test2_eqFunction_1020(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1020};
  (data->localData[0]->realVars[604] /* revolute.frame_b.t[3] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1021
type: SIMPLE_ASSIGN
cutForce.frame_b.t[3] = 0.0
*/
void inerter_test2_eqFunction_1021(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1021};
  (data->localData[0]->realVars[520] /* cutForce.frame_b.t[3] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1022
type: SIMPLE_ASSIGN
cutForce.cutForce.frame_b.t[3] = 0.0
*/
void inerter_test2_eqFunction_1022(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1022};
  (data->localData[0]->realVars[491] /* cutForce.cutForce.frame_b.t[3] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1023
type: SIMPLE_ASSIGN
bodyShape.frameTranslation.frame_b.f[3] = 0.0
*/
void inerter_test2_eqFunction_1023(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1023};
  (data->localData[0]->realVars[447] /* bodyShape.frameTranslation.frame_b.f[3] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1024
type: SIMPLE_ASSIGN
bodyShape.frame_b.f[3] = 0.0
*/
void inerter_test2_eqFunction_1024(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1024};
  (data->localData[0]->realVars[456] /* bodyShape.frame_b.f[3] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1025
type: SIMPLE_ASSIGN
prismatic.frame_b.f[3] = 0.0
*/
void inerter_test2_eqFunction_1025(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1025};
  (data->localData[0]->realVars[576] /* prismatic.frame_b.f[3] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1026
type: SIMPLE_ASSIGN
idealGearR2T.fixedR.flange.tau = 0.0
*/
void inerter_test2_eqFunction_1026(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1026};
  (data->localData[0]->realVars[542] /* idealGearR2T.fixedR.flange.tau variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1027
type: SIMPLE_ASSIGN
idealGearR2T.flangeR.tau = 0.0
*/
void inerter_test2_eqFunction_1027(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1027};
  (data->localData[0]->realVars[543] /* idealGearR2T.flangeR.tau variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1028
type: SIMPLE_ASSIGN
idealGearR2T.internalSupportT.flange.f = 0.0
*/
void inerter_test2_eqFunction_1028(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1028};
  (data->localData[0]->realVars[546] /* idealGearR2T.internalSupportT.flange.f variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1029
type: SIMPLE_ASSIGN
idealGearR2T.internalSupportT.f = 0.0
*/
void inerter_test2_eqFunction_1029(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1029};
  (data->localData[0]->realVars[545] /* idealGearR2T.internalSupportT.f variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1030
type: SIMPLE_ASSIGN
SprungMassCase3.velocity.der1[1].u = 0.0
*/
void inerter_test2_eqFunction_1030(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1030};
  (data->localData[0]->realVars[238] /* SprungMassCase3.velocity.der1[1].u DUMMY_STATE */) = 0.0;
  TRACE_POP
}
/*
equation index: 1031
type: SIMPLE_ASSIGN
SprungMassCase3.der1[1].u = 0.0
*/
void inerter_test2_eqFunction_1031(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1031};
  (data->localData[0]->realVars[147] /* SprungMassCase3.der1[1].u DUMMY_STATE */) = 0.0;
  TRACE_POP
}
/*
equation index: 1032
type: SIMPLE_ASSIGN
SprungMassCase3.velocity.der1[2].u = 0.0
*/
void inerter_test2_eqFunction_1032(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1032};
  (data->localData[0]->realVars[239] /* SprungMassCase3.velocity.der1[2].u DUMMY_STATE */) = 0.0;
  TRACE_POP
}
/*
equation index: 1033
type: SIMPLE_ASSIGN
SprungMassCase3.der1[2].u = 0.0
*/
void inerter_test2_eqFunction_1033(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1033};
  (data->localData[0]->realVars[148] /* SprungMassCase3.der1[2].u DUMMY_STATE */) = 0.0;
  TRACE_POP
}
/*
equation index: 1034
type: SIMPLE_ASSIGN
SprungMassCase3.der1[3].u = 0.0
*/
void inerter_test2_eqFunction_1034(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1034};
  (data->localData[0]->realVars[149] /* SprungMassCase3.der1[3].u DUMMY_STATE */) = 0.0;
  TRACE_POP
}
/*
equation index: 1035
type: SIMPLE_ASSIGN
revolute.w = 0.0
*/
void inerter_test2_eqFunction_1035(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1035};
  (data->localData[0]->realVars[608] /* revolute.w DUMMY_STATE */) = 0.0;
  TRACE_POP
}
/*
equation index: 1036
type: SIMPLE_ASSIGN
revolute.R_rel.w[3] = 0.0
*/
void inerter_test2_eqFunction_1036(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1036};
  (data->localData[0]->realVars[582] /* revolute.R_rel.w[3] DUMMY_STATE */) = 0.0;
  TRACE_POP
}
/*
equation index: 1037
type: SIMPLE_ASSIGN
body.w_a[3] = 0.0
*/
void inerter_test2_eqFunction_1037(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1037};
  (data->localData[0]->realVars[404] /* body.w_a[3] DUMMY_STATE */) = 0.0;
  TRACE_POP
}
/*
equation index: 1038
type: SIMPLE_ASSIGN
revolute.R_rel.w[2] = 0.0
*/
void inerter_test2_eqFunction_1038(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1038};
  (data->localData[0]->realVars[581] /* revolute.R_rel.w[2] DUMMY_STATE */) = 0.0;
  TRACE_POP
}
/*
equation index: 1039
type: SIMPLE_ASSIGN
body.w_a[2] = 0.0
*/
void inerter_test2_eqFunction_1039(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1039};
  (data->localData[0]->realVars[403] /* body.w_a[2] DUMMY_STATE */) = 0.0;
  TRACE_POP
}
/*
equation index: 1040
type: SIMPLE_ASSIGN
revolute.R_rel.w[1] = 0.0
*/
void inerter_test2_eqFunction_1040(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1040};
  (data->localData[0]->realVars[580] /* revolute.R_rel.w[1] DUMMY_STATE */) = 0.0;
  TRACE_POP
}
/*
equation index: 1041
type: SIMPLE_ASSIGN
body.w_a[1] = 0.0
*/
void inerter_test2_eqFunction_1041(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1041};
  (data->localData[0]->realVars[402] /* body.w_a[1] DUMMY_STATE */) = 0.0;
  TRACE_POP
}
/*
equation index: 1042
type: SIMPLE_ASSIGN
springDamper.v_rel = 0.0
*/
void inerter_test2_eqFunction_1042(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1042};
  (data->localData[0]->realVars[614] /* springDamper.v_rel DUMMY_STATE */) = 0.0;
  TRACE_POP
}
/*
equation index: 1043
type: SIMPLE_ASSIGN
body.a_0[1] = 0.0
*/
void inerter_test2_eqFunction_1043(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1043};
  (data->localData[0]->realVars[356] /* body.a_0[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1044
type: SIMPLE_ASSIGN
body.a_0[2] = 0.0
*/
void inerter_test2_eqFunction_1044(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1044};
  (data->localData[0]->realVars[357] /* body.a_0[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1045
type: SIMPLE_ASSIGN
body.a_0[3] = 0.0
*/
void inerter_test2_eqFunction_1045(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1045};
  (data->localData[0]->realVars[358] /* body.a_0[3] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1046
type: SIMPLE_ASSIGN
$DER.revolute.phi = 0.0
*/
void inerter_test2_eqFunction_1046(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1046};
  (data->localData[0]->realVars[12] /* der(revolute.phi) DUMMY_DER */) = 0.0;
  TRACE_POP
}
/*
equation index: 1047
type: SIMPLE_ASSIGN
$DER.SprungMassCase3.velocity.der1[1].u = 0.0
*/
void inerter_test2_eqFunction_1047(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1047};
  (data->localData[0]->realVars[3] /* der(SprungMassCase3.velocity.der1[1].u) DUMMY_DER */) = 0.0;
  TRACE_POP
}
/*
equation index: 1048
type: SIMPLE_ASSIGN
$DER.SprungMassCase3.velocity.der1[2].u = 0.0
*/
void inerter_test2_eqFunction_1048(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1048};
  (data->localData[0]->realVars[4] /* der(SprungMassCase3.velocity.der1[2].u) DUMMY_DER */) = 0.0;
  TRACE_POP
}
/*
equation index: 1049
type: SIMPLE_ASSIGN
$DER.SprungMassCase3.velocity.der1[3].u = 0.0
*/
void inerter_test2_eqFunction_1049(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1049};
  (data->localData[0]->realVars[5] /* der(SprungMassCase3.velocity.der1[3].u) DUMMY_DER */) = 0.0;
  TRACE_POP
}
/*
equation index: 1050
type: SIMPLE_ASSIGN
SprungMassCase3.v[1] = 0.0
*/
void inerter_test2_eqFunction_1050(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1050};
  (data->localData[0]->realVars[236] /* SprungMassCase3.v[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1051
type: SIMPLE_ASSIGN
SprungMassCase3.v[2] = 0.0
*/
void inerter_test2_eqFunction_1051(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1051};
  (data->localData[0]->realVars[237] /* SprungMassCase3.v[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1052
type: SIMPLE_ASSIGN
$DER.SprungMassCase3.der1[1].u = 0.0
*/
void inerter_test2_eqFunction_1052(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1052};
  (data->localData[0]->realVars[0] /* der(SprungMassCase3.der1[1].u) DUMMY_DER */) = 0.0;
  TRACE_POP
}
/*
equation index: 1053
type: SIMPLE_ASSIGN
$DER.SprungMassCase3.der1[2].u = 0.0
*/
void inerter_test2_eqFunction_1053(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1053};
  (data->localData[0]->realVars[1] /* der(SprungMassCase3.der1[2].u) DUMMY_DER */) = 0.0;
  TRACE_POP
}
/*
equation index: 1054
type: SIMPLE_ASSIGN
$DER.SprungMassCase3.der1[3].u = 0.0
*/
void inerter_test2_eqFunction_1054(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1054};
  (data->localData[0]->realVars[2] /* der(SprungMassCase3.der1[3].u) DUMMY_DER */) = 0.0;
  TRACE_POP
}
/*
equation index: 1055
type: SIMPLE_ASSIGN
SprungMassCase3.a[1] = 0.0
*/
void inerter_test2_eqFunction_1055(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1055};
  (data->localData[0]->realVars[18] /* SprungMassCase3.a[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1056
type: SIMPLE_ASSIGN
SprungMassCase3.a[2] = 0.0
*/
void inerter_test2_eqFunction_1056(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1056};
  (data->localData[0]->realVars[19] /* SprungMassCase3.a[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1057
type: SIMPLE_ASSIGN
SprungMassCase3.a[3] = 0.0
*/
void inerter_test2_eqFunction_1057(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1057};
  (data->localData[0]->realVars[20] /* SprungMassCase3.a[3] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1058
type: SIMPLE_ASSIGN
revolute.a = 0.0
*/
void inerter_test2_eqFunction_1058(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1058};
  (data->localData[0]->realVars[583] /* revolute.a variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1059
type: SIMPLE_ASSIGN
$DER.revolute.R_rel.w[3] = 0.0
*/
void inerter_test2_eqFunction_1059(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1059};
  (data->localData[0]->realVars[11] /* der(revolute.R_rel.w[3]) DUMMY_DER */) = 0.0;
  TRACE_POP
}
/*
equation index: 1060
type: SIMPLE_ASSIGN
body.z_a[3] = 0.0
*/
void inerter_test2_eqFunction_1060(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1060};
  (data->localData[0]->realVars[407] /* body.z_a[3] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1061
type: SIMPLE_ASSIGN
$DER.body.w_a[3] = 0.0
*/
void inerter_test2_eqFunction_1061(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1061};
  (data->localData[0]->realVars[8] /* der(body.w_a[3]) DUMMY_DER */) = 0.0;
  TRACE_POP
}
/*
equation index: 1062
type: SIMPLE_ASSIGN
$DER.revolute.R_rel.w[2] = 0.0
*/
void inerter_test2_eqFunction_1062(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1062};
  (data->localData[0]->realVars[10] /* der(revolute.R_rel.w[2]) DUMMY_DER */) = 0.0;
  TRACE_POP
}
/*
equation index: 1063
type: SIMPLE_ASSIGN
body.z_a[2] = 0.0
*/
void inerter_test2_eqFunction_1063(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1063};
  (data->localData[0]->realVars[406] /* body.z_a[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1064
type: SIMPLE_ASSIGN
body.frame_a.f[1] = 0.0
*/
void inerter_test2_eqFunction_1064(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1064};
  (data->localData[0]->realVars[370] /* body.frame_a.f[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1065
type: SIMPLE_ASSIGN
$DER.body.w_a[2] = 0.0
*/
void inerter_test2_eqFunction_1065(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1065};
  (data->localData[0]->realVars[7] /* der(body.w_a[2]) DUMMY_DER */) = 0.0;
  TRACE_POP
}
/*
equation index: 1066
type: SIMPLE_ASSIGN
$DER.revolute.R_rel.w[1] = 0.0
*/
void inerter_test2_eqFunction_1066(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1066};
  (data->localData[0]->realVars[9] /* der(revolute.R_rel.w[1]) DUMMY_DER */) = 0.0;
  TRACE_POP
}
/*
equation index: 1067
type: SIMPLE_ASSIGN
body.z_a[1] = 0.0
*/
void inerter_test2_eqFunction_1067(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1067};
  (data->localData[0]->realVars[405] /* body.z_a[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1068
type: SIMPLE_ASSIGN
body.frame_a.f[3] = 0.0
*/
void inerter_test2_eqFunction_1068(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1068};
  (data->localData[0]->realVars[372] /* body.frame_a.f[3] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1069
type: SIMPLE_ASSIGN
body.frame_a.t[2] = 0.0
*/
void inerter_test2_eqFunction_1069(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1069};
  (data->localData[0]->realVars[374] /* body.frame_a.t[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1070
type: SIMPLE_ASSIGN
body.frame_a.f[2] = 0.0
*/
void inerter_test2_eqFunction_1070(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1070};
  (data->localData[0]->realVars[371] /* body.frame_a.f[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1071
type: SIMPLE_ASSIGN
body.frame_a.t[3] = 0.0
*/
void inerter_test2_eqFunction_1071(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1071};
  (data->localData[0]->realVars[375] /* body.frame_a.t[3] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1072
type: SIMPLE_ASSIGN
body.frame_a.t[1] = 0.0
*/
void inerter_test2_eqFunction_1072(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1072};
  (data->localData[0]->realVars[373] /* body.frame_a.t[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1073
type: SIMPLE_ASSIGN
revolute.tau = 0.0
*/
void inerter_test2_eqFunction_1073(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1073};
  (data->localData[0]->realVars[607] /* revolute.tau variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1074
type: SIMPLE_ASSIGN
bodyShape.frame_b.t[3] = 0.0
*/
void inerter_test2_eqFunction_1074(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1074};
  (data->localData[0]->realVars[459] /* bodyShape.frame_b.t[3] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1075
type: SIMPLE_ASSIGN
revolute.frame_a.t[2] = 0.0
*/
void inerter_test2_eqFunction_1075(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1075};
  (data->localData[0]->realVars[597] /* revolute.frame_a.t[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1076
type: SIMPLE_ASSIGN
revolute.frame_a.t[1] = 0.0
*/
void inerter_test2_eqFunction_1076(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1076};
  (data->localData[0]->realVars[596] /* revolute.frame_a.t[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1077
type: SIMPLE_ASSIGN
prismatic.f = 0.0
*/
void inerter_test2_eqFunction_1077(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1077};
  (data->localData[0]->realVars[567] /* prismatic.f variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1078
type: SIMPLE_ASSIGN
bodyShape.frame_b.f[2] = 0.0
*/
void inerter_test2_eqFunction_1078(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1078};
  (data->localData[0]->realVars[455] /* bodyShape.frame_b.f[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1079
type: SIMPLE_ASSIGN
bodyShape.frame_b.t[1] = 0.0
*/
void inerter_test2_eqFunction_1079(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1079};
  (data->localData[0]->realVars[457] /* bodyShape.frame_b.t[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1080
type: SIMPLE_ASSIGN
bodyShape.frame_b.f[1] = 0.0
*/
void inerter_test2_eqFunction_1080(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1080};
  (data->localData[0]->realVars[454] /* bodyShape.frame_b.f[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1081
type: SIMPLE_ASSIGN
bodyShape.frame_b.t[2] = 0.0
*/
void inerter_test2_eqFunction_1081(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1081};
  (data->localData[0]->realVars[458] /* bodyShape.frame_b.t[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1082
type: SIMPLE_ASSIGN
$DER.body.w_a[1] = 0.0
*/
void inerter_test2_eqFunction_1082(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1082};
  (data->localData[0]->realVars[6] /* der(body.w_a[1]) DUMMY_DER */) = 0.0;
  TRACE_POP
}
/*
equation index: 1083
type: SIMPLE_ASSIGN
$DER.revolute.w = 0.0
*/
void inerter_test2_eqFunction_1083(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1083};
  (data->localData[0]->realVars[13] /* der(revolute.w) DUMMY_DER */) = 0.0;
  TRACE_POP
}
/*
equation index: 1084
type: SIMPLE_ASSIGN
idealGearR2T.flangeT.f = 0.0
*/
void inerter_test2_eqFunction_1084(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1084};
  (data->localData[0]->realVars[544] /* idealGearR2T.flangeT.f variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1085
type: SIMPLE_ASSIGN
springDamper.f_d = 0.0
*/
void inerter_test2_eqFunction_1085(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1085};
  (data->localData[0]->realVars[611] /* springDamper.f_d variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1086
type: SIMPLE_ASSIGN
springDamper.lossPower = 0.0
*/
void inerter_test2_eqFunction_1086(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1086};
  (data->localData[0]->realVars[612] /* springDamper.lossPower variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1087
type: SIMPLE_ASSIGN
$DER.springDamper.v_rel = 0.0
*/
void inerter_test2_eqFunction_1087(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1087};
  (data->localData[0]->realVars[15] /* der(springDamper.v_rel) DUMMY_DER */) = 0.0;
  TRACE_POP
}
/*
equation index: 1088
type: SIMPLE_ASSIGN
$DER.springDamper.s_rel = 0.0
*/
void inerter_test2_eqFunction_1088(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1088};
  (data->localData[0]->realVars[14] /* der(springDamper.s_rel) DUMMY_DER */) = 0.0;
  TRACE_POP
}
/*
equation index: 1089
type: SIMPLE_ASSIGN
bodyShape.body.frame_a.f[1] = 0.0
*/
void inerter_test2_eqFunction_1089(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1089};
  (data->localData[0]->realVars[418] /* bodyShape.body.frame_a.f[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1090
type: SIMPLE_ASSIGN
bodyShape.frame_a.f[1] = 0.0
*/
void inerter_test2_eqFunction_1090(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1090};
  (data->localData[0]->realVars[448] /* bodyShape.frame_a.f[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1091
type: SIMPLE_ASSIGN
bodyShape.body.frame_a.f[2] = 0.0
*/
void inerter_test2_eqFunction_1091(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1091};
  (data->localData[0]->realVars[419] /* bodyShape.body.frame_a.f[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1092
type: SIMPLE_ASSIGN
bodyShape.frame_a.f[2] = 0.0
*/
void inerter_test2_eqFunction_1092(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1092};
  (data->localData[0]->realVars[449] /* bodyShape.frame_a.f[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1093
type: SIMPLE_ASSIGN
bodyShape.body.frame_a.f[3] = 0.0
*/
void inerter_test2_eqFunction_1093(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1093};
  (data->localData[0]->realVars[420] /* bodyShape.body.frame_a.f[3] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1094
type: SIMPLE_ASSIGN
bodyShape.frame_a.f[3] = 0.0
*/
void inerter_test2_eqFunction_1094(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1094};
  (data->localData[0]->realVars[450] /* bodyShape.frame_a.f[3] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1095
type: SIMPLE_ASSIGN
bodyShape.body.frame_a.t[1] = 0.0
*/
void inerter_test2_eqFunction_1095(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1095};
  (data->localData[0]->realVars[421] /* bodyShape.body.frame_a.t[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1096
type: SIMPLE_ASSIGN
bodyShape.frame_a.t[1] = 0.0
*/
void inerter_test2_eqFunction_1096(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1096};
  (data->localData[0]->realVars[451] /* bodyShape.frame_a.t[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1097
type: SIMPLE_ASSIGN
bodyShape.body.frame_a.t[2] = 0.0
*/
void inerter_test2_eqFunction_1097(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1097};
  (data->localData[0]->realVars[422] /* bodyShape.body.frame_a.t[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1098
type: SIMPLE_ASSIGN
bodyShape.frame_a.t[2] = 0.0
*/
void inerter_test2_eqFunction_1098(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1098};
  (data->localData[0]->realVars[452] /* bodyShape.frame_a.t[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1099
type: SIMPLE_ASSIGN
bodyShape.body.frame_a.t[3] = 0.0
*/
void inerter_test2_eqFunction_1099(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1099};
  (data->localData[0]->realVars[423] /* bodyShape.body.frame_a.t[3] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1100
type: SIMPLE_ASSIGN
bodyShape.frame_a.t[3] = 0.0
*/
void inerter_test2_eqFunction_1100(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1100};
  (data->localData[0]->realVars[453] /* bodyShape.frame_a.t[3] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1101
type: SIMPLE_ASSIGN
cutForce.forceArrow.r_head[1] = 0.0
*/
void inerter_test2_eqFunction_1101(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1101};
  (data->localData[0]->realVars[500] /* cutForce.forceArrow.r_head[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1102
type: SIMPLE_ASSIGN
cutForce.forceArrow.r_head[2] = 0.0
*/
void inerter_test2_eqFunction_1102(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1102};
  (data->localData[0]->realVars[501] /* cutForce.forceArrow.r_head[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1103
type: SIMPLE_ASSIGN
cutForce.forceArrow.r_head[3] = 0.0
*/
void inerter_test2_eqFunction_1103(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1103};
  (data->localData[0]->realVars[502] /* cutForce.forceArrow.r_head[3] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1104
type: SIMPLE_ASSIGN
cutForce.force[1] = 0.0
*/
void inerter_test2_eqFunction_1104(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1104};
  (data->localData[0]->realVars[498] /* cutForce.force[1] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1105
type: SIMPLE_ASSIGN
cutForce.force[2] = 0.0
*/
void inerter_test2_eqFunction_1105(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1105};
  (data->localData[0]->realVars[499] /* cutForce.force[2] variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1106
type: SIMPLE_ASSIGN
SprungMassCase3.velocity.der1[3].u = u
*/
void inerter_test2_eqFunction_1106(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1106};
  (data->localData[0]->realVars[240] /* SprungMassCase3.velocity.der1[3].u DUMMY_STATE */) = (data->localData[0]->realVars[615] /* u variable */);
  TRACE_POP
}
/*
equation index: 1107
type: SIMPLE_ASSIGN
prismatic.box.length = if noEvent(abs(u) > 1e-6) then u else 1e-6
*/
void inerter_test2_eqFunction_1107(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1107};
  modelica_boolean tmp0;
  tmp0 = Greater(fabs((data->localData[0]->realVars[615] /* u variable */)),1e-6);
  (data->localData[0]->realVars[557] /* prismatic.box.length variable */) = (tmp0?(data->localData[0]->realVars[615] /* u variable */):1e-6);
  TRACE_POP
}
/*
equation index: 1108
type: SIMPLE_ASSIGN
y = 0.0
*/
void inerter_test2_eqFunction_1108(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1108};
  (data->localData[0]->realVars[1013] /* y variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1109
type: SIMPLE_ASSIGN
y11 = 0.0
*/
void inerter_test2_eqFunction_1109(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1109};
  (data->localData[0]->realVars[1015] /* y11 variable */) = 0.0;
  TRACE_POP
}
/*
equation index: 1110
type: SIMPLE_ASSIGN
springDamper.s_rel = u - prismatic.fixed.s0
*/
void inerter_test2_eqFunction_1110(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1110};
  (data->localData[0]->realVars[613] /* springDamper.s_rel DUMMY_STATE */) = (data->localData[0]->realVars[615] /* u variable */) - (data->simulationInfo->realParameter[207] /* prismatic.fixed.s0 PARAM */);
  TRACE_POP
}
/*
equation index: 1111
type: SIMPLE_ASSIGN
springDamper.f = springDamper.c * (springDamper.s_rel - springDamper.s_rel0)
*/
void inerter_test2_eqFunction_1111(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1111};
  (data->localData[0]->realVars[609] /* springDamper.f variable */) = ((data->simulationInfo->realParameter[232] /* springDamper.c PARAM */)) * ((data->localData[0]->realVars[613] /* springDamper.s_rel DUMMY_STATE */) - (data->simulationInfo->realParameter[236] /* springDamper.s_rel0 PARAM */));
  TRACE_POP
}
/*
equation index: 1112
type: SIMPLE_ASSIGN
springDamper.f_c = springDamper.f
*/
void inerter_test2_eqFunction_1112(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1112};
  (data->localData[0]->realVars[610] /* springDamper.f_c variable */) = (data->localData[0]->realVars[609] /* springDamper.f variable */);
  TRACE_POP
}
/*
equation index: 1113
type: SIMPLE_ASSIGN
positionToForceAdaptor.f = springDamper.f
*/
void inerter_test2_eqFunction_1113(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1113};
  (data->localData[0]->realVars[547] /* positionToForceAdaptor.f variable */) = (data->localData[0]->realVars[609] /* springDamper.f variable */);
  TRACE_POP
}
/*
equation index: 1114
type: SIMPLE_ASSIGN
revolute.phi = idealGearR2T.ratio * (u - idealGearR2T.fixedT.s0) + idealGearR2T.fixedR.phi0
*/
void inerter_test2_eqFunction_1114(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1114};
  (data->localData[0]->realVars[605] /* revolute.phi DUMMY_STATE */) = ((data->simulationInfo->realParameter[192] /* idealGearR2T.ratio PARAM */)) * ((data->localData[0]->realVars[615] /* u variable */) - (data->simulationInfo->realParameter[187] /* idealGearR2T.fixedT.s0 PARAM */)) + (data->simulationInfo->realParameter[185] /* idealGearR2T.fixedR.phi0 PARAM */);
  TRACE_POP
}
/*
equation index: 1115
type: SIMPLE_ASSIGN
$cse2 = sin(revolute.phi)
*/
void inerter_test2_eqFunction_1115(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1115};
  (data->localData[0]->realVars[17] /* $cse2 variable */) = sin((data->localData[0]->realVars[605] /* revolute.phi DUMMY_STATE */));
  TRACE_POP
}
/*
equation index: 1116
type: SIMPLE_ASSIGN
$cse1 = cos(revolute.phi)
*/
void inerter_test2_eqFunction_1116(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1116};
  (data->localData[0]->realVars[16] /* $cse1 variable */) = cos((data->localData[0]->realVars[605] /* revolute.phi DUMMY_STATE */));
  TRACE_POP
}
/*
equation index: 1117
type: SIMPLE_ASSIGN
cutForce.frame_a.R.T[1,1] = revolute.e[1] ^ 2.0 + (1.0 - revolute.e[1] ^ 2.0) * $cse1
*/
void inerter_test2_eqFunction_1117(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1117};
  modelica_real tmp1;
  modelica_real tmp2;
  tmp1 = (data->simulationInfo->realParameter[222] /* revolute.e[1] PARAM */);
  tmp2 = (data->simulationInfo->realParameter[222] /* revolute.e[1] PARAM */);
  (data->localData[0]->realVars[506] /* cutForce.frame_a.R.T[1,1] variable */) = (tmp1 * tmp1) + (1.0 - ((tmp2 * tmp2))) * ((data->localData[0]->realVars[16] /* $cse1 variable */));
  TRACE_POP
}
/*
equation index: 1118
type: SIMPLE_ASSIGN
cutForce.frame_a.R.T[1,2] = (revolute.e[1] - revolute.e[1] * $cse1) * revolute.e[2] + revolute.e[3] * $cse2
*/
void inerter_test2_eqFunction_1118(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1118};
  (data->localData[0]->realVars[507] /* cutForce.frame_a.R.T[1,2] variable */) = ((data->simulationInfo->realParameter[222] /* revolute.e[1] PARAM */) - (((data->simulationInfo->realParameter[222] /* revolute.e[1] PARAM */)) * ((data->localData[0]->realVars[16] /* $cse1 variable */)))) * ((data->simulationInfo->realParameter[223] /* revolute.e[2] PARAM */)) + ((data->simulationInfo->realParameter[224] /* revolute.e[3] PARAM */)) * ((data->localData[0]->realVars[17] /* $cse2 variable */));
  TRACE_POP
}
/*
equation index: 1119
type: SIMPLE_ASSIGN
cutForce.frame_a.R.T[1,3] = (revolute.e[1] - revolute.e[1] * $cse1) * revolute.e[3] - revolute.e[2] * $cse2
*/
void inerter_test2_eqFunction_1119(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1119};
  (data->localData[0]->realVars[508] /* cutForce.frame_a.R.T[1,3] variable */) = ((data->simulationInfo->realParameter[222] /* revolute.e[1] PARAM */) - (((data->simulationInfo->realParameter[222] /* revolute.e[1] PARAM */)) * ((data->localData[0]->realVars[16] /* $cse1 variable */)))) * ((data->simulationInfo->realParameter[224] /* revolute.e[3] PARAM */)) - (((data->simulationInfo->realParameter[223] /* revolute.e[2] PARAM */)) * ((data->localData[0]->realVars[17] /* $cse2 variable */)));
  TRACE_POP
}
/*
equation index: 1120
type: SIMPLE_ASSIGN
SprungMassCase3.r[1] = cutForce.frame_a.R.T[1,3] * u
*/
void inerter_test2_eqFunction_1120(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1120};
  (data->localData[0]->realVars[189] /* SprungMassCase3.r[1] variable */) = ((data->localData[0]->realVars[508] /* cutForce.frame_a.R.T[1,3] variable */)) * ((data->localData[0]->realVars[615] /* u variable */));
  TRACE_POP
}
/*
equation index: 1121
type: SIMPLE_ASSIGN
cutForce.frame_a.R.T[2,1] = (revolute.e[2] - revolute.e[2] * $cse1) * revolute.e[1] - revolute.e[3] * $cse2
*/
void inerter_test2_eqFunction_1121(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1121};
  (data->localData[0]->realVars[509] /* cutForce.frame_a.R.T[2,1] variable */) = ((data->simulationInfo->realParameter[223] /* revolute.e[2] PARAM */) - (((data->simulationInfo->realParameter[223] /* revolute.e[2] PARAM */)) * ((data->localData[0]->realVars[16] /* $cse1 variable */)))) * ((data->simulationInfo->realParameter[222] /* revolute.e[1] PARAM */)) - (((data->simulationInfo->realParameter[224] /* revolute.e[3] PARAM */)) * ((data->localData[0]->realVars[17] /* $cse2 variable */)));
  TRACE_POP
}
/*
equation index: 1122
type: SIMPLE_ASSIGN
cutForce.frame_a.R.T[2,2] = revolute.e[2] ^ 2.0 + (1.0 - revolute.e[2] ^ 2.0) * $cse1
*/
void inerter_test2_eqFunction_1122(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1122};
  modelica_real tmp3;
  modelica_real tmp4;
  tmp3 = (data->simulationInfo->realParameter[223] /* revolute.e[2] PARAM */);
  tmp4 = (data->simulationInfo->realParameter[223] /* revolute.e[2] PARAM */);
  (data->localData[0]->realVars[510] /* cutForce.frame_a.R.T[2,2] variable */) = (tmp3 * tmp3) + (1.0 - ((tmp4 * tmp4))) * ((data->localData[0]->realVars[16] /* $cse1 variable */));
  TRACE_POP
}
/*
equation index: 1123
type: SIMPLE_ASSIGN
cutForce.frame_a.R.T[2,3] = (revolute.e[2] - revolute.e[2] * $cse1) * revolute.e[3] + revolute.e[1] * $cse2
*/
void inerter_test2_eqFunction_1123(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1123};
  (data->localData[0]->realVars[511] /* cutForce.frame_a.R.T[2,3] variable */) = ((data->simulationInfo->realParameter[223] /* revolute.e[2] PARAM */) - (((data->simulationInfo->realParameter[223] /* revolute.e[2] PARAM */)) * ((data->localData[0]->realVars[16] /* $cse1 variable */)))) * ((data->simulationInfo->realParameter[224] /* revolute.e[3] PARAM */)) + ((data->simulationInfo->realParameter[222] /* revolute.e[1] PARAM */)) * ((data->localData[0]->realVars[17] /* $cse2 variable */));
  TRACE_POP
}
/*
equation index: 1124
type: SIMPLE_ASSIGN
SprungMassCase3.r[2] = cutForce.frame_a.R.T[2,3] * u
*/
void inerter_test2_eqFunction_1124(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1124};
  (data->localData[0]->realVars[190] /* SprungMassCase3.r[2] variable */) = ((data->localData[0]->realVars[511] /* cutForce.frame_a.R.T[2,3] variable */)) * ((data->localData[0]->realVars[615] /* u variable */));
  TRACE_POP
}
/*
equation index: 1125
type: SIMPLE_ASSIGN
cutForce.frame_a.R.T[3,1] = (revolute.e[3] - revolute.e[3] * $cse1) * revolute.e[1] + revolute.e[2] * $cse2
*/
void inerter_test2_eqFunction_1125(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1125};
  (data->localData[0]->realVars[512] /* cutForce.frame_a.R.T[3,1] variable */) = ((data->simulationInfo->realParameter[224] /* revolute.e[3] PARAM */) - (((data->simulationInfo->realParameter[224] /* revolute.e[3] PARAM */)) * ((data->localData[0]->realVars[16] /* $cse1 variable */)))) * ((data->simulationInfo->realParameter[222] /* revolute.e[1] PARAM */)) + ((data->simulationInfo->realParameter[223] /* revolute.e[2] PARAM */)) * ((data->localData[0]->realVars[17] /* $cse2 variable */));
  TRACE_POP
}
/*
equation index: 1126
type: SIMPLE_ASSIGN
cutForce.frame_a.R.T[3,2] = (revolute.e[3] - revolute.e[3] * $cse1) * revolute.e[2] - revolute.e[1] * $cse2
*/
void inerter_test2_eqFunction_1126(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1126};
  (data->localData[0]->realVars[513] /* cutForce.frame_a.R.T[3,2] variable */) = ((data->simulationInfo->realParameter[224] /* revolute.e[3] PARAM */) - (((data->simulationInfo->realParameter[224] /* revolute.e[3] PARAM */)) * ((data->localData[0]->realVars[16] /* $cse1 variable */)))) * ((data->simulationInfo->realParameter[223] /* revolute.e[2] PARAM */)) - (((data->simulationInfo->realParameter[222] /* revolute.e[1] PARAM */)) * ((data->localData[0]->realVars[17] /* $cse2 variable */)));
  TRACE_POP
}
/*
equation index: 1127
type: SIMPLE_ASSIGN
cutForce.frame_a.R.T[3,3] = revolute.e[3] ^ 2.0 + (1.0 - revolute.e[3] ^ 2.0) * $cse1
*/
void inerter_test2_eqFunction_1127(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1127};
  modelica_real tmp5;
  modelica_real tmp6;
  tmp5 = (data->simulationInfo->realParameter[224] /* revolute.e[3] PARAM */);
  tmp6 = (data->simulationInfo->realParameter[224] /* revolute.e[3] PARAM */);
  (data->localData[0]->realVars[514] /* cutForce.frame_a.R.T[3,3] variable */) = (tmp5 * tmp5) + (1.0 - ((tmp6 * tmp6))) * ((data->localData[0]->realVars[16] /* $cse1 variable */));
  TRACE_POP
}
/*
equation index: 1128
type: SIMPLE_ASSIGN
y1 = cutForce.frame_a.R.T[3,3] * u
*/
void inerter_test2_eqFunction_1128(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1128};
  (data->localData[0]->realVars[1014] /* y1 variable */) = ((data->localData[0]->realVars[514] /* cutForce.frame_a.R.T[3,3] variable */)) * ((data->localData[0]->realVars[615] /* u variable */));
  TRACE_POP
}
/*
equation index: 1129
type: ARRAY_CALL_ASSIGN

world.z_label.R_lines = Modelica.Mechanics.MultiBody.Frames.TransformationMatrices.from_nxy({0.0, 0.0, 1.0}, {0.0, 1.0, 0.0})
*/
void inerter_test2_eqFunction_1129(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1129};
  real_array tmp7;
  real_array_create(&tmp7, ((modelica_real*)&((&(data->localData[0]->realVars[948] /* world.z_label.R_lines[1,1] variable */))[(((modelica_integer) 1) - 1) * 3 + (((modelica_integer) 1)-1)])), 2, (_index_t)3, (_index_t)3);
  real_array_copy_data(omc_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_from__nxy(threadData, _OMC_LIT3, _OMC_LIT2), tmp7);
  TRACE_POP
}
/*
equation index: 1130
type: SIMPLE_ASSIGN
world.z_label.cylinders[3].r[2] = world.z_label.R_lines[2,2] * world.scaledLabel
*/
void inerter_test2_eqFunction_1130(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1130};
  (data->localData[0]->realVars[973] /* world.z_label.cylinders[3].r[2] variable */) = ((data->localData[0]->realVars[952] /* world.z_label.R_lines[2,2] variable */)) * ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 1131
type: SIMPLE_ASSIGN
world.z_label.cylinders[2].lengthDirection[1] = world.z_label.R_lines[1,1] * world.scaledLabel
*/
void inerter_test2_eqFunction_1131(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1131};
  (data->localData[0]->realVars[966] /* world.z_label.cylinders[2].lengthDirection[1] variable */) = ((data->localData[0]->realVars[948] /* world.z_label.R_lines[1,1] variable */)) * ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 1132
type: SIMPLE_ASSIGN
world.z_label.cylinders[3].r[1] = world.z_label.R_lines[2,1] * world.scaledLabel
*/
void inerter_test2_eqFunction_1132(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1132};
  (data->localData[0]->realVars[972] /* world.z_label.cylinders[3].r[1] variable */) = ((data->localData[0]->realVars[951] /* world.z_label.R_lines[2,1] variable */)) * ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 1133
type: SIMPLE_ASSIGN
world.z_label.cylinders[3].lengthDirection[1] = (world.z_label.R_lines[1,1] - world.z_label.R_lines[2,1]) * world.scaledLabel
*/
void inerter_test2_eqFunction_1133(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1133};
  (data->localData[0]->realVars[969] /* world.z_label.cylinders[3].lengthDirection[1] variable */) = ((data->localData[0]->realVars[948] /* world.z_label.R_lines[1,1] variable */) - (data->localData[0]->realVars[951] /* world.z_label.R_lines[2,1] variable */)) * ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 1134
type: SIMPLE_ASSIGN
world.z_label.cylinders[2].lengthDirection[2] = world.z_label.R_lines[1,2] * world.scaledLabel
*/
void inerter_test2_eqFunction_1134(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1134};
  (data->localData[0]->realVars[967] /* world.z_label.cylinders[2].lengthDirection[2] variable */) = ((data->localData[0]->realVars[949] /* world.z_label.R_lines[1,2] variable */)) * ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 1135
type: SIMPLE_ASSIGN
world.z_label.cylinders[3].lengthDirection[2] = (world.z_label.R_lines[1,2] - world.z_label.R_lines[2,2]) * world.scaledLabel
*/
void inerter_test2_eqFunction_1135(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1135};
  (data->localData[0]->realVars[970] /* world.z_label.cylinders[3].lengthDirection[2] variable */) = ((data->localData[0]->realVars[949] /* world.z_label.R_lines[1,2] variable */) - (data->localData[0]->realVars[952] /* world.z_label.R_lines[2,2] variable */)) * ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 1136
type: SIMPLE_ASSIGN
world.z_label.cylinders[3].r[3] = world.labelStart + world.z_label.R_lines[2,3] * world.scaledLabel
*/
void inerter_test2_eqFunction_1136(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1136};
  (data->localData[0]->realVars[974] /* world.z_label.cylinders[3].r[3] variable */) = (data->simulationInfo->realParameter[268] /* world.labelStart PARAM */) + ((data->localData[0]->realVars[953] /* world.z_label.R_lines[2,3] variable */)) * ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 1137
type: SIMPLE_ASSIGN
world.z_label.cylinders[2].lengthDirection[3] = world.z_label.R_lines[1,3] * world.scaledLabel
*/
void inerter_test2_eqFunction_1137(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1137};
  (data->localData[0]->realVars[968] /* world.z_label.cylinders[2].lengthDirection[3] variable */) = ((data->localData[0]->realVars[950] /* world.z_label.R_lines[1,3] variable */)) * ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 1138
type: SIMPLE_ASSIGN
world.z_label.cylinders[3].lengthDirection[3] = (world.z_label.R_lines[1,3] - world.z_label.R_lines[2,3]) * world.scaledLabel
*/
void inerter_test2_eqFunction_1138(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1138};
  (data->localData[0]->realVars[971] /* world.z_label.cylinders[3].lengthDirection[3] variable */) = ((data->localData[0]->realVars[950] /* world.z_label.R_lines[1,3] variable */) - (data->localData[0]->realVars[953] /* world.z_label.R_lines[2,3] variable */)) * ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 1139
type: ARRAY_CALL_ASSIGN

world.y_label.R_lines = Modelica.Mechanics.MultiBody.Frames.TransformationMatrices.from_nxy({0.0, 1.0, 0.0}, {-1.0, 0.0, 0.0})
*/
void inerter_test2_eqFunction_1139(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1139};
  real_array tmp8;
  real_array_create(&tmp8, ((modelica_real*)&((&(data->localData[0]->realVars[824] /* world.y_label.R_lines[1,1] variable */))[(((modelica_integer) 1) - 1) * 3 + (((modelica_integer) 1)-1)])), 2, (_index_t)3, (_index_t)3);
  real_array_copy_data(omc_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_from__nxy(threadData, _OMC_LIT2, _OMC_LIT4), tmp8);
  TRACE_POP
}
/*
equation index: 1140
type: SIMPLE_ASSIGN
world.y_label.cylinders[2].r[2] = world.labelStart + world.y_label.R_lines[2,2] * world.y_label.lines[2,1,2]
*/
void inerter_test2_eqFunction_1140(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1140};
  (data->localData[0]->realVars[847] /* world.y_label.cylinders[2].r[2] variable */) = (data->simulationInfo->realParameter[268] /* world.labelStart PARAM */) + ((data->localData[0]->realVars[828] /* world.y_label.R_lines[2,2] variable */)) * ((data->localData[0]->realVars[865] /* world.y_label.lines[2,1,2] variable */));
  TRACE_POP
}
/*
equation index: 1141
type: SIMPLE_ASSIGN
world.y_label.cylinders[1].lengthDirection[1] = world.y_label.R_lines[1,1] * world.scaledLabel + world.y_label.R_lines[2,1] * world.y_label.lines[1,2,2]
*/
void inerter_test2_eqFunction_1141(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1141};
  (data->localData[0]->realVars[840] /* world.y_label.cylinders[1].lengthDirection[1] variable */) = ((data->localData[0]->realVars[824] /* world.y_label.R_lines[1,1] variable */)) * ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */)) + ((data->localData[0]->realVars[827] /* world.y_label.R_lines[2,1] variable */)) * ((data->localData[0]->realVars[863] /* world.y_label.lines[1,2,2] variable */));
  TRACE_POP
}
/*
equation index: 1142
type: SIMPLE_ASSIGN
world.y_label.cylinders[2].r[1] = world.y_label.R_lines[2,1] * world.y_label.lines[2,1,2]
*/
void inerter_test2_eqFunction_1142(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1142};
  (data->localData[0]->realVars[846] /* world.y_label.cylinders[2].r[1] variable */) = ((data->localData[0]->realVars[827] /* world.y_label.R_lines[2,1] variable */)) * ((data->localData[0]->realVars[865] /* world.y_label.lines[2,1,2] variable */));
  TRACE_POP
}
/*
equation index: 1143
type: SIMPLE_ASSIGN
world.y_label.cylinders[2].lengthDirection[1] = world.y_label.R_lines[1,1] * world.y_label.lines[2,2,1] + world.y_label.R_lines[2,1] * (world.y_label.lines[2,2,2] - world.y_label.lines[2,1,2])
*/
void inerter_test2_eqFunction_1143(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1143};
  (data->localData[0]->realVars[843] /* world.y_label.cylinders[2].lengthDirection[1] variable */) = ((data->localData[0]->realVars[824] /* world.y_label.R_lines[1,1] variable */)) * ((data->localData[0]->realVars[866] /* world.y_label.lines[2,2,1] variable */)) + ((data->localData[0]->realVars[827] /* world.y_label.R_lines[2,1] variable */)) * ((data->localData[0]->realVars[867] /* world.y_label.lines[2,2,2] variable */) - (data->localData[0]->realVars[865] /* world.y_label.lines[2,1,2] variable */));
  TRACE_POP
}
/*
equation index: 1144
type: SIMPLE_ASSIGN
world.y_label.cylinders[1].lengthDirection[2] = world.y_label.R_lines[1,2] * world.scaledLabel + world.y_label.R_lines[2,2] * world.y_label.lines[1,2,2]
*/
void inerter_test2_eqFunction_1144(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1144};
  (data->localData[0]->realVars[841] /* world.y_label.cylinders[1].lengthDirection[2] variable */) = ((data->localData[0]->realVars[825] /* world.y_label.R_lines[1,2] variable */)) * ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */)) + ((data->localData[0]->realVars[828] /* world.y_label.R_lines[2,2] variable */)) * ((data->localData[0]->realVars[863] /* world.y_label.lines[1,2,2] variable */));
  TRACE_POP
}
/*
equation index: 1145
type: SIMPLE_ASSIGN
world.y_label.cylinders[2].lengthDirection[2] = world.y_label.R_lines[1,2] * world.y_label.lines[2,2,1] + world.y_label.R_lines[2,2] * (world.y_label.lines[2,2,2] - world.y_label.lines[2,1,2])
*/
void inerter_test2_eqFunction_1145(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1145};
  (data->localData[0]->realVars[844] /* world.y_label.cylinders[2].lengthDirection[2] variable */) = ((data->localData[0]->realVars[825] /* world.y_label.R_lines[1,2] variable */)) * ((data->localData[0]->realVars[866] /* world.y_label.lines[2,2,1] variable */)) + ((data->localData[0]->realVars[828] /* world.y_label.R_lines[2,2] variable */)) * ((data->localData[0]->realVars[867] /* world.y_label.lines[2,2,2] variable */) - (data->localData[0]->realVars[865] /* world.y_label.lines[2,1,2] variable */));
  TRACE_POP
}
/*
equation index: 1146
type: SIMPLE_ASSIGN
world.y_label.cylinders[2].r[3] = world.y_label.R_lines[2,3] * world.y_label.lines[2,1,2]
*/
void inerter_test2_eqFunction_1146(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1146};
  (data->localData[0]->realVars[848] /* world.y_label.cylinders[2].r[3] variable */) = ((data->localData[0]->realVars[829] /* world.y_label.R_lines[2,3] variable */)) * ((data->localData[0]->realVars[865] /* world.y_label.lines[2,1,2] variable */));
  TRACE_POP
}
/*
equation index: 1147
type: SIMPLE_ASSIGN
world.y_label.cylinders[1].lengthDirection[3] = world.y_label.R_lines[1,3] * world.scaledLabel + world.y_label.R_lines[2,3] * world.y_label.lines[1,2,2]
*/
void inerter_test2_eqFunction_1147(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1147};
  (data->localData[0]->realVars[842] /* world.y_label.cylinders[1].lengthDirection[3] variable */) = ((data->localData[0]->realVars[826] /* world.y_label.R_lines[1,3] variable */)) * ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */)) + ((data->localData[0]->realVars[829] /* world.y_label.R_lines[2,3] variable */)) * ((data->localData[0]->realVars[863] /* world.y_label.lines[1,2,2] variable */));
  TRACE_POP
}
/*
equation index: 1148
type: SIMPLE_ASSIGN
world.y_label.cylinders[2].lengthDirection[3] = world.y_label.R_lines[1,3] * world.y_label.lines[2,2,1] + world.y_label.R_lines[2,3] * (world.y_label.lines[2,2,2] - world.y_label.lines[2,1,2])
*/
void inerter_test2_eqFunction_1148(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1148};
  (data->localData[0]->realVars[845] /* world.y_label.cylinders[2].lengthDirection[3] variable */) = ((data->localData[0]->realVars[826] /* world.y_label.R_lines[1,3] variable */)) * ((data->localData[0]->realVars[866] /* world.y_label.lines[2,2,1] variable */)) + ((data->localData[0]->realVars[829] /* world.y_label.R_lines[2,3] variable */)) * ((data->localData[0]->realVars[867] /* world.y_label.lines[2,2,2] variable */) - (data->localData[0]->realVars[865] /* world.y_label.lines[2,1,2] variable */));
  TRACE_POP
}
/*
equation index: 1149
type: ARRAY_CALL_ASSIGN

world.x_label.R_lines = Modelica.Mechanics.MultiBody.Frames.TransformationMatrices.from_nxy({1.0, 0.0, 0.0}, {0.0, 1.0, 0.0})
*/
void inerter_test2_eqFunction_1149(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1149};
  real_array tmp9;
  real_array_create(&tmp9, ((modelica_real*)&((&(data->localData[0]->realVars[703] /* world.x_label.R_lines[1,1] variable */))[(((modelica_integer) 1) - 1) * 3 + (((modelica_integer) 1)-1)])), 2, (_index_t)3, (_index_t)3);
  real_array_copy_data(omc_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_from__nxy(threadData, _OMC_LIT1, _OMC_LIT2), tmp9);
  TRACE_POP
}
/*
equation index: 1150
type: SIMPLE_ASSIGN
world.x_label.cylinders[2].r[2] = world.x_label.R_lines[2,2] * world.scaledLabel
*/
void inerter_test2_eqFunction_1150(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1150};
  (data->localData[0]->realVars[726] /* world.x_label.cylinders[2].r[2] variable */) = ((data->localData[0]->realVars[707] /* world.x_label.R_lines[2,2] variable */)) * ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 1151
type: SIMPLE_ASSIGN
world.x_label.cylinders[1].lengthDirection[1] = world.scaledLabel * (world.x_label.R_lines[1,1] + world.x_label.R_lines[2,1])
*/
void inerter_test2_eqFunction_1151(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1151};
  (data->localData[0]->realVars[719] /* world.x_label.cylinders[1].lengthDirection[1] variable */) = ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */)) * ((data->localData[0]->realVars[703] /* world.x_label.R_lines[1,1] variable */) + (data->localData[0]->realVars[706] /* world.x_label.R_lines[2,1] variable */));
  TRACE_POP
}
/*
equation index: 1152
type: SIMPLE_ASSIGN
world.x_label.cylinders[2].r[1] = world.labelStart + world.x_label.R_lines[2,1] * world.scaledLabel
*/
void inerter_test2_eqFunction_1152(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1152};
  (data->localData[0]->realVars[725] /* world.x_label.cylinders[2].r[1] variable */) = (data->simulationInfo->realParameter[268] /* world.labelStart PARAM */) + ((data->localData[0]->realVars[706] /* world.x_label.R_lines[2,1] variable */)) * ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 1153
type: SIMPLE_ASSIGN
world.x_label.cylinders[2].lengthDirection[1] = (world.x_label.R_lines[1,1] - world.x_label.R_lines[2,1]) * world.scaledLabel
*/
void inerter_test2_eqFunction_1153(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1153};
  (data->localData[0]->realVars[722] /* world.x_label.cylinders[2].lengthDirection[1] variable */) = ((data->localData[0]->realVars[703] /* world.x_label.R_lines[1,1] variable */) - (data->localData[0]->realVars[706] /* world.x_label.R_lines[2,1] variable */)) * ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 1154
type: SIMPLE_ASSIGN
world.x_label.cylinders[1].lengthDirection[2] = world.scaledLabel * (world.x_label.R_lines[1,2] + world.x_label.R_lines[2,2])
*/
void inerter_test2_eqFunction_1154(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1154};
  (data->localData[0]->realVars[720] /* world.x_label.cylinders[1].lengthDirection[2] variable */) = ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */)) * ((data->localData[0]->realVars[704] /* world.x_label.R_lines[1,2] variable */) + (data->localData[0]->realVars[707] /* world.x_label.R_lines[2,2] variable */));
  TRACE_POP
}
/*
equation index: 1155
type: SIMPLE_ASSIGN
world.x_label.cylinders[2].lengthDirection[2] = (world.x_label.R_lines[1,2] - world.x_label.R_lines[2,2]) * world.scaledLabel
*/
void inerter_test2_eqFunction_1155(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1155};
  (data->localData[0]->realVars[723] /* world.x_label.cylinders[2].lengthDirection[2] variable */) = ((data->localData[0]->realVars[704] /* world.x_label.R_lines[1,2] variable */) - (data->localData[0]->realVars[707] /* world.x_label.R_lines[2,2] variable */)) * ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 1156
type: SIMPLE_ASSIGN
world.x_label.cylinders[2].r[3] = world.x_label.R_lines[2,3] * world.scaledLabel
*/
void inerter_test2_eqFunction_1156(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1156};
  (data->localData[0]->realVars[727] /* world.x_label.cylinders[2].r[3] variable */) = ((data->localData[0]->realVars[708] /* world.x_label.R_lines[2,3] variable */)) * ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */));
  TRACE_POP
}
/*
equation index: 1157
type: SIMPLE_ASSIGN
world.x_label.cylinders[1].lengthDirection[3] = world.scaledLabel * (world.x_label.R_lines[1,3] + world.x_label.R_lines[2,3])
*/
void inerter_test2_eqFunction_1157(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1157};
  (data->localData[0]->realVars[721] /* world.x_label.cylinders[1].lengthDirection[3] variable */) = ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */)) * ((data->localData[0]->realVars[705] /* world.x_label.R_lines[1,3] variable */) + (data->localData[0]->realVars[708] /* world.x_label.R_lines[2,3] variable */));
  TRACE_POP
}
/*
equation index: 1158
type: SIMPLE_ASSIGN
world.x_label.cylinders[2].lengthDirection[3] = (world.x_label.R_lines[1,3] - world.x_label.R_lines[2,3]) * world.scaledLabel
*/
void inerter_test2_eqFunction_1158(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1158};
  (data->localData[0]->realVars[724] /* world.x_label.cylinders[2].lengthDirection[3] variable */) = ((data->localData[0]->realVars[705] /* world.x_label.R_lines[1,3] variable */) - (data->localData[0]->realVars[708] /* world.x_label.R_lines[2,3] variable */)) * ((data->simulationInfo->realParameter[276] /* world.scaledLabel PARAM */));
  TRACE_POP
}

OMC_DISABLE_OPT
int inerter_test2_functionDAE(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  int equationIndexes[1] = {0};
#if !defined(OMC_MINIMAL_RUNTIME)
  if (measure_time_flag) rt_tick(SIM_TIMER_DAE);
#endif

  data->simulationInfo->needToIterate = 0;
  data->simulationInfo->discreteCall = 1;
  inerter_test2_functionLocalKnownVars(data, threadData);
  inerter_test2_eqFunction_984(data, threadData);

  inerter_test2_eqFunction_985(data, threadData);

  inerter_test2_eqFunction_986(data, threadData);

  inerter_test2_eqFunction_987(data, threadData);

  inerter_test2_eqFunction_988(data, threadData);

  inerter_test2_eqFunction_989(data, threadData);

  inerter_test2_eqFunction_990(data, threadData);

  inerter_test2_eqFunction_991(data, threadData);

  inerter_test2_eqFunction_992(data, threadData);

  inerter_test2_eqFunction_993(data, threadData);

  inerter_test2_eqFunction_994(data, threadData);

  inerter_test2_eqFunction_995(data, threadData);

  inerter_test2_eqFunction_996(data, threadData);

  inerter_test2_eqFunction_997(data, threadData);

  inerter_test2_eqFunction_998(data, threadData);

  inerter_test2_eqFunction_999(data, threadData);

  inerter_test2_eqFunction_1000(data, threadData);

  inerter_test2_eqFunction_1001(data, threadData);

  inerter_test2_eqFunction_1002(data, threadData);

  inerter_test2_eqFunction_1003(data, threadData);

  inerter_test2_eqFunction_1004(data, threadData);

  inerter_test2_eqFunction_1005(data, threadData);

  inerter_test2_eqFunction_1006(data, threadData);

  inerter_test2_eqFunction_1007(data, threadData);

  inerter_test2_eqFunction_1008(data, threadData);

  inerter_test2_eqFunction_1009(data, threadData);

  inerter_test2_eqFunction_1010(data, threadData);

  inerter_test2_eqFunction_1011(data, threadData);

  inerter_test2_eqFunction_1012(data, threadData);

  inerter_test2_eqFunction_1013(data, threadData);

  inerter_test2_eqFunction_1014(data, threadData);

  inerter_test2_eqFunction_1015(data, threadData);

  inerter_test2_eqFunction_1016(data, threadData);

  inerter_test2_eqFunction_1017(data, threadData);

  inerter_test2_eqFunction_1018(data, threadData);

  inerter_test2_eqFunction_1019(data, threadData);

  inerter_test2_eqFunction_1020(data, threadData);

  inerter_test2_eqFunction_1021(data, threadData);

  inerter_test2_eqFunction_1022(data, threadData);

  inerter_test2_eqFunction_1023(data, threadData);

  inerter_test2_eqFunction_1024(data, threadData);

  inerter_test2_eqFunction_1025(data, threadData);

  inerter_test2_eqFunction_1026(data, threadData);

  inerter_test2_eqFunction_1027(data, threadData);

  inerter_test2_eqFunction_1028(data, threadData);

  inerter_test2_eqFunction_1029(data, threadData);

  inerter_test2_eqFunction_1030(data, threadData);

  inerter_test2_eqFunction_1031(data, threadData);

  inerter_test2_eqFunction_1032(data, threadData);

  inerter_test2_eqFunction_1033(data, threadData);

  inerter_test2_eqFunction_1034(data, threadData);

  inerter_test2_eqFunction_1035(data, threadData);

  inerter_test2_eqFunction_1036(data, threadData);

  inerter_test2_eqFunction_1037(data, threadData);

  inerter_test2_eqFunction_1038(data, threadData);

  inerter_test2_eqFunction_1039(data, threadData);

  inerter_test2_eqFunction_1040(data, threadData);

  inerter_test2_eqFunction_1041(data, threadData);

  inerter_test2_eqFunction_1042(data, threadData);

  inerter_test2_eqFunction_1043(data, threadData);

  inerter_test2_eqFunction_1044(data, threadData);

  inerter_test2_eqFunction_1045(data, threadData);

  inerter_test2_eqFunction_1046(data, threadData);

  inerter_test2_eqFunction_1047(data, threadData);

  inerter_test2_eqFunction_1048(data, threadData);

  inerter_test2_eqFunction_1049(data, threadData);

  inerter_test2_eqFunction_1050(data, threadData);

  inerter_test2_eqFunction_1051(data, threadData);

  inerter_test2_eqFunction_1052(data, threadData);

  inerter_test2_eqFunction_1053(data, threadData);

  inerter_test2_eqFunction_1054(data, threadData);

  inerter_test2_eqFunction_1055(data, threadData);

  inerter_test2_eqFunction_1056(data, threadData);

  inerter_test2_eqFunction_1057(data, threadData);

  inerter_test2_eqFunction_1058(data, threadData);

  inerter_test2_eqFunction_1059(data, threadData);

  inerter_test2_eqFunction_1060(data, threadData);

  inerter_test2_eqFunction_1061(data, threadData);

  inerter_test2_eqFunction_1062(data, threadData);

  inerter_test2_eqFunction_1063(data, threadData);

  inerter_test2_eqFunction_1064(data, threadData);

  inerter_test2_eqFunction_1065(data, threadData);

  inerter_test2_eqFunction_1066(data, threadData);

  inerter_test2_eqFunction_1067(data, threadData);

  inerter_test2_eqFunction_1068(data, threadData);

  inerter_test2_eqFunction_1069(data, threadData);

  inerter_test2_eqFunction_1070(data, threadData);

  inerter_test2_eqFunction_1071(data, threadData);

  inerter_test2_eqFunction_1072(data, threadData);

  inerter_test2_eqFunction_1073(data, threadData);

  inerter_test2_eqFunction_1074(data, threadData);

  inerter_test2_eqFunction_1075(data, threadData);

  inerter_test2_eqFunction_1076(data, threadData);

  inerter_test2_eqFunction_1077(data, threadData);

  inerter_test2_eqFunction_1078(data, threadData);

  inerter_test2_eqFunction_1079(data, threadData);

  inerter_test2_eqFunction_1080(data, threadData);

  inerter_test2_eqFunction_1081(data, threadData);

  inerter_test2_eqFunction_1082(data, threadData);

  inerter_test2_eqFunction_1083(data, threadData);

  inerter_test2_eqFunction_1084(data, threadData);

  inerter_test2_eqFunction_1085(data, threadData);

  inerter_test2_eqFunction_1086(data, threadData);

  inerter_test2_eqFunction_1087(data, threadData);

  inerter_test2_eqFunction_1088(data, threadData);

  inerter_test2_eqFunction_1089(data, threadData);

  inerter_test2_eqFunction_1090(data, threadData);

  inerter_test2_eqFunction_1091(data, threadData);

  inerter_test2_eqFunction_1092(data, threadData);

  inerter_test2_eqFunction_1093(data, threadData);

  inerter_test2_eqFunction_1094(data, threadData);

  inerter_test2_eqFunction_1095(data, threadData);

  inerter_test2_eqFunction_1096(data, threadData);

  inerter_test2_eqFunction_1097(data, threadData);

  inerter_test2_eqFunction_1098(data, threadData);

  inerter_test2_eqFunction_1099(data, threadData);

  inerter_test2_eqFunction_1100(data, threadData);

  inerter_test2_eqFunction_1101(data, threadData);

  inerter_test2_eqFunction_1102(data, threadData);

  inerter_test2_eqFunction_1103(data, threadData);

  inerter_test2_eqFunction_1104(data, threadData);

  inerter_test2_eqFunction_1105(data, threadData);

  inerter_test2_eqFunction_1106(data, threadData);

  inerter_test2_eqFunction_1107(data, threadData);

  inerter_test2_eqFunction_1108(data, threadData);

  inerter_test2_eqFunction_1109(data, threadData);

  inerter_test2_eqFunction_1110(data, threadData);

  inerter_test2_eqFunction_1111(data, threadData);

  inerter_test2_eqFunction_1112(data, threadData);

  inerter_test2_eqFunction_1113(data, threadData);

  inerter_test2_eqFunction_1114(data, threadData);

  inerter_test2_eqFunction_1115(data, threadData);

  inerter_test2_eqFunction_1116(data, threadData);

  inerter_test2_eqFunction_1117(data, threadData);

  inerter_test2_eqFunction_1118(data, threadData);

  inerter_test2_eqFunction_1119(data, threadData);

  inerter_test2_eqFunction_1120(data, threadData);

  inerter_test2_eqFunction_1121(data, threadData);

  inerter_test2_eqFunction_1122(data, threadData);

  inerter_test2_eqFunction_1123(data, threadData);

  inerter_test2_eqFunction_1124(data, threadData);

  inerter_test2_eqFunction_1125(data, threadData);

  inerter_test2_eqFunction_1126(data, threadData);

  inerter_test2_eqFunction_1127(data, threadData);

  inerter_test2_eqFunction_1128(data, threadData);

  inerter_test2_eqFunction_1129(data, threadData);

  inerter_test2_eqFunction_1130(data, threadData);

  inerter_test2_eqFunction_1131(data, threadData);

  inerter_test2_eqFunction_1132(data, threadData);

  inerter_test2_eqFunction_1133(data, threadData);

  inerter_test2_eqFunction_1134(data, threadData);

  inerter_test2_eqFunction_1135(data, threadData);

  inerter_test2_eqFunction_1136(data, threadData);

  inerter_test2_eqFunction_1137(data, threadData);

  inerter_test2_eqFunction_1138(data, threadData);

  inerter_test2_eqFunction_1139(data, threadData);

  inerter_test2_eqFunction_1140(data, threadData);

  inerter_test2_eqFunction_1141(data, threadData);

  inerter_test2_eqFunction_1142(data, threadData);

  inerter_test2_eqFunction_1143(data, threadData);

  inerter_test2_eqFunction_1144(data, threadData);

  inerter_test2_eqFunction_1145(data, threadData);

  inerter_test2_eqFunction_1146(data, threadData);

  inerter_test2_eqFunction_1147(data, threadData);

  inerter_test2_eqFunction_1148(data, threadData);

  inerter_test2_eqFunction_1149(data, threadData);

  inerter_test2_eqFunction_1150(data, threadData);

  inerter_test2_eqFunction_1151(data, threadData);

  inerter_test2_eqFunction_1152(data, threadData);

  inerter_test2_eqFunction_1153(data, threadData);

  inerter_test2_eqFunction_1154(data, threadData);

  inerter_test2_eqFunction_1155(data, threadData);

  inerter_test2_eqFunction_1156(data, threadData);

  inerter_test2_eqFunction_1157(data, threadData);

  inerter_test2_eqFunction_1158(data, threadData);
  data->simulationInfo->discreteCall = 0;
  
#if !defined(OMC_MINIMAL_RUNTIME)
  if (measure_time_flag) rt_accumulate(SIM_TIMER_DAE);
#endif
  TRACE_POP
  return 0;
}


int inerter_test2_functionLocalKnownVars(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  
  TRACE_POP
  return 0;
}


int inerter_test2_functionODE(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
#if !defined(OMC_MINIMAL_RUNTIME)
  if (measure_time_flag) rt_tick(SIM_TIMER_FUNCTION_ODE);
#endif

  
  data->simulationInfo->callStatistics.functionODE++;
  
  inerter_test2_functionLocalKnownVars(data, threadData);
  /* no ODE systems */

#if !defined(OMC_MINIMAL_RUNTIME)
  if (measure_time_flag) rt_accumulate(SIM_TIMER_FUNCTION_ODE);
#endif

  TRACE_POP
  return 0;
}

/* forward the main in the simulation runtime */
extern int _main_SimulationRuntime(int argc, char**argv, DATA *data, threadData_t *threadData);

#include "inerter_test2_12jac.h"
#include "inerter_test2_13opt.h"

struct OpenModelicaGeneratedFunctionCallbacks inerter_test2_callback = {
   NULL,    /* performSimulation */
   NULL,    /* performQSSSimulation */
   NULL,    /* updateContinuousSystem */
   inerter_test2_callExternalObjectDestructors,    /* callExternalObjectDestructors */
   NULL,    /* initialNonLinearSystem */
   NULL,    /* initialLinearSystem */
   NULL,    /* initialMixedSystem */
   #if !defined(OMC_NO_STATESELECTION)
   inerter_test2_initializeStateSets,
   #else
   NULL,
   #endif    /* initializeStateSets */
   inerter_test2_initializeDAEmodeData,
   inerter_test2_functionODE,
   inerter_test2_functionAlgebraics,
   inerter_test2_functionDAE,
   inerter_test2_functionLocalKnownVars,
   inerter_test2_input_function,
   inerter_test2_input_function_init,
   inerter_test2_input_function_updateStartValues,
   inerter_test2_data_function,
   inerter_test2_output_function,
   inerter_test2_setc_function,
   inerter_test2_setb_function,
   inerter_test2_function_storeDelayed,
   inerter_test2_function_storeSpatialDistribution,
   inerter_test2_function_initSpatialDistribution,
   inerter_test2_updateBoundVariableAttributes,
   inerter_test2_functionInitialEquations,
   1, /* useHomotopy - 0: local homotopy (equidistant lambda), 1: global homotopy (equidistant lambda), 2: new global homotopy approach (adaptive lambda), 3: new local homotopy approach (adaptive lambda)*/
   NULL,
   inerter_test2_functionRemovedInitialEquations,
   inerter_test2_updateBoundParameters,
   inerter_test2_checkForAsserts,
   inerter_test2_function_ZeroCrossingsEquations,
   inerter_test2_function_ZeroCrossings,
   inerter_test2_function_updateRelations,
   inerter_test2_zeroCrossingDescription,
   inerter_test2_relationDescription,
   inerter_test2_function_initSample,
   inerter_test2_INDEX_JAC_A,
   inerter_test2_INDEX_JAC_B,
   inerter_test2_INDEX_JAC_C,
   inerter_test2_INDEX_JAC_D,
   inerter_test2_INDEX_JAC_F,
   inerter_test2_INDEX_JAC_H,
   inerter_test2_initialAnalyticJacobianA,
   inerter_test2_initialAnalyticJacobianB,
   inerter_test2_initialAnalyticJacobianC,
   inerter_test2_initialAnalyticJacobianD,
   inerter_test2_initialAnalyticJacobianF,
   inerter_test2_initialAnalyticJacobianH,
   inerter_test2_functionJacA_column,
   inerter_test2_functionJacB_column,
   inerter_test2_functionJacC_column,
   inerter_test2_functionJacD_column,
   inerter_test2_functionJacF_column,
   inerter_test2_functionJacH_column,
   inerter_test2_linear_model_frame,
   inerter_test2_linear_model_datarecovery_frame,
   inerter_test2_mayer,
   inerter_test2_lagrange,
   inerter_test2_pickUpBoundsForInputsInOptimization,
   inerter_test2_setInputData,
   inerter_test2_getTimeGrid,
   inerter_test2_symbolicInlineSystem,
   inerter_test2_function_initSynchronous,
   inerter_test2_function_updateSynchronous,
   inerter_test2_function_equationsSynchronous,
   inerter_test2_inputNames,
   inerter_test2_dataReconciliationInputNames,
   inerter_test2_dataReconciliationUnmeasuredVariables,
   inerter_test2_read_simulation_info,
   inerter_test2_read_input_fmu,
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

#define _OMC_LIT_RESOURCE_8_name_data "inerter_test3"
#define _OMC_LIT_RESOURCE_8_dir_data "C:/Users/thogan1/OneDrive - University of New Brunswick/Grad Studies/OpenModelica/FMI"
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_8_name,13,_OMC_LIT_RESOURCE_8_name_data);
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_8_dir,85,_OMC_LIT_RESOURCE_8_dir_data);

#define _OMC_LIT_RESOURCE_9_name_data "inerter_testing"
#define _OMC_LIT_RESOURCE_9_dir_data "C:/Users/thogan1/OneDrive - University of New Brunswick/Grad Studies/OpenModelica/FMI"
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_9_name,15,_OMC_LIT_RESOURCE_9_name_data);
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_9_dir,85,_OMC_LIT_RESOURCE_9_dir_data);

#define _OMC_LIT_RESOURCE_10_name_data "positionConverter"
#define _OMC_LIT_RESOURCE_10_dir_data "C:/Users/thogan1/OneDrive - University of New Brunswick/Grad Studies/OpenModelica/FMI"
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_10_name,17,_OMC_LIT_RESOURCE_10_name_data);
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_10_dir,85,_OMC_LIT_RESOURCE_10_dir_data);

#define _OMC_LIT_RESOURCE_11_name_data "quad_test"
#define _OMC_LIT_RESOURCE_11_dir_data "C:/Users/thogan1/OneDrive - University of New Brunswick/Grad Studies/OpenModelica/FMI"
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_11_name,9,_OMC_LIT_RESOURCE_11_name_data);
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_11_dir,85,_OMC_LIT_RESOURCE_11_dir_data);

#define _OMC_LIT_RESOURCE_12_name_data "quadratic"
#define _OMC_LIT_RESOURCE_12_dir_data "C:/Users/thogan1/OneDrive - University of New Brunswick/Grad Studies/OpenModelica/FMI"
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_12_name,9,_OMC_LIT_RESOURCE_12_name_data);
static const MMC_DEFSTRINGLIT(_OMC_LIT_RESOURCE_12_dir,85,_OMC_LIT_RESOURCE_12_dir_data);

static const MMC_DEFSTRUCTLIT(_OMC_LIT_RESOURCES,26,MMC_ARRAY_TAG) {MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_0_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_0_dir), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_1_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_1_dir), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_2_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_2_dir), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_3_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_3_dir), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_4_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_4_dir), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_5_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_5_dir), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_6_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_6_dir), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_7_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_7_dir), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_8_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_8_dir), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_9_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_9_dir), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_10_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_10_dir), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_11_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_11_dir), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_12_name), MMC_REFSTRINGLIT(_OMC_LIT_RESOURCE_12_dir)}};
void inerter_test2_setupDataStruc(DATA *data, threadData_t *threadData)
{
  assertStreamPrint(threadData,0!=data, "Error while initialize Data");
  threadData->localRoots[LOCAL_ROOT_SIMULATION_DATA] = data;
  data->callback = &inerter_test2_callback;
  OpenModelica_updateUriMapping(threadData, MMC_REFSTRUCTLIT(_OMC_LIT_RESOURCES));
  data->modelData->modelName = "inerter_test2";
  data->modelData->modelFilePrefix = "inerter_test2";
  data->modelData->resultFileName = NULL;
  data->modelData->modelDir = "C:/Users/thogan1/OneDrive - University of New Brunswick/Grad Studies/OpenModelica/FMI";
  data->modelData->modelGUID = "{41684f28-8698-4e98-b250-d3c682c80310}";
  data->modelData->initXMLData = NULL;
  data->modelData->modelDataXml.infoXMLData = NULL;
  GC_asprintf(&data->modelData->modelDataXml.fileName, "%s/inerter_test2_info.json", data->modelData->resourcesDir);
  data->modelData->runTestsuite = 0;
  data->modelData->nStates = 0;
  data->modelData->nVariablesReal = 1016;
  data->modelData->nDiscreteReal = 0;
  data->modelData->nVariablesInteger = 36;
  data->modelData->nVariablesBoolean = 4;
  data->modelData->nVariablesString = 0;
  data->modelData->nParametersReal = 335;
  data->modelData->nParametersInteger = 57;
  data->modelData->nParametersBoolean = 47;
  data->modelData->nParametersString = 29;
  data->modelData->nInputVars = 1;
  data->modelData->nOutputVars = 3;
  data->modelData->nAliasReal = 987;
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
  data->modelData->modelDataXml.nEquations = 2528;
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

