/* Jacobians 8 */
#include "inerter_test3_model.h"
#include "inerter_test3_12jac.h"
#include "simulation/jacobian_util.h"
#include "util/omc_file.h"
/* constant equations */
/* dynamic equations */

/*
equation index: 656
type: SIMPLE_ASSIGN
revolute.a.$pDERLSJac0.dummyVarLSJac0 = body.z_a.SeedLSJac0[3] / revolute.e[3]
*/
void inerter_test3_eqFunction_656(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 0;
  const int equationIndexes[2] = {1,656};
  jacobian->tmpVars[3] /* revolute.a.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */ = DIVISION(jacobian->seedVars[0] /* body.z_a.SeedLSJac0[3] SEED_VAR */,(data->simulationInfo->realParameter[223] /* revolute.e[3] PARAM */),"revolute.e[3]");
  TRACE_POP
}

/*
equation index: 657
type: SIMPLE_ASSIGN
body.a_0.$pDERLSJac0.dummyVarLSJac0[3] = revolute.a.$pDERLSJac0.dummyVarLSJac0 / idealGearR2T.ratio
*/
void inerter_test3_eqFunction_657(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 1;
  const int equationIndexes[2] = {1,657};
  jacobian->tmpVars[5] /* body.a_0.$pDERLSJac0.dummyVarLSJac0[3] JACOBIAN_TMP_VAR */ = DIVISION(jacobian->tmpVars[3] /* revolute.a.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */,(data->simulationInfo->realParameter[191] /* idealGearR2T.ratio PARAM */),"idealGearR2T.ratio");
  TRACE_POP
}

/*
equation index: 658
type: SIMPLE_ASSIGN
cutForce.frame_a.f.$pDERLSJac0.dummyVarLSJac0[3] = (cutForce.frame_a.R.T[3,3] * body.a_0.$pDERLSJac0.dummyVarLSJac0[3] + body.z_a.SeedLSJac0[1] * body.r_CM[2] - body.z_a.SeedLSJac0[2] * body.r_CM[1]) * body.m
*/
void inerter_test3_eqFunction_658(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 2;
  const int equationIndexes[2] = {1,658};
  jacobian->tmpVars[6] /* cutForce.frame_a.f.$pDERLSJac0.dummyVarLSJac0[3] JACOBIAN_TMP_VAR */ = (((data->localData[0]->realVars[172] /* cutForce.frame_a.R.T[3,3] variable */)) * (jacobian->tmpVars[5] /* body.a_0.$pDERLSJac0.dummyVarLSJac0[3] JACOBIAN_TMP_VAR */) + (jacobian->seedVars[1] /* body.z_a.SeedLSJac0[1] SEED_VAR */) * ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)) - ((jacobian->seedVars[2] /* body.z_a.SeedLSJac0[2] SEED_VAR */) * ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)))) * ((data->simulationInfo->realParameter[43] /* body.m PARAM */));
  TRACE_POP
}

/*
equation index: 659
type: SIMPLE_ASSIGN
cutForce.frame_a.f.$pDERLSJac0.dummyVarLSJac0[1] = (cutForce.frame_a.R.T[1,3] * body.a_0.$pDERLSJac0.dummyVarLSJac0[3] + body.z_a.SeedLSJac0[2] * body.r_CM[3] - body.z_a.SeedLSJac0[3] * body.r_CM[2]) * body.m
*/
void inerter_test3_eqFunction_659(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 3;
  const int equationIndexes[2] = {1,659};
  jacobian->tmpVars[7] /* cutForce.frame_a.f.$pDERLSJac0.dummyVarLSJac0[1] JACOBIAN_TMP_VAR */ = (((data->localData[0]->realVars[166] /* cutForce.frame_a.R.T[1,3] variable */)) * (jacobian->tmpVars[5] /* body.a_0.$pDERLSJac0.dummyVarLSJac0[3] JACOBIAN_TMP_VAR */) + (jacobian->seedVars[2] /* body.z_a.SeedLSJac0[2] SEED_VAR */) * ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)) - ((jacobian->seedVars[0] /* body.z_a.SeedLSJac0[3] SEED_VAR */) * ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)))) * ((data->simulationInfo->realParameter[43] /* body.m PARAM */));
  TRACE_POP
}

/*
equation index: 660
type: SIMPLE_ASSIGN
cutForce.frame_a.t.$pDERLSJac0.dummyVarLSJac0[2] = body.I[2,1] * body.z_a.SeedLSJac0[1] + body.I[2,2] * body.z_a.SeedLSJac0[2] + body.I[2,3] * body.z_a.SeedLSJac0[3] + body.r_CM[3] * cutForce.frame_a.f.$pDERLSJac0.dummyVarLSJac0[1] - body.r_CM[1] * cutForce.frame_a.f.$pDERLSJac0.dummyVarLSJac0[3]
*/
void inerter_test3_eqFunction_660(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 4;
  const int equationIndexes[2] = {1,660};
  jacobian->tmpVars[8] /* cutForce.frame_a.t.$pDERLSJac0.dummyVarLSJac0[2] JACOBIAN_TMP_VAR */ = ((data->simulationInfo->realParameter[5] /* body.I[2,1] PARAM */)) * (jacobian->seedVars[1] /* body.z_a.SeedLSJac0[1] SEED_VAR */) + ((data->simulationInfo->realParameter[6] /* body.I[2,2] PARAM */)) * (jacobian->seedVars[2] /* body.z_a.SeedLSJac0[2] SEED_VAR */) + ((data->simulationInfo->realParameter[7] /* body.I[2,3] PARAM */)) * (jacobian->seedVars[0] /* body.z_a.SeedLSJac0[3] SEED_VAR */) + ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)) * (jacobian->tmpVars[7] /* cutForce.frame_a.f.$pDERLSJac0.dummyVarLSJac0[1] JACOBIAN_TMP_VAR */) - (((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)) * (jacobian->tmpVars[6] /* cutForce.frame_a.f.$pDERLSJac0.dummyVarLSJac0[3] JACOBIAN_TMP_VAR */));
  TRACE_POP
}

