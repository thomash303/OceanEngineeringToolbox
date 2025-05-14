/* update bound parameters and variable attributes (start, nominal, min, max) */
#include "inerter_test3_model.h"
#if defined(__cplusplus)
extern "C" {
#endif


/*
equation index: 849
type: SIMPLE_ASSIGN
$START.body.z_a[3] = body.z_0_start[3]
*/
static void inerter_test3_eqFunction_849(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,849};
  (data->modelData->realVarsData[83] /* body.z_a[3] variable */).attribute .start = (data->simulationInfo->realParameter[60] /* body.z_0_start[3] PARAM */);
    (data->localData[0]->realVars[83] /* body.z_a[3] variable */) = (data->modelData->realVarsData[83] /* body.z_a[3] variable */).attribute .start;
    infoStreamPrint(LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[83].info /* body.z_a[3] */.name, (modelica_real) (data->localData[0]->realVars[83] /* body.z_a[3] variable */));
  TRACE_POP
}

/*
equation index: 850
type: SIMPLE_ASSIGN
$START.body.z_a[2] = body.z_0_start[2]
*/
static void inerter_test3_eqFunction_850(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,850};
  (data->modelData->realVarsData[82] /* body.z_a[2] variable */).attribute .start = (data->simulationInfo->realParameter[59] /* body.z_0_start[2] PARAM */);
    (data->localData[0]->realVars[82] /* body.z_a[2] variable */) = (data->modelData->realVarsData[82] /* body.z_a[2] variable */).attribute .start;
    infoStreamPrint(LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[82].info /* body.z_a[2] */.name, (modelica_real) (data->localData[0]->realVars[82] /* body.z_a[2] variable */));
  TRACE_POP
}

/*
equation index: 851
type: SIMPLE_ASSIGN
$START.body.z_a[1] = body.z_0_start[1]
*/
static void inerter_test3_eqFunction_851(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,851};
  (data->modelData->realVarsData[81] /* body.z_a[1] variable */).attribute .start = (data->simulationInfo->realParameter[58] /* body.z_0_start[1] PARAM */);
    (data->localData[0]->realVars[81] /* body.z_a[1] variable */) = (data->modelData->realVarsData[81] /* body.z_a[1] variable */).attribute .start;
    infoStreamPrint(LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[81].info /* body.z_a[1] */.name, (modelica_real) (data->localData[0]->realVars[81] /* body.z_a[1] variable */));
  TRACE_POP
}

/*
equation index: 852
type: SIMPLE_ASSIGN
$START.body.w_a[3] = body.w_0_start[3]
*/
static void inerter_test3_eqFunction_852(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,852};
  (data->modelData->realVarsData[80] /* body.w_a[3] DUMMY_STATE */).attribute .start = (data->simulationInfo->realParameter[57] /* body.w_0_start[3] PARAM */);
    (data->localData[0]->realVars[80] /* body.w_a[3] DUMMY_STATE */) = (data->modelData->realVarsData[80] /* body.w_a[3] DUMMY_STATE */).attribute .start;
    infoStreamPrint(LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[80].info /* body.w_a[3] */.name, (modelica_real) (data->localData[0]->realVars[80] /* body.w_a[3] DUMMY_STATE */));
  TRACE_POP
}

/*
equation index: 853
type: SIMPLE_ASSIGN
$START.body.w_a[2] = body.w_0_start[2]
*/
static void inerter_test3_eqFunction_853(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,853};
  (data->modelData->realVarsData[79] /* body.w_a[2] DUMMY_STATE */).attribute .start = (data->simulationInfo->realParameter[56] /* body.w_0_start[2] PARAM */);
    (data->localData[0]->realVars[79] /* body.w_a[2] DUMMY_STATE */) = (data->modelData->realVarsData[79] /* body.w_a[2] DUMMY_STATE */).attribute .start;
    infoStreamPrint(LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[79].info /* body.w_a[2] */.name, (modelica_real) (data->localData[0]->realVars[79] /* body.w_a[2] DUMMY_STATE */));
  TRACE_POP
}

