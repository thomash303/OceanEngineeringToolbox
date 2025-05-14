/* Jacobians 8 */
#include "inerter_test3_model.h"
#include "inerter_test3_12jac.h"
#include "simulation/jacobian_util.h"
#include "util/omc_file.h"
/* constant equations */
/* dynamic equations */

/*
equation index: 659
type: SIMPLE_ASSIGN
revolute.a.$pDERLSJac2.dummyVarLSJac2 = body.z_a.SeedLSJac2[3] / revolute.e[3]
*/
void inerter_test3_eqFunction_659(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 0;
  const int equationIndexes[2] = {1,659};
  jacobian->tmpVars[3] /* revolute.a.$pDERLSJac2.dummyVarLSJac2 JACOBIAN_TMP_VAR */ = DIVISION(jacobian->seedVars[0] /* body.z_a.SeedLSJac2[3] SEED_VAR */,(data->simulationInfo->realParameter[223] /* revolute.e[3] PARAM */),"revolute.e[3]");
  TRACE_POP
}

/*
equation index: 660
type: SIMPLE_ASSIGN
body.a_0.$pDERLSJac2.dummyVarLSJac2[3] = revolute.a.$pDERLSJac2.dummyVarLSJac2 / idealGearR2T.ratio
*/
void inerter_test3_eqFunction_660(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 1;
  const int equationIndexes[2] = {1,660};
  jacobian->tmpVars[5] /* body.a_0.$pDERLSJac2.dummyVarLSJac2[3] JACOBIAN_TMP_VAR */ = DIVISION(jacobian->tmpVars[3] /* revolute.a.$pDERLSJac2.dummyVarLSJac2 JACOBIAN_TMP_VAR */,(data->simulationInfo->realParameter[191] /* idealGearR2T.ratio PARAM */),"idealGearR2T.ratio");
  TRACE_POP
}

/*
equation index: 661
type: SIMPLE_ASSIGN
body.frame_a.f.$pDERLSJac2.dummyVarLSJac2[1] = (force.frame_b.R.T[1,3] * body.a_0.$pDERLSJac2.dummyVarLSJac2[3] + body.z_a.SeedLSJac2[2] * body.r_CM[3] - body.z_a.SeedLSJac2[3] * body.r_CM[2]) * body.m
*/
void inerter_test3_eqFunction_661(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 2;
  const int equationIndexes[2] = {1,661};
  jacobian->tmpVars[6] /* body.frame_a.f.$pDERLSJac2.dummyVarLSJac2[1] JACOBIAN_TMP_VAR */ = (((data->localData[0]->realVars[209] /* force.frame_b.R.T[1,3] variable */)) * (jacobian->tmpVars[5] /* body.a_0.$pDERLSJac2.dummyVarLSJac2[3] JACOBIAN_TMP_VAR */) + (jacobian->seedVars[2] /* body.z_a.SeedLSJac2[2] SEED_VAR */) * ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)) - ((jacobian->seedVars[0] /* body.z_a.SeedLSJac2[3] SEED_VAR */) * ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)))) * ((data->simulationInfo->realParameter[43] /* body.m PARAM */));
  TRACE_POP
}

/*
equation index: 662
type: SIMPLE_ASSIGN
body.frame_a.f.$pDERLSJac2.dummyVarLSJac2[2] = (force.frame_b.R.T[2,3] * body.a_0.$pDERLSJac2.dummyVarLSJac2[3] + body.z_a.SeedLSJac2[3] * body.r_CM[1] - body.z_a.SeedLSJac2[1] * body.r_CM[3]) * body.m
*/
void inerter_test3_eqFunction_662(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 3;
  const int equationIndexes[2] = {1,662};
  jacobian->tmpVars[7] /* body.frame_a.f.$pDERLSJac2.dummyVarLSJac2[2] JACOBIAN_TMP_VAR */ = (((data->localData[0]->realVars[212] /* force.frame_b.R.T[2,3] variable */)) * (jacobian->tmpVars[5] /* body.a_0.$pDERLSJac2.dummyVarLSJac2[3] JACOBIAN_TMP_VAR */) + (jacobian->seedVars[0] /* body.z_a.SeedLSJac2[3] SEED_VAR */) * ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)) - ((jacobian->seedVars[1] /* body.z_a.SeedLSJac2[1] SEED_VAR */) * ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)))) * ((data->simulationInfo->realParameter[43] /* body.m PARAM */));
  TRACE_POP
}