/*
equation index: 661
type: SIMPLE_ASSIGN
cutForce.frame_a.f.$pDERLSJac0.dummyVarLSJac0[2] = (cutForce.frame_a.R.T[2,3] * body.a_0.$pDERLSJac0.dummyVarLSJac0[3] + body.z_a.SeedLSJac0[3] * body.r_CM[1] - body.z_a.SeedLSJac0[1] * body.r_CM[3]) * body.m
*/
void inerter_test3_eqFunction_661(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 5;
  const int equationIndexes[2] = {1,661};
  jacobian->tmpVars[9] /* cutForce.frame_a.f.$pDERLSJac0.dummyVarLSJac0[2] JACOBIAN_TMP_VAR */ = (((data->localData[0]->realVars[169] /* cutForce.frame_a.R.T[2,3] variable */)) * (jacobian->tmpVars[5] /* body.a_0.$pDERLSJac0.dummyVarLSJac0[3] JACOBIAN_TMP_VAR */) + (jacobian->seedVars[0] /* body.z_a.SeedLSJac0[3] SEED_VAR */) * ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)) - ((jacobian->seedVars[1] /* body.z_a.SeedLSJac0[1] SEED_VAR */) * ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)))) * ((data->simulationInfo->realParameter[43] /* body.m PARAM */));
  TRACE_POP
}

/*
equation index: 662
type: SIMPLE_ASSIGN
cutForce.frame_a.t.$pDERLSJac0.dummyVarLSJac0[1] = body.I[1,1] * body.z_a.SeedLSJac0[1] + body.I[1,2] * body.z_a.SeedLSJac0[2] + body.I[1,3] * body.z_a.SeedLSJac0[3] + body.r_CM[2] * cutForce.frame_a.f.$pDERLSJac0.dummyVarLSJac0[3] - body.r_CM[3] * cutForce.frame_a.f.$pDERLSJac0.dummyVarLSJac0[2]
*/
void inerter_test3_eqFunction_662(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 6;
  const int equationIndexes[2] = {1,662};
  jacobian->tmpVars[10] /* cutForce.frame_a.t.$pDERLSJac0.dummyVarLSJac0[1] JACOBIAN_TMP_VAR */ = ((data->simulationInfo->realParameter[2] /* body.I[1,1] PARAM */)) * (jacobian->seedVars[1] /* body.z_a.SeedLSJac0[1] SEED_VAR */) + ((data->simulationInfo->realParameter[3] /* body.I[1,2] PARAM */)) * (jacobian->seedVars[2] /* body.z_a.SeedLSJac0[2] SEED_VAR */) + ((data->simulationInfo->realParameter[4] /* body.I[1,3] PARAM */)) * (jacobian->seedVars[0] /* body.z_a.SeedLSJac0[3] SEED_VAR */) + ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)) * (jacobian->tmpVars[6] /* cutForce.frame_a.f.$pDERLSJac0.dummyVarLSJac0[3] JACOBIAN_TMP_VAR */) - (((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)) * (jacobian->tmpVars[9] /* cutForce.frame_a.f.$pDERLSJac0.dummyVarLSJac0[2] JACOBIAN_TMP_VAR */));
  TRACE_POP
}

/*
equation index: 663
type: SIMPLE_ASSIGN
cutForce.frame_a.t.$pDERLSJac0.dummyVarLSJac0[3] = body.I[3,1] * body.z_a.SeedLSJac0[1] + body.I[3,2] * body.z_a.SeedLSJac0[2] + body.I[3,3] * body.z_a.SeedLSJac0[3] + body.r_CM[1] * cutForce.frame_a.f.$pDERLSJac0.dummyVarLSJac0[2] - body.r_CM[2] * cutForce.frame_a.f.$pDERLSJac0.dummyVarLSJac0[1]
*/
void inerter_test3_eqFunction_663(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 7;
  const int equationIndexes[2] = {1,663};
  jacobian->tmpVars[11] /* cutForce.frame_a.t.$pDERLSJac0.dummyVarLSJac0[3] JACOBIAN_TMP_VAR */ = ((data->simulationInfo->realParameter[8] /* body.I[3,1] PARAM */)) * (jacobian->seedVars[1] /* body.z_a.SeedLSJac0[1] SEED_VAR */) + ((data->simulationInfo->realParameter[9] /* body.I[3,2] PARAM */)) * (jacobian->seedVars[2] /* body.z_a.SeedLSJac0[2] SEED_VAR */) + ((data->simulationInfo->realParameter[10] /* body.I[3,3] PARAM */)) * (jacobian->seedVars[0] /* body.z_a.SeedLSJac0[3] SEED_VAR */) + ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)) * (jacobian->tmpVars[9] /* cutForce.frame_a.f.$pDERLSJac0.dummyVarLSJac0[2] JACOBIAN_TMP_VAR */) - (((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)) * (jacobian->tmpVars[7] /* cutForce.frame_a.f.$pDERLSJac0.dummyVarLSJac0[1] JACOBIAN_TMP_VAR */));
  TRACE_POP
}