/*
equation index: 854
type: SIMPLE_ASSIGN
$START.body.w_a[1] = body.w_0_start[1]
*/
static void inerter_test3_eqFunction_854(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,854};
  (data->modelData->realVarsData[78] /* body.w_a[1] DUMMY_STATE */).attribute .start = (data->simulationInfo->realParameter[55] /* body.w_0_start[1] PARAM */);
    (data->localData[0]->realVars[78] /* body.w_a[1] DUMMY_STATE */) = (data->modelData->realVarsData[78] /* body.w_a[1] DUMMY_STATE */).attribute .start;
    infoStreamPrint(LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[78].info /* body.w_a[1] */.name, (modelica_real) (data->localData[0]->realVars[78] /* body.w_a[1] DUMMY_STATE */));
  TRACE_POP
}
/*
equation index: 855
type: SIMPLE_ASSIGN
springDamper.s_rel = springDamper.s_nominal
*/
static void inerter_test3_eqFunction_855(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,855};
  data->modelData->realVarsData[284].attribute /* springDamper.s_rel */.nominal = (data->simulationInfo->realParameter[234] /* springDamper.s_nominal PARAM */);
  infoStreamPrint(LOG_INIT_V, 0, "%s(nominal=%g)", data->modelData->realVarsData[284].info /* springDamper.s_rel */.name,
        (modelica_real) data->modelData->realVarsData[284].attribute /* springDamper.s_rel */.nominal);
  TRACE_POP
}

OMC_DISABLE_OPT
int inerter_test3_updateBoundVariableAttributes(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  /* min ******************************************************** */
  infoStreamPrint(LOG_INIT, 1, "updating min-values");
  if (ACTIVE_STREAM(LOG_INIT)) messageClose(LOG_INIT);
  
  /* max ******************************************************** */
  infoStreamPrint(LOG_INIT, 1, "updating max-values");
  if (ACTIVE_STREAM(LOG_INIT)) messageClose(LOG_INIT);
  
  /* nominal **************************************************** */
  infoStreamPrint(LOG_INIT, 1, "updating nominal-values");
  inerter_test3_eqFunction_855(data, threadData);
  if (ACTIVE_STREAM(LOG_INIT)) messageClose(LOG_INIT);
  
  /* start ****************************************************** */
  infoStreamPrint(LOG_INIT, 1, "updating primary start-values");
  inerter_test3_eqFunction_849(data, threadData);

  inerter_test3_eqFunction_850(data, threadData);

  inerter_test3_eqFunction_851(data, threadData);

  inerter_test3_eqFunction_852(data, threadData);

  inerter_test3_eqFunction_853(data, threadData);

  inerter_test3_eqFunction_854(data, threadData);
  if (ACTIVE_STREAM(LOG_INIT)) messageClose(LOG_INIT);
  
  TRACE_POP
  return 0;
}

