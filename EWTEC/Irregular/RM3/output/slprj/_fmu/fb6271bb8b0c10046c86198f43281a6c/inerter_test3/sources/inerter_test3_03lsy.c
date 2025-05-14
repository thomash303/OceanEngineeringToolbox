/* Linear Systems */
#include "inerter_test3_model.h"
#include "inerter_test3_12jac.h"
#if defined(__cplusplus)
extern "C" {
#endif

/* linear systems */

/*
equation index: 758
type: SIMPLE_ASSIGN
body.z_a[2] = revolute.e[2] * revolute.a
*/
void inerter_test3_eqFunction_758(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,758};
  (data->localData[0]->realVars[82] /* body.z_a[2] variable */) = ((data->simulationInfo->realParameter[222] /* revolute.e[2] PARAM */)) * ((data->localData[0]->realVars[263] /* revolute.a variable */));
  TRACE_POP
}
/*
equation index: 759
type: SIMPLE_ASSIGN
body.z_a[1] = revolute.e[1] * revolute.a
*/
void inerter_test3_eqFunction_759(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,759};
  (data->localData[0]->realVars[81] /* body.z_a[1] variable */) = ((data->simulationInfo->realParameter[221] /* revolute.e[1] PARAM */)) * ((data->localData[0]->realVars[263] /* revolute.a variable */));
  TRACE_POP
}
/*
equation index: 760
type: SIMPLE_ASSIGN
body.a_0[3] = revolute.a / idealGearR2T.ratio
*/
void inerter_test3_eqFunction_760(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,760};
  (data->localData[0]->realVars[28] /* body.a_0[3] variable */) = DIVISION_SIM((data->localData[0]->realVars[263] /* revolute.a variable */),(data->simulationInfo->realParameter[191] /* idealGearR2T.ratio PARAM */),"idealGearR2T.ratio",equationIndexes);
  TRACE_POP
}
/*
equation index: 761
type: SIMPLE_ASSIGN
body.frame_a.f[3] = (force.frame_b.R.T[3,3] * body.a_0[3] + body.z_a[1] * body.r_CM[2] + body.w_a[1] * (body.w_a[3] * body.r_CM[1] - body.w_a[1] * body.r_CM[3]) + body.w_a[2] * (body.w_a[3] * body.r_CM[2] - body.w_a[2] * body.r_CM[3]) - body.z_a[2] * body.r_CM[1]) * body.m
*/
void inerter_test3_eqFunction_761(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,761};
  (data->localData[0]->realVars[42] /* body.frame_a.f[3] variable */) = (((data->localData[0]->realVars[215] /* force.frame_b.R.T[3,3] variable */)) * ((data->localData[0]->realVars[28] /* body.a_0[3] variable */)) + ((data->localData[0]->realVars[81] /* body.z_a[1] variable */)) * ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)) + ((data->localData[0]->realVars[78] /* body.w_a[1] DUMMY_STATE */)) * (((data->localData[0]->realVars[80] /* body.w_a[3] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)) - (((data->localData[0]->realVars[78] /* body.w_a[1] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)))) + ((data->localData[0]->realVars[79] /* body.w_a[2] DUMMY_STATE */)) * (((data->localData[0]->realVars[80] /* body.w_a[3] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)) - (((data->localData[0]->realVars[79] /* body.w_a[2] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)))) - (((data->localData[0]->realVars[82] /* body.z_a[2] variable */)) * ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)))) * ((data->simulationInfo->realParameter[43] /* body.m PARAM */));
  TRACE_POP
}
/*
equation index: 762
type: SIMPLE_ASSIGN
body.z_a[3] = revolute.e[3] * revolute.a
*/
void inerter_test3_eqFunction_762(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,762};
  (data->localData[0]->realVars[83] /* body.z_a[3] variable */) = ((data->simulationInfo->realParameter[223] /* revolute.e[3] PARAM */)) * ((data->localData[0]->realVars[263] /* revolute.a variable */));
  TRACE_POP
}
/*
equation index: 763
type: SIMPLE_ASSIGN
body.frame_a.f[1] = (force.frame_b.R.T[1,3] * body.a_0[3] + body.z_a[2] * body.r_CM[3] + body.w_a[2] * (body.w_a[1] * body.r_CM[2] - body.w_a[2] * body.r_CM[1]) + body.w_a[3] * (body.w_a[1] * body.r_CM[3] - body.w_a[3] * body.r_CM[1]) - body.z_a[3] * body.r_CM[2]) * body.m
*/
void inerter_test3_eqFunction_763(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,763};
  (data->localData[0]->realVars[40] /* body.frame_a.f[1] variable */) = (((data->localData[0]->realVars[209] /* force.frame_b.R.T[1,3] variable */)) * ((data->localData[0]->realVars[28] /* body.a_0[3] variable */)) + ((data->localData[0]->realVars[82] /* body.z_a[2] variable */)) * ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)) + ((data->localData[0]->realVars[79] /* body.w_a[2] DUMMY_STATE */)) * (((data->localData[0]->realVars[78] /* body.w_a[1] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)) - (((data->localData[0]->realVars[79] /* body.w_a[2] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)))) + ((data->localData[0]->realVars[80] /* body.w_a[3] DUMMY_STATE */)) * (((data->localData[0]->realVars[78] /* body.w_a[1] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)) - (((data->localData[0]->realVars[80] /* body.w_a[3] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)))) - (((data->localData[0]->realVars[83] /* body.z_a[3] variable */)) * ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)))) * ((data->simulationInfo->realParameter[43] /* body.m PARAM */));
  TRACE_POP
}
/*
equation index: 764
type: SIMPLE_ASSIGN
body.frame_a.t[2] = body.I[2,1] * body.z_a[1] + body.I[2,2] * body.z_a[2] + body.I[2,3] * body.z_a[3] + body.w_a[3] * (body.I[1,1] * body.w_a[1] + body.I[1,2] * body.w_a[2] + body.I[1,3] * body.w_a[3]) + body.r_CM[3] * body.frame_a.f[1] - body.r_CM[1] * body.frame_a.f[3] - body.w_a[1] * (body.I[3,1] * body.w_a[1] + body.I[3,2] * body.w_a[2] + body.I[3,3] * body.w_a[3])
*/
void inerter_test3_eqFunction_764(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,764};
  (data->localData[0]->realVars[47] /* body.frame_a.t[2] variable */) = ((data->simulationInfo->realParameter[5] /* body.I[2,1] PARAM */)) * ((data->localData[0]->realVars[81] /* body.z_a[1] variable */)) + ((data->simulationInfo->realParameter[6] /* body.I[2,2] PARAM */)) * ((data->localData[0]->realVars[82] /* body.z_a[2] variable */)) + ((data->simulationInfo->realParameter[7] /* body.I[2,3] PARAM */)) * ((data->localData[0]->realVars[83] /* body.z_a[3] variable */)) + ((data->localData[0]->realVars[80] /* body.w_a[3] DUMMY_STATE */)) * (((data->simulationInfo->realParameter[2] /* body.I[1,1] PARAM */)) * ((data->localData[0]->realVars[78] /* body.w_a[1] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[3] /* body.I[1,2] PARAM */)) * ((data->localData[0]->realVars[79] /* body.w_a[2] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[4] /* body.I[1,3] PARAM */)) * ((data->localData[0]->realVars[80] /* body.w_a[3] DUMMY_STATE */))) + ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)) * ((data->localData[0]->realVars[40] /* body.frame_a.f[1] variable */)) - (((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)) * ((data->localData[0]->realVars[42] /* body.frame_a.f[3] variable */))) - (((data->localData[0]->realVars[78] /* body.w_a[1] DUMMY_STATE */)) * (((data->simulationInfo->realParameter[8] /* body.I[3,1] PARAM */)) * ((data->localData[0]->realVars[78] /* body.w_a[1] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[9] /* body.I[3,2] PARAM */)) * ((data->localData[0]->realVars[79] /* body.w_a[2] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[10] /* body.I[3,3] PARAM */)) * ((data->localData[0]->realVars[80] /* body.w_a[3] DUMMY_STATE */))));
  TRACE_POP
}
/*
equation index: 765
type: SIMPLE_ASSIGN
body.frame_a.f[2] = (force.frame_b.R.T[2,3] * body.a_0[3] + body.z_a[3] * body.r_CM[1] + body.w_a[3] * (body.w_a[2] * body.r_CM[3] - body.w_a[3] * body.r_CM[2]) + body.w_a[1] * (body.w_a[2] * body.r_CM[1] - body.w_a[1] * body.r_CM[2]) - body.z_a[1] * body.r_CM[3]) * body.m
*/
void inerter_test3_eqFunction_765(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,765};
  (data->localData[0]->realVars[41] /* body.frame_a.f[2] variable */) = (((data->localData[0]->realVars[212] /* force.frame_b.R.T[2,3] variable */)) * ((data->localData[0]->realVars[28] /* body.a_0[3] variable */)) + ((data->localData[0]->realVars[83] /* body.z_a[3] variable */)) * ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)) + ((data->localData[0]->realVars[80] /* body.w_a[3] DUMMY_STATE */)) * (((data->localData[0]->realVars[79] /* body.w_a[2] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)) - (((data->localData[0]->realVars[80] /* body.w_a[3] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)))) + ((data->localData[0]->realVars[78] /* body.w_a[1] DUMMY_STATE */)) * (((data->localData[0]->realVars[79] /* body.w_a[2] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)) - (((data->localData[0]->realVars[78] /* body.w_a[1] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)))) - (((data->localData[0]->realVars[81] /* body.z_a[1] variable */)) * ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)))) * ((data->simulationInfo->realParameter[43] /* body.m PARAM */));
  TRACE_POP
}
/*
equation index: 766
type: SIMPLE_ASSIGN
body.frame_a.t[1] = body.I[1,1] * body.z_a[1] + body.I[1,2] * body.z_a[2] + body.I[1,3] * body.z_a[3] + body.w_a[2] * (body.I[3,1] * body.w_a[1] + body.I[3,2] * body.w_a[2] + body.I[3,3] * body.w_a[3]) + body.r_CM[2] * body.frame_a.f[3] - body.r_CM[3] * body.frame_a.f[2] - body.w_a[3] * (body.I[2,1] * body.w_a[1] + body.I[2,2] * body.w_a[2] + body.I[2,3] * body.w_a[3])
*/
void inerter_test3_eqFunction_766(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,766};
  (data->localData[0]->realVars[46] /* body.frame_a.t[1] variable */) = ((data->simulationInfo->realParameter[2] /* body.I[1,1] PARAM */)) * ((data->localData[0]->realVars[81] /* body.z_a[1] variable */)) + ((data->simulationInfo->realParameter[3] /* body.I[1,2] PARAM */)) * ((data->localData[0]->realVars[82] /* body.z_a[2] variable */)) + ((data->simulationInfo->realParameter[4] /* body.I[1,3] PARAM */)) * ((data->localData[0]->realVars[83] /* body.z_a[3] variable */)) + ((data->localData[0]->realVars[79] /* body.w_a[2] DUMMY_STATE */)) * (((data->simulationInfo->realParameter[8] /* body.I[3,1] PARAM */)) * ((data->localData[0]->realVars[78] /* body.w_a[1] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[9] /* body.I[3,2] PARAM */)) * ((data->localData[0]->realVars[79] /* body.w_a[2] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[10] /* body.I[3,3] PARAM */)) * ((data->localData[0]->realVars[80] /* body.w_a[3] DUMMY_STATE */))) + ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)) * ((data->localData[0]->realVars[42] /* body.frame_a.f[3] variable */)) - (((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)) * ((data->localData[0]->realVars[41] /* body.frame_a.f[2] variable */))) - (((data->localData[0]->realVars[80] /* body.w_a[3] DUMMY_STATE */)) * (((data->simulationInfo->realParameter[5] /* body.I[2,1] PARAM */)) * ((data->localData[0]->realVars[78] /* body.w_a[1] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[6] /* body.I[2,2] PARAM */)) * ((data->localData[0]->realVars[79] /* body.w_a[2] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[7] /* body.I[2,3] PARAM */)) * ((data->localData[0]->realVars[80] /* body.w_a[3] DUMMY_STATE */))));
  TRACE_POP
}
/*
equation index: 767
type: SIMPLE_ASSIGN
body.frame_a.t[3] = body.I[3,1] * body.z_a[1] + body.I[3,2] * body.z_a[2] + body.I[3,3] * body.z_a[3] + body.w_a[1] * (body.I[2,1] * body.w_a[1] + body.I[2,2] * body.w_a[2] + body.I[2,3] * body.w_a[3]) + body.r_CM[1] * body.frame_a.f[2] - body.r_CM[2] * body.frame_a.f[1] - body.w_a[2] * (body.I[1,1] * body.w_a[1] + body.I[1,2] * body.w_a[2] + body.I[1,3] * body.w_a[3])
*/
void inerter_test3_eqFunction_767(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,767};
  (data->localData[0]->realVars[48] /* body.frame_a.t[3] variable */) = ((data->simulationInfo->realParameter[8] /* body.I[3,1] PARAM */)) * ((data->localData[0]->realVars[81] /* body.z_a[1] variable */)) + ((data->simulationInfo->realParameter[9] /* body.I[3,2] PARAM */)) * ((data->localData[0]->realVars[82] /* body.z_a[2] variable */)) + ((data->simulationInfo->realParameter[10] /* body.I[3,3] PARAM */)) * ((data->localData[0]->realVars[83] /* body.z_a[3] variable */)) + ((data->localData[0]->realVars[78] /* body.w_a[1] DUMMY_STATE */)) * (((data->simulationInfo->realParameter[5] /* body.I[2,1] PARAM */)) * ((data->localData[0]->realVars[78] /* body.w_a[1] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[6] /* body.I[2,2] PARAM */)) * ((data->localData[0]->realVars[79] /* body.w_a[2] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[7] /* body.I[2,3] PARAM */)) * ((data->localData[0]->realVars[80] /* body.w_a[3] DUMMY_STATE */))) + ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)) * ((data->localData[0]->realVars[41] /* body.frame_a.f[2] variable */)) - (((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)) * ((data->localData[0]->realVars[40] /* body.frame_a.f[1] variable */))) - (((data->localData[0]->realVars[79] /* body.w_a[2] DUMMY_STATE */)) * (((data->simulationInfo->realParameter[2] /* body.I[1,1] PARAM */)) * ((data->localData[0]->realVars[78] /* body.w_a[1] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[3] /* body.I[1,2] PARAM */)) * ((data->localData[0]->realVars[79] /* body.w_a[2] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[4] /* body.I[1,3] PARAM */)) * ((data->localData[0]->realVars[80] /* body.w_a[3] DUMMY_STATE */))));
  TRACE_POP
}
/*
equation index: 768
type: SIMPLE_ASSIGN
revolute.tau = body.frame_a.t[2] * revolute.e[2] + body.frame_a.t[3] * revolute.e[3] + body.frame_a.t[1] * revolute.e[1]
*/
void inerter_test3_eqFunction_768(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,768};
  (data->localData[0]->realVars[278] /* revolute.tau variable */) = ((data->localData[0]->realVars[47] /* body.frame_a.t[2] variable */)) * ((data->simulationInfo->realParameter[222] /* revolute.e[2] PARAM */)) + ((data->localData[0]->realVars[48] /* body.frame_a.t[3] variable */)) * ((data->simulationInfo->realParameter[223] /* revolute.e[3] PARAM */)) + ((data->localData[0]->realVars[46] /* body.frame_a.t[1] variable */)) * ((data->simulationInfo->realParameter[221] /* revolute.e[1] PARAM */));
  TRACE_POP
}
/*
equation index: 769
type: SIMPLE_ASSIGN
idealGearR2T.flangeT.f = idealGearR2T.ratio * revolute.tau
*/
void inerter_test3_eqFunction_769(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,769};
  (data->localData[0]->realVars[240] /* idealGearR2T.flangeT.f variable */) = ((data->simulationInfo->realParameter[191] /* idealGearR2T.ratio PARAM */)) * ((data->localData[0]->realVars[278] /* revolute.tau variable */));
  TRACE_POP
}
/*
equation index: 770
type: SIMPLE_ASSIGN
prismatic.f = (-springDamper.f) - idealGearR2T.flangeT.f
*/
void inerter_test3_eqFunction_770(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,770};
  (data->localData[0]->realVars[256] /* prismatic.f variable */) = (-(data->localData[0]->realVars[280] /* springDamper.f variable */)) - (data->localData[0]->realVars[240] /* idealGearR2T.flangeT.f variable */);
  TRACE_POP
}
/*
equation index: 771
type: SIMPLE_ASSIGN
cutForce.frame_a.f[3] = force.frame_b.f[3] + body.frame_a.f[3]
*/
void inerter_test3_eqFunction_771(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,771};
  (data->localData[0]->realVars[171] /* cutForce.frame_a.f[3] variable */) = (data->localData[0]->realVars[218] /* force.frame_b.f[3] variable */) + (data->localData[0]->realVars[42] /* body.frame_a.f[3] variable */);
  TRACE_POP
}
/*
equation index: 772
type: SIMPLE_ASSIGN
cutForce.frame_a.f[2] = force.frame_b.f[2] + body.frame_a.f[2]
*/
void inerter_test3_eqFunction_772(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,772};
  (data->localData[0]->realVars[170] /* cutForce.frame_a.f[2] variable */) = (data->localData[0]->realVars[217] /* force.frame_b.f[2] variable */) + (data->localData[0]->realVars[41] /* body.frame_a.f[2] variable */);
  TRACE_POP
}
/*
equation index: 773
type: SIMPLE_ASSIGN
cutForce.frame_a.f[1] = force.frame_b.f[1] + body.frame_a.f[1]
*/
void inerter_test3_eqFunction_773(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,773};
  (data->localData[0]->realVars[169] /* cutForce.frame_a.f[1] variable */) = (data->localData[0]->realVars[216] /* force.frame_b.f[1] variable */) + (data->localData[0]->realVars[40] /* body.frame_a.f[1] variable */);
  TRACE_POP
}