/*
equation index: 664
type: SIMPLE_ASSIGN
revolute.tau.$pDERLSJac0.dummyVarLSJac0 = cutForce.frame_a.t.$pDERLSJac0.dummyVarLSJac0[2] * revolute.e[2] + cutForce.frame_a.t.$pDERLSJac0.dummyVarLSJac0[3] * revolute.e[3] + cutForce.frame_a.t.$pDERLSJac0.dummyVarLSJac0[1] * revolute.e[1]
*/
void inerter_test3_eqFunction_664(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 8;
  const int equationIndexes[2] = {1,664};
  jacobian->tmpVars[13] /* revolute.tau.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */ = (jacobian->tmpVars[8] /* cutForce.frame_a.t.$pDERLSJac0.dummyVarLSJac0[2] JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[222] /* revolute.e[2] PARAM */)) + (jacobian->tmpVars[11] /* cutForce.frame_a.t.$pDERLSJac0.dummyVarLSJac0[3] JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[223] /* revolute.e[3] PARAM */)) + (jacobian->tmpVars[10] /* cutForce.frame_a.t.$pDERLSJac0.dummyVarLSJac0[1] JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[221] /* revolute.e[1] PARAM */));
  TRACE_POP
}

/*
equation index: 665
type: SIMPLE_ASSIGN
idealGearR2T.flangeT.f.$pDERLSJac0.dummyVarLSJac0 = idealGearR2T.ratio * revolute.tau.$pDERLSJac0.dummyVarLSJac0
*/
void inerter_test3_eqFunction_665(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 9;
  const int equationIndexes[2] = {1,665};
  jacobian->tmpVars[14] /* idealGearR2T.flangeT.f.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */ = ((data->simulationInfo->realParameter[191] /* idealGearR2T.ratio PARAM */)) * (jacobian->tmpVars[13] /* revolute.tau.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */);
  TRACE_POP
}

/*
equation index: 666
type: SIMPLE_ASSIGN
prismatic.f.$pDERLSJac0.dummyVarLSJac0 = cutForce.frame_a.R.T[3,3] * cutForce.frame_a.f.$pDERLSJac0.dummyVarLSJac0[3] + cutForce.frame_a.R.T[1,3] * cutForce.frame_a.f.$pDERLSJac0.dummyVarLSJac0[1] + cutForce.frame_a.R.T[2,3] * cutForce.frame_a.f.$pDERLSJac0.dummyVarLSJac0[2]
*/
void inerter_test3_eqFunction_666(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 10;
  const int equationIndexes[2] = {1,666};
  jacobian->tmpVars[12] /* prismatic.f.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */ = ((data->localData[0]->realVars[172] /* cutForce.frame_a.R.T[3,3] variable */)) * (jacobian->tmpVars[6] /* cutForce.frame_a.f.$pDERLSJac0.dummyVarLSJac0[3] JACOBIAN_TMP_VAR */) + ((data->localData[0]->realVars[166] /* cutForce.frame_a.R.T[1,3] variable */)) * (jacobian->tmpVars[7] /* cutForce.frame_a.f.$pDERLSJac0.dummyVarLSJac0[1] JACOBIAN_TMP_VAR */) + ((data->localData[0]->realVars[169] /* cutForce.frame_a.R.T[2,3] variable */)) * (jacobian->tmpVars[9] /* cutForce.frame_a.f.$pDERLSJac0.dummyVarLSJac0[2] JACOBIAN_TMP_VAR */);
  TRACE_POP
}

/*
equation index: 667
type: SIMPLE_ASSIGN
$res_LSJac0_3.$pDERLSJac0.dummyVarLSJac0 = idealGearR2T.flangeT.f.$pDERLSJac0.dummyVarLSJac0 + prismatic.f.$pDERLSJac0.dummyVarLSJac0
*/
void inerter_test3_eqFunction_667(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 11;
  const int equationIndexes[2] = {1,667};
  jacobian->resultVars[2] /* $res_LSJac0_3.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_VAR */ = jacobian->tmpVars[14] /* idealGearR2T.flangeT.f.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */ + jacobian->tmpVars[12] /* prismatic.f.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */;
  TRACE_POP
}

/*
equation index: 668
type: SIMPLE_ASSIGN
$res_LSJac0_1.$pDERLSJac0.dummyVarLSJac0 = revolute.e[1] * revolute.a.$pDERLSJac0.dummyVarLSJac0 - body.z_a.SeedLSJac0[1]
*/
void inerter_test3_eqFunction_668(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 12;
  const int equationIndexes[2] = {1,668};
  jacobian->resultVars[0] /* $res_LSJac0_1.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_VAR */ = ((data->simulationInfo->realParameter[221] /* revolute.e[1] PARAM */)) * (jacobian->tmpVars[3] /* revolute.a.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */) - jacobian->seedVars[1] /* body.z_a.SeedLSJac0[1] SEED_VAR */;
  TRACE_POP
}