/*
equation index: 663
type: SIMPLE_ASSIGN
body.frame_a.t.$pDERLSJac2.dummyVarLSJac2[3] = body.I[3,1] * body.z_a.SeedLSJac2[1] + body.I[3,2] * body.z_a.SeedLSJac2[2] + body.I[3,3] * body.z_a.SeedLSJac2[3] + body.r_CM[1] * body.frame_a.f.$pDERLSJac2.dummyVarLSJac2[2] - body.r_CM[2] * body.frame_a.f.$pDERLSJac2.dummyVarLSJac2[1]
*/
void inerter_test3_eqFunction_663(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 4;
  const int equationIndexes[2] = {1,663};
  jacobian->tmpVars[8] /* body.frame_a.t.$pDERLSJac2.dummyVarLSJac2[3] JACOBIAN_TMP_VAR */ = ((data->simulationInfo->realParameter[8] /* body.I[3,1] PARAM */)) * (jacobian->seedVars[1] /* body.z_a.SeedLSJac2[1] SEED_VAR */) + ((data->simulationInfo->realParameter[9] /* body.I[3,2] PARAM */)) * (jacobian->seedVars[2] /* body.z_a.SeedLSJac2[2] SEED_VAR */) + ((data->simulationInfo->realParameter[10] /* body.I[3,3] PARAM */)) * (jacobian->seedVars[0] /* body.z_a.SeedLSJac2[3] SEED_VAR */) + ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)) * (jacobian->tmpVars[7] /* body.frame_a.f.$pDERLSJac2.dummyVarLSJac2[2] JACOBIAN_TMP_VAR */) - (((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)) * (jacobian->tmpVars[6] /* body.frame_a.f.$pDERLSJac2.dummyVarLSJac2[1] JACOBIAN_TMP_VAR */));
  TRACE_POP
}

/*
equation index: 664
type: SIMPLE_ASSIGN
body.frame_a.f.$pDERLSJac2.dummyVarLSJac2[3] = (force.frame_b.R.T[3,3] * body.a_0.$pDERLSJac2.dummyVarLSJac2[3] + body.z_a.SeedLSJac2[1] * body.r_CM[2] - body.z_a.SeedLSJac2[2] * body.r_CM[1]) * body.m
*/
void inerter_test3_eqFunction_664(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 5;
  const int equationIndexes[2] = {1,664};
  jacobian->tmpVars[9] /* body.frame_a.f.$pDERLSJac2.dummyVarLSJac2[3] JACOBIAN_TMP_VAR */ = (((data->localData[0]->realVars[215] /* force.frame_b.R.T[3,3] variable */)) * (jacobian->tmpVars[5] /* body.a_0.$pDERLSJac2.dummyVarLSJac2[3] JACOBIAN_TMP_VAR */) + (jacobian->seedVars[1] /* body.z_a.SeedLSJac2[1] SEED_VAR */) * ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)) - ((jacobian->seedVars[2] /* body.z_a.SeedLSJac2[2] SEED_VAR */) * ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)))) * ((data->simulationInfo->realParameter[43] /* body.m PARAM */));
  TRACE_POP
}

/*
equation index: 665
type: SIMPLE_ASSIGN
body.frame_a.t.$pDERLSJac2.dummyVarLSJac2[2] = body.I[2,1] * body.z_a.SeedLSJac2[1] + body.I[2,2] * body.z_a.SeedLSJac2[2] + body.I[2,3] * body.z_a.SeedLSJac2[3] + body.r_CM[3] * body.frame_a.f.$pDERLSJac2.dummyVarLSJac2[1] - body.r_CM[1] * body.frame_a.f.$pDERLSJac2.dummyVarLSJac2[3]
*/
void inerter_test3_eqFunction_665(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 6;
  const int equationIndexes[2] = {1,665};
  jacobian->tmpVars[10] /* body.frame_a.t.$pDERLSJac2.dummyVarLSJac2[2] JACOBIAN_TMP_VAR */ = ((data->simulationInfo->realParameter[5] /* body.I[2,1] PARAM */)) * (jacobian->seedVars[1] /* body.z_a.SeedLSJac2[1] SEED_VAR */) + ((data->simulationInfo->realParameter[6] /* body.I[2,2] PARAM */)) * (jacobian->seedVars[2] /* body.z_a.SeedLSJac2[2] SEED_VAR */) + ((data->simulationInfo->realParameter[7] /* body.I[2,3] PARAM */)) * (jacobian->seedVars[0] /* body.z_a.SeedLSJac2[3] SEED_VAR */) + ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)) * (jacobian->tmpVars[6] /* body.frame_a.f.$pDERLSJac2.dummyVarLSJac2[1] JACOBIAN_TMP_VAR */) - (((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)) * (jacobian->tmpVars[9] /* body.frame_a.f.$pDERLSJac2.dummyVarLSJac2[3] JACOBIAN_TMP_VAR */));
  TRACE_POP
}

