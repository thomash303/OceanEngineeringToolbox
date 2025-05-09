/* update bound parameters and variable attributes (start, nominal, min, max) */
#include "inerter_test2_model.h"
#if defined(__cplusplus)
extern "C" {
#endif


/*
equation index: 1164
type: SIMPLE_ASSIGN
$START.body.z_a[1] = body.z_0_start[1]
*/
static void inerter_test2_eqFunction_1164(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1164};
  (data->modelData->realVarsData[405] /* body.z_a[1] variable */).attribute .start = (data->simulationInfo->realParameter[62] /* body.z_0_start[1] PARAM */);
    (data->localData[0]->realVars[405] /* body.z_a[1] variable */) = (data->modelData->realVarsData[405] /* body.z_a[1] variable */).attribute .start;
    infoStreamPrint(LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[405].info /* body.z_a[1] */.name, (modelica_real) (data->localData[0]->realVars[405] /* body.z_a[1] variable */));
  TRACE_POP
}

/*
equation index: 1163
type: SIMPLE_ASSIGN
$START.body.z_a[2] = body.z_0_start[2]
*/
static void inerter_test2_eqFunction_1163(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1163};
  (data->modelData->realVarsData[406] /* body.z_a[2] variable */).attribute .start = (data->simulationInfo->realParameter[63] /* body.z_0_start[2] PARAM */);
    (data->localData[0]->realVars[406] /* body.z_a[2] variable */) = (data->modelData->realVarsData[406] /* body.z_a[2] variable */).attribute .start;
    infoStreamPrint(LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[406].info /* body.z_a[2] */.name, (modelica_real) (data->localData[0]->realVars[406] /* body.z_a[2] variable */));
  TRACE_POP
}

/*
equation index: 1162
type: SIMPLE_ASSIGN
$START.body.z_a[3] = body.z_0_start[3]
*/
static void inerter_test2_eqFunction_1162(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1162};
  (data->modelData->realVarsData[407] /* body.z_a[3] variable */).attribute .start = (data->simulationInfo->realParameter[64] /* body.z_0_start[3] PARAM */);
    (data->localData[0]->realVars[407] /* body.z_a[3] variable */) = (data->modelData->realVarsData[407] /* body.z_a[3] variable */).attribute .start;
    infoStreamPrint(LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[407].info /* body.z_a[3] */.name, (modelica_real) (data->localData[0]->realVars[407] /* body.z_a[3] variable */));
  TRACE_POP
}

/*
equation index: 1161
type: SIMPLE_ASSIGN
$START.body.w_a[1] = body.w_0_start[1]
*/
static void inerter_test2_eqFunction_1161(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1161};
  (data->modelData->realVarsData[402] /* body.w_a[1] DUMMY_STATE */).attribute .start = (data->simulationInfo->realParameter[59] /* body.w_0_start[1] PARAM */);
    (data->localData[0]->realVars[402] /* body.w_a[1] DUMMY_STATE */) = (data->modelData->realVarsData[402] /* body.w_a[1] DUMMY_STATE */).attribute .start;
    infoStreamPrint(LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[402].info /* body.w_a[1] */.name, (modelica_real) (data->localData[0]->realVars[402] /* body.w_a[1] DUMMY_STATE */));
  TRACE_POP
}

/*
equation index: 1160
type: SIMPLE_ASSIGN
$START.body.w_a[2] = body.w_0_start[2]
*/
static void inerter_test2_eqFunction_1160(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1160};
  (data->modelData->realVarsData[403] /* body.w_a[2] DUMMY_STATE */).attribute .start = (data->simulationInfo->realParameter[60] /* body.w_0_start[2] PARAM */);
    (data->localData[0]->realVars[403] /* body.w_a[2] DUMMY_STATE */) = (data->modelData->realVarsData[403] /* body.w_a[2] DUMMY_STATE */).attribute .start;
    infoStreamPrint(LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[403].info /* body.w_a[2] */.name, (modelica_real) (data->localData[0]->realVars[403] /* body.w_a[2] DUMMY_STATE */));
  TRACE_POP
}

/*
equation index: 1159
type: SIMPLE_ASSIGN
$START.body.w_a[3] = body.w_0_start[3]
*/
static void inerter_test2_eqFunction_1159(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1159};
  (data->modelData->realVarsData[404] /* body.w_a[3] DUMMY_STATE */).attribute .start = (data->simulationInfo->realParameter[61] /* body.w_0_start[3] PARAM */);
    (data->localData[0]->realVars[404] /* body.w_a[3] DUMMY_STATE */) = (data->modelData->realVarsData[404] /* body.w_a[3] DUMMY_STATE */).attribute .start;
    infoStreamPrint(LOG_INIT_V, 0, "updated start value: %s(start=%g)", data->modelData->realVarsData[404].info /* body.w_a[3] */.name, (modelica_real) (data->localData[0]->realVars[404] /* body.w_a[3] DUMMY_STATE */));
  TRACE_POP
}
/*
equation index: 1165
type: SIMPLE_ASSIGN
springDamper.s_rel = springDamper.s_nominal
*/
static void inerter_test2_eqFunction_1165(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,1165};
  data->modelData->realVarsData[613].attribute /* springDamper.s_rel */.nominal = (data->simulationInfo->realParameter[235] /* springDamper.s_nominal PARAM */);
  infoStreamPrint(LOG_INIT_V, 0, "%s(nominal=%g)", data->modelData->realVarsData[613].info /* springDamper.s_rel */.name,
        (modelica_real) data->modelData->realVarsData[613].attribute /* springDamper.s_rel */.nominal);
  TRACE_POP
}

