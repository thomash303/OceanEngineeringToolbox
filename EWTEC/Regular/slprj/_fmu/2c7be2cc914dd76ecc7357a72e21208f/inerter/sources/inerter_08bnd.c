/* update bound parameters and variable attributes (start, nominal, min, max) */
#include "inerter_model.h"
#if defined(__cplusplus)
extern "C" {
#endif


/*
equation index: 739
type: SIMPLE_ASSIGN
$START.body.z_a[3] = body.z_0_start[3]
*/
static void inerter_eqFunction_739(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,739};
  (data->modelData->realVarsData[94] /* body.z_a[3] variable */).attribute .start = (data->simulationInfo->realParameter[60] /* body.z_0_start[3] PARAM */);
    (data->localData[0]->realVars[94] /* body.z_a[3] variable */) = (data->modelData->realVarsData[94] /* body.z_a[3] variable */).attribute .start;
    infoStreamPrint(LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[94].info /* body.z_a[3] */.name, (modelica_real) (data->localData[0]->realVars[94] /* body.z_a[3] variable */));
  TRACE_POP
}

/*
equation index: 740
type: SIMPLE_ASSIGN
$START.body.z_a[2] = body.z_0_start[2]
*/
static void inerter_eqFunction_740(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,740};
  (data->modelData->realVarsData[93] /* body.z_a[2] variable */).attribute .start = (data->simulationInfo->realParameter[59] /* body.z_0_start[2] PARAM */);
    (data->localData[0]->realVars[93] /* body.z_a[2] variable */) = (data->modelData->realVarsData[93] /* body.z_a[2] variable */).attribute .start;
    infoStreamPrint(LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[93].info /* body.z_a[2] */.name, (modelica_real) (data->localData[0]->realVars[93] /* body.z_a[2] variable */));
  TRACE_POP
}

/*
equation index: 741
type: SIMPLE_ASSIGN
$START.body.z_a[1] = body.z_0_start[1]
*/
static void inerter_eqFunction_741(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,741};
  (data->modelData->realVarsData[92] /* body.z_a[1] variable */).attribute .start = (data->simulationInfo->realParameter[58] /* body.z_0_start[1] PARAM */);
    (data->localData[0]->realVars[92] /* body.z_a[1] variable */) = (data->modelData->realVarsData[92] /* body.z_a[1] variable */).attribute .start;
    infoStreamPrint(LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[92].info /* body.z_a[1] */.name, (modelica_real) (data->localData[0]->realVars[92] /* body.z_a[1] variable */));
  TRACE_POP
}

/*
equation index: 742
type: SIMPLE_ASSIGN
$START.body.w_a[3] = body.w_0_start[3]
*/
static void inerter_eqFunction_742(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,742};
  (data->modelData->realVarsData[91] /* body.w_a[3] DUMMY_STATE */).attribute .start = (data->simulationInfo->realParameter[57] /* body.w_0_start[3] PARAM */);
    (data->localData[0]->realVars[91] /* body.w_a[3] DUMMY_STATE */) = (data->modelData->realVarsData[91] /* body.w_a[3] DUMMY_STATE */).attribute .start;
    infoStreamPrint(LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[91].info /* body.w_a[3] */.name, (modelica_real) (data->localData[0]->realVars[91] /* body.w_a[3] DUMMY_STATE */));
  TRACE_POP
}

/*
equation index: 743
type: SIMPLE_ASSIGN
$START.body.w_a[2] = body.w_0_start[2]
*/
static void inerter_eqFunction_743(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,743};
  (data->modelData->realVarsData[90] /* body.w_a[2] DUMMY_STATE */).attribute .start = (data->simulationInfo->realParameter[56] /* body.w_0_start[2] PARAM */);
    (data->localData[0]->realVars[90] /* body.w_a[2] DUMMY_STATE */) = (data->modelData->realVarsData[90] /* body.w_a[2] DUMMY_STATE */).attribute .start;
    infoStreamPrint(LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[90].info /* body.w_a[2] */.name, (modelica_real) (data->localData[0]->realVars[90] /* body.w_a[2] DUMMY_STATE */));
  TRACE_POP
}

/*
equation index: 744
type: SIMPLE_ASSIGN
$START.body.w_a[1] = body.w_0_start[1]
*/
static void inerter_eqFunction_744(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,744};
  (data->modelData->realVarsData[89] /* body.w_a[1] DUMMY_STATE */).attribute .start = (data->simulationInfo->realParameter[55] /* body.w_0_start[1] PARAM */);
    (data->localData[0]->realVars[89] /* body.w_a[1] DUMMY_STATE */) = (data->modelData->realVarsData[89] /* body.w_a[1] DUMMY_STATE */).attribute .start;
    infoStreamPrint(LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[89].info /* body.w_a[1] */.name, (modelica_real) (data->localData[0]->realVars[89] /* body.w_a[1] DUMMY_STATE */));
  TRACE_POP
}
/*
equation index: 745
type: SIMPLE_ASSIGN
springDamper.s_rel = springDamper.s_nominal
*/
static void inerter_eqFunction_745(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,745};
  data->modelData->realVarsData[216].attribute /* springDamper.s_rel */.nominal = (data->simulationInfo->realParameter[232] /* springDamper.s_nominal PARAM */);
  infoStreamPrint(LOG_INIT_V, 0, "%s(nominal=%g)", data->modelData->realVarsData[216].info /* springDamper.s_rel */.name,
        (modelica_real) data->modelData->realVarsData[216].attribute /* springDamper.s_rel */.nominal);
  TRACE_POP
}