/*
equation index: 669
type: SIMPLE_ASSIGN
$res_LSJac0_2.$pDERLSJac0.dummyVarLSJac0 = revolute.e[2] * revolute.a.$pDERLSJac0.dummyVarLSJac0 - body.z_a.SeedLSJac0[2]
*/
void inerter_test3_eqFunction_669(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 13;
  const int equationIndexes[2] = {1,669};
  jacobian->resultVars[1] /* $res_LSJac0_2.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_VAR */ = ((data->simulationInfo->realParameter[222] /* revolute.e[2] PARAM */)) * (jacobian->tmpVars[3] /* revolute.a.$pDERLSJac0.dummyVarLSJac0 JACOBIAN_TMP_VAR */) - jacobian->seedVars[2] /* body.z_a.SeedLSJac0[2] SEED_VAR */;
  TRACE_POP
}

OMC_DISABLE_OPT
int inerter_test3_functionJacLSJac0_constantEqns(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = inerter_test3_INDEX_JAC_LSJac0;
  
  TRACE_POP
  return 0;
}

int inerter_test3_functionJacLSJac0_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = inerter_test3_INDEX_JAC_LSJac0;
  inerter_test3_eqFunction_656(data, threadData, jacobian, parentJacobian);
  inerter_test3_eqFunction_657(data, threadData, jacobian, parentJacobian);
  inerter_test3_eqFunction_658(data, threadData, jacobian, parentJacobian);
  inerter_test3_eqFunction_659(data, threadData, jacobian, parentJacobian);
  inerter_test3_eqFunction_660(data, threadData, jacobian, parentJacobian);
  inerter_test3_eqFunction_661(data, threadData, jacobian, parentJacobian);
  inerter_test3_eqFunction_662(data, threadData, jacobian, parentJacobian);
  inerter_test3_eqFunction_663(data, threadData, jacobian, parentJacobian);
  inerter_test3_eqFunction_664(data, threadData, jacobian, parentJacobian);
  inerter_test3_eqFunction_665(data, threadData, jacobian, parentJacobian);
  inerter_test3_eqFunction_666(data, threadData, jacobian, parentJacobian);
  inerter_test3_eqFunction_667(data, threadData, jacobian, parentJacobian);
  inerter_test3_eqFunction_668(data, threadData, jacobian, parentJacobian);
  inerter_test3_eqFunction_669(data, threadData, jacobian, parentJacobian);
  TRACE_POP
  return 0;
}
/* constant equations */
/* dynamic equations */

/*
equation index: 777
type: SIMPLE_ASSIGN
body.z_a.$pDERLSJac1.dummyVarLSJac1[2] = revolute.e[2] * revolute.a.SeedLSJac1
*/
void inerter_test3_eqFunction_777(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 0;
  const int equationIndexes[2] = {1,777};
  jacobian->tmpVars[0] /* body.z_a.$pDERLSJac1.dummyVarLSJac1[2] JACOBIAN_TMP_VAR */ = ((data->simulationInfo->realParameter[222] /* revolute.e[2] PARAM */)) * (jacobian->seedVars[0] /* revolute.a.SeedLSJac1 SEED_VAR */);
  TRACE_POP
}

/*
equation index: 778
type: SIMPLE_ASSIGN
body.z_a.$pDERLSJac1.dummyVarLSJac1[1] = revolute.e[1] * revolute.a.SeedLSJac1
*/
void inerter_test3_eqFunction_778(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 1;
  const int equationIndexes[2] = {1,778};
  jacobian->tmpVars[1] /* body.z_a.$pDERLSJac1.dummyVarLSJac1[1] JACOBIAN_TMP_VAR */ = ((data->simulationInfo->realParameter[221] /* revolute.e[1] PARAM */)) * (jacobian->seedVars[0] /* revolute.a.SeedLSJac1 SEED_VAR */);
  TRACE_POP
}

/*
equation index: 779
type: SIMPLE_ASSIGN
body.a_0.$pDERLSJac1.dummyVarLSJac1[3] = revolute.a.SeedLSJac1 / idealGearR2T.ratio
*/
void inerter_test3_eqFunction_779(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 2;
  const int equationIndexes[2] = {1,779};
  jacobian->tmpVars[2] /* body.a_0.$pDERLSJac1.dummyVarLSJac1[3] JACOBIAN_TMP_VAR */ = DIVISION(jacobian->seedVars[0] /* revolute.a.SeedLSJac1 SEED_VAR */,(data->simulationInfo->realParameter[191] /* idealGearR2T.ratio PARAM */),"idealGearR2T.ratio");
  TRACE_POP
}

/*
equation index: 780
type: SIMPLE_ASSIGN
cutForce.frame_a.f.$pDERLSJac1.dummyVarLSJac1[3] = (cutForce.frame_a.R.T[3,3] * body.a_0.$pDERLSJac1.dummyVarLSJac1[3] + body.z_a.$pDERLSJac1.dummyVarLSJac1[1] * body.r_CM[2] - body.z_a.$pDERLSJac1.dummyVarLSJac1[2] * body.r_CM[1]) * body.m
*/
void inerter_test3_eqFunction_780(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 3;
  const int equationIndexes[2] = {1,780};
  jacobian->tmpVars[3] /* cutForce.frame_a.f.$pDERLSJac1.dummyVarLSJac1[3] JACOBIAN_TMP_VAR */ = (((data->localData[0]->realVars[172] /* cutForce.frame_a.R.T[3,3] variable */)) * (jacobian->tmpVars[2] /* body.a_0.$pDERLSJac1.dummyVarLSJac1[3] JACOBIAN_TMP_VAR */) + (jacobian->tmpVars[1] /* body.z_a.$pDERLSJac1.dummyVarLSJac1[1] JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)) - ((jacobian->tmpVars[0] /* body.z_a.$pDERLSJac1.dummyVarLSJac1[2] JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)))) * ((data->simulationInfo->realParameter[43] /* body.m PARAM */));
  TRACE_POP
}