OMC_DISABLE_OPT
int inerter_test2_updateBoundVariableAttributes(DATA *data, threadData_t *threadData)
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
  inerter_test2_eqFunction_1165(data, threadData);
  if (ACTIVE_STREAM(LOG_INIT)) messageClose(LOG_INIT);
  
  /* start ****************************************************** */
  infoStreamPrint(LOG_INIT, 1, "updating primary start-values");
  inerter_test2_eqFunction_1164(data, threadData);

  inerter_test2_eqFunction_1163(data, threadData);

  inerter_test2_eqFunction_1162(data, threadData);

  inerter_test2_eqFunction_1161(data, threadData);

  inerter_test2_eqFunction_1160(data, threadData);

  inerter_test2_eqFunction_1159(data, threadData);
  if (ACTIVE_STREAM(LOG_INIT)) messageClose(LOG_INIT);
  
  TRACE_POP
  return 0;
}

void inerter_test2_updateBoundParameters_0(DATA *data, threadData_t *threadData);
void inerter_test2_updateBoundParameters_1(DATA *data, threadData_t *threadData);
void inerter_test2_updateBoundParameters_2(DATA *data, threadData_t *threadData);
OMC_DISABLE_OPT
int inerter_test2_updateBoundParameters(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  (data->localData[0]->integerVars[2] /* SprungMassCase3.arrowColor[3] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[2].time_unvarying = 1;
  (data->localData[0]->integerVars[3] /* body.sphereColor[1] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[3].time_unvarying = 1;
  (data->localData[0]->integerVars[6] /* bodyShape.body.sphereColor[1] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[6].time_unvarying = 1;
  (data->localData[0]->integerVars[9] /* bodyShape.color[1] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[9].time_unvarying = 1;
  (data->localData[0]->integerVars[15] /* cutForce.forceColor[1] DISCRETE */) = ((modelica_integer) 0);
  data->modelData->integerVarsData[15].time_unvarying = 1;
  (data->localData[0]->integerVars[17] /* cutForce.forceColor[3] DISCRETE */) = ((modelica_integer) 0);
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
  (data->simulationInfo->integerParameter[11] /* SprungMassCase3.sequence[1] PARAM */) = ((modelica_integer) 1);
  data->modelData->integerParameterData[11].time_unvarying = 1;
  (data->simulationInfo->integerParameter[12] /* SprungMassCase3.sequence[2] PARAM */) = ((modelica_integer) 2);
  data->modelData->integerParameterData[12].time_unvarying = 1;
  (data->simulationInfo->integerParameter[13] /* SprungMassCase3.sequence[3] PARAM */) = ((modelica_integer) 3);
  data->modelData->integerParameterData[13].time_unvarying = 1;
  (data->simulationInfo->integerParameter[24] /* body.sequence_angleStates[1] PARAM */) = ((modelica_integer) 1);
  data->modelData->integerParameterData[24].time_unvarying = 1;
  (data->simulationInfo->integerParameter[25] /* body.sequence_angleStates[2] PARAM */) = ((modelica_integer) 2);
  data->modelData->integerParameterData[25].time_unvarying = 1;
  (data->simulationInfo->integerParameter[26] /* body.sequence_angleStates[3] PARAM */) = ((modelica_integer) 3);
  data->modelData->integerParameterData[26].time_unvarying = 1;
  (data->simulationInfo->integerParameter[27] /* body.sequence_start[1] PARAM */) = ((modelica_integer) 1);
  data->modelData->integerParameterData[27].time_unvarying = 1;
  (data->simulationInfo->integerParameter[28] /* body.sequence_start[2] PARAM */) = ((modelica_integer) 2);
  data->modelData->integerParameterData[28].time_unvarying = 1;
  (data->simulationInfo->integerParameter[29] /* body.sequence_start[3] PARAM */) = ((modelica_integer) 3);
  data->modelData->integerParameterData[29].time_unvarying = 1;
  (data->simulationInfo->integerParameter[30] /* bodyShape.body.sequence_angleStates[1] PARAM */) = ((modelica_integer) 1);
  data->modelData->integerParameterData[30].time_unvarying = 1;
  (data->simulationInfo->integerParameter[31] /* bodyShape.body.sequence_angleStates[2] PARAM */) = ((modelica_integer) 2);
  data->modelData->integerParameterData[31].time_unvarying = 1;
  (data->simulationInfo->integerParameter[32] /* bodyShape.body.sequence_angleStates[3] PARAM */) = ((modelica_integer) 3);
  data->modelData->integerParameterData[32].time_unvarying = 1;
  (data->simulationInfo->integerParameter[33] /* bodyShape.body.sequence_start[1] PARAM */) = ((modelica_integer) 1);
  data->modelData->integerParameterData[33].time_unvarying = 1;
  (data->simulationInfo->integerParameter[34] /* bodyShape.body.sequence_start[2] PARAM */) = ((modelica_integer) 2);
  data->modelData->integerParameterData[34].time_unvarying = 1;
  (data->simulationInfo->integerParameter[35] /* bodyShape.body.sequence_start[3] PARAM */) = ((modelica_integer) 3);
  data->modelData->integerParameterData[35].time_unvarying = 1;
  (data->simulationInfo->integerParameter[36] /* bodyShape.sequence_angleStates[1] PARAM */) = ((modelica_integer) 1);
  data->modelData->integerParameterData[36].time_unvarying = 1;
  (data->simulationInfo->integerParameter[37] /* bodyShape.sequence_angleStates[2] PARAM */) = ((modelica_integer) 2);
  data->modelData->integerParameterData[37].time_unvarying = 1;
  (data->simulationInfo->integerParameter[38] /* bodyShape.sequence_angleStates[3] PARAM */) = ((modelica_integer) 3);
  data->modelData->integerParameterData[38].time_unvarying = 1;
  (data->simulationInfo->integerParameter[39] /* bodyShape.sequence_start[1] PARAM */) = ((modelica_integer) 1);
  data->modelData->integerParameterData[39].time_unvarying = 1;
  (data->simulationInfo->integerParameter[40] /* bodyShape.sequence_start[2] PARAM */) = ((modelica_integer) 2);
  data->modelData->integerParameterData[40].time_unvarying = 1;
  (data->simulationInfo->integerParameter[41] /* bodyShape.sequence_start[3] PARAM */) = ((modelica_integer) 3);
  data->modelData->integerParameterData[41].time_unvarying = 1;
  (data->simulationInfo->integerParameter[51] /* world.ndim PARAM */) = ((modelica_integer) 1);
  data->modelData->integerParameterData[51].time_unvarying = 1;
  (data->simulationInfo->integerParameter[52] /* world.ndim2 PARAM */) = ((modelica_integer) 1);
  data->modelData->integerParameterData[52].time_unvarying = 1;
  (data->simulationInfo->integerParameter[53] /* world.ndim_pointGravity PARAM */) = ((modelica_integer) 0);
  data->modelData->integerParameterData[53].time_unvarying = 1;
  (data->simulationInfo->integerParameter[54] /* world.x_label.n PARAM */) = ((modelica_integer) 2);
  data->modelData->integerParameterData[54].time_unvarying = 1;
  (data->simulationInfo->integerParameter[55] /* world.y_label.n PARAM */) = ((modelica_integer) 2);
  data->modelData->integerParameterData[55].time_unvarying = 1;
  (data->simulationInfo->integerParameter[56] /* world.z_label.n PARAM */) = ((modelica_integer) 3);
  data->modelData->integerParameterData[56].time_unvarying = 1;
  (data->localData[0]->realVars[75] /* SprungMassCase3.absoluteVelocity.transformAbsoluteVector.zeroPosition.frame_resolve.f[1] variable */) = -0.0;
  data->modelData->realVarsData[75].time_unvarying = 1;
  (data->localData[0]->realVars[76] /* SprungMassCase3.absoluteVelocity.transformAbsoluteVector.zeroPosition.frame_resolve.f[2] variable */) = -0.0;
  data->modelData->realVarsData[76].time_unvarying = 1;
  (data->localData[0]->realVars[77] /* SprungMassCase3.absoluteVelocity.transformAbsoluteVector.zeroPosition.frame_resolve.f[3] variable */) = -0.0;
  data->modelData->realVarsData[77].time_unvarying = 1;
  (data->localData[0]->realVars[81] /* SprungMassCase3.absoluteVelocity.transformAbsoluteVector.zeroPosition.frame_resolve.t[1] variable */) = -0.0;
  data->modelData->realVarsData[81].time_unvarying = 1;
  (data->localData[0]->realVars[82] /* SprungMassCase3.absoluteVelocity.transformAbsoluteVector.zeroPosition.frame_resolve.t[2] variable */) = -0.0;
  data->modelData->realVarsData[82].time_unvarying = 1;
  (data->localData[0]->realVars[83] /* SprungMassCase3.absoluteVelocity.transformAbsoluteVector.zeroPosition.frame_resolve.t[3] variable */) = -0.0;
  data->modelData->realVarsData[83].time_unvarying = 1;
  (data->localData[0]->realVars[96] /* SprungMassCase3.absoluteVelocity.zeroPosition.frame_resolve.f[1] variable */) = -0.0;
  data->modelData->realVarsData[96].time_unvarying = 1;
  (data->localData[0]->realVars[97] /* SprungMassCase3.absoluteVelocity.zeroPosition.frame_resolve.f[2] variable */) = -0.0;
  data->modelData->realVarsData[97].time_unvarying = 1;
  (data->localData[0]->realVars[98] /* SprungMassCase3.absoluteVelocity.zeroPosition.frame_resolve.f[3] variable */) = -0.0;
  data->modelData->realVarsData[98].time_unvarying = 1;
  (data->localData[0]->realVars[102] /* SprungMassCase3.absoluteVelocity.zeroPosition.frame_resolve.t[1] variable */) = -0.0;
  data->modelData->realVarsData[102].time_unvarying = 1;
  (data->localData[0]->realVars[103] /* SprungMassCase3.absoluteVelocity.zeroPosition.frame_resolve.t[2] variable */) = -0.0;
  data->modelData->realVarsData[103].time_unvarying = 1;
  (data->localData[0]->realVars[104] /* SprungMassCase3.absoluteVelocity.zeroPosition.frame_resolve.t[3] variable */) = -0.0;
  data->modelData->realVarsData[104].time_unvarying = 1;
  (data->localData[0]->realVars[180] /* SprungMassCase3.position.zeroPosition.frame_resolve.f[1] variable */) = -0.0;
  data->modelData->realVarsData[180].time_unvarying = 1;
  (data->localData[0]->realVars[181] /* SprungMassCase3.position.zeroPosition.frame_resolve.f[2] variable */) = -0.0;
  data->modelData->realVarsData[181].time_unvarying = 1;
  (data->localData[0]->realVars[182] /* SprungMassCase3.position.zeroPosition.frame_resolve.f[3] variable */) = -0.0;
  data->modelData->realVarsData[182].time_unvarying = 1;
  (data->localData[0]->realVars[186] /* SprungMassCase3.position.zeroPosition.frame_resolve.t[1] variable */) = -0.0;
  data->modelData->realVarsData[186].time_unvarying = 1;
  (data->localData[0]->realVars[187] /* SprungMassCase3.position.zeroPosition.frame_resolve.t[2] variable */) = -0.0;
  data->modelData->realVarsData[187].time_unvarying = 1;
  (data->localData[0]->realVars[188] /* SprungMassCase3.position.zeroPosition.frame_resolve.t[3] variable */) = -0.0;
  data->modelData->realVarsData[188].time_unvarying = 1;
  (data->localData[0]->realVars[227] /* SprungMassCase3.transformVector_a.zeroPosition.frame_resolve.f[1] variable */) = -0.0;
  data->modelData->realVarsData[227].time_unvarying = 1;
  (data->localData[0]->realVars[228] /* SprungMassCase3.transformVector_a.zeroPosition.frame_resolve.f[2] variable */) = -0.0;
  data->modelData->realVarsData[228].time_unvarying = 1;
  (data->localData[0]->realVars[229] /* SprungMassCase3.transformVector_a.zeroPosition.frame_resolve.f[3] variable */) = -0.0;
  data->modelData->realVarsData[229].time_unvarying = 1;
  (data->localData[0]->realVars[233] /* SprungMassCase3.transformVector_a.zeroPosition.frame_resolve.t[1] variable */) = -0.0;
  data->modelData->realVarsData[233].time_unvarying = 1;
  (data->localData[0]->realVars[234] /* SprungMassCase3.transformVector_a.zeroPosition.frame_resolve.t[2] variable */) = -0.0;
  data->modelData->realVarsData[234].time_unvarying = 1;
  (data->localData[0]->realVars[235] /* SprungMassCase3.transformVector_a.zeroPosition.frame_resolve.t[3] variable */) = -0.0;
  data->modelData->realVarsData[235].time_unvarying = 1;
  (data->localData[0]->realVars[295] /* SprungMassCase3.velocity.transformAbsoluteVector.zeroPosition.frame_resolve.f[1] variable */) = -0.0;
  data->modelData->realVarsData[295].time_unvarying = 1;
  (data->localData[0]->realVars[296] /* SprungMassCase3.velocity.transformAbsoluteVector.zeroPosition.frame_resolve.f[2] variable */) = -0.0;
  data->modelData->realVarsData[296].time_unvarying = 1;
  (data->localData[0]->realVars[297] /* SprungMassCase3.velocity.transformAbsoluteVector.zeroPosition.frame_resolve.f[3] variable */) = -0.0;
  data->modelData->realVarsData[297].time_unvarying = 1;
  (data->localData[0]->realVars[301] /* SprungMassCase3.velocity.transformAbsoluteVector.zeroPosition.frame_resolve.t[1] variable */) = -0.0;
  data->modelData->realVarsData[301].time_unvarying = 1;
  (data->localData[0]->realVars[302] /* SprungMassCase3.velocity.transformAbsoluteVector.zeroPosition.frame_resolve.t[2] variable */) = -0.0;
  data->modelData->realVarsData[302].time_unvarying = 1;
  (data->localData[0]->realVars[303] /* SprungMassCase3.velocity.transformAbsoluteVector.zeroPosition.frame_resolve.t[3] variable */) = -0.0;
  data->modelData->realVarsData[303].time_unvarying = 1;
  (data->localData[0]->realVars[316] /* SprungMassCase3.velocity.zeroPosition.frame_resolve.f[1] variable */) = -0.0;
  data->modelData->realVarsData[316].time_unvarying = 1;
  (data->localData[0]->realVars[317] /* SprungMassCase3.velocity.zeroPosition.frame_resolve.f[2] variable */) = -0.0;
  data->modelData->realVarsData[317].time_unvarying = 1;
  (data->localData[0]->realVars[318] /* SprungMassCase3.velocity.zeroPosition.frame_resolve.f[3] variable */) = -0.0;
  data->modelData->realVarsData[318].time_unvarying = 1;
  (data->localData[0]->realVars[322] /* SprungMassCase3.velocity.zeroPosition.frame_resolve.t[1] variable */) = -0.0;
  data->modelData->realVarsData[322].time_unvarying = 1;
  (data->localData[0]->realVars[323] /* SprungMassCase3.velocity.zeroPosition.frame_resolve.t[2] variable */) = -0.0;
  data->modelData->realVarsData[323].time_unvarying = 1;
  (data->localData[0]->realVars[324] /* SprungMassCase3.velocity.zeroPosition.frame_resolve.t[3] variable */) = -0.0;
  data->modelData->realVarsData[324].time_unvarying = 1;
  (data->localData[0]->realVars[533] /* cutForce.zeroPosition.frame_resolve.f[1] variable */) = -0.0;
  data->modelData->realVarsData[533].time_unvarying = 1;
  (data->localData[0]->realVars[534] /* cutForce.zeroPosition.frame_resolve.f[2] variable */) = -0.0;
  data->modelData->realVarsData[534].time_unvarying = 1;
  (data->localData[0]->realVars[535] /* cutForce.zeroPosition.frame_resolve.f[3] variable */) = -0.0;
  data->modelData->realVarsData[535].time_unvarying = 1;
  (data->localData[0]->realVars[539] /* cutForce.zeroPosition.frame_resolve.t[1] variable */) = -0.0;
  data->modelData->realVarsData[539].time_unvarying = 1;
  (data->localData[0]->realVars[540] /* cutForce.zeroPosition.frame_resolve.t[2] variable */) = -0.0;
  data->modelData->realVarsData[540].time_unvarying = 1;
  (data->localData[0]->realVars[541] /* cutForce.zeroPosition.frame_resolve.t[3] variable */) = -0.0;
  data->modelData->realVarsData[541].time_unvarying = 1;
  (data->simulationInfo->realParameter[21] /* body.Q_start[1] PARAM */) = 0.0;
  data->modelData->realParameterData[21].time_unvarying = 1;
  (data->simulationInfo->realParameter[22] /* body.Q_start[2] PARAM */) = 0.0;
  data->modelData->realParameterData[22].time_unvarying = 1;
  (data->simulationInfo->realParameter[23] /* body.Q_start[3] PARAM */) = 0.0;
  data->modelData->realParameterData[23].time_unvarying = 1;
  (data->simulationInfo->realParameter[24] /* body.Q_start[4] PARAM */) = 1.0;
  data->modelData->realParameterData[24].time_unvarying = 1;
  (data->simulationInfo->realParameter[25] /* body.R_start.T[1,1] PARAM */) = 1.0;
  data->modelData->realParameterData[25].time_unvarying = 1;
  (data->simulationInfo->realParameter[26] /* body.R_start.T[1,2] PARAM */) = 0.0;
  data->modelData->realParameterData[26].time_unvarying = 1;
  (data->simulationInfo->realParameter[27] /* body.R_start.T[1,3] PARAM */) = 0.0;
  data->modelData->realParameterData[27].time_unvarying = 1;
  (data->simulationInfo->realParameter[28] /* body.R_start.T[2,1] PARAM */) = 0.0;
  data->modelData->realParameterData[28].time_unvarying = 1;
  (data->simulationInfo->realParameter[29] /* body.R_start.T[2,2] PARAM */) = 1.0;
  data->modelData->realParameterData[29].time_unvarying = 1;
  (data->simulationInfo->realParameter[30] /* body.R_start.T[2,3] PARAM */) = 0.0;
  data->modelData->realParameterData[30].time_unvarying = 1;
  (data->simulationInfo->realParameter[31] /* body.R_start.T[3,1] PARAM */) = 0.0;
  data->modelData->realParameterData[31].time_unvarying = 1;
  (data->simulationInfo->realParameter[32] /* body.R_start.T[3,2] PARAM */) = 0.0;
  data->modelData->realParameterData[32].time_unvarying = 1;
  (data->simulationInfo->realParameter[33] /* body.R_start.T[3,3] PARAM */) = 1.0;
  data->modelData->realParameterData[33].time_unvarying = 1;
  (data->simulationInfo->realParameter[34] /* body.R_start.w[1] PARAM */) = 0.0;
  data->modelData->realParameterData[34].time_unvarying = 1;
  (data->simulationInfo->realParameter[35] /* body.R_start.w[2] PARAM */) = 0.0;
  data->modelData->realParameterData[35].time_unvarying = 1;
  (data->simulationInfo->realParameter[36] /* body.R_start.w[3] PARAM */) = 0.0;
  data->modelData->realParameterData[36].time_unvarying = 1;
  (data->simulationInfo->realParameter[58] /* body.sphereDiameter PARAM */) = 0.1111111111111111;
  data->modelData->realParameterData[58].time_unvarying = 1;
  (data->simulationInfo->realParameter[89] /* bodyShape.body.Q_start[1] PARAM */) = 0.0;
  data->modelData->realParameterData[89].time_unvarying = 1;
  (data->simulationInfo->realParameter[90] /* bodyShape.body.Q_start[2] PARAM */) = 0.0;
  data->modelData->realParameterData[90].time_unvarying = 1;
  (data->simulationInfo->realParameter[91] /* bodyShape.body.Q_start[3] PARAM */) = 0.0;
  data->modelData->realParameterData[91].time_unvarying = 1;
  (data->simulationInfo->realParameter[92] /* bodyShape.body.Q_start[4] PARAM */) = 1.0;
  data->modelData->realParameterData[92].time_unvarying = 1;
  (data->simulationInfo->realParameter[93] /* bodyShape.body.R_start.T[1,1] PARAM */) = 1.0;
  data->modelData->realParameterData[93].time_unvarying = 1;
  (data->simulationInfo->realParameter[94] /* bodyShape.body.R_start.T[1,2] PARAM */) = 0.0;
  data->modelData->realParameterData[94].time_unvarying = 1;
  (data->simulationInfo->realParameter[95] /* bodyShape.body.R_start.T[1,3] PARAM */) = 0.0;
  data->modelData->realParameterData[95].time_unvarying = 1;
  (data->simulationInfo->realParameter[96] /* bodyShape.body.R_start.T[2,1] PARAM */) = 0.0;
  data->modelData->realParameterData[96].time_unvarying = 1;
  (data->simulationInfo->realParameter[97] /* bodyShape.body.R_start.T[2,2] PARAM */) = 1.0;
  data->modelData->realParameterData[97].time_unvarying = 1;
  (data->simulationInfo->realParameter[98] /* bodyShape.body.R_start.T[2,3] PARAM */) = 0.0;
  data->modelData->realParameterData[98].time_unvarying = 1;
  (data->simulationInfo->realParameter[99] /* bodyShape.body.R_start.T[3,1] PARAM */) = 0.0;
  data->modelData->realParameterData[99].time_unvarying = 1;
  (data->simulationInfo->realParameter[100] /* bodyShape.body.R_start.T[3,2] PARAM */) = 0.0;
  data->modelData->realParameterData[100].time_unvarying = 1;
  (data->simulationInfo->realParameter[101] /* bodyShape.body.R_start.T[3,3] PARAM */) = 1.0;
  data->modelData->realParameterData[101].time_unvarying = 1;
  (data->simulationInfo->realParameter[102] /* bodyShape.body.R_start.w[1] PARAM */) = 0.0;
  data->modelData->realParameterData[102].time_unvarying = 1;
  (data->simulationInfo->realParameter[103] /* bodyShape.body.R_start.w[2] PARAM */) = 0.0;
  data->modelData->realParameterData[103].time_unvarying = 1;
  (data->simulationInfo->realParameter[104] /* bodyShape.body.R_start.w[3] PARAM */) = 0.0;
  data->modelData->realParameterData[104].time_unvarying = 1;
  (data->simulationInfo->realParameter[117] /* bodyShape.body.sphereDiameter PARAM */) = 0.1111111111111111;
  data->modelData->realParameterData[117].time_unvarying = 1;
  (data->simulationInfo->realParameter[128] /* bodyShape.frameTranslation.lengthDirection[1] PARAM */) = 0.0;
  data->modelData->realParameterData[128].time_unvarying = 1;
  (data->simulationInfo->realParameter[129] /* bodyShape.frameTranslation.lengthDirection[2] PARAM */) = 0.0;
  data->modelData->realParameterData[129].time_unvarying = 1;
  (data->simulationInfo->realParameter[130] /* bodyShape.frameTranslation.lengthDirection[3] PARAM */) = 0.0;
  data->modelData->realParameterData[130].time_unvarying = 1;
  (data->simulationInfo->realParameter[131] /* bodyShape.frameTranslation.r[1] PARAM */) = 0.0;
  data->modelData->realParameterData[131].time_unvarying = 1;
  (data->simulationInfo->realParameter[132] /* bodyShape.frameTranslation.r[2] PARAM */) = 0.0;
  data->modelData->realParameterData[132].time_unvarying = 1;
  (data->simulationInfo->realParameter[133] /* bodyShape.frameTranslation.r[3] PARAM */) = 0.0;
  data->modelData->realParameterData[133].time_unvarying = 1;
  (data->simulationInfo->realParameter[134] /* bodyShape.frameTranslation.r_shape[1] PARAM */) = 0.0;
  data->modelData->realParameterData[134].time_unvarying = 1;
  (data->simulationInfo->realParameter[135] /* bodyShape.frameTranslation.r_shape[2] PARAM */) = 0.0;
  data->modelData->realParameterData[135].time_unvarying = 1;
  (data->simulationInfo->realParameter[136] /* bodyShape.frameTranslation.r_shape[3] PARAM */) = 0.0;
  data->modelData->realParameterData[136].time_unvarying = 1;
  (data->simulationInfo->realParameter[139] /* bodyShape.frameTranslation.widthDirection[1] PARAM */) = 0.0;
  data->modelData->realParameterData[139].time_unvarying = 1;
  (data->simulationInfo->realParameter[140] /* bodyShape.frameTranslation.widthDirection[2] PARAM */) = 1.0;
  data->modelData->realParameterData[140].time_unvarying = 1;
  (data->simulationInfo->realParameter[141] /* bodyShape.frameTranslation.widthDirection[3] PARAM */) = 0.0;
  data->modelData->realParameterData[141].time_unvarying = 1;
  (data->simulationInfo->realParameter[144] /* bodyShape.lengthDirection[1] PARAM */) = 0.0;
  data->modelData->realParameterData[144].time_unvarying = 1;
  (data->simulationInfo->realParameter[145] /* bodyShape.lengthDirection[2] PARAM */) = 0.0;
  data->modelData->realParameterData[145].time_unvarying = 1;
  (data->simulationInfo->realParameter[146] /* bodyShape.lengthDirection[3] PARAM */) = 0.0;
  data->modelData->realParameterData[146].time_unvarying = 1;
  (data->simulationInfo->realParameter[148] /* bodyShape.r[1] PARAM */) = 0.0;
  data->modelData->realParameterData[148].time_unvarying = 1;
  (data->simulationInfo->realParameter[149] /* bodyShape.r[2] PARAM */) = 0.0;
  data->modelData->realParameterData[149].time_unvarying = 1;
  (data->simulationInfo->realParameter[150] /* bodyShape.r[3] PARAM */) = 0.0;
  data->modelData->realParameterData[150].time_unvarying = 1;
  (data->simulationInfo->realParameter[154] /* bodyShape.r_shape[1] PARAM */) = 0.0;
  data->modelData->realParameterData[154].time_unvarying = 1;
  (data->simulationInfo->realParameter[155] /* bodyShape.r_shape[2] PARAM */) = 0.0;
  data->modelData->realParameterData[155].time_unvarying = 1;
  (data->simulationInfo->realParameter[156] /* bodyShape.r_shape[3] PARAM */) = 0.0;
  data->modelData->realParameterData[156].time_unvarying = 1;
  (data->simulationInfo->realParameter[174] /* bodyShape.widthDirection[1] PARAM */) = 0.0;
  data->modelData->realParameterData[174].time_unvarying = 1;
  (data->simulationInfo->realParameter[175] /* bodyShape.widthDirection[2] PARAM */) = 1.0;
  data->modelData->realParameterData[175].time_unvarying = 1;
  (data->simulationInfo->realParameter[176] /* bodyShape.widthDirection[3] PARAM */) = 0.0;
  data->modelData->realParameterData[176].time_unvarying = 1;
  (data->simulationInfo->realParameter[185] /* idealGearR2T.fixedR.phi0 PARAM */) = 0.0;
  data->modelData->realParameterData[185].time_unvarying = 1;
  (data->simulationInfo->realParameter[187] /* idealGearR2T.fixedT.s0 PARAM */) = 0.0;
  data->modelData->realParameterData[187].time_unvarying = 1;
  (data->simulationInfo->realParameter[200] /* prismatic.boxWidthDirection[1] PARAM */) = 0.0;
  data->modelData->realParameterData[200].time_unvarying = 1;
  (data->simulationInfo->realParameter[201] /* prismatic.boxWidthDirection[2] PARAM */) = 1.0;
  data->modelData->realParameterData[201].time_unvarying = 1;
  (data->simulationInfo->realParameter[202] /* prismatic.boxWidthDirection[3] PARAM */) = 0.0;
  data->modelData->realParameterData[202].time_unvarying = 1;
  (data->simulationInfo->realParameter[203] /* prismatic.e[1] PARAM */) = 0.0;
  data->modelData->realParameterData[203].time_unvarying = 1;
  (data->simulationInfo->realParameter[204] /* prismatic.e[2] PARAM */) = 0.0;
  data->modelData->realParameterData[204].time_unvarying = 1;
  (data->simulationInfo->realParameter[205] /* prismatic.e[3] PARAM */) = 1.0;
  data->modelData->realParameterData[205].time_unvarying = 1;
  (data->simulationInfo->realParameter[207] /* prismatic.fixed.s0 PARAM */) = 0.0;
  data->modelData->realParameterData[207].time_unvarying = 1;
  (data->simulationInfo->realParameter[208] /* prismatic.n[1] PARAM */) = 0.0;
  data->modelData->realParameterData[208].time_unvarying = 1;
  (data->simulationInfo->realParameter[209] /* prismatic.n[2] PARAM */) = 0.0;
  data->modelData->realParameterData[209].time_unvarying = 1;
  (data->simulationInfo->realParameter[210] /* prismatic.n[3] PARAM */) = 1.0;
  data->modelData->realParameterData[210].time_unvarying = 1;
  (data->simulationInfo->realParameter[222] /* revolute.e[1] PARAM */) = 0.0;
  data->modelData->realParameterData[222].time_unvarying = 1;
  (data->simulationInfo->realParameter[223] /* revolute.e[2] PARAM */) = 0.0;
  data->modelData->realParameterData[223].time_unvarying = 1;
  (data->simulationInfo->realParameter[224] /* revolute.e[3] PARAM */) = 1.0;
  data->modelData->realParameterData[224].time_unvarying = 1;
  (data->simulationInfo->realParameter[226] /* revolute.fixed.phi0 PARAM */) = 0.0;
  data->modelData->realParameterData[226].time_unvarying = 1;
  (data->simulationInfo->realParameter[227] /* revolute.n[1] PARAM */) = 0.0;
  data->modelData->realParameterData[227].time_unvarying = 1;
  (data->simulationInfo->realParameter[228] /* revolute.n[2] PARAM */) = 0.0;
  data->modelData->realParameterData[228].time_unvarying = 1;
  (data->simulationInfo->realParameter[229] /* revolute.n[3] PARAM */) = 1.0;
  data->modelData->realParameterData[229].time_unvarying = 1;
  (data->simulationInfo->realParameter[241] /* world.defaultBodyDiameter PARAM */) = 0.1111111111111111;
  data->modelData->realParameterData[241].time_unvarying = 1;
  (data->simulationInfo->realParameter[272] /* world.n[1] PARAM */) = 0.0;
  data->modelData->realParameterData[272].time_unvarying = 1;
  (data->simulationInfo->realParameter[273] /* world.n[2] PARAM */) = -1.0;
  data->modelData->realParameterData[273].time_unvarying = 1;
  (data->simulationInfo->realParameter[274] /* world.n[3] PARAM */) = 0.0;
  data->modelData->realParameterData[274].time_unvarying = 1;
  (data->simulationInfo->realParameter[275] /* world.nominalLength PARAM */) = 1.0;
  data->modelData->realParameterData[275].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[0] /* SprungMassCase3.animation PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[0].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[1] /* SprungMassCase3.get_a PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[1].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[2] /* SprungMassCase3.get_angles PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[2].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[3] /* SprungMassCase3.get_r PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[3].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[4] /* SprungMassCase3.get_v PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[4].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[5] /* SprungMassCase3.get_w PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[5].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[6] /* SprungMassCase3.get_z PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[6].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[7] /* body.angles_fixed PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[7].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[8] /* body.animation PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[8].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[9] /* body.enforceStates PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[9].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[10] /* body.useQuaternions PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[10].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[11] /* body.w_0_fixed PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[11].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[12] /* body.z_0_fixed PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[12].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[13] /* bodyShape.angles_fixed PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[13].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[14] /* bodyShape.animateSphere PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[14].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[15] /* bodyShape.animation PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[15].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[16] /* bodyShape.body.angles_fixed PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[16].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[17] /* bodyShape.body.animation PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[17].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[18] /* bodyShape.body.enforceStates PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[18].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[19] /* bodyShape.body.useQuaternions PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[19].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[20] /* bodyShape.body.w_0_fixed PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[20].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[21] /* bodyShape.body.z_0_fixed PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[21].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[22] /* bodyShape.enforceStates PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[22].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[23] /* bodyShape.frameTranslation.animation PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[23].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[24] /* bodyShape.useQuaternions PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[24].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[25] /* bodyShape.w_0_fixed PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[25].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[26] /* bodyShape.z_0_fixed PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[26].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[27] /* cutForce.animation PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[27].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[30] /* idealGearR2T.useSupportR PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[30].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[31] /* idealGearR2T.useSupportT PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[31].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[32] /* positionToForceAdaptor.use_fder PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[32].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[33] /* positionToForceAdaptor.use_fder2 PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[33].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[34] /* positionToForceAdaptor.use_pder PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[34].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[35] /* positionToForceAdaptor.use_pder2 PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[35].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[36] /* prismatic.animation PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[36].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[37] /* prismatic.useAxisFlange PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[37].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[38] /* revolute.animation PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[38].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[39] /* revolute.useAxisFlange PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[39].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[40] /* springDamper.useHeatPort PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[40].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[41] /* world.animateGravity PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[41].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[42] /* world.animateGround PARAM */) = 0 /* false */;
  data->modelData->booleanParameterData[42].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[43] /* world.animateWorld PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[43].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[44] /* world.axisShowLabels PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[44].time_unvarying = 1;
  (data->simulationInfo->booleanParameter[46] /* world.enableAnimation PARAM */) = 1 /* true */;
  data->modelData->booleanParameterData[46].time_unvarying = 1;
  (data->simulationInfo->integerParameter[0] /* SprungMassCase3.absoluteVelocity.position.resolveInFrame PARAM */) = 1;
  data->modelData->integerParameterData[0].time_unvarying = 1;
  (data->simulationInfo->integerParameter[1] /* SprungMassCase3.absoluteVelocity.resolveInFrame PARAM */) = 1;
  data->modelData->integerParameterData[1].time_unvarying = 1;
  (data->simulationInfo->integerParameter[2] /* SprungMassCase3.absoluteVelocity.transformAbsoluteVector.basicTransformVector.frame_r_in PARAM */) = 1;
  data->modelData->integerParameterData[2].time_unvarying = 1;
  (data->simulationInfo->integerParameter[3] /* SprungMassCase3.absoluteVelocity.transformAbsoluteVector.basicTransformVector.frame_r_out PARAM */) = 1;
  data->modelData->integerParameterData[3].time_unvarying = 1;
  (data->simulationInfo->integerParameter[4] /* SprungMassCase3.absoluteVelocity.transformAbsoluteVector.frame_r_in PARAM */) = 1;
  data->modelData->integerParameterData[4].time_unvarying = 1;
  (data->simulationInfo->integerParameter[5] /* SprungMassCase3.absoluteVelocity.transformAbsoluteVector.frame_r_out PARAM */) = 1;
  data->modelData->integerParameterData[5].time_unvarying = 1;
  (data->simulationInfo->integerParameter[7] /* SprungMassCase3.arrow.quantity PARAM */) = 7;
  data->modelData->integerParameterData[7].time_unvarying = 1;
  (data->simulationInfo->integerParameter[8] /* SprungMassCase3.position.position.resolveInFrame PARAM */) = 2;
  data->modelData->integerParameterData[8].time_unvarying = 1;
  (data->simulationInfo->integerParameter[9] /* SprungMassCase3.position.resolveInFrame PARAM */) = 2;
  data->modelData->integerParameterData[9].time_unvarying = 1;
  (data->simulationInfo->integerParameter[10] /* SprungMassCase3.resolveInFrame PARAM */) = 2;
  data->modelData->integerParameterData[10].time_unvarying = 1;
  (data->simulationInfo->integerParameter[14] /* SprungMassCase3.transformVector_a.basicTransformVector.frame_r_in PARAM */) = 1;
  data->modelData->integerParameterData[14].time_unvarying = 1;
  (data->simulationInfo->integerParameter[15] /* SprungMassCase3.transformVector_a.basicTransformVector.frame_r_out PARAM */) = 2;
  data->modelData->integerParameterData[15].time_unvarying = 1;
  (data->simulationInfo->integerParameter[16] /* SprungMassCase3.transformVector_a.frame_r_in PARAM */) = 1;
  data->modelData->integerParameterData[16].time_unvarying = 1;
  (data->simulationInfo->integerParameter[17] /* SprungMassCase3.transformVector_a.frame_r_out PARAM */) = 2;
  data->modelData->integerParameterData[17].time_unvarying = 1;
  (data->simulationInfo->integerParameter[18] /* SprungMassCase3.velocity.position.resolveInFrame PARAM */) = 1;
  data->modelData->integerParameterData[18].time_unvarying = 1;
  (data->simulationInfo->integerParameter[19] /* SprungMassCase3.velocity.resolveInFrame PARAM */) = 2;
  data->modelData->integerParameterData[19].time_unvarying = 1;
  (data->simulationInfo->integerParameter[20] /* SprungMassCase3.velocity.transformAbsoluteVector.basicTransformVector.frame_r_in PARAM */) = 1;
  data->modelData->integerParameterData[20].time_unvarying = 1;
  (data->simulationInfo->integerParameter[21] /* SprungMassCase3.velocity.transformAbsoluteVector.basicTransformVector.frame_r_out PARAM */) = 2;
  data->modelData->integerParameterData[21].time_unvarying = 1;
  (data->simulationInfo->integerParameter[22] /* SprungMassCase3.velocity.transformAbsoluteVector.frame_r_in PARAM */) = 1;
  data->modelData->integerParameterData[22].time_unvarying = 1;
  (data->simulationInfo->integerParameter[23] /* SprungMassCase3.velocity.transformAbsoluteVector.frame_r_out PARAM */) = 2;
  data->modelData->integerParameterData[23].time_unvarying = 1;
  (data->simulationInfo->integerParameter[43] /* cutForce.cutForce.resolveInFrame PARAM */) = 2;
  data->modelData->integerParameterData[43].time_unvarying = 1;
  (data->simulationInfo->integerParameter[45] /* cutForce.forceArrow.quantity PARAM */) = 1;
  data->modelData->integerParameterData[45].time_unvarying = 1;
  (data->simulationInfo->integerParameter[46] /* cutForce.resolveInFrame PARAM */) = 2;
  data->modelData->integerParameterData[46].time_unvarying = 1;
  (data->simulationInfo->integerParameter[47] /* prismatic.stateSelect PARAM */) = 4;
  data->modelData->integerParameterData[47].time_unvarying = 1;
  (data->simulationInfo->integerParameter[48] /* revolute.stateSelect PARAM */) = 4;
  data->modelData->integerParameterData[48].time_unvarying = 1;
  (data->simulationInfo->integerParameter[49] /* springDamper.stateSelect PARAM */) = 4;
  data->modelData->integerParameterData[49].time_unvarying = 1;
  (data->simulationInfo->integerParameter[50] /* world.gravityType PARAM */) = 1;
  data->modelData->integerParameterData[50].time_unvarying = 1;
  inerter_test2_updateBoundParameters_0(data, threadData);
  inerter_test2_updateBoundParameters_1(data, threadData);
  inerter_test2_updateBoundParameters_2(data, threadData);
  TRACE_POP
  return 0;
}

#if defined(__cplusplus)
}
#endif