OMC_DISABLE_OPT
int inerter_updateBoundVariableAttributes(DATA *data, threadData_t *threadData)
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
  inerter_eqFunction_745(data, threadData);
  if (ACTIVE_STREAM(LOG_INIT)) messageClose(LOG_INIT);
  
  /* start ****************************************************** */
  infoStreamPrint(LOG_INIT, 1, "updating primary start-values");
  inerter_eqFunction_739(data, threadData);

  inerter_eqFunction_740(data, threadData);

  inerter_eqFunction_741(data, threadData);

  inerter_eqFunction_742(data, threadData);

  inerter_eqFunction_743(data, threadData);

  inerter_eqFunction_744(data, threadData);
  if (ACTIVE_STREAM(LOG_INIT)) messageClose(LOG_INIT);
  
  TRACE_POP
  return 0;
}

void inerter_updateBoundParameters_0(DATA *data, threadData_t *threadData);
void inerter_updateBoundParameters_1(DATA *data, threadData_t *threadData);
OMC_DISABLE_OPT
int inerter_updateBoundParameters(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  (data->localData[0]->integerVars[0] /* body.sphereColor[1] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[0].time_unvarying = 1;
  (data->localData[0]->integerVars[3] /* bodyShape.body.sphereColor[1] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[3].time_unvarying = 1;
  (data->localData[0]->integerVars[6] /* bodyShape.color[1] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[6].time_unvarying = 1;
  (data->localData[0]->integerVars[13] /* prismatic.boxColor[2] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[13].time_unvarying = 1;
  (data->localData[0]->integerVars[14] /* prismatic.boxColor[3] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[14].time_unvarying = 1;
  (data->localData[0]->integerVars[16] /* revolute.cylinderColor[2] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[16].time_unvarying = 1;
  (data->localData[0]->integerVars[17] /* revolute.cylinderColor[3] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[17].time_unvarying = 1;
  (data->localData[0]->integerVars[18] /* world.axisColor_x[1] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[18].time_unvarying = 1;
  (data->localData[0]->integerVars[19] /* world.axisColor_x[2] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[19].time_unvarying = 1;
  (data->localData[0]->integerVars[20] /* world.axisColor_x[3] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[20].time_unvarying = 1;
  (data->localData[0]->integerVars[21] /* world.gravityArrowColor[1] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[21].time_unvarying = 1;
  (data->localData[0]->integerVars[23] /* world.gravityArrowColor[3] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[23].time_unvarying = 1;
  (data->localData[0]->integerVars[24] /* world.gravitySphereColor[1] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[24].time_unvarying = 1;
  (data->localData[0]->integerVars[26] /* world.gravitySphereColor[3] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[26].time_unvarying = 1;
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
  (data->simulationInfo->integerParameter[22] /* world.ndim PARAM */) = ((modelica_integer) 1);
  data->modelData->integerParameterData[22].time_unvarying = 1;
  (data->simulationInfo->integerParameter[23] /* world.ndim2 PARAM */) = ((modelica_integer) 1);
  data->modelData->integerParameterData[23].time_unvarying = 1;
  (data->simulationInfo->integerParameter[24] /* world.ndim_pointGravity PARAM */) = ((modelica_integer) 0);
  data->modelData->integerParameterData[24].time_unvarying = 1;
  (data->simulationInfo->integerParameter[25] /* world.x_label.n PARAM */) = ((modelica_integer) 2);
  data->modelData->integerParameterData[25].time_unvarying = 1;
  (data->simulationInfo->integerParameter[26] /* world.y_label.n PARAM */) = ((modelica_integer) 2);
  data->modelData->integerParameterData[26].time_unvarying = 1;
  (data->simulationInfo->integerParameter[27] /* world.z_label.n PARAM */) = ((modelica_integer) 3);
  data->modelData->integerParameterData[27].time_unvarying = 1;
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
  (data->simulationInfo->realParameter[178] /* idealGearR2T.fixedR.phi0 PARAM */) = 0.0;
  data->modelData->realParameterData[178].time_unvarying = 1;
  (data->simulationInfo->realParameter[180] /* idealGearR2T.fixedT.s0 PARAM */) = 0.0;
  data->modelData->realParameterData[180].time_unvarying = 1;
  (data->simulationInfo->realParameter[197] /* prismatic.boxWidthDirection[1] PARAM */) = 0.0;
  data->modelData->realParameterData[197].time_unvarying = 1;
  (data->simulationInfo->realParameter[198] /* prismatic.boxWidthDirection[2] PARAM */) = 1.0;
  data->modelData->realParameterData[198].time_unvarying = 1;
  (data->simulationInfo->realParameter[199] /* prismatic.boxWidthDirection[3] PARAM */) = 0.0;
  data->modelData->realParameterData[199].time_unvarying = 1;
  (data->simulationInfo->realParameter[200] /* prismatic.e[1] PARAM */) = 0.0;
  data->modelData->realParameterData[200].time_unvarying = 1;
  (data->simulationInfo->realParameter[201] /* prismatic.e[2] PARAM */) = 0.0;
  data->modelData->realParameterData[201].time_unvarying = 1;
  (data->simulationInfo->realParameter[202] /* prismatic.e[3] PARAM */) = 1.0;
  data->modelData->realParameterData[202].time_unvarying = 1;
  (data->simulationInfo->realParameter[204] /* prismatic.fixed.s0 PARAM */) = 0.0;
  data->modelData->realParameterData[204].time_unvarying = 1;
  (data->simulationInfo->realParameter[205] /* prismatic.n[1] PARAM */) = 0.0;
  data->modelData->realParameterData[205].time_unvarying = 1;
  (data->simulationInfo->realParameter[206] /* prismatic.n[2] PARAM */) = 0.0;
  data->modelData->realParameterData[206].time_unvarying = 1;
  (data->simulationInfo->realParameter[207] /* prismatic.n[3] PARAM */) = 1.0;
  data->modelData->realParameterData[207].time_unvarying = 1;
  (data->simulationInfo->realParameter[219] /* revolute.e[1] PARAM */) = 0.0;
  data->modelData->realParameterData[219].time_unvarying = 1;
  (data->simulationInfo->realParameter[220] /* revolute.e[2] PARAM */) = 0.0;
  data->modelData->realParameterData[220].time_unvarying = 1;
  (data->simulationInfo->realParameter[221] /* revolute.e[3] PARAM */) = 1.0;
  data->modelData->realParameterData[221].time_unvarying = 1;
  (data->simulationInfo->realParameter[223] /* revolute.fixed.phi0 PARAM */) = 0.0;
  data->modelData->realParameterData[223].time_unvarying = 1;
  (data->simulationInfo->realParameter[224] /* revolute.n[1] PARAM */) = 0.0;
  data->modelData->realParameterData[224].time_unvarying = 1;
  (data->simulationInfo->realParameter[225] /* revolute.n[2] PARAM */) = 0.0;
  data->modelData->realParameterData[225].time_unvarying = 1;
  (data->simulationInfo->realParameter[226] /* revolute.n[3] PARAM */) = 1.0;
  data->modelData->realParameterData[226].time_unvarying = 1;
  (data->simulationInfo->realParameter[238] /* world.defaultBodyDiameter PARAM */) = 0.1111111111111111;
  data->modelData->realParameterData[238].time_unvarying = 1;
  (data->simulationInfo->realParameter[269] /* world.n[1] PARAM */) = 0.0;
  data->modelData->realParameterData[269].time_unvarying = 1;
  (data->simulationInfo->realParameter[270] /* world.n[2] PARAM */) = -1.0;
  data->modelData->realParameterData[270].time_unvarying = 1;
  (data->simulationInfo->realParameter[271] /* world.n[3] PARAM */) = 0.0;
  data->modelData->realParameterData[271].time_unvarying = 1;
  (data->simulationInfo->realParameter[272] /* world.nominalLength PARAM */) = 1.0;
  data->modelData->realParameterData[272].time_unvarying = 1;
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
  (data->simulationInfo->booleanParameter[20] /* idealGearR2T.useSupportR PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[20].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[21] /* idealGearR2T.useSupportT PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[21].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[22] /* position.exact PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[22].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[23] /* position.useSupport PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[23].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[24] /* prismatic.animation PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[24].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[25] /* prismatic.useAxisFlange PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[25].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[26] /* revolute.animation PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[26].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[27] /* revolute.useAxisFlange PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[27].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[28] /* springDamper.useHeatPort PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[28].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[29] /* world.animateGravity PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[29].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[30] /* world.animateGround PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[30].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[31] /* world.animateWorld PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[31].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[32] /* world.axisShowLabels PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[32].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[34] /* world.enableAnimation PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[34].time_unvarying = 1;
  (data->simulationInfo->integerParameter[18] /* prismatic.stateSelect PARAM */) = 4;
  data->modelData->integerParameterData[18].time_unvarying = 1;
  (data->simulationInfo->integerParameter[19] /* revolute.stateSelect PARAM */) = 4;
  data->modelData->integerParameterData[19].time_unvarying = 1;
  (data->simulationInfo->integerParameter[20] /* springDamper.stateSelect PARAM */) = 4;
  data->modelData->integerParameterData[20].time_unvarying = 1;
  (data->simulationInfo->integerParameter[21] /* world.gravityType PARAM */) = 1;
  data->modelData->integerParameterData[21].time_unvarying = 1;
  inerter_updateBoundParameters_0(data, threadData);
  inerter_updateBoundParameters_1(data, threadData);
  TRACE_POP
  return 0;
}

#if defined(__cplusplus)
}
#endif