/*
equation index: 781
type: SIMPLE_ASSIGN
body.z_a.$pDERLSJac1.dummyVarLSJac1[3] = revolute.e[3] * revolute.a.SeedLSJac1
*/
void inerter_test3_eqFunction_781(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 4;
  const int equationIndexes[2] = {1,781};
  jacobian->tmpVars[4] /* body.z_a.$pDERLSJac1.dummyVarLSJac1[3] JACOBIAN_TMP_VAR */ = ((data->simulationInfo->realParameter[223] /* revolute.e[3] PARAM */)) * (jacobian->seedVars[0] /* revolute.a.SeedLSJac1 SEED_VAR */);
  TRACE_POP
}

/*
equation index: 782
type: SIMPLE_ASSIGN
cutForce.frame_a.f.$pDERLSJac1.dummyVarLSJac1[1] = (cutForce.frame_a.R.T[1,3] * body.a_0.$pDERLSJac1.dummyVarLSJac1[3] + body.z_a.$pDERLSJac1.dummyVarLSJac1[2] * body.r_CM[3] - body.z_a.$pDERLSJac1.dummyVarLSJac1[3] * body.r_CM[2]) * body.m
*/
void inerter_test3_eqFunction_782(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 5;
  const int equationIndexes[2] = {1,782};
  jacobian->tmpVars[5] /* cutForce.frame_a.f.$pDERLSJac1.dummyVarLSJac1[1] JACOBIAN_TMP_VAR */ = (((data->localData[0]->realVars[166] /* cutForce.frame_a.R.T[1,3] variable */)) * (jacobian->tmpVars[2] /* body.a_0.$pDERLSJac1.dummyVarLSJac1[3] JACOBIAN_TMP_VAR */) + (jacobian->tmpVars[0] /* body.z_a.$pDERLSJac1.dummyVarLSJac1[2] JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)) - ((jacobian->tmpVars[4] /* body.z_a.$pDERLSJac1.dummyVarLSJac1[3] JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)))) * ((data->simulationInfo->realParameter[43] /* body.m PARAM */));
  TRACE_POP
}

/*
equation index: 783
type: SIMPLE_ASSIGN
cutForce.frame_a.t.$pDERLSJac1.dummyVarLSJac1[2] = body.I[2,1] * body.z_a.$pDERLSJac1.dummyVarLSJac1[1] + body.I[2,2] * body.z_a.$pDERLSJac1.dummyVarLSJac1[2] + body.I[2,3] * body.z_a.$pDERLSJac1.dummyVarLSJac1[3] + body.r_CM[3] * cutForce.frame_a.f.$pDERLSJac1.dummyVarLSJac1[1] - body.r_CM[1] * cutForce.frame_a.f.$pDERLSJac1.dummyVarLSJac1[3]
*/
void inerter_test3_eqFunction_783(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 6;
  const int equationIndexes[2] = {1,783};
  jacobian->tmpVars[6] /* cutForce.frame_a.t.$pDERLSJac1.dummyVarLSJac1[2] JACOBIAN_TMP_VAR */ = ((data->simulationInfo->realParameter[5] /* body.I[2,1] PARAM */)) * (jacobian->tmpVars[1] /* body.z_a.$pDERLSJac1.dummyVarLSJac1[1] JACOBIAN_TMP_VAR */) + ((data->simulationInfo->realParameter[6] /* body.I[2,2] PARAM */)) * (jacobian->tmpVars[0] /* body.z_a.$pDERLSJac1.dummyVarLSJac1[2] JACOBIAN_TMP_VAR */) + ((data->simulationInfo->realParameter[7] /* body.I[2,3] PARAM */)) * (jacobian->tmpVars[4] /* body.z_a.$pDERLSJac1.dummyVarLSJac1[3] JACOBIAN_TMP_VAR */) + ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)) * (jacobian->tmpVars[5] /* cutForce.frame_a.f.$pDERLSJac1.dummyVarLSJac1[1] JACOBIAN_TMP_VAR */) - (((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)) * (jacobian->tmpVars[3] /* cutForce.frame_a.f.$pDERLSJac1.dummyVarLSJac1[3] JACOBIAN_TMP_VAR */));
  TRACE_POP
}

/*
equation index: 784
type: SIMPLE_ASSIGN
cutForce.frame_a.f.$pDERLSJac1.dummyVarLSJac1[2] = (cutForce.frame_a.R.T[2,3] * body.a_0.$pDERLSJac1.dummyVarLSJac1[3] + body.z_a.$pDERLSJac1.dummyVarLSJac1[3] * body.r_CM[1] - body.z_a.$pDERLSJac1.dummyVarLSJac1[1] * body.r_CM[3]) * body.m
*/
void inerter_test3_eqFunction_784(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 7;
  const int equationIndexes[2] = {1,784};
  jacobian->tmpVars[7] /* cutForce.frame_a.f.$pDERLSJac1.dummyVarLSJac1[2] JACOBIAN_TMP_VAR */ = (((data->localData[0]->realVars[169] /* cutForce.frame_a.R.T[2,3] variable */)) * (jacobian->tmpVars[2] /* body.a_0.$pDERLSJac1.dummyVarLSJac1[3] JACOBIAN_TMP_VAR */) + (jacobian->tmpVars[4] /* body.z_a.$pDERLSJac1.dummyVarLSJac1[3] JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)) - ((jacobian->tmpVars[1] /* body.z_a.$pDERLSJac1.dummyVarLSJac1[1] JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)))) * ((data->simulationInfo->realParameter[43] /* body.m PARAM */));
  TRACE_POP
}