void residualFunc788(RESIDUAL_USERDATA* userData, const double* xloc, double* res, const int* iflag)
{
  TRACE_PUSH
  DATA *data = userData->data;
  threadData_t *threadData = userData->threadData;
  const int equationIndexes[2] = {1,788};
  ANALYTIC_JACOBIAN* jacobian = NULL;
  (data->localData[0]->realVars[263] /* revolute.a variable */) = xloc[0];
  /* local constraints */
  inerter_test3_eqFunction_758(data, threadData);

  /* local constraints */
  inerter_test3_eqFunction_759(data, threadData);

  /* local constraints */
  inerter_test3_eqFunction_760(data, threadData);

  /* local constraints */
  inerter_test3_eqFunction_761(data, threadData);

  /* local constraints */
  inerter_test3_eqFunction_762(data, threadData);

  /* local constraints */
  inerter_test3_eqFunction_763(data, threadData);

  /* local constraints */
  inerter_test3_eqFunction_764(data, threadData);

  /* local constraints */
  inerter_test3_eqFunction_765(data, threadData);

  /* local constraints */
  inerter_test3_eqFunction_766(data, threadData);

  /* local constraints */
  inerter_test3_eqFunction_767(data, threadData);

  /* local constraints */
  inerter_test3_eqFunction_768(data, threadData);

  /* local constraints */
  inerter_test3_eqFunction_769(data, threadData);

  /* local constraints */
  inerter_test3_eqFunction_770(data, threadData);

  /* local constraints */
  inerter_test3_eqFunction_771(data, threadData);

  /* local constraints */
  inerter_test3_eqFunction_772(data, threadData);

  /* local constraints */
  inerter_test3_eqFunction_773(data, threadData);
  res[0] = ((data->localData[0]->realVars[212] /* force.frame_b.R.T[2,3] variable */)) * ((data->localData[0]->realVars[170] /* cutForce.frame_a.f[2] variable */)) + ((data->localData[0]->realVars[209] /* force.frame_b.R.T[1,3] variable */)) * ((data->localData[0]->realVars[169] /* cutForce.frame_a.f[1] variable */)) + ((data->localData[0]->realVars[215] /* force.frame_b.R.T[3,3] variable */)) * ((data->localData[0]->realVars[171] /* cutForce.frame_a.f[3] variable */)) - (data->localData[0]->realVars[256] /* prismatic.f variable */);
  TRACE_POP
}
OMC_DISABLE_OPT
void initializeStaticLSData788(DATA* data, threadData_t* threadData, LINEAR_SYSTEM_DATA* linearSystemData, modelica_boolean initSparsePattern)
{
  const int indices[1] = {
    263 /* revolute.a */
  };
  for (int i = 0; i < 1; ++i) {
    linearSystemData->nominal[i] = data->modelData->realVarsData[indices[i]].attribute.nominal;
    linearSystemData->min[i]     = data->modelData->realVarsData[indices[i]].attribute.min;
    linearSystemData->max[i]     = data->modelData->realVarsData[indices[i]].attribute.max;
  }
}