/*
equation index: 666
type: SIMPLE_ASSIGN
body.frame_a.t.$pDERLSJac2.dummyVarLSJac2[1] = body.I[1,1] * body.z_a.SeedLSJac2[1] + body.I[1,2] * body.z_a.SeedLSJac2[2] + body.I[1,3] * body.z_a.SeedLSJac2[3] + body.r_CM[2] * body.frame_a.f.$pDERLSJac2.dummyVarLSJac2[3] - body.r_CM[3] * body.frame_a.f.$pDERLSJac2.dummyVarLSJac2[2]
*/
void inerter_test3_eqFunction_666(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 7;
  const int equationIndexes[2] = {1,666};
  jacobian->tmpVars[11] /* body.frame_a.t.$pDERLSJac2.dummyVarLSJac2[1] JACOBIAN_TMP_VAR */ = ((data->simulationInfo->realParameter[2] /* body.I[1,1] PARAM */)) * (jacobian->seedVars[1] /* body.z_a.SeedLSJac2[1] SEED_VAR */) + ((data->simulationInfo->realParameter[3] /* body.I[1,2] PARAM */)) * (jacobian->seedVars[2] /* body.z_a.SeedLSJac2[2] SEED_VAR */) + ((data->simulationInfo->realParameter[4] /* body.I[1,3] PARAM */)) * (jacobian->seedVars[0] /* body.z_a.SeedLSJac2[3] SEED_VAR */) + ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)) * (jacobian->tmpVars[9] /* body.frame_a.f.$pDERLSJac2.dummyVarLSJac2[3] JACOBIAN_TMP_VAR */) - (((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)) * (jacobian->tmpVars[7] /* body.frame_a.f.$pDERLSJac2.dummyVarLSJac2[2] JACOBIAN_TMP_VAR */));
  TRACE_POP
}

/*
equation index: 667
type: SIMPLE_ASSIGN
revolute.tau.$pDERLSJac2.dummyVarLSJac2 = body.frame_a.t.$pDERLSJac2.dummyVarLSJac2[2] * revolute.e[2] + body.frame_a.t.$pDERLSJac2.dummyVarLSJac2[3] * revolute.e[3] + body.frame_a.t.$pDERLSJac2.dummyVarLSJac2[1] * revolute.e[1]
*/
void inerter_test3_eqFunction_667(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 8;
  const int equationIndexes[2] = {1,667};
  jacobian->tmpVars[12] /* revolute.tau.$pDERLSJac2.dummyVarLSJac2 JACOBIAN_TMP_VAR */ = (jacobian->tmpVars[10] /* body.frame_a.t.$pDERLSJac2.dummyVarLSJac2[2] JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[222] /* revolute.e[2] PARAM */)) + (jacobian->tmpVars[8] /* body.frame_a.t.$pDERLSJac2.dummyVarLSJac2[3] JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[223] /* revolute.e[3] PARAM */)) + (jacobian->tmpVars[11] /* body.frame_a.t.$pDERLSJac2.dummyVarLSJac2[1] JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[221] /* revolute.e[1] PARAM */));
  TRACE_POP
}

/*
equation index: 668
type: SIMPLE_ASSIGN
prismatic.f.$pDERLSJac2.dummyVarLSJac2 = (-idealGearR2T.ratio) * revolute.tau.$pDERLSJac2.dummyVarLSJac2
*/
void inerter_test3_eqFunction_668(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 9;
  const int equationIndexes[2] = {1,668};
  jacobian->tmpVars[16] /* prismatic.f.$pDERLSJac2.dummyVarLSJac2 JACOBIAN_TMP_VAR */ = ((-(data->simulationInfo->realParameter[191] /* idealGearR2T.ratio PARAM */))) * (jacobian->tmpVars[12] /* revolute.tau.$pDERLSJac2.dummyVarLSJac2 JACOBIAN_TMP_VAR */);
  TRACE_POP
}