/*
equation index: 785
type: SIMPLE_ASSIGN
cutForce.frame_a.t.$pDERLSJac1.dummyVarLSJac1[1] = body.I[1,1] * body.z_a.$pDERLSJac1.dummyVarLSJac1[1] + body.I[1,2] * body.z_a.$pDERLSJac1.dummyVarLSJac1[2] + body.I[1,3] * body.z_a.$pDERLSJac1.dummyVarLSJac1[3] + body.r_CM[2] * cutForce.frame_a.f.$pDERLSJac1.dummyVarLSJac1[3] - body.r_CM[3] * cutForce.frame_a.f.$pDERLSJac1.dummyVarLSJac1[2]
*/
void inerter_test3_eqFunction_785(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 8;
  const int equationIndexes[2] = {1,785};
  jacobian->tmpVars[8] /* cutForce.frame_a.t.$pDERLSJac1.dummyVarLSJac1[1] JACOBIAN_TMP_VAR */ = ((data->simulationInfo->realParameter[2] /* body.I[1,1] PARAM */)) * (jacobian->tmpVars[1] /* body.z_a.$pDERLSJac1.dummyVarLSJac1[1] JACOBIAN_TMP_VAR */) + ((data->simulationInfo->realParameter[3] /* body.I[1,2] PARAM */)) * (jacobian->tmpVars[0] /* body.z_a.$pDERLSJac1.dummyVarLSJac1[2] JACOBIAN_TMP_VAR */) + ((data->simulationInfo->realParameter[4] /* body.I[1,3] PARAM */)) * (jacobian->tmpVars[4] /* body.z_a.$pDERLSJac1.dummyVarLSJac1[3] JACOBIAN_TMP_VAR */) + ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)) * (jacobian->tmpVars[3] /* cutForce.frame_a.f.$pDERLSJac1.dummyVarLSJac1[3] JACOBIAN_TMP_VAR */) - (((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)) * (jacobian->tmpVars[7] /* cutForce.frame_a.f.$pDERLSJac1.dummyVarLSJac1[2] JACOBIAN_TMP_VAR */));
  TRACE_POP
}

/*
equation index: 786
type: SIMPLE_ASSIGN
cutForce.frame_a.t.$pDERLSJac1.dummyVarLSJac1[3] = body.I[3,1] * body.z_a.$pDERLSJac1.dummyVarLSJac1[1] + body.I[3,2] * body.z_a.$pDERLSJac1.dummyVarLSJac1[2] + body.I[3,3] * body.z_a.$pDERLSJac1.dummyVarLSJac1[3] + body.r_CM[1] * cutForce.frame_a.f.$pDERLSJac1.dummyVarLSJac1[2] - body.r_CM[2] * cutForce.frame_a.f.$pDERLSJac1.dummyVarLSJac1[1]
*/
void inerter_test3_eqFunction_786(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 9;
  const int equationIndexes[2] = {1,786};
  jacobian->tmpVars[9] /* cutForce.frame_a.t.$pDERLSJac1.dummyVarLSJac1[3] JACOBIAN_TMP_VAR */ = ((data->simulationInfo->realParameter[8] /* body.I[3,1] PARAM */)) * (jacobian->tmpVars[1] /* body.z_a.$pDERLSJac1.dummyVarLSJac1[1] JACOBIAN_TMP_VAR */) + ((data->simulationInfo->realParameter[9] /* body.I[3,2] PARAM */)) * (jacobian->tmpVars[0] /* body.z_a.$pDERLSJac1.dummyVarLSJac1[2] JACOBIAN_TMP_VAR */) + ((data->simulationInfo->realParameter[10] /* body.I[3,3] PARAM */)) * (jacobian->tmpVars[4] /* body.z_a.$pDERLSJac1.dummyVarLSJac1[3] JACOBIAN_TMP_VAR */) + ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)) * (jacobian->tmpVars[7] /* cutForce.frame_a.f.$pDERLSJac1.dummyVarLSJac1[2] JACOBIAN_TMP_VAR */) - (((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)) * (jacobian->tmpVars[5] /* cutForce.frame_a.f.$pDERLSJac1.dummyVarLSJac1[1] JACOBIAN_TMP_VAR */));
  TRACE_POP
}