/*
equation index: 638
type: SIMPLE_ASSIGN
$DER.revolute.R_rel.w[2] = body.z_a[2]
*/
void inerter_test3_eqFunction_638(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,638};
  (data->localData[0]->realVars[14] /* der(revolute.R_rel.w[2]) DUMMY_DER */) = (data->localData[0]->realVars[82] /* body.z_a[2] variable */);
  TRACE_POP
}
/*
equation index: 639
type: SIMPLE_ASSIGN
$DER.revolute.R_rel.w[1] = body.z_a[1]
*/
void inerter_test3_eqFunction_639(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,639};
  (data->localData[0]->realVars[13] /* der(revolute.R_rel.w[1]) DUMMY_DER */) = (data->localData[0]->realVars[81] /* body.z_a[1] variable */);
  TRACE_POP
}
/*
equation index: 640
type: SIMPLE_ASSIGN
$DER.revolute.R_rel.w[3] = body.z_a[3]
*/
void inerter_test3_eqFunction_640(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,640};
  (data->localData[0]->realVars[15] /* der(revolute.R_rel.w[3]) DUMMY_DER */) = (data->localData[0]->realVars[83] /* body.z_a[3] variable */);
  TRACE_POP
}
/*
equation index: 641
type: SIMPLE_ASSIGN
revolute.a = $DER.revolute.R_rel.w[3] / revolute.e[3]
*/
void inerter_test3_eqFunction_641(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,641};
  (data->localData[0]->realVars[263] /* revolute.a variable */) = DIVISION_SIM((data->localData[0]->realVars[15] /* der(revolute.R_rel.w[3]) DUMMY_DER */),(data->simulationInfo->realParameter[223] /* revolute.e[3] PARAM */),"revolute.e[3]",equationIndexes);
  TRACE_POP
}
/*
equation index: 642
type: SIMPLE_ASSIGN
prismatic.a = revolute.a / idealGearR2T.ratio
*/
void inerter_test3_eqFunction_642(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,642};
  (data->localData[0]->realVars[241] /* prismatic.a variable */) = DIVISION_SIM((data->localData[0]->realVars[263] /* revolute.a variable */),(data->simulationInfo->realParameter[191] /* idealGearR2T.ratio PARAM */),"idealGearR2T.ratio",equationIndexes);
  TRACE_POP
}
/*
equation index: 643
type: SIMPLE_ASSIGN
body.a_0[3] = prismatic.a
*/
void inerter_test3_eqFunction_643(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,643};
  (data->localData[0]->realVars[28] /* body.a_0[3] variable */) = (data->localData[0]->realVars[241] /* prismatic.a variable */);
  TRACE_POP
}
/*
equation index: 644
type: SIMPLE_ASSIGN
body.frame_a.f[1] = (force.frame_b.R.T[1,1] * body.a_0[1] + force.frame_b.R.T[1,2] * body.a_0[2] + force.frame_b.R.T[1,3] * body.a_0[3] + body.z_a[2] * body.r_CM[3] + body.w_a[2] * (body.w_a[1] * body.r_CM[2] - body.w_a[2] * body.r_CM[1]) + body.w_a[3] * (body.w_a[1] * body.r_CM[3] - body.w_a[3] * body.r_CM[1]) - body.z_a[3] * body.r_CM[2]) * body.m
*/
void inerter_test3_eqFunction_644(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,644};
  (data->localData[0]->realVars[40] /* body.frame_a.f[1] variable */) = (((data->localData[0]->realVars[207] /* force.frame_b.R.T[1,1] variable */)) * ((data->localData[0]->realVars[26] /* body.a_0[1] variable */)) + ((data->localData[0]->realVars[208] /* force.frame_b.R.T[1,2] variable */)) * ((data->localData[0]->realVars[27] /* body.a_0[2] variable */)) + ((data->localData[0]->realVars[209] /* force.frame_b.R.T[1,3] variable */)) * ((data->localData[0]->realVars[28] /* body.a_0[3] variable */)) + ((data->localData[0]->realVars[82] /* body.z_a[2] variable */)) * ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)) + ((data->localData[0]->realVars[79] /* body.w_a[2] DUMMY_STATE */)) * (((data->localData[0]->realVars[78] /* body.w_a[1] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)) - (((data->localData[0]->realVars[79] /* body.w_a[2] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)))) + ((data->localData[0]->realVars[80] /* body.w_a[3] DUMMY_STATE */)) * (((data->localData[0]->realVars[78] /* body.w_a[1] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)) - (((data->localData[0]->realVars[80] /* body.w_a[3] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)))) - (((data->localData[0]->realVars[83] /* body.z_a[3] variable */)) * ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)))) * ((data->simulationInfo->realParameter[43] /* body.m PARAM */));
  TRACE_POP
}
/*
equation index: 645
type: SIMPLE_ASSIGN
body.frame_a.f[2] = (force.frame_b.R.T[2,1] * body.a_0[1] + force.frame_b.R.T[2,2] * body.a_0[2] + force.frame_b.R.T[2,3] * body.a_0[3] + body.z_a[3] * body.r_CM[1] + body.w_a[3] * (body.w_a[2] * body.r_CM[3] - body.w_a[3] * body.r_CM[2]) + body.w_a[1] * (body.w_a[2] * body.r_CM[1] - body.w_a[1] * body.r_CM[2]) - body.z_a[1] * body.r_CM[3]) * body.m
*/
void inerter_test3_eqFunction_645(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,645};
  (data->localData[0]->realVars[41] /* body.frame_a.f[2] variable */) = (((data->localData[0]->realVars[210] /* force.frame_b.R.T[2,1] variable */)) * ((data->localData[0]->realVars[26] /* body.a_0[1] variable */)) + ((data->localData[0]->realVars[211] /* force.frame_b.R.T[2,2] variable */)) * ((data->localData[0]->realVars[27] /* body.a_0[2] variable */)) + ((data->localData[0]->realVars[212] /* force.frame_b.R.T[2,3] variable */)) * ((data->localData[0]->realVars[28] /* body.a_0[3] variable */)) + ((data->localData[0]->realVars[83] /* body.z_a[3] variable */)) * ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)) + ((data->localData[0]->realVars[80] /* body.w_a[3] DUMMY_STATE */)) * (((data->localData[0]->realVars[79] /* body.w_a[2] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)) - (((data->localData[0]->realVars[80] /* body.w_a[3] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)))) + ((data->localData[0]->realVars[78] /* body.w_a[1] DUMMY_STATE */)) * (((data->localData[0]->realVars[79] /* body.w_a[2] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)) - (((data->localData[0]->realVars[78] /* body.w_a[1] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)))) - (((data->localData[0]->realVars[81] /* body.z_a[1] variable */)) * ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)))) * ((data->simulationInfo->realParameter[43] /* body.m PARAM */));
  TRACE_POP
}
/*
equation index: 646
type: SIMPLE_ASSIGN
body.frame_a.t[3] = body.I[3,1] * body.z_a[1] + body.I[3,2] * body.z_a[2] + body.I[3,3] * body.z_a[3] + body.w_a[1] * (body.I[2,1] * body.w_a[1] + body.I[2,2] * body.w_a[2] + body.I[2,3] * body.w_a[3]) + body.r_CM[1] * body.frame_a.f[2] - body.r_CM[2] * body.frame_a.f[1] - body.w_a[2] * (body.I[1,1] * body.w_a[1] + body.I[1,2] * body.w_a[2] + body.I[1,3] * body.w_a[3])
*/
void inerter_test3_eqFunction_646(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,646};
  (data->localData[0]->realVars[48] /* body.frame_a.t[3] variable */) = ((data->simulationInfo->realParameter[8] /* body.I[3,1] PARAM */)) * ((data->localData[0]->realVars[81] /* body.z_a[1] variable */)) + ((data->simulationInfo->realParameter[9] /* body.I[3,2] PARAM */)) * ((data->localData[0]->realVars[82] /* body.z_a[2] variable */)) + ((data->simulationInfo->realParameter[10] /* body.I[3,3] PARAM */)) * ((data->localData[0]->realVars[83] /* body.z_a[3] variable */)) + ((data->localData[0]->realVars[78] /* body.w_a[1] DUMMY_STATE */)) * (((data->simulationInfo->realParameter[5] /* body.I[2,1] PARAM */)) * ((data->localData[0]->realVars[78] /* body.w_a[1] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[6] /* body.I[2,2] PARAM */)) * ((data->localData[0]->realVars[79] /* body.w_a[2] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[7] /* body.I[2,3] PARAM */)) * ((data->localData[0]->realVars[80] /* body.w_a[3] DUMMY_STATE */))) + ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)) * ((data->localData[0]->realVars[41] /* body.frame_a.f[2] variable */)) - (((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)) * ((data->localData[0]->realVars[40] /* body.frame_a.f[1] variable */))) - (((data->localData[0]->realVars[79] /* body.w_a[2] DUMMY_STATE */)) * (((data->simulationInfo->realParameter[2] /* body.I[1,1] PARAM */)) * ((data->localData[0]->realVars[78] /* body.w_a[1] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[3] /* body.I[1,2] PARAM */)) * ((data->localData[0]->realVars[79] /* body.w_a[2] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[4] /* body.I[1,3] PARAM */)) * ((data->localData[0]->realVars[80] /* body.w_a[3] DUMMY_STATE */))));
  TRACE_POP
}
/*
equation index: 647
type: SIMPLE_ASSIGN
body.frame_a.f[3] = (force.frame_b.R.T[3,1] * body.a_0[1] + force.frame_b.R.T[3,2] * body.a_0[2] + force.frame_b.R.T[3,3] * body.a_0[3] + body.z_a[1] * body.r_CM[2] + body.w_a[1] * (body.w_a[3] * body.r_CM[1] - body.w_a[1] * body.r_CM[3]) + body.w_a[2] * (body.w_a[3] * body.r_CM[2] - body.w_a[2] * body.r_CM[3]) - body.z_a[2] * body.r_CM[1]) * body.m
*/
void inerter_test3_eqFunction_647(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,647};
  (data->localData[0]->realVars[42] /* body.frame_a.f[3] variable */) = (((data->localData[0]->realVars[213] /* force.frame_b.R.T[3,1] variable */)) * ((data->localData[0]->realVars[26] /* body.a_0[1] variable */)) + ((data->localData[0]->realVars[214] /* force.frame_b.R.T[3,2] variable */)) * ((data->localData[0]->realVars[27] /* body.a_0[2] variable */)) + ((data->localData[0]->realVars[215] /* force.frame_b.R.T[3,3] variable */)) * ((data->localData[0]->realVars[28] /* body.a_0[3] variable */)) + ((data->localData[0]->realVars[81] /* body.z_a[1] variable */)) * ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)) + ((data->localData[0]->realVars[78] /* body.w_a[1] DUMMY_STATE */)) * (((data->localData[0]->realVars[80] /* body.w_a[3] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)) - (((data->localData[0]->realVars[78] /* body.w_a[1] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)))) + ((data->localData[0]->realVars[79] /* body.w_a[2] DUMMY_STATE */)) * (((data->localData[0]->realVars[80] /* body.w_a[3] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)) - (((data->localData[0]->realVars[79] /* body.w_a[2] DUMMY_STATE */)) * ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)))) - (((data->localData[0]->realVars[82] /* body.z_a[2] variable */)) * ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)))) * ((data->simulationInfo->realParameter[43] /* body.m PARAM */));
  TRACE_POP
}
/*
equation index: 648
type: SIMPLE_ASSIGN
body.frame_a.t[2] = body.I[2,1] * body.z_a[1] + body.I[2,2] * body.z_a[2] + body.I[2,3] * body.z_a[3] + body.w_a[3] * (body.I[1,1] * body.w_a[1] + body.I[1,2] * body.w_a[2] + body.I[1,3] * body.w_a[3]) + body.r_CM[3] * body.frame_a.f[1] - body.r_CM[1] * body.frame_a.f[3] - body.w_a[1] * (body.I[3,1] * body.w_a[1] + body.I[3,2] * body.w_a[2] + body.I[3,3] * body.w_a[3])
*/
void inerter_test3_eqFunction_648(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,648};
  (data->localData[0]->realVars[47] /* body.frame_a.t[2] variable */) = ((data->simulationInfo->realParameter[5] /* body.I[2,1] PARAM */)) * ((data->localData[0]->realVars[81] /* body.z_a[1] variable */)) + ((data->simulationInfo->realParameter[6] /* body.I[2,2] PARAM */)) * ((data->localData[0]->realVars[82] /* body.z_a[2] variable */)) + ((data->simulationInfo->realParameter[7] /* body.I[2,3] PARAM */)) * ((data->localData[0]->realVars[83] /* body.z_a[3] variable */)) + ((data->localData[0]->realVars[80] /* body.w_a[3] DUMMY_STATE */)) * (((data->simulationInfo->realParameter[2] /* body.I[1,1] PARAM */)) * ((data->localData[0]->realVars[78] /* body.w_a[1] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[3] /* body.I[1,2] PARAM */)) * ((data->localData[0]->realVars[79] /* body.w_a[2] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[4] /* body.I[1,3] PARAM */)) * ((data->localData[0]->realVars[80] /* body.w_a[3] DUMMY_STATE */))) + ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)) * ((data->localData[0]->realVars[40] /* body.frame_a.f[1] variable */)) - (((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)) * ((data->localData[0]->realVars[42] /* body.frame_a.f[3] variable */))) - (((data->localData[0]->realVars[78] /* body.w_a[1] DUMMY_STATE */)) * (((data->simulationInfo->realParameter[8] /* body.I[3,1] PARAM */)) * ((data->localData[0]->realVars[78] /* body.w_a[1] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[9] /* body.I[3,2] PARAM */)) * ((data->localData[0]->realVars[79] /* body.w_a[2] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[10] /* body.I[3,3] PARAM */)) * ((data->localData[0]->realVars[80] /* body.w_a[3] DUMMY_STATE */))));
  TRACE_POP
}
/*
equation index: 649
type: SIMPLE_ASSIGN
body.frame_a.t[1] = body.I[1,1] * body.z_a[1] + body.I[1,2] * body.z_a[2] + body.I[1,3] * body.z_a[3] + body.w_a[2] * (body.I[3,1] * body.w_a[1] + body.I[3,2] * body.w_a[2] + body.I[3,3] * body.w_a[3]) + body.r_CM[2] * body.frame_a.f[3] - body.r_CM[3] * body.frame_a.f[2] - body.w_a[3] * (body.I[2,1] * body.w_a[1] + body.I[2,2] * body.w_a[2] + body.I[2,3] * body.w_a[3])
*/
void inerter_test3_eqFunction_649(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,649};
  (data->localData[0]->realVars[46] /* body.frame_a.t[1] variable */) = ((data->simulationInfo->realParameter[2] /* body.I[1,1] PARAM */)) * ((data->localData[0]->realVars[81] /* body.z_a[1] variable */)) + ((data->simulationInfo->realParameter[3] /* body.I[1,2] PARAM */)) * ((data->localData[0]->realVars[82] /* body.z_a[2] variable */)) + ((data->simulationInfo->realParameter[4] /* body.I[1,3] PARAM */)) * ((data->localData[0]->realVars[83] /* body.z_a[3] variable */)) + ((data->localData[0]->realVars[79] /* body.w_a[2] DUMMY_STATE */)) * (((data->simulationInfo->realParameter[8] /* body.I[3,1] PARAM */)) * ((data->localData[0]->realVars[78] /* body.w_a[1] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[9] /* body.I[3,2] PARAM */)) * ((data->localData[0]->realVars[79] /* body.w_a[2] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[10] /* body.I[3,3] PARAM */)) * ((data->localData[0]->realVars[80] /* body.w_a[3] DUMMY_STATE */))) + ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)) * ((data->localData[0]->realVars[42] /* body.frame_a.f[3] variable */)) - (((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)) * ((data->localData[0]->realVars[41] /* body.frame_a.f[2] variable */))) - (((data->localData[0]->realVars[80] /* body.w_a[3] DUMMY_STATE */)) * (((data->simulationInfo->realParameter[5] /* body.I[2,1] PARAM */)) * ((data->localData[0]->realVars[78] /* body.w_a[1] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[6] /* body.I[2,2] PARAM */)) * ((data->localData[0]->realVars[79] /* body.w_a[2] DUMMY_STATE */)) + ((data->simulationInfo->realParameter[7] /* body.I[2,3] PARAM */)) * ((data->localData[0]->realVars[80] /* body.w_a[3] DUMMY_STATE */))));
  TRACE_POP
}
/*
equation index: 650
type: SIMPLE_ASSIGN
revolute.tau = body.frame_a.t[2] * revolute.e[2] + body.frame_a.t[3] * revolute.e[3] + body.frame_a.t[1] * revolute.e[1]
*/
void inerter_test3_eqFunction_650(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,650};
  (data->localData[0]->realVars[278] /* revolute.tau variable */) = ((data->localData[0]->realVars[47] /* body.frame_a.t[2] variable */)) * ((data->simulationInfo->realParameter[222] /* revolute.e[2] PARAM */)) + ((data->localData[0]->realVars[48] /* body.frame_a.t[3] variable */)) * ((data->simulationInfo->realParameter[223] /* revolute.e[3] PARAM */)) + ((data->localData[0]->realVars[46] /* body.frame_a.t[1] variable */)) * ((data->simulationInfo->realParameter[221] /* revolute.e[1] PARAM */));
  TRACE_POP
}
/*
equation index: 651
type: SIMPLE_ASSIGN
idealGearR2T.flangeT.f = idealGearR2T.ratio * revolute.tau
*/
void inerter_test3_eqFunction_651(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,651};
  (data->localData[0]->realVars[240] /* idealGearR2T.flangeT.f variable */) = ((data->simulationInfo->realParameter[191] /* idealGearR2T.ratio PARAM */)) * ((data->localData[0]->realVars[278] /* revolute.tau variable */));
  TRACE_POP
}
/*
equation index: 652
type: SIMPLE_ASSIGN
cutForce.frame_a.f[3] = force.frame_b.f[3] + body.frame_a.f[3]
*/
void inerter_test3_eqFunction_652(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,652};
  (data->localData[0]->realVars[171] /* cutForce.frame_a.f[3] variable */) = (data->localData[0]->realVars[218] /* force.frame_b.f[3] variable */) + (data->localData[0]->realVars[42] /* body.frame_a.f[3] variable */);
  TRACE_POP
}
/*
equation index: 653
type: SIMPLE_ASSIGN
cutForce.frame_a.f[1] = force.frame_b.f[1] + body.frame_a.f[1]
*/
void inerter_test3_eqFunction_653(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,653};
  (data->localData[0]->realVars[169] /* cutForce.frame_a.f[1] variable */) = (data->localData[0]->realVars[216] /* force.frame_b.f[1] variable */) + (data->localData[0]->realVars[40] /* body.frame_a.f[1] variable */);
  TRACE_POP
}
/*
equation index: 654
type: SIMPLE_ASSIGN
prismatic.f = (-springDamper.f) - idealGearR2T.flangeT.f
*/
void inerter_test3_eqFunction_654(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,654};
  (data->localData[0]->realVars[256] /* prismatic.f variable */) = (-(data->localData[0]->realVars[280] /* springDamper.f variable */)) - (data->localData[0]->realVars[240] /* idealGearR2T.flangeT.f variable */);
  TRACE_POP
}
/*
equation index: 655
type: SIMPLE_ASSIGN
cutForce.frame_a.f[2] = force.frame_b.f[2] + body.frame_a.f[2]
*/
void inerter_test3_eqFunction_655(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,655};
  (data->localData[0]->realVars[170] /* cutForce.frame_a.f[2] variable */) = (data->localData[0]->realVars[217] /* force.frame_b.f[2] variable */) + (data->localData[0]->realVars[41] /* body.frame_a.f[2] variable */);
  TRACE_POP
}