/*
equation index: 669
type: SIMPLE_ASSIGN
$res_LSJac2_3.$pDERLSJac2.dummyVarLSJac2 = force.frame_b.R.T[2,3] * body.frame_a.f.$pDERLSJac2.dummyVarLSJac2[2] + force.frame_b.R.T[1,3] * body.frame_a.f.$pDERLSJac2.dummyVarLSJac2[1] + force.frame_b.R.T[3,3] * body.frame_a.f.$pDERLSJac2.dummyVarLSJac2[3] - prismatic.f.$pDERLSJac2.dummyVarLSJac2
*/
void inerter_test3_eqFunction_669(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 10;
  const int equationIndexes[2] = {1,669};
  jacobian->resultVars[2] /* $res_LSJac2_3.$pDERLSJac2.dummyVarLSJac2 JACOBIAN_VAR */ = ((data->localData[0]->realVars[212] /* force.frame_b.R.T[2,3] variable */)) * (jacobian->tmpVars[7] /* body.frame_a.f.$pDERLSJac2.dummyVarLSJac2[2] JACOBIAN_TMP_VAR */) + ((data->localData[0]->realVars[209] /* force.frame_b.R.T[1,3] variable */)) * (jacobian->tmpVars[6] /* body.frame_a.f.$pDERLSJac2.dummyVarLSJac2[1] JACOBIAN_TMP_VAR */) + ((data->localData[0]->realVars[215] /* force.frame_b.R.T[3,3] variable */)) * (jacobian->tmpVars[9] /* body.frame_a.f.$pDERLSJac2.dummyVarLSJac2[3] JACOBIAN_TMP_VAR */) - jacobian->tmpVars[16] /* prismatic.f.$pDERLSJac2.dummyVarLSJac2 JACOBIAN_TMP_VAR */;
  TRACE_POP
}

/*
equation index: 670
type: SIMPLE_ASSIGN
$res_LSJac2_1.$pDERLSJac2.dummyVarLSJac2 = revolute.e[1] * revolute.a.$pDERLSJac2.dummyVarLSJac2 - body.z_a.SeedLSJac2[1]
*/
void inerter_test3_eqFunction_670(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 11;
  const int equationIndexes[2] = {1,670};
  jacobian->resultVars[0] /* $res_LSJac2_1.$pDERLSJac2.dummyVarLSJac2 JACOBIAN_VAR */ = ((data->simulationInfo->realParameter[221] /* revolute.e[1] PARAM */)) * (jacobian->tmpVars[3] /* revolute.a.$pDERLSJac2.dummyVarLSJac2 JACOBIAN_TMP_VAR */) - jacobian->seedVars[1] /* body.z_a.SeedLSJac2[1] SEED_VAR */;
  TRACE_POP
}

/*
equation index: 671
type: SIMPLE_ASSIGN
$res_LSJac2_2.$pDERLSJac2.dummyVarLSJac2 = revolute.e[2] * revolute.a.$pDERLSJac2.dummyVarLSJac2 - body.z_a.SeedLSJac2[2]
*/
void inerter_test3_eqFunction_671(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 12;
  const int equationIndexes[2] = {1,671};
  jacobian->resultVars[1] /* $res_LSJac2_2.$pDERLSJac2.dummyVarLSJac2 JACOBIAN_VAR */ = ((data->simulationInfo->realParameter[222] /* revolute.e[2] PARAM */)) * (jacobian->tmpVars[3] /* revolute.a.$pDERLSJac2.dummyVarLSJac2 JACOBIAN_TMP_VAR */) - jacobian->seedVars[2] /* body.z_a.SeedLSJac2[2] SEED_VAR */;
  TRACE_POP
}

OMC_DISABLE_OPT
int inerter_test3_functionJacLSJac2_constantEqns(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = inerter_test3_INDEX_JAC_LSJac2;
  
  TRACE_POP
  return 0;
}

int inerter_test3_functionJacLSJac2_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = inerter_test3_INDEX_JAC_LSJac2;
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
  inerter_test3_eqFunction_670(data, threadData, jacobian, parentJacobian);
  inerter_test3_eqFunction_671(data, threadData, jacobian, parentJacobian);
  TRACE_POP
  return 0;
}
/* constant equations */
/* dynamic equations */

/*
equation index: 775
type: SIMPLE_ASSIGN
body.z_a.$pDERLSJac3.dummyVarLSJac3[3] = revolute.e[3] * revolute.a.SeedLSJac3
*/
void inerter_test3_eqFunction_775(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 0;
  const int equationIndexes[2] = {1,775};
  jacobian->tmpVars[4] /* body.z_a.$pDERLSJac3.dummyVarLSJac3[3] JACOBIAN_TMP_VAR */ = ((data->simulationInfo->realParameter[223] /* revolute.e[3] PARAM */)) * (jacobian->seedVars[0] /* revolute.a.SeedLSJac3 SEED_VAR */);
  TRACE_POP
}