/*
equation index: 787
type: SIMPLE_ASSIGN
prismatic.f.$pDERLSJac1.dummyVarLSJac1 = cutForce.frame_a.R.T[3,3] * cutForce.frame_a.f.$pDERLSJac1.dummyVarLSJac1[3] + cutForce.frame_a.R.T[1,3] * cutForce.frame_a.f.$pDERLSJac1.dummyVarLSJac1[1] + cutForce.frame_a.R.T[2,3] * cutForce.frame_a.f.$pDERLSJac1.dummyVarLSJac1[2]
*/
void inerter_test3_eqFunction_787(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 10;
  const int equationIndexes[2] = {1,787};
  jacobian->tmpVars[10] /* prismatic.f.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_TMP_VAR */ = ((data->localData[0]->realVars[172] /* cutForce.frame_a.R.T[3,3] variable */)) * (jacobian->tmpVars[3] /* cutForce.frame_a.f.$pDERLSJac1.dummyVarLSJac1[3] JACOBIAN_TMP_VAR */) + ((data->localData[0]->realVars[166] /* cutForce.frame_a.R.T[1,3] variable */)) * (jacobian->tmpVars[5] /* cutForce.frame_a.f.$pDERLSJac1.dummyVarLSJac1[1] JACOBIAN_TMP_VAR */) + ((data->localData[0]->realVars[169] /* cutForce.frame_a.R.T[2,3] variable */)) * (jacobian->tmpVars[7] /* cutForce.frame_a.f.$pDERLSJac1.dummyVarLSJac1[2] JACOBIAN_TMP_VAR */);
  TRACE_POP
}

/*
equation index: 788
type: SIMPLE_ASSIGN
revolute.tau.$pDERLSJac1.dummyVarLSJac1 = cutForce.frame_a.t.$pDERLSJac1.dummyVarLSJac1[2] * revolute.e[2] + cutForce.frame_a.t.$pDERLSJac1.dummyVarLSJac1[3] * revolute.e[3] + cutForce.frame_a.t.$pDERLSJac1.dummyVarLSJac1[1] * revolute.e[1]
*/
void inerter_test3_eqFunction_788(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 11;
  const int equationIndexes[2] = {1,788};
  jacobian->tmpVars[11] /* revolute.tau.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_TMP_VAR */ = (jacobian->tmpVars[6] /* cutForce.frame_a.t.$pDERLSJac1.dummyVarLSJac1[2] JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[222] /* revolute.e[2] PARAM */)) + (jacobian->tmpVars[9] /* cutForce.frame_a.t.$pDERLSJac1.dummyVarLSJac1[3] JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[223] /* revolute.e[3] PARAM */)) + (jacobian->tmpVars[8] /* cutForce.frame_a.t.$pDERLSJac1.dummyVarLSJac1[1] JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[221] /* revolute.e[1] PARAM */));
  TRACE_POP
}

/*
equation index: 789
type: SIMPLE_ASSIGN
idealGearR2T.flangeT.f.$pDERLSJac1.dummyVarLSJac1 = idealGearR2T.ratio * revolute.tau.$pDERLSJac1.dummyVarLSJac1
*/
void inerter_test3_eqFunction_789(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 12;
  const int equationIndexes[2] = {1,789};
  jacobian->tmpVars[12] /* idealGearR2T.flangeT.f.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_TMP_VAR */ = ((data->simulationInfo->realParameter[191] /* idealGearR2T.ratio PARAM */)) * (jacobian->tmpVars[11] /* revolute.tau.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_TMP_VAR */);
  TRACE_POP
}

/*
equation index: 790
type: SIMPLE_ASSIGN
$res_LSJac1_1.$pDERLSJac1.dummyVarLSJac1 = idealGearR2T.flangeT.f.$pDERLSJac1.dummyVarLSJac1 + prismatic.f.$pDERLSJac1.dummyVarLSJac1
*/
void inerter_test3_eqFunction_790(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 13;
  const int equationIndexes[2] = {1,790};
  jacobian->resultVars[0] /* $res_LSJac1_1.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_VAR */ = jacobian->tmpVars[12] /* idealGearR2T.flangeT.f.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_TMP_VAR */ + jacobian->tmpVars[10] /* prismatic.f.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_TMP_VAR */;
  TRACE_POP
}

OMC_DISABLE_OPT
int inerter_test3_functionJacLSJac1_constantEqns(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = inerter_test3_INDEX_JAC_LSJac1;
  
  TRACE_POP
  return 0;
}

int inerter_test3_functionJacLSJac1_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = inerter_test3_INDEX_JAC_LSJac1;
  inerter_test3_eqFunction_777(data, threadData, jacobian, parentJacobian);
  inerter_test3_eqFunction_778(data, threadData, jacobian, parentJacobian);
  inerter_test3_eqFunction_779(data, threadData, jacobian, parentJacobian);
  inerter_test3_eqFunction_780(data, threadData, jacobian, parentJacobian);
  inerter_test3_eqFunction_781(data, threadData, jacobian, parentJacobian);
  inerter_test3_eqFunction_782(data, threadData, jacobian, parentJacobian);
  inerter_test3_eqFunction_783(data, threadData, jacobian, parentJacobian);
  inerter_test3_eqFunction_784(data, threadData, jacobian, parentJacobian);
  inerter_test3_eqFunction_785(data, threadData, jacobian, parentJacobian);
  inerter_test3_eqFunction_786(data, threadData, jacobian, parentJacobian);
  inerter_test3_eqFunction_787(data, threadData, jacobian, parentJacobian);
  inerter_test3_eqFunction_788(data, threadData, jacobian, parentJacobian);
  inerter_test3_eqFunction_789(data, threadData, jacobian, parentJacobian);
  inerter_test3_eqFunction_790(data, threadData, jacobian, parentJacobian);
  TRACE_POP
  return 0;
}
int inerter_test3_functionJacH_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  TRACE_POP
  return 0;
}
int inerter_test3_functionJacF_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  TRACE_POP
  return 0;
}
int inerter_test3_functionJacD_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  TRACE_POP
  return 0;
}
int inerter_test3_functionJacC_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  TRACE_POP
  return 0;
}
int inerter_test3_functionJacB_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  TRACE_POP
  return 0;
}
/* constant equations */
/* dynamic equations */