void residualFunc672(RESIDUAL_USERDATA* userData, const double* xloc, double* res, const int* iflag)
{
  TRACE_PUSH
  DATA *data = userData->data;
  threadData_t *threadData = userData->threadData;
  const int equationIndexes[2] = {1,672};
  ANALYTIC_JACOBIAN* jacobian = NULL;
  (data->localData[0]->realVars[83] /* body.z_a[3] variable */) = xloc[0];
  (data->localData[0]->realVars[81] /* body.z_a[1] variable */) = xloc[1];
  (data->localData[0]->realVars[82] /* body.z_a[2] variable */) = xloc[2];
  /* local constraints */
  inerter_test3_eqFunction_638(data, threadData);

  /* local constraints */
  inerter_test3_eqFunction_639(data, threadData);

  /* local constraints */
  inerter_test3_eqFunction_640(data, threadData);

  /* local constraints */
  inerter_test3_eqFunction_641(data, threadData);

  /* local constraints */
  inerter_test3_eqFunction_642(data, threadData);

  /* local constraints */
  inerter_test3_eqFunction_643(data, threadData);

  /* local constraints */
  inerter_test3_eqFunction_644(data, threadData);

  /* local constraints */
  inerter_test3_eqFunction_645(data, threadData);

  /* local constraints */
  inerter_test3_eqFunction_646(data, threadData);

  /* local constraints */
  inerter_test3_eqFunction_647(data, threadData);

  /* local constraints */
  inerter_test3_eqFunction_648(data, threadData);

  /* local constraints */
  inerter_test3_eqFunction_649(data, threadData);

  /* local constraints */
  inerter_test3_eqFunction_650(data, threadData);

  /* local constraints */
  inerter_test3_eqFunction_651(data, threadData);

  /* local constraints */
  inerter_test3_eqFunction_652(data, threadData);

  /* local constraints */
  inerter_test3_eqFunction_653(data, threadData);

  /* local constraints */
  inerter_test3_eqFunction_654(data, threadData);

  /* local constraints */
  inerter_test3_eqFunction_655(data, threadData);
  res[0] = ((data->simulationInfo->realParameter[221] /* revolute.e[1] PARAM */)) * ((data->localData[0]->realVars[263] /* revolute.a variable */)) - (data->localData[0]->realVars[13] /* der(revolute.R_rel.w[1]) DUMMY_DER */);

  res[1] = ((data->simulationInfo->realParameter[222] /* revolute.e[2] PARAM */)) * ((data->localData[0]->realVars[263] /* revolute.a variable */)) - (data->localData[0]->realVars[14] /* der(revolute.R_rel.w[2]) DUMMY_DER */);

  res[2] = ((data->localData[0]->realVars[212] /* force.frame_b.R.T[2,3] variable */)) * ((data->localData[0]->realVars[170] /* cutForce.frame_a.f[2] variable */)) + ((data->localData[0]->realVars[209] /* force.frame_b.R.T[1,3] variable */)) * ((data->localData[0]->realVars[169] /* cutForce.frame_a.f[1] variable */)) + ((data->localData[0]->realVars[215] /* force.frame_b.R.T[3,3] variable */)) * ((data->localData[0]->realVars[171] /* cutForce.frame_a.f[3] variable */)) - (data->localData[0]->realVars[256] /* prismatic.f variable */);
  TRACE_POP
}
OMC_DISABLE_OPT
void initializeStaticLSData672(DATA* data, threadData_t* threadData, LINEAR_SYSTEM_DATA* linearSystemData, modelica_boolean initSparsePattern)
{
  const int indices[3] = {
    83 /* body.z_a[3] */,
    81 /* body.z_a[1] */,
    82 /* body.z_a[2] */
  };
  for (int i = 0; i < 3; ++i) {
    linearSystemData->nominal[i] = data->modelData->realVarsData[indices[i]].attribute.nominal;
    linearSystemData->min[i]     = data->modelData->realVarsData[indices[i]].attribute.min;
    linearSystemData->max[i]     = data->modelData->realVarsData[indices[i]].attribute.max;
  }
}