/*
equation index: 776
type: SIMPLE_ASSIGN
body.a_0.$pDERLSJac3.dummyVarLSJac3[3] = revolute.a.SeedLSJac3 / idealGearR2T.ratio
*/
void inerter_test3_eqFunction_776(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 1;
  const int equationIndexes[2] = {1,776};
  jacobian->tmpVars[2] /* body.a_0.$pDERLSJac3.dummyVarLSJac3[3] JACOBIAN_TMP_VAR */ = DIVISION(jacobian->seedVars[0] /* revolute.a.SeedLSJac3 SEED_VAR */,(data->simulationInfo->realParameter[191] /* idealGearR2T.ratio PARAM */),"idealGearR2T.ratio");
  TRACE_POP
}

/*
equation index: 777
type: SIMPLE_ASSIGN
body.z_a.$pDERLSJac3.dummyVarLSJac3[1] = revolute.e[1] * revolute.a.SeedLSJac3
*/
void inerter_test3_eqFunction_777(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 2;
  const int equationIndexes[2] = {1,777};
  jacobian->tmpVars[1] /* body.z_a.$pDERLSJac3.dummyVarLSJac3[1] JACOBIAN_TMP_VAR */ = ((data->simulationInfo->realParameter[221] /* revolute.e[1] PARAM */)) * (jacobian->seedVars[0] /* revolute.a.SeedLSJac3 SEED_VAR */);
  TRACE_POP
}

/*
equation index: 778
type: SIMPLE_ASSIGN
body.frame_a.f.$pDERLSJac3.dummyVarLSJac3[2] = (force.frame_b.R.T[2,3] * body.a_0.$pDERLSJac3.dummyVarLSJac3[3] + body.z_a.$pDERLSJac3.dummyVarLSJac3[3] * body.r_CM[1] - body.z_a.$pDERLSJac3.dummyVarLSJac3[1] * body.r_CM[3]) * body.m
*/
void inerter_test3_eqFunction_778(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 3;
  const int equationIndexes[2] = {1,778};
  jacobian->tmpVars[7] /* body.frame_a.f.$pDERLSJac3.dummyVarLSJac3[2] JACOBIAN_TMP_VAR */ = (((data->localData[0]->realVars[212] /* force.frame_b.R.T[2,3] variable */)) * (jacobian->tmpVars[2] /* body.a_0.$pDERLSJac3.dummyVarLSJac3[3] JACOBIAN_TMP_VAR */) + (jacobian->tmpVars[4] /* body.z_a.$pDERLSJac3.dummyVarLSJac3[3] JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)) - ((jacobian->tmpVars[1] /* body.z_a.$pDERLSJac3.dummyVarLSJac3[1] JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)))) * ((data->simulationInfo->realParameter[43] /* body.m PARAM */));
  TRACE_POP
}

/*
equation index: 779
type: SIMPLE_ASSIGN
body.z_a.$pDERLSJac3.dummyVarLSJac3[2] = revolute.e[2] * revolute.a.SeedLSJac3
*/
void inerter_test3_eqFunction_779(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 4;
  const int equationIndexes[2] = {1,779};
  jacobian->tmpVars[0] /* body.z_a.$pDERLSJac3.dummyVarLSJac3[2] JACOBIAN_TMP_VAR */ = ((data->simulationInfo->realParameter[222] /* revolute.e[2] PARAM */)) * (jacobian->seedVars[0] /* revolute.a.SeedLSJac3 SEED_VAR */);
  TRACE_POP
}

/*
equation index: 780
type: SIMPLE_ASSIGN
body.frame_a.f.$pDERLSJac3.dummyVarLSJac3[3] = (force.frame_b.R.T[3,3] * body.a_0.$pDERLSJac3.dummyVarLSJac3[3] + body.z_a.$pDERLSJac3.dummyVarLSJac3[1] * body.r_CM[2] - body.z_a.$pDERLSJac3.dummyVarLSJac3[2] * body.r_CM[1]) * body.m
*/
void inerter_test3_eqFunction_780(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 5;
  const int equationIndexes[2] = {1,780};
  jacobian->tmpVars[3] /* body.frame_a.f.$pDERLSJac3.dummyVarLSJac3[3] JACOBIAN_TMP_VAR */ = (((data->localData[0]->realVars[215] /* force.frame_b.R.T[3,3] variable */)) * (jacobian->tmpVars[2] /* body.a_0.$pDERLSJac3.dummyVarLSJac3[3] JACOBIAN_TMP_VAR */) + (jacobian->tmpVars[1] /* body.z_a.$pDERLSJac3.dummyVarLSJac3[1] JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)) - ((jacobian->tmpVars[0] /* body.z_a.$pDERLSJac3.dummyVarLSJac3[2] JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)))) * ((data->simulationInfo->realParameter[43] /* body.m PARAM */));
  TRACE_POP
}