void inerter_test3_updateBoundParameters_0(DATA *data, threadData_t *threadData);
void inerter_test3_updateBoundParameters_1(DATA *data, threadData_t *threadData);
OMC_DISABLE_OPT
int inerter_test3_updateBoundParameters(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  (data->localData[0]->integerVars[0] /* body.sphereColor[1] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[0].time_unvarying = 1;
  (data->localData[0]->integerVars[3] /* bodyShape.body.sphereColor[1] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[3].time_unvarying = 1;
  (data->localData[0]->integerVars[6] /* bodyShape.color[1] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[6].time_unvarying = 1;
  (data->localData[0]->integerVars[12] /* cutForce.forceColor[1] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[12].time_unvarying = 1;
  (data->localData[0]->integerVars[14] /* cutForce.forceColor[3] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[14].time_unvarying = 1;
  (data->localData[0]->integerVars[15] /* force.color[1] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[15].time_unvarying = 1;
  (data->localData[0]->integerVars[17] /* force.color[3] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[17].time_unvarying = 1;
  (data->localData[0]->integerVars[19] /* prismatic.boxColor[2] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[19].time_unvarying = 1;
  (data->localData[0]->integerVars[20] /* prismatic.boxColor[3] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[20].time_unvarying = 1;
  (data->localData[0]->integerVars[22] /* revolute.cylinderColor[2] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[22].time_unvarying = 1;
  (data->localData[0]->integerVars[23] /* revolute.cylinderColor[3] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[23].time_unvarying = 1;
  (data->localData[0]->integerVars[24] /* world.axisColor_x[1] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[24].time_unvarying = 1;
  (data->localData[0]->integerVars[25] /* world.axisColor_x[2] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[25].time_unvarying = 1;
  (data->localData[0]->integerVars[26] /* world.axisColor_x[3] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[26].time_unvarying = 1;
  (data->localData[0]->integerVars[27] /* world.gravityArrowColor[1] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[27].time_unvarying = 1;
  (data->localData[0]->integerVars[29] /* world.gravityArrowColor[3] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[29].time_unvarying = 1;
  (data->localData[0]->integerVars[30] /* world.gravitySphereColor[1] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[30].time_unvarying = 1;
  (data->localData[0]->integerVars[32] /* world.gravitySphereColor[3] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[32].time_unvarying = 1;
  (data->simulationInfo->integerParameter[0] /* body.sequence_angleStates[1] PARAM */) = ((modelica_integer) 1);
  data->modelData->integerParameterData[0].time_unvarying = 1;
  (data->simulationInfo->integerParameter[1] /* body.sequence_angleStates[2] PARAM */) = ((modelica_integer) 2);
  data->modelData->integerParameterData[1].time_unvarying = 1;
  (data->simulationInfo->integerParameter[2] /* body.sequence_angleStates[3] PARAM */) = ((modelica_integer) 3);
  data->modelData->integerParameterData[2].time_unvarying = 1;
  (data->simulationInfo->integerParameter[3] /* body.sequence_start[1] PARAM */) = ((modelica_integer) 1);
  data->modelData->integerParameterData[3].time_unvarying = 1;
  (data->simulationInfo->integerParameter[4] /* body.sequence_start[2] PARAM */) = ((modelica_integer) 2);
  data->modelData->integerParameterData[4].time_unvarying = 1;
  (data->simulationInfo->integerParameter[5] /* body.sequence_start[3] PARAM */) = ((modelica_integer) 3);
  data->modelData->integerParameterData[5].time_unvarying = 1;
  (data->simulationInfo->integerParameter[6] /* bodyShape.body.sequence_angleStates[1] PARAM */) = ((modelica_integer) 1);
  data->modelData->integerParameterData[6].time_unvarying = 1;
  (data->simulationInfo->integerParameter[7] /* bodyShape.body.sequence_angleStates[2] PARAM */) = ((modelica_integer) 2);
  data->modelData->integerParameterData[7].time_unvarying = 1;
  (data->simulationInfo->integerParameter[8] /* bodyShape.body.sequence_angleStates[3] PARAM */) = ((modelica_integer) 3);
  data->modelData->integerParameterData[8].time_unvarying = 1;
  (data->simulationInfo->integerParameter[9] /* bodyShape.body.sequence_start[1] PARAM */) = ((modelica_integer) 1);
  data->modelData->integerParameterData[9].time_unvarying = 1;
  (data->simulationInfo->integerParameter[10] /* bodyShape.body.sequence_start[2] PARAM */) = ((modelica_integer) 2);
  data->modelData->integerParameterData[10].time_unvarying = 1;
  (data->simulationInfo->integerParameter[11] /* bodyShape.body.sequence_start[3] PARAM */) = ((modelica_integer) 3);
  data->modelData->integerParameterData[11].time_unvarying = 1;
  (data->simulationInfo->integerParameter[12] /* bodyShape.sequence_angleStates[1] PARAM */) = ((modelica_integer) 1);
  data->modelData->integerParameterData[12].time_unvarying = 1;
  (data->simulationInfo->integerParameter[13] /* bodyShape.sequence_angleStates[2] PARAM */) = ((modelica_integer) 2);
  data->modelData->integerParameterData[13].time_unvarying = 1;
  (data->simulationInfo->integerParameter[14] /* bodyShape.sequence_angleStates[3] PARAM */) = ((modelica_integer) 3);
  data->modelData->integerParameterData[14].time_unvarying = 1;
  (data->simulationInfo->integerParameter[15] /* bodyShape.sequence_start[1] PARAM */) = ((modelica_integer) 1);
  data->modelData->integerParameterData[15].time_unvarying = 1;
  (data->simulationInfo->integerParameter[16] /* bodyShape.sequence_start[2] PARAM */) = ((modelica_integer) 2);
  data->modelData->integerParameterData[16].time_unvarying = 1;
  (data->simulationInfo->integerParameter[17] /* bodyShape.sequence_start[3] PARAM */) = ((modelica_integer) 3);
  data->modelData->integerParameterData[17].time_unvarying = 1;
  (data->simulationInfo->integerParameter[31] /* world.ndim PARAM */) = ((modelica_integer) 1);
  data->modelData->integerParameterData[31].time_unvarying = 1;
  (data->simulationInfo->integerParameter[32] /* world.ndim2 PARAM */) = ((modelica_integer) 1);
  data->modelData->integerParameterData[32].time_unvarying = 1;
  (data->simulationInfo->integerParameter[33] /* world.ndim_pointGravity PARAM */) = ((modelica_integer) 0);
  data->modelData->integerParameterData[33].time_unvarying = 1;
  (data->simulationInfo->integerParameter[34] /* world.x_label.n PARAM */) = ((modelica_integer) 2);
  data->modelData->integerParameterData[34].time_unvarying = 1;
  (data->simulationInfo->integerParameter[35] /* world.y_label.n PARAM */) = ((modelica_integer) 2);
  data->modelData->integerParameterData[35].time_unvarying = 1;
  (data->simulationInfo->integerParameter[36] /* world.z_label.n PARAM */) = ((modelica_integer) 3);
  data->modelData->integerParameterData[36].time_unvarying = 1;
  (data->localData[0]->realVars[184] /* cutForce.zeroPosition.frame_resolve.f[1] variable */) = -0.0;
  data->modelData->realVarsData[184].time_unvarying = 1;
  (data->localData[0]->realVars[185] /* cutForce.zeroPosition.frame_resolve.f[2] variable */) = -0.0;
  data->modelData->realVarsData[185].time_unvarying = 1;
  (data->localData[0]->realVars[186] /* cutForce.zeroPosition.frame_resolve.f[3] variable */) = -0.0;
  data->modelData->realVarsData[186].time_unvarying = 1;
  (data->localData[0]->realVars[190] /* cutForce.zeroPosition.frame_resolve.t[1] variable */) = -0.0;
  data->modelData->realVarsData[190].time_unvarying = 1;
  (data->localData[0]->realVars[191] /* cutForce.zeroPosition.frame_resolve.t[2] variable */) = -0.0;
  data->modelData->realVarsData[191].time_unvarying = 1;
  (data->localData[0]->realVars[192] /* cutForce.zeroPosition.frame_resolve.t[3] variable */) = -0.0;
  data->modelData->realVarsData[192].time_unvarying = 1;
  (data->localData[0]->realVars[231] /* force.zeroPosition.frame_resolve.f[1] variable */) = -0.0;
  data->modelData->realVarsData[231].time_unvarying = 1;
  (data->localData[0]->realVars[232] /* force.zeroPosition.frame_resolve.f[2] variable */) = -0.0;
  data->modelData->realVarsData[232].time_unvarying = 1;
  (data->localData[0]->realVars[233] /* force.zeroPosition.frame_resolve.f[3] variable */) = -0.0;
  data->modelData->realVarsData[233].time_unvarying = 1;
  (data->localData[0]->realVars[237] /* force.zeroPosition.frame_resolve.t[1] variable */) = -0.0;
  data->modelData->realVarsData[237].time_unvarying = 1;
  (data->localData[0]->realVars[238] /* force.zeroPosition.frame_resolve.t[2] variable */) = -0.0;
  data->modelData->realVarsData[238].time_unvarying = 1;
  (data->localData[0]->realVars[239] /* force.zeroPosition.frame_resolve.t[3] variable */) = -0.0;
  data->modelData->realVarsData[239].time_unvarying = 1;
  (data->simulationInfo->realParameter[17] /* body.Q_start[1] PARAM */) = 0.0;
  data->modelData->realParameterData[17].time_unvarying = 1;
  (data->simulationInfo->realParameter[18] /* body.Q_start[2] PARAM */) = 0.0;
  data->modelData->realParameterData[18].time_unvarying = 1;
  (data->simulationInfo->realParameter[19] /* body.Q_start[3] PARAM */) = 0.0;
  data->modelData->realParameterData[19].time_unvarying = 1;
  (data->simulationInfo->realParameter[20] /* body.Q_start[4] PARAM */) = 1.0;
  data->modelData->realParameterData[20].time_unvarying = 1;
  (data->simulationInfo->realParameter[21] /* body.R_start.T[1,1] PARAM */) = 1.0;
  data->modelData->realParameterData[21].time_unvarying = 1;
  (data->simulationInfo->realParameter[22] /* body.R_start.T[1,2] PARAM */) = 0.0;
  data->modelData->realParameterData[22].time_unvarying = 1;
  (data->simulationInfo->realParameter[23] /* body.R_start.T[1,3] PARAM */) = 0.0;
  data->modelData->realParameterData[23].time_unvarying = 1;
  (data->simulationInfo->realParameter[24] /* body.R_start.T[2,1] PARAM */) = 0.0;
  data->modelData->realParameterData[24].time_unvarying = 1;
  (data->simulationInfo->realParameter[25] /* body.R_start.T[2,2] PARAM */) = 1.0;
  data->modelData->realParameterData[25].time_unvarying = 1;
  (data->simulationInfo->realParameter[26] /* body.R_start.T[2,3] PARAM */) = 0.0;
  data->modelData->realParameterData[26].time_unvarying = 1;
  (data->simulationInfo->realParameter[27] /* body.R_start.T[3,1] PARAM */) = 0.0;
  data->modelData->realParameterData[27].time_unvarying = 1;
  (data->simulationInfo->realParameter[28] /* body.R_start.T[3,2] PARAM */) = 0.0;
  data->modelData->realParameterData[28].time_unvarying = 1;
  (data->simulationInfo->realParameter[29] /* body.R_start.T[3,3] PARAM */) = 1.0;
  data->modelData->realParameterData[29].time_unvarying = 1;
  (data->simulationInfo->realParameter[30] /* body.R_start.w[1] PARAM */) = 0.0;
  data->modelData->realParameterData[30].time_unvarying = 1;
  (data->simulationInfo->realParameter[31] /* body.R_start.w[2] PARAM */) = 0.0;
  data->modelData->realParameterData[31].time_unvarying = 1;
  (data->simulationInfo->realParameter[32] /* body.R_start.w[3] PARAM */) = 0.0;
  data->modelData->realParameterData[32].time_unvarying = 1;
  (data->simulationInfo->realParameter[54] /* body.sphereDiameter PARAM */) = 0.1111111111111111;
  data->modelData->realParameterData[54].time_unvarying = 1;
  (data->simulationInfo->realParameter[85] /* bodyShape.body.Q_start[1] PARAM */) = 0.0;
  data->modelData->realParameterData[85].time_unvarying = 1;
  (data->simulationInfo->realParameter[86] /* bodyShape.body.Q_start[2] PARAM */) = 0.0;
  data->modelData->realParameterData[86].time_unvarying = 1;
  (data->simulationInfo->realParameter[87] /* bodyShape.body.Q_start[3] PARAM */) = 0.0;
  data->modelData->realParameterData[87].time_unvarying = 1;
  (data->simulationInfo->realParameter[88] /* bodyShape.body.Q_start[4] PARAM */) = 1.0;
  data->modelData->realParameterData[88].time_unvarying = 1;
  (data->simulationInfo->realParameter[89] /* bodyShape.body.R_start.T[1,1] PARAM */) = 1.0;
  data->modelData->realParameterData[89].time_unvarying = 1;
  (data->simulationInfo->realParameter[90] /* bodyShape.body.R_start.T[1,2] PARAM */) = 0.0;
  data->modelData->realParameterData[90].time_unvarying = 1;
  (data->simulationInfo->realParameter[91] /* bodyShape.body.R_start.T[1,3] PARAM */) = 0.0;
  data->modelData->realParameterData[91].time_unvarying = 1;
  (data->simulationInfo->realParameter[92] /* bodyShape.body.R_start.T[2,1] PARAM */) = 0.0;
  data->modelData->realParameterData[92].time_unvarying = 1;
  (data->simulationInfo->realParameter[93] /* bodyShape.body.R_start.T[2,2] PARAM */) = 1.0;
  data->modelData->realParameterData[93].time_unvarying = 1;
  (data->simulationInfo->realParameter[94] /* bodyShape.body.R_start.T[2,3] PARAM */) = 0.0;
  data->modelData->realParameterData[94].time_unvarying = 1;
  (data->simulationInfo->realParameter[95] /* bodyShape.body.R_start.T[3,1] PARAM */) = 0.0;
  data->modelData->realParameterData[95].time_unvarying = 1;
  (data->simulationInfo->realParameter[96] /* bodyShape.body.R_start.T[3,2] PARAM */) = 0.0;
  data->modelData->realParameterData[96].time_unvarying = 1;
  (data->simulationInfo->realParameter[97] /* bodyShape.body.R_start.T[3,3] PARAM */) = 1.0;
  data->modelData->realParameterData[97].time_unvarying = 1;
  (data->simulationInfo->realParameter[98] /* bodyShape.body.R_start.w[1] PARAM */) = 0.0;
  data->modelData->realParameterData[98].time_unvarying = 1;
  (data->simulationInfo->realParameter[99] /* bodyShape.body.R_start.w[2] PARAM */) = 0.0;
  data->modelData->realParameterData[99].time_unvarying = 1;
  (data->simulationInfo->realParameter[100] /* bodyShape.body.R_start.w[3] PARAM */) = 0.0;
  data->modelData->realParameterData[100].time_unvarying = 1;
  (data->simulationInfo->realParameter[113] /* bodyShape.body.sphereDiameter PARAM */) = 0.1111111111111111;
  data->modelData->realParameterData[113].time_unvarying = 1;
  (data->simulationInfo->realParameter[124] /* bodyShape.frameTranslation.lengthDirection[1] PARAM */) = 0.0;
  data->modelData->realParameterData[124].time_unvarying = 1;
  (data->simulationInfo->realParameter[125] /* bodyShape.frameTranslation.lengthDirection[2] PARAM */) = 0.0;
  data->modelData->realParameterData[125].time_unvarying = 1;
  (data->simulationInfo->realParameter[126] /* bodyShape.frameTranslation.lengthDirection[3] PARAM */) = 0.0;
  data->modelData->realParameterData[126].time_unvarying = 1;
  (data->simulationInfo->realParameter[127] /* bodyShape.frameTranslation.r[1] PARAM */) = 0.0;
  data->modelData->realParameterData[127].time_unvarying = 1;
  (data->simulationInfo->realParameter[128] /* bodyShape.frameTranslation.r[2] PARAM */) = 0.0;
  data->modelData->realParameterData[128].time_unvarying = 1;
  (data->simulationInfo->realParameter[129] /* bodyShape.frameTranslation.r[3] PARAM */) = 0.0;
  data->modelData->realParameterData[129].time_unvarying = 1;
  (data->simulationInfo->realParameter[130] /* bodyShape.frameTranslation.r_shape[1] PARAM */) = 0.0;
  data->modelData->realParameterData[130].time_unvarying = 1;
  (data->simulationInfo->realParameter[131] /* bodyShape.frameTranslation.r_shape[2] PARAM */) = 0.0;
  data->modelData->realParameterData[131].time_unvarying = 1;
  (data->simulationInfo->realParameter[132] /* bodyShape.frameTranslation.r_shape[3] PARAM */) = 0.0;
  data->modelData->realParameterData[132].time_unvarying = 1;
  (data->simulationInfo->realParameter[135] /* bodyShape.frameTranslation.widthDirection[1] PARAM */) = 0.0;
  data->modelData->realParameterData[135].time_unvarying = 1;
  (data->simulationInfo->realParameter[136] /* bodyShape.frameTranslation.widthDirection[2] PARAM */) = 1.0;
  data->modelData->realParameterData[136].time_unvarying = 1;
  (data->simulationInfo->realParameter[137] /* bodyShape.frameTranslation.widthDirection[3] PARAM */) = 0.0;
  data->modelData->realParameterData[137].time_unvarying = 1;
  (data->simulationInfo->realParameter[140] /* bodyShape.lengthDirection[1] PARAM */) = 0.0;
  data->modelData->realParameterData[140].time_unvarying = 1;
  (data->simulationInfo->realParameter[141] /* bodyShape.lengthDirection[2] PARAM */) = 0.0;
  data->modelData->realParameterData[141].time_unvarying = 1;
  (data->simulationInfo->realParameter[142] /* bodyShape.lengthDirection[3] PARAM */) = 0.0;
  data->modelData->realParameterData[142].time_unvarying = 1;
  (data->simulationInfo->realParameter[144] /* bodyShape.r[1] PARAM */) = 0.0;
  data->modelData->realParameterData[144].time_unvarying = 1;
  (data->simulationInfo->realParameter[145] /* bodyShape.r[2] PARAM */) = 0.0;
  data->modelData->realParameterData[145].time_unvarying = 1;
  (data->simulationInfo->realParameter[146] /* bodyShape.r[3] PARAM */) = 0.0;
  data->modelData->realParameterData[146].time_unvarying = 1;
  (data->simulationInfo->realParameter[150] /* bodyShape.r_shape[1] PARAM */) = 0.0;
  data->modelData->realParameterData[150].time_unvarying = 1;
  (data->simulationInfo->realParameter[151] /* bodyShape.r_shape[2] PARAM */) = 0.0;
  data->modelData->realParameterData[151].time_unvarying = 1;
  (data->simulationInfo->realParameter[152] /* bodyShape.r_shape[3] PARAM */) = 0.0;
  data->modelData->realParameterData[152].time_unvarying = 1;
  (data->simulationInfo->realParameter[170] /* bodyShape.widthDirection[1] PARAM */) = 0.0;
  data->modelData->realParameterData[170].time_unvarying = 1;
  (data->simulationInfo->realParameter[171] /* bodyShape.widthDirection[2] PARAM */) = 1.0;
  data->modelData->realParameterData[171].time_unvarying = 1;
  (data->simulationInfo->realParameter[172] /* bodyShape.widthDirection[3] PARAM */) = 0.0;
  data->modelData->realParameterData[172].time_unvarying = 1;
  (data->simulationInfo->realParameter[184] /* idealGearR2T.fixedR.phi0 PARAM */) = 0.0;
  data->modelData->realParameterData[184].time_unvarying = 1;
  (data->simulationInfo->realParameter[186] /* idealGearR2T.fixedT.s0 PARAM */) = 0.0;
  data->modelData->realParameterData[186].time_unvarying = 1;
  (data->simulationInfo->realParameter[199] /* prismatic.boxWidthDirection[1] PARAM */) = 0.0;
  data->modelData->realParameterData[199].time_unvarying = 1;
  (data->simulationInfo->realParameter[200] /* prismatic.boxWidthDirection[2] PARAM */) = 1.0;
  data->modelData->realParameterData[200].time_unvarying = 1;
  (data->simulationInfo->realParameter[201] /* prismatic.boxWidthDirection[3] PARAM */) = 0.0;
  data->modelData->realParameterData[201].time_unvarying = 1;
  (data->simulationInfo->realParameter[202] /* prismatic.e[1] PARAM */) = 0.0;
  data->modelData->realParameterData[202].time_unvarying = 1;
  (data->simulationInfo->realParameter[203] /* prismatic.e[2] PARAM */) = 0.0;
  data->modelData->realParameterData[203].time_unvarying = 1;
  (data->simulationInfo->realParameter[204] /* prismatic.e[3] PARAM */) = 1.0;
  data->modelData->realParameterData[204].time_unvarying = 1;
  (data->simulationInfo->realParameter[206] /* prismatic.fixed.s0 PARAM */) = 0.0;
  data->modelData->realParameterData[206].time_unvarying = 1;
  (data->simulationInfo->realParameter[207] /* prismatic.n[1] PARAM */) = 0.0;
  data->modelData->realParameterData[207].time_unvarying = 1;
  (data->simulationInfo->realParameter[208] /* prismatic.n[2] PARAM */) = 0.0;
  data->modelData->realParameterData[208].time_unvarying = 1;
  (data->simulationInfo->realParameter[209] /* prismatic.n[3] PARAM */) = 1.0;
  data->modelData->realParameterData[209].time_unvarying = 1;
  (data->simulationInfo->realParameter[221] /* revolute.e[1] PARAM */) = 0.0;
  data->modelData->realParameterData[221].time_unvarying = 1;
  (data->simulationInfo->realParameter[222] /* revolute.e[2] PARAM */) = 0.0;
  data->modelData->realParameterData[222].time_unvarying = 1;
  (data->simulationInfo->realParameter[223] /* revolute.e[3] PARAM */) = 1.0;
  data->modelData->realParameterData[223].time_unvarying = 1;
  (data->simulationInfo->realParameter[225] /* revolute.fixed.phi0 PARAM */) = 0.0;
  data->modelData->realParameterData[225].time_unvarying = 1;
  (data->simulationInfo->realParameter[226] /* revolute.n[1] PARAM */) = 0.0;
  data->modelData->realParameterData[226].time_unvarying = 1;
  (data->simulationInfo->realParameter[227] /* revolute.n[2] PARAM */) = 0.0;
  data->modelData->realParameterData[227].time_unvarying = 1;
  (data->simulationInfo->realParameter[228] /* revolute.n[3] PARAM */) = 1.0;
  data->modelData->realParameterData[228].time_unvarying = 1;
  (data->simulationInfo->realParameter[240] /* world.defaultBodyDiameter PARAM */) = 0.1111111111111111;
  data->modelData->realParameterData[240].time_unvarying = 1;
  (data->simulationInfo->realParameter[271] /* world.n[1] PARAM */) = 0.0;
  data->modelData->realParameterData[271].time_unvarying = 1;
  (data->simulationInfo->realParameter[272] /* world.n[2] PARAM */) = -1.0;
  data->modelData->realParameterData[272].time_unvarying = 1;
  (data->simulationInfo->realParameter[273] /* world.n[3] PARAM */) = 0.0;
  data->modelData->realParameterData[273].time_unvarying = 1;
  (data->simulationInfo->realParameter[274] /* world.nominalLength PARAM */) = 1.0;
  data->modelData->realParameterData[274].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[0] /* body.angles_fixed PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[0].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[1] /* body.animation PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[1].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[2] /* body.enforceStates PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[2].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[3] /* body.useQuaternions PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[3].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[4] /* body.w_0_fixed PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[4].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[5] /* body.z_0_fixed PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[5].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[6] /* bodyShape.angles_fixed PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[6].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[7] /* bodyShape.animateSphere PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[7].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[8] /* bodyShape.animation PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[8].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[9] /* bodyShape.body.angles_fixed PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[9].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[10] /* bodyShape.body.animation PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[10].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[11] /* bodyShape.body.enforceStates PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[11].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[12] /* bodyShape.body.useQuaternions PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[12].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[13] /* bodyShape.body.w_0_fixed PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[13].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[14] /* bodyShape.body.z_0_fixed PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[14].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[15] /* bodyShape.enforceStates PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[15].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[16] /* bodyShape.frameTranslation.animation PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[16].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[17] /* bodyShape.useQuaternions PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[17].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[18] /* bodyShape.w_0_fixed PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[18].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[19] /* bodyShape.z_0_fixed PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[19].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[20] /* cutForce.animation PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[20].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[23] /* force.animation PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[23].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[24] /* idealGearR2T.useSupportR PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[24].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[25] /* idealGearR2T.useSupportT PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[25].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[26] /* prismatic.animation PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[26].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[27] /* prismatic.useAxisFlange PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[27].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[28] /* revolute.animation PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[28].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[29] /* revolute.useAxisFlange PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[29].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[30] /* springDamper.useHeatPort PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[30].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[31] /* world.animateGravity PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[31].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[32] /* world.animateGround PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[32].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[33] /* world.animateWorld PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[33].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[34] /* world.axisShowLabels PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[34].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[36] /* world.enableAnimation PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[36].time_unvarying = 1;
  (data->simulationInfo->integerParameter[19] /* cutForce.cutForce.resolveInFrame PARAM */) = 2;
  data->modelData->integerParameterData[19].time_unvarying = 1;
  (data->simulationInfo->integerParameter[21] /* cutForce.forceArrow.quantity PARAM */) = 1;
  data->modelData->integerParameterData[21].time_unvarying = 1;
  (data->simulationInfo->integerParameter[22] /* cutForce.resolveInFrame PARAM */) = 2;
  data->modelData->integerParameterData[22].time_unvarying = 1;
  (data->simulationInfo->integerParameter[24] /* force.arrow.quantity PARAM */) = 1;
  data->modelData->integerParameterData[24].time_unvarying = 1;
  (data->simulationInfo->integerParameter[25] /* force.basicWorldForce.resolveInFrame PARAM */) = 1;
  data->modelData->integerParameterData[25].time_unvarying = 1;
  (data->simulationInfo->integerParameter[26] /* force.resolveInFrame PARAM */) = 1;
  data->modelData->integerParameterData[26].time_unvarying = 1;
  (data->simulationInfo->integerParameter[27] /* prismatic.stateSelect PARAM */) = 4;
  data->modelData->integerParameterData[27].time_unvarying = 1;
  (data->simulationInfo->integerParameter[28] /* revolute.stateSelect PARAM */) = 4;
  data->modelData->integerParameterData[28].time_unvarying = 1;
  (data->simulationInfo->integerParameter[29] /* springDamper.stateSelect PARAM */) = 4;
  data->modelData->integerParameterData[29].time_unvarying = 1;
  (data->simulationInfo->integerParameter[30] /* world.gravityType PARAM */) = 1;
  data->modelData->integerParameterData[30].time_unvarying = 1;
  inerter_test3_updateBoundParameters_0(data, threadData);
  inerter_test3_updateBoundParameters_1(data, threadData);
  TRACE_POP
  return 0;
}

#if defined(__cplusplus)
}
#endif