OMC_DISABLE_OPT
int inerter_test3_functionJacA_constantEqns(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = inerter_test3_INDEX_JAC_A;
  
  TRACE_POP
  return 0;
}

int inerter_test3_functionJacA_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = inerter_test3_INDEX_JAC_A;
  TRACE_POP
  return 0;
}

OMC_DISABLE_OPT
int inerter_test3_initialAnalyticJacobianLSJac0(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  size_t count;

  FILE* pFile = openSparsePatternFile(data, threadData, "inerter_test3_JacLSJac0.bin");
  
  initAnalyticJacobian(jacobian, 3, 3, 18, NULL, jacobian->sparsePattern);
  jacobian->sparsePattern = allocSparsePattern(3, 7, 3);
  jacobian->availability = JACOBIAN_AVAILABLE;
  
  /* read lead index of compressed sparse column */
  count = omc_fread(jacobian->sparsePattern->leadindex, sizeof(unsigned int), 3+1, pFile, FALSE);
  if (count != 3+1) {
    throwStreamPrint(threadData, "Error while reading lead index list of sparsity pattern. Expected %d, got %zu", 3+1, count);
  }
  
  /* read sparse index */
  count = omc_fread(jacobian->sparsePattern->index, sizeof(unsigned int), 7, pFile, FALSE);
  if (count != 7) {
    throwStreamPrint(threadData, "Error while reading row index list of sparsity pattern. Expected %d, got %zu", 7, count);
  }
  
  /* write color array */
  /* color 1 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 1, 1, 3);
  /* color 2 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 2, 1, 3);
  /* color 3 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 3, 1, 3);
  
  omc_fclose(pFile);
  
  TRACE_POP
  return 0;
}
OMC_DISABLE_OPT
int inerter_test3_initialAnalyticJacobianLSJac1(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  size_t count;

  FILE* pFile = openSparsePatternFile(data, threadData, "inerter_test3_JacLSJac1.bin");
  
  initAnalyticJacobian(jacobian, 1, 1, 14, NULL, jacobian->sparsePattern);
  jacobian->sparsePattern = allocSparsePattern(1, 1, 1);
  jacobian->availability = JACOBIAN_AVAILABLE;
  
  /* read lead index of compressed sparse column */
  count = omc_fread(jacobian->sparsePattern->leadindex, sizeof(unsigned int), 1+1, pFile, FALSE);
  if (count != 1+1) {
    throwStreamPrint(threadData, "Error while reading lead index list of sparsity pattern. Expected %d, got %zu", 1+1, count);
  }
  
  /* read sparse index */
  count = omc_fread(jacobian->sparsePattern->index, sizeof(unsigned int), 1, pFile, FALSE);
  if (count != 1) {
    throwStreamPrint(threadData, "Error while reading row index list of sparsity pattern. Expected %d, got %zu", 1, count);
  }
  
  /* write color array */
  /* color 1 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 1, 1, 1);
  
  omc_fclose(pFile);
  
  TRACE_POP
  return 0;
}
int inerter_test3_initialAnalyticJacobianH(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  TRACE_POP
  jacobian->availability = JACOBIAN_NOT_AVAILABLE;
  return 1;
}
int inerter_test3_initialAnalyticJacobianF(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  TRACE_POP
  jacobian->availability = JACOBIAN_NOT_AVAILABLE;
  return 1;
}
int inerter_test3_initialAnalyticJacobianD(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  TRACE_POP
  jacobian->availability = JACOBIAN_NOT_AVAILABLE;
  return 1;
}
int inerter_test3_initialAnalyticJacobianC(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  TRACE_POP
  jacobian->availability = JACOBIAN_NOT_AVAILABLE;
  return 1;
}
int inerter_test3_initialAnalyticJacobianB(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  TRACE_POP
  jacobian->availability = JACOBIAN_NOT_AVAILABLE;
  return 1;
}
OMC_DISABLE_OPT
int inerter_test3_initialAnalyticJacobianA(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  size_t count;

  FILE* pFile = openSparsePatternFile(data, threadData, "inerter_test3_JacA.bin");
  
  initAnalyticJacobian(jacobian, 2, 2, 0, NULL, jacobian->sparsePattern);
  jacobian->sparsePattern = allocSparsePattern(2, 3, 2);
  jacobian->availability = JACOBIAN_ONLY_SPARSITY;
  
  /* read lead index of compressed sparse column */
  count = omc_fread(jacobian->sparsePattern->leadindex, sizeof(unsigned int), 2+1, pFile, FALSE);
  if (count != 2+1) {
    throwStreamPrint(threadData, "Error while reading lead index list of sparsity pattern. Expected %d, got %zu", 2+1, count);
  }
  
  /* read sparse index */
  count = omc_fread(jacobian->sparsePattern->index, sizeof(unsigned int), 3, pFile, FALSE);
  if (count != 3) {
    throwStreamPrint(threadData, "Error while reading row index list of sparsity pattern. Expected %d, got %zu", 3, count);
  }
  
  /* write color array */
  /* color 1 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 1, 1, 2);
  /* color 2 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 2, 1, 2);
  
  omc_fclose(pFile);
  
  TRACE_POP
  return 0;
}