/*
equation index: 781
type: SIMPLE_ASSIGN
body.frame_a.f.$pDERLSJac3.dummyVarLSJac3[1] = (force.frame_b.R.T[1,3] * body.a_0.$pDERLSJac3.dummyVarLSJac3[3] + body.z_a.$pDERLSJac3.dummyVarLSJac3[2] * body.r_CM[3] - body.z_a.$pDERLSJac3.dummyVarLSJac3[3] * body.r_CM[2]) * body.m
*/
void inerter_test3_eqFunction_781(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 6;
  const int equationIndexes[2] = {1,781};
  jacobian->tmpVars[5] /* body.frame_a.f.$pDERLSJac3.dummyVarLSJac3[1] JACOBIAN_TMP_VAR */ = (((data->localData[0]->realVars[209] /* force.frame_b.R.T[1,3] variable */)) * (jacobian->tmpVars[2] /* body.a_0.$pDERLSJac3.dummyVarLSJac3[3] JACOBIAN_TMP_VAR */) + (jacobian->tmpVars[0] /* body.z_a.$pDERLSJac3.dummyVarLSJac3[2] JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)) - ((jacobian->tmpVars[4] /* body.z_a.$pDERLSJac3.dummyVarLSJac3[3] JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)))) * ((data->simulationInfo->realParameter[43] /* body.m PARAM */));
  TRACE_POP
}

/*
equation index: 782
type: SIMPLE_ASSIGN
body.frame_a.t.$pDERLSJac3.dummyVarLSJac3[2] = body.I[2,1] * body.z_a.$pDERLSJac3.dummyVarLSJac3[1] + body.I[2,2] * body.z_a.$pDERLSJac3.dummyVarLSJac3[2] + body.I[2,3] * body.z_a.$pDERLSJac3.dummyVarLSJac3[3] + body.r_CM[3] * body.frame_a.f.$pDERLSJac3.dummyVarLSJac3[1] - body.r_CM[1] * body.frame_a.f.$pDERLSJac3.dummyVarLSJac3[3]
*/
void inerter_test3_eqFunction_782(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 7;
  const int equationIndexes[2] = {1,782};
  jacobian->tmpVars[6] /* body.frame_a.t.$pDERLSJac3.dummyVarLSJac3[2] JACOBIAN_TMP_VAR */ = ((data->simulationInfo->realParameter[5] /* body.I[2,1] PARAM */)) * (jacobian->tmpVars[1] /* body.z_a.$pDERLSJac3.dummyVarLSJac3[1] JACOBIAN_TMP_VAR */) + ((data->simulationInfo->realParameter[6] /* body.I[2,2] PARAM */)) * (jacobian->tmpVars[0] /* body.z_a.$pDERLSJac3.dummyVarLSJac3[2] JACOBIAN_TMP_VAR */) + ((data->simulationInfo->realParameter[7] /* body.I[2,3] PARAM */)) * (jacobian->tmpVars[4] /* body.z_a.$pDERLSJac3.dummyVarLSJac3[3] JACOBIAN_TMP_VAR */) + ((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)) * (jacobian->tmpVars[5] /* body.frame_a.f.$pDERLSJac3.dummyVarLSJac3[1] JACOBIAN_TMP_VAR */) - (((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)) * (jacobian->tmpVars[3] /* body.frame_a.f.$pDERLSJac3.dummyVarLSJac3[3] JACOBIAN_TMP_VAR */));
  TRACE_POP
}