/* Prototypes for the strict sets (Dynamic Tearing) */

/* Global constraints for the casual sets */
/* function initialize linear systems */
void inerter_test3_initialLinearSystem(int nLinearSystems, LINEAR_SYSTEM_DATA* linearSystemData)
{
  /* linear systems */
  assertStreamPrint(NULL, nLinearSystems > 1, "Internal Error: indexlinearSystem mismatch!");
  linearSystemData[1].equationIndex = 788;
  linearSystemData[1].size = 1;
  linearSystemData[1].nnz = 0;
  linearSystemData[1].method = 1;   /* Symbolic Jacobian available */
  linearSystemData[1].residualFunc = residualFunc788;
  linearSystemData[1].strictTearingFunctionCall = NULL;
  linearSystemData[1].analyticalJacobianColumn = inerter_test3_functionJacLSJac3_column;
  linearSystemData[1].initialAnalyticalJacobian = inerter_test3_initialAnalyticJacobianLSJac3;
  linearSystemData[1].jacobianIndex = 1 /*jacInx*/;
  linearSystemData[1].setA = NULL;  //setLinearMatrixA788;
  linearSystemData[1].setb = NULL;  //setLinearVectorb788;
  linearSystemData[1].initializeStaticLSData = initializeStaticLSData788;
  
  assertStreamPrint(NULL, nLinearSystems > 0, "Internal Error: indexlinearSystem mismatch!");
  linearSystemData[0].equationIndex = 672;
  linearSystemData[0].size = 3;
  linearSystemData[0].nnz = 0;
  linearSystemData[0].method = 1;   /* Symbolic Jacobian available */
  linearSystemData[0].residualFunc = residualFunc672;
  linearSystemData[0].strictTearingFunctionCall = NULL;
  linearSystemData[0].analyticalJacobianColumn = inerter_test3_functionJacLSJac2_column;
  linearSystemData[0].initialAnalyticalJacobian = inerter_test3_initialAnalyticJacobianLSJac2;
  linearSystemData[0].jacobianIndex = 0 /*jacInx*/;
  linearSystemData[0].setA = NULL;  //setLinearMatrixA672;
  linearSystemData[0].setb = NULL;  //setLinearVectorb672;
  linearSystemData[0].initializeStaticLSData = initializeStaticLSData672;
}

#if defined(__cplusplus)
}
#endif