/*
equation index: 783
type: SIMPLE_ASSIGN
body.frame_a.t.$pDERLSJac3.dummyVarLSJac3[1] = body.I[1,1] * body.z_a.$pDERLSJac3.dummyVarLSJac3[1] + body.I[1,2] * body.z_a.$pDERLSJac3.dummyVarLSJac3[2] + body.I[1,3] * body.z_a.$pDERLSJac3.dummyVarLSJac3[3] + body.r_CM[2] * body.frame_a.f.$pDERLSJac3.dummyVarLSJac3[3] - body.r_CM[3] * body.frame_a.f.$pDERLSJac3.dummyVarLSJac3[2]
*/
void inerter_test3_eqFunction_783(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 8;
  const int equationIndexes[2] = {1,783};
  jacobian->tmpVars[8] /* body.frame_a.t.$pDERLSJac3.dummyVarLSJac3[1] JACOBIAN_TMP_VAR */ = ((data->simulationInfo->realParameter[2] /* body.I[1,1] PARAM */)) * (jacobian->tmpVars[1] /* body.z_a.$pDERLSJac3.dummyVarLSJac3[1] JACOBIAN_TMP_VAR */) + ((data->simulationInfo->realParameter[3] /* body.I[1,2] PARAM */)) * (jacobian->tmpVars[0] /* body.z_a.$pDERLSJac3.dummyVarLSJac3[2] JACOBIAN_TMP_VAR */) + ((data->simulationInfo->realParameter[4] /* body.I[1,3] PARAM */)) * (jacobian->tmpVars[4] /* body.z_a.$pDERLSJac3.dummyVarLSJac3[3] JACOBIAN_TMP_VAR */) + ((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)) * (jacobian->tmpVars[3] /* body.frame_a.f.$pDERLSJac3.dummyVarLSJac3[3] JACOBIAN_TMP_VAR */) - (((data->simulationInfo->realParameter[49] /* body.r_CM[3] PARAM */)) * (jacobian->tmpVars[7] /* body.frame_a.f.$pDERLSJac3.dummyVarLSJac3[2] JACOBIAN_TMP_VAR */));
  TRACE_POP
}

/*
equation index: 784
type: SIMPLE_ASSIGN
body.frame_a.t.$pDERLSJac3.dummyVarLSJac3[3] = body.I[3,1] * body.z_a.$pDERLSJac3.dummyVarLSJac3[1] + body.I[3,2] * body.z_a.$pDERLSJac3.dummyVarLSJac3[2] + body.I[3,3] * body.z_a.$pDERLSJac3.dummyVarLSJac3[3] + body.r_CM[1] * body.frame_a.f.$pDERLSJac3.dummyVarLSJac3[2] - body.r_CM[2] * body.frame_a.f.$pDERLSJac3.dummyVarLSJac3[1]
*/
void inerter_test3_eqFunction_784(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 9;
  const int equationIndexes[2] = {1,784};
  jacobian->tmpVars[9] /* body.frame_a.t.$pDERLSJac3.dummyVarLSJac3[3] JACOBIAN_TMP_VAR */ = ((data->simulationInfo->realParameter[8] /* body.I[3,1] PARAM */)) * (jacobian->tmpVars[1] /* body.z_a.$pDERLSJac3.dummyVarLSJac3[1] JACOBIAN_TMP_VAR */) + ((data->simulationInfo->realParameter[9] /* body.I[3,2] PARAM */)) * (jacobian->tmpVars[0] /* body.z_a.$pDERLSJac3.dummyVarLSJac3[2] JACOBIAN_TMP_VAR */) + ((data->simulationInfo->realParameter[10] /* body.I[3,3] PARAM */)) * (jacobian->tmpVars[4] /* body.z_a.$pDERLSJac3.dummyVarLSJac3[3] JACOBIAN_TMP_VAR */) + ((data->simulationInfo->realParameter[47] /* body.r_CM[1] PARAM */)) * (jacobian->tmpVars[7] /* body.frame_a.f.$pDERLSJac3.dummyVarLSJac3[2] JACOBIAN_TMP_VAR */) - (((data->simulationInfo->realParameter[48] /* body.r_CM[2] PARAM */)) * (jacobian->tmpVars[5] /* body.frame_a.f.$pDERLSJac3.dummyVarLSJac3[1] JACOBIAN_TMP_VAR */));
  TRACE_POP
}

/*
equation index: 785
type: SIMPLE_ASSIGN
revolute.tau.$pDERLSJac3.dummyVarLSJac3 = body.frame_a.t.$pDERLSJac3.dummyVarLSJac3[2] * revolute.e[2] + body.frame_a.t.$pDERLSJac3.dummyVarLSJac3[3] * revolute.e[3] + body.frame_a.t.$pDERLSJac3.dummyVarLSJac3[1] * revolute.e[1]
*/
void inerter_test3_eqFunction_785(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 10;
  const int equationIndexes[2] = {1,785};
  jacobian->tmpVars[10] /* revolute.tau.$pDERLSJac3.dummyVarLSJac3 JACOBIAN_TMP_VAR */ = (jacobian->tmpVars[6] /* body.frame_a.t.$pDERLSJac3.dummyVarLSJac3[2] JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[222] /* revolute.e[2] PARAM */)) + (jacobian->tmpVars[9] /* body.frame_a.t.$pDERLSJac3.dummyVarLSJac3[3] JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[223] /* revolute.e[3] PARAM */)) + (jacobian->tmpVars[8] /* body.frame_a.t.$pDERLSJac3.dummyVarLSJac3[1] JACOBIAN_TMP_VAR */) * ((data->simulationInfo->realParameter[221] /* revolute.e[1] PARAM */));
  TRACE_POP
}

/*
equation index: 786
type: SIMPLE_ASSIGN
prismatic.f.$pDERLSJac3.dummyVarLSJac3 = (-idealGearR2T.ratio) * revolute.tau.$pDERLSJac3.dummyVarLSJac3
*/
void inerter_test3_eqFunction_786(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 11;
  const int equationIndexes[2] = {1,786};
  jacobian->tmpVars[12] /* prismatic.f.$pDERLSJac3.dummyVarLSJac3 JACOBIAN_TMP_VAR */ = ((-(data->simulationInfo->realParameter[191] /* idealGearR2T.ratio PARAM */))) * (jacobian->tmpVars[10] /* revolute.tau.$pDERLSJac3.dummyVarLSJac3 JACOBIAN_TMP_VAR */);
  TRACE_POP
}

/*
equation index: 787
type: SIMPLE_ASSIGN
$res_LSJac3_1.$pDERLSJac3.dummyVarLSJac3 = force.frame_b.R.T[2,3] * body.frame_a.f.$pDERLSJac3.dummyVarLSJac3[2] + force.frame_b.R.T[1,3] * body.frame_a.f.$pDERLSJac3.dummyVarLSJac3[1] + force.frame_b.R.T[3,3] * body.frame_a.f.$pDERLSJac3.dummyVarLSJac3[3] - prismatic.f.$pDERLSJac3.dummyVarLSJac3
*/
void inerter_test3_eqFunction_787(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 12;
  const int equationIndexes[2] = {1,787};
  jacobian->resultVars[0] /* $res_LSJac3_1.$pDERLSJac3.dummyVarLSJac3 JACOBIAN_VAR */ = ((data->localData[0]->realVars[212] /* force.frame_b.R.T[2,3] variable */)) * (jacobian->tmpVars[7] /* body.frame_a.f.$pDERLSJac3.dummyVarLSJac3[2] JACOBIAN_TMP_VAR */) + ((data->localData[0]->realVars[209] /* force.frame_b.R.T[1,3] variable */)) * (jacobian->tmpVars[5] /* body.frame_a.f.$pDERLSJac3.dummyVarLSJac3[1] JACOBIAN_TMP_VAR */) + ((data->localData[0]->realVars[215] /* force.frame_b.R.T[3,3] variable */)) * (jacobian->tmpVars[3] /* body.frame_a.f.$pDERLSJac3.dummyVarLSJac3[3] JACOBIAN_TMP_VAR */) - jacobian->tmpVars[12] /* prismatic.f.$pDERLSJac3.dummyVarLSJac3 JACOBIAN_TMP_VAR */;
  TRACE_POP
}

OMC_DISABLE_OPT
int inerter_test3_functionJacLSJac3_constantEqns(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = inerter_test3_INDEX_JAC_LSJac3;
  
  TRACE_POP
  return 0;
}

int inerter_test3_functionJacLSJac3_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = inerter_test3_INDEX_JAC_LSJac3;
  inerter_test3_eqFunction_775(data, threadData, jacobian, parentJacobian);
  inerter_test3_eqFunction_776(data, threadData, jacobian, parentJacobian);
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
int inerter_test3_initialAnalyticJacobianLSJac2(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  size_t count;

  FILE* pFile = openSparsePatternFile(data, threadData, "inerter_test3_JacLSJac2.bin");
  
  initAnalyticJacobian(jacobian, 3, 3, 21, NULL, jacobian->sparsePattern);
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
int inerter_test3_initialAnalyticJacobianLSJac3(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  size_t count;

  FILE* pFile = openSparsePatternFile(data, threadData, "inerter_test3_JacLSJac3.bin");
  
  initAnalyticJacobian(jacobian, 1, 1, 17, NULL, jacobian->sparsePattern);
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



