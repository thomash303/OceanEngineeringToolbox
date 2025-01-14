/* Jacobians 11 */
#include "OET.Example.multibodyWECSingleDoF_model.h"
#include "OET.Example.multibodyWECSingleDoF_12jac.h"
#include "simulation/jacobian_util.h"
#include "util/omc_file.h"
/* constant equations */
/* dynamic equations */

/*
equation index: 3136
type: SIMPLE_ASSIGN
spar.body.body.z_a.$pDERLSJac1.dummyVarLSJac1[2] = (((-spar.body.body.I[3,1]) - spar.body.body.Ainf22[3,1]) * spar.body.body.z_a.SeedLSJac1[1] - (spar.body.body.I[3,3] + spar.body.body.Ainf22[3,3]) * spar.body.body.z_a.SeedLSJac1[3] - spar.body.body.Ainf21[3,1] * spar.body.body.a.SeedLSJac1[1] - spar.body.body.Ainf21[3,2] * spar.body.body.a.SeedLSJac1[2] - spar.body.body.Ainf21[3,3] * spar.body.body.a.SeedLSJac1[3]) / (spar.body.body.I[3,2] + spar.body.body.Ainf22[3,2])
*/
void OET_Example_multibodyWECSingleDoF_eqFunction_3136(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 0;
  const int equationIndexes[2] = {1,3136};
  jacobian->tmpVars[0] /* spar.body.body.z_a.$pDERLSJac1.dummyVarLSJac1[2] JACOBIAN_TMP_VAR */ = DIVISION(((-(data->simulationInfo->realParameter[42987] /* spar.body.body.I[3,1] PARAM */)) - (data->simulationInfo->realParameter[42978] /* spar.body.body.Ainf22[3,1] PARAM */)) * (jacobian->seedVars[4] /* spar.body.body.z_a.SeedLSJac1[1] SEED_VAR */) - (((data->simulationInfo->realParameter[42989] /* spar.body.body.I[3,3] PARAM */) + (data->simulationInfo->realParameter[42980] /* spar.body.body.Ainf22[3,3] PARAM */)) * (jacobian->seedVars[1] /* spar.body.body.z_a.SeedLSJac1[3] SEED_VAR */)) - (((data->simulationInfo->realParameter[42969] /* spar.body.body.Ainf21[3,1] PARAM */)) * (jacobian->seedVars[0] /* spar.body.body.a.SeedLSJac1[1] SEED_VAR */)) - (((data->simulationInfo->realParameter[42970] /* spar.body.body.Ainf21[3,2] PARAM */)) * (jacobian->seedVars[2] /* spar.body.body.a.SeedLSJac1[2] SEED_VAR */)) - (((data->simulationInfo->realParameter[42971] /* spar.body.body.Ainf21[3,3] PARAM */)) * (jacobian->seedVars[3] /* spar.body.body.a.SeedLSJac1[3] SEED_VAR */)),(data->simulationInfo->realParameter[42988] /* spar.body.body.I[3,2] PARAM */) + (data->simulationInfo->realParameter[42979] /* spar.body.body.Ainf22[3,2] PARAM */),"spar.body.body.I[3,2] + spar.body.body.Ainf22[3,2]");
  TRACE_POP
}

/*
equation index: 3137
type: SIMPLE_ASSIGN
$res_LSJac1_1.$pDERLSJac1.dummyVarLSJac1 = (spar.body.body.m[1,1] + spar.body.body.Ainf11[1,1]) * spar.body.body.a.SeedLSJac1[1] + (spar.body.body.m[1,2] + spar.body.body.Ainf11[1,2]) * spar.body.body.a.SeedLSJac1[2] + (spar.body.body.m[1,3] + spar.body.body.Ainf11[1,3]) * spar.body.body.a.SeedLSJac1[3] + spar.body.body.Ainf12[1,1] * spar.body.body.z_a.SeedLSJac1[1] + spar.body.body.Ainf12[1,2] * spar.body.body.z_a.$pDERLSJac1.dummyVarLSJac1[2] + spar.body.body.Ainf12[1,3] * spar.body.body.z_a.SeedLSJac1[3]
*/
void OET_Example_multibodyWECSingleDoF_eqFunction_3137(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 1;
  const int equationIndexes[2] = {1,3137};
  jacobian->resultVars[0] /* $res_LSJac1_1.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_VAR */ = ((data->simulationInfo->realParameter[43017] /* spar.body.body.m[1,1] PARAM */) + (data->simulationInfo->realParameter[42945] /* spar.body.body.Ainf11[1,1] PARAM */)) * (jacobian->seedVars[0] /* spar.body.body.a.SeedLSJac1[1] SEED_VAR */) + ((data->simulationInfo->realParameter[43018] /* spar.body.body.m[1,2] PARAM */) + (data->simulationInfo->realParameter[42946] /* spar.body.body.Ainf11[1,2] PARAM */)) * (jacobian->seedVars[2] /* spar.body.body.a.SeedLSJac1[2] SEED_VAR */) + ((data->simulationInfo->realParameter[43019] /* spar.body.body.m[1,3] PARAM */) + (data->simulationInfo->realParameter[42947] /* spar.body.body.Ainf11[1,3] PARAM */)) * (jacobian->seedVars[3] /* spar.body.body.a.SeedLSJac1[3] SEED_VAR */) + ((data->simulationInfo->realParameter[42954] /* spar.body.body.Ainf12[1,1] PARAM */)) * (jacobian->seedVars[4] /* spar.body.body.z_a.SeedLSJac1[1] SEED_VAR */) + ((data->simulationInfo->realParameter[42955] /* spar.body.body.Ainf12[1,2] PARAM */)) * (jacobian->tmpVars[0] /* spar.body.body.z_a.$pDERLSJac1.dummyVarLSJac1[2] JACOBIAN_TMP_VAR */) + ((data->simulationInfo->realParameter[42956] /* spar.body.body.Ainf12[1,3] PARAM */)) * (jacobian->seedVars[1] /* spar.body.body.z_a.SeedLSJac1[3] SEED_VAR */);
  TRACE_POP
}

/*
equation index: 3138
type: SIMPLE_ASSIGN
$res_LSJac1_2.$pDERLSJac1.dummyVarLSJac1 = (spar.body.body.m[2,1] + spar.body.body.Ainf11[2,1]) * spar.body.body.a.SeedLSJac1[1] + (spar.body.body.m[2,2] + spar.body.body.Ainf11[2,2]) * spar.body.body.a.SeedLSJac1[2] + (spar.body.body.m[2,3] + spar.body.body.Ainf11[2,3]) * spar.body.body.a.SeedLSJac1[3] + spar.body.body.Ainf12[2,1] * spar.body.body.z_a.SeedLSJac1[1] + spar.body.body.Ainf12[2,2] * spar.body.body.z_a.$pDERLSJac1.dummyVarLSJac1[2] + spar.body.body.Ainf12[2,3] * spar.body.body.z_a.SeedLSJac1[3]
*/
void OET_Example_multibodyWECSingleDoF_eqFunction_3138(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 2;
  const int equationIndexes[2] = {1,3138};
  jacobian->resultVars[1] /* $res_LSJac1_2.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_VAR */ = ((data->simulationInfo->realParameter[43020] /* spar.body.body.m[2,1] PARAM */) + (data->simulationInfo->realParameter[42948] /* spar.body.body.Ainf11[2,1] PARAM */)) * (jacobian->seedVars[0] /* spar.body.body.a.SeedLSJac1[1] SEED_VAR */) + ((data->simulationInfo->realParameter[43021] /* spar.body.body.m[2,2] PARAM */) + (data->simulationInfo->realParameter[42949] /* spar.body.body.Ainf11[2,2] PARAM */)) * (jacobian->seedVars[2] /* spar.body.body.a.SeedLSJac1[2] SEED_VAR */) + ((data->simulationInfo->realParameter[43022] /* spar.body.body.m[2,3] PARAM */) + (data->simulationInfo->realParameter[42950] /* spar.body.body.Ainf11[2,3] PARAM */)) * (jacobian->seedVars[3] /* spar.body.body.a.SeedLSJac1[3] SEED_VAR */) + ((data->simulationInfo->realParameter[42957] /* spar.body.body.Ainf12[2,1] PARAM */)) * (jacobian->seedVars[4] /* spar.body.body.z_a.SeedLSJac1[1] SEED_VAR */) + ((data->simulationInfo->realParameter[42958] /* spar.body.body.Ainf12[2,2] PARAM */)) * (jacobian->tmpVars[0] /* spar.body.body.z_a.$pDERLSJac1.dummyVarLSJac1[2] JACOBIAN_TMP_VAR */) + ((data->simulationInfo->realParameter[42959] /* spar.body.body.Ainf12[2,3] PARAM */)) * (jacobian->seedVars[1] /* spar.body.body.z_a.SeedLSJac1[3] SEED_VAR */);
  TRACE_POP
}

/*
equation index: 3139
type: SIMPLE_ASSIGN
$res_LSJac1_3.$pDERLSJac1.dummyVarLSJac1 = (spar.body.body.m[3,1] + spar.body.body.Ainf11[3,1]) * spar.body.body.a.SeedLSJac1[1] + (spar.body.body.m[3,2] + spar.body.body.Ainf11[3,2]) * spar.body.body.a.SeedLSJac1[2] + (spar.body.body.m[3,3] + spar.body.body.Ainf11[3,3]) * spar.body.body.a.SeedLSJac1[3] + spar.body.body.Ainf12[3,1] * spar.body.body.z_a.SeedLSJac1[1] + spar.body.body.Ainf12[3,2] * spar.body.body.z_a.$pDERLSJac1.dummyVarLSJac1[2] + spar.body.body.Ainf12[3,3] * spar.body.body.z_a.SeedLSJac1[3]
*/
void OET_Example_multibodyWECSingleDoF_eqFunction_3139(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 3;
  const int equationIndexes[2] = {1,3139};
  jacobian->resultVars[2] /* $res_LSJac1_3.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_VAR */ = ((data->simulationInfo->realParameter[43023] /* spar.body.body.m[3,1] PARAM */) + (data->simulationInfo->realParameter[42951] /* spar.body.body.Ainf11[3,1] PARAM */)) * (jacobian->seedVars[0] /* spar.body.body.a.SeedLSJac1[1] SEED_VAR */) + ((data->simulationInfo->realParameter[43024] /* spar.body.body.m[3,2] PARAM */) + (data->simulationInfo->realParameter[42952] /* spar.body.body.Ainf11[3,2] PARAM */)) * (jacobian->seedVars[2] /* spar.body.body.a.SeedLSJac1[2] SEED_VAR */) + ((data->simulationInfo->realParameter[43025] /* spar.body.body.m[3,3] PARAM */) + (data->simulationInfo->realParameter[42953] /* spar.body.body.Ainf11[3,3] PARAM */)) * (jacobian->seedVars[3] /* spar.body.body.a.SeedLSJac1[3] SEED_VAR */) + ((data->simulationInfo->realParameter[42960] /* spar.body.body.Ainf12[3,1] PARAM */)) * (jacobian->seedVars[4] /* spar.body.body.z_a.SeedLSJac1[1] SEED_VAR */) + ((data->simulationInfo->realParameter[42961] /* spar.body.body.Ainf12[3,2] PARAM */)) * (jacobian->tmpVars[0] /* spar.body.body.z_a.$pDERLSJac1.dummyVarLSJac1[2] JACOBIAN_TMP_VAR */) + ((data->simulationInfo->realParameter[42962] /* spar.body.body.Ainf12[3,3] PARAM */)) * (jacobian->seedVars[1] /* spar.body.body.z_a.SeedLSJac1[3] SEED_VAR */);
  TRACE_POP
}

/*
equation index: 3140
type: SIMPLE_ASSIGN
$res_LSJac1_4.$pDERLSJac1.dummyVarLSJac1 = (spar.body.body.I[1,1] + spar.body.body.Ainf22[1,1]) * spar.body.body.z_a.SeedLSJac1[1] + (spar.body.body.I[1,2] + spar.body.body.Ainf22[1,2]) * spar.body.body.z_a.$pDERLSJac1.dummyVarLSJac1[2] + (spar.body.body.I[1,3] + spar.body.body.Ainf22[1,3]) * spar.body.body.z_a.SeedLSJac1[3] + spar.body.body.Ainf21[1,1] * spar.body.body.a.SeedLSJac1[1] + spar.body.body.Ainf21[1,2] * spar.body.body.a.SeedLSJac1[2] + spar.body.body.Ainf21[1,3] * spar.body.body.a.SeedLSJac1[3]
*/
void OET_Example_multibodyWECSingleDoF_eqFunction_3140(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 4;
  const int equationIndexes[2] = {1,3140};
  jacobian->resultVars[3] /* $res_LSJac1_4.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_VAR */ = ((data->simulationInfo->realParameter[42981] /* spar.body.body.I[1,1] PARAM */) + (data->simulationInfo->realParameter[42972] /* spar.body.body.Ainf22[1,1] PARAM */)) * (jacobian->seedVars[4] /* spar.body.body.z_a.SeedLSJac1[1] SEED_VAR */) + ((data->simulationInfo->realParameter[42982] /* spar.body.body.I[1,2] PARAM */) + (data->simulationInfo->realParameter[42973] /* spar.body.body.Ainf22[1,2] PARAM */)) * (jacobian->tmpVars[0] /* spar.body.body.z_a.$pDERLSJac1.dummyVarLSJac1[2] JACOBIAN_TMP_VAR */) + ((data->simulationInfo->realParameter[42983] /* spar.body.body.I[1,3] PARAM */) + (data->simulationInfo->realParameter[42974] /* spar.body.body.Ainf22[1,3] PARAM */)) * (jacobian->seedVars[1] /* spar.body.body.z_a.SeedLSJac1[3] SEED_VAR */) + ((data->simulationInfo->realParameter[42963] /* spar.body.body.Ainf21[1,1] PARAM */)) * (jacobian->seedVars[0] /* spar.body.body.a.SeedLSJac1[1] SEED_VAR */) + ((data->simulationInfo->realParameter[42964] /* spar.body.body.Ainf21[1,2] PARAM */)) * (jacobian->seedVars[2] /* spar.body.body.a.SeedLSJac1[2] SEED_VAR */) + ((data->simulationInfo->realParameter[42965] /* spar.body.body.Ainf21[1,3] PARAM */)) * (jacobian->seedVars[3] /* spar.body.body.a.SeedLSJac1[3] SEED_VAR */);
  TRACE_POP
}

/*
equation index: 3141
type: SIMPLE_ASSIGN
$res_LSJac1_5.$pDERLSJac1.dummyVarLSJac1 = (spar.body.body.I[2,1] + spar.body.body.Ainf22[2,1]) * spar.body.body.z_a.SeedLSJac1[1] + (spar.body.body.I[2,2] + spar.body.body.Ainf22[2,2]) * spar.body.body.z_a.$pDERLSJac1.dummyVarLSJac1[2] + (spar.body.body.I[2,3] + spar.body.body.Ainf22[2,3]) * spar.body.body.z_a.SeedLSJac1[3] + spar.body.body.Ainf21[2,1] * spar.body.body.a.SeedLSJac1[1] + spar.body.body.Ainf21[2,2] * spar.body.body.a.SeedLSJac1[2] + spar.body.body.Ainf21[2,3] * spar.body.body.a.SeedLSJac1[3]
*/
void OET_Example_multibodyWECSingleDoF_eqFunction_3141(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 5;
  const int equationIndexes[2] = {1,3141};
  jacobian->resultVars[4] /* $res_LSJac1_5.$pDERLSJac1.dummyVarLSJac1 JACOBIAN_VAR */ = ((data->simulationInfo->realParameter[42984] /* spar.body.body.I[2,1] PARAM */) + (data->simulationInfo->realParameter[42975] /* spar.body.body.Ainf22[2,1] PARAM */)) * (jacobian->seedVars[4] /* spar.body.body.z_a.SeedLSJac1[1] SEED_VAR */) + ((data->simulationInfo->realParameter[42985] /* spar.body.body.I[2,2] PARAM */) + (data->simulationInfo->realParameter[42976] /* spar.body.body.Ainf22[2,2] PARAM */)) * (jacobian->tmpVars[0] /* spar.body.body.z_a.$pDERLSJac1.dummyVarLSJac1[2] JACOBIAN_TMP_VAR */) + ((data->simulationInfo->realParameter[42986] /* spar.body.body.I[2,3] PARAM */) + (data->simulationInfo->realParameter[42977] /* spar.body.body.Ainf22[2,3] PARAM */)) * (jacobian->seedVars[1] /* spar.body.body.z_a.SeedLSJac1[3] SEED_VAR */) + ((data->simulationInfo->realParameter[42966] /* spar.body.body.Ainf21[2,1] PARAM */)) * (jacobian->seedVars[0] /* spar.body.body.a.SeedLSJac1[1] SEED_VAR */) + ((data->simulationInfo->realParameter[42967] /* spar.body.body.Ainf21[2,2] PARAM */)) * (jacobian->seedVars[2] /* spar.body.body.a.SeedLSJac1[2] SEED_VAR */) + ((data->simulationInfo->realParameter[42968] /* spar.body.body.Ainf21[2,3] PARAM */)) * (jacobian->seedVars[3] /* spar.body.body.a.SeedLSJac1[3] SEED_VAR */);
  TRACE_POP
}

OMC_DISABLE_OPT
int OET_Example_multibodyWECSingleDoF_functionJacLSJac1_constantEqns(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = OET_Example_multibodyWECSingleDoF_INDEX_JAC_LSJac1;
  
  TRACE_POP
  return 0;
}

int OET_Example_multibodyWECSingleDoF_functionJacLSJac1_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = OET_Example_multibodyWECSingleDoF_INDEX_JAC_LSJac1;
  OET_Example_multibodyWECSingleDoF_eqFunction_3136(data, threadData, jacobian, parentJacobian);
  OET_Example_multibodyWECSingleDoF_eqFunction_3137(data, threadData, jacobian, parentJacobian);
  OET_Example_multibodyWECSingleDoF_eqFunction_3138(data, threadData, jacobian, parentJacobian);
  OET_Example_multibodyWECSingleDoF_eqFunction_3139(data, threadData, jacobian, parentJacobian);
  OET_Example_multibodyWECSingleDoF_eqFunction_3140(data, threadData, jacobian, parentJacobian);
  OET_Example_multibodyWECSingleDoF_eqFunction_3141(data, threadData, jacobian, parentJacobian);
  TRACE_POP
  return 0;
}
/* constant equations */
/* dynamic equations */

/*
equation index: 3185
type: SIMPLE_ASSIGN
$res_NLSJac2_1.$pDERNLSJac2.dummyVarNLSJac2 = 2.0 * (spar.body.body.Q[1] * spar.body.body.Q.SeedNLSJac2[1] + spar.body.body.Q[2] * spar.body.body.Q.SeedNLSJac2[2] + spar.body.body.Q[3] * spar.body.body.Q.SeedNLSJac2[3] + spar.body.body.Q[4] * spar.body.body.Q.SeedNLSJac2[4])
*/
void OET_Example_multibodyWECSingleDoF_eqFunction_3185(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 0;
  const int equationIndexes[2] = {1,3185};
  jacobian->resultVars[0] /* $res_NLSJac2_1.$pDERNLSJac2.dummyVarNLSJac2 JACOBIAN_VAR */ = (2.0) * (((data->localData[0]->realVars[2729] /* spar.body.body.Q[1] DUMMY_STATE */)) * (jacobian->seedVars[2] /* spar.body.body.Q.SeedNLSJac2[1] SEED_VAR */) + ((data->localData[0]->realVars[2730] /* spar.body.body.Q[2] DUMMY_STATE */)) * (jacobian->seedVars[3] /* spar.body.body.Q.SeedNLSJac2[2] SEED_VAR */) + ((data->localData[0]->realVars[2731] /* spar.body.body.Q[3] DUMMY_STATE */)) * (jacobian->seedVars[0] /* spar.body.body.Q.SeedNLSJac2[3] SEED_VAR */) + ((data->localData[0]->realVars[2732] /* spar.body.body.Q[4] DUMMY_STATE */)) * (jacobian->seedVars[1] /* spar.body.body.Q.SeedNLSJac2[4] SEED_VAR */));
  TRACE_POP
}

/*
equation index: 3186
type: SIMPLE_ASSIGN
$res_NLSJac2_2.$pDERNLSJac2.dummyVarNLSJac2 = (*Real*)($STATESET1.A[3,1]) * spar.body.body.Q.SeedNLSJac2[4] + (*Real*)($STATESET1.A[3,2]) * spar.body.body.Q.SeedNLSJac2[3] + (*Real*)($STATESET1.A[3,3]) * spar.body.body.Q.SeedNLSJac2[2] + (*Real*)($STATESET1.A[3,4]) * spar.body.body.Q.SeedNLSJac2[1]
*/
void OET_Example_multibodyWECSingleDoF_eqFunction_3186(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 1;
  const int equationIndexes[2] = {1,3186};
  jacobian->resultVars[1] /* $res_NLSJac2_2.$pDERNLSJac2.dummyVarNLSJac2 JACOBIAN_VAR */ = (((modelica_real)(data->localData[0]->integerVars[8] /* $STATESET1.A[3,1] variable */))) * (jacobian->seedVars[1] /* spar.body.body.Q.SeedNLSJac2[4] SEED_VAR */) + (((modelica_real)(data->localData[0]->integerVars[9] /* $STATESET1.A[3,2] variable */))) * (jacobian->seedVars[0] /* spar.body.body.Q.SeedNLSJac2[3] SEED_VAR */) + (((modelica_real)(data->localData[0]->integerVars[10] /* $STATESET1.A[3,3] variable */))) * (jacobian->seedVars[3] /* spar.body.body.Q.SeedNLSJac2[2] SEED_VAR */) + (((modelica_real)(data->localData[0]->integerVars[11] /* $STATESET1.A[3,4] variable */))) * (jacobian->seedVars[2] /* spar.body.body.Q.SeedNLSJac2[1] SEED_VAR */);
  TRACE_POP
}

/*
equation index: 3187
type: SIMPLE_ASSIGN
$res_NLSJac2_3.$pDERNLSJac2.dummyVarNLSJac2 = (*Real*)($STATESET1.A[2,1]) * spar.body.body.Q.SeedNLSJac2[4] + (*Real*)($STATESET1.A[2,2]) * spar.body.body.Q.SeedNLSJac2[3] + (*Real*)($STATESET1.A[2,3]) * spar.body.body.Q.SeedNLSJac2[2] + (*Real*)($STATESET1.A[2,4]) * spar.body.body.Q.SeedNLSJac2[1]
*/
void OET_Example_multibodyWECSingleDoF_eqFunction_3187(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 2;
  const int equationIndexes[2] = {1,3187};
  jacobian->resultVars[2] /* $res_NLSJac2_3.$pDERNLSJac2.dummyVarNLSJac2 JACOBIAN_VAR */ = (((modelica_real)(data->localData[0]->integerVars[4] /* $STATESET1.A[2,1] variable */))) * (jacobian->seedVars[1] /* spar.body.body.Q.SeedNLSJac2[4] SEED_VAR */) + (((modelica_real)(data->localData[0]->integerVars[5] /* $STATESET1.A[2,2] variable */))) * (jacobian->seedVars[0] /* spar.body.body.Q.SeedNLSJac2[3] SEED_VAR */) + (((modelica_real)(data->localData[0]->integerVars[6] /* $STATESET1.A[2,3] variable */))) * (jacobian->seedVars[3] /* spar.body.body.Q.SeedNLSJac2[2] SEED_VAR */) + (((modelica_real)(data->localData[0]->integerVars[7] /* $STATESET1.A[2,4] variable */))) * (jacobian->seedVars[2] /* spar.body.body.Q.SeedNLSJac2[1] SEED_VAR */);
  TRACE_POP
}

/*
equation index: 3188
type: SIMPLE_ASSIGN
$res_NLSJac2_4.$pDERNLSJac2.dummyVarNLSJac2 = (*Real*)($STATESET1.A[1,1]) * spar.body.body.Q.SeedNLSJac2[4] + (*Real*)($STATESET1.A[1,2]) * spar.body.body.Q.SeedNLSJac2[3] + (*Real*)($STATESET1.A[1,3]) * spar.body.body.Q.SeedNLSJac2[2] + (*Real*)($STATESET1.A[1,4]) * spar.body.body.Q.SeedNLSJac2[1]
*/
void OET_Example_multibodyWECSingleDoF_eqFunction_3188(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 3;
  const int equationIndexes[2] = {1,3188};
  jacobian->resultVars[3] /* $res_NLSJac2_4.$pDERNLSJac2.dummyVarNLSJac2 JACOBIAN_VAR */ = (((modelica_real)(data->localData[0]->integerVars[0] /* $STATESET1.A[1,1] variable */))) * (jacobian->seedVars[1] /* spar.body.body.Q.SeedNLSJac2[4] SEED_VAR */) + (((modelica_real)(data->localData[0]->integerVars[1] /* $STATESET1.A[1,2] variable */))) * (jacobian->seedVars[0] /* spar.body.body.Q.SeedNLSJac2[3] SEED_VAR */) + (((modelica_real)(data->localData[0]->integerVars[2] /* $STATESET1.A[1,3] variable */))) * (jacobian->seedVars[3] /* spar.body.body.Q.SeedNLSJac2[2] SEED_VAR */) + (((modelica_real)(data->localData[0]->integerVars[3] /* $STATESET1.A[1,4] variable */))) * (jacobian->seedVars[2] /* spar.body.body.Q.SeedNLSJac2[1] SEED_VAR */);
  TRACE_POP
}

OMC_DISABLE_OPT
int OET_Example_multibodyWECSingleDoF_functionJacNLSJac2_constantEqns(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = OET_Example_multibodyWECSingleDoF_INDEX_JAC_NLSJac2;
  
  TRACE_POP
  return 0;
}

int OET_Example_multibodyWECSingleDoF_functionJacNLSJac2_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = OET_Example_multibodyWECSingleDoF_INDEX_JAC_NLSJac2;
  OET_Example_multibodyWECSingleDoF_eqFunction_3185(data, threadData, jacobian, parentJacobian);
  OET_Example_multibodyWECSingleDoF_eqFunction_3186(data, threadData, jacobian, parentJacobian);
  OET_Example_multibodyWECSingleDoF_eqFunction_3187(data, threadData, jacobian, parentJacobian);
  OET_Example_multibodyWECSingleDoF_eqFunction_3188(data, threadData, jacobian, parentJacobian);
  TRACE_POP
  return 0;
}
/* constant equations */
/* dynamic equations */

/*
equation index: 3666
type: SIMPLE_ASSIGN
spar.body.body.z_a.$pDERLSJac3.dummyVarLSJac3[2] = (((-spar.body.body.I[3,1]) - spar.body.body.Ainf22[3,1]) * spar.body.body.z_a.SeedLSJac3[1] - (spar.body.body.I[3,3] + spar.body.body.Ainf22[3,3]) * spar.body.body.z_a.SeedLSJac3[3] - spar.body.body.Ainf21[3,1] * spar.body.body.a.SeedLSJac3[1] - spar.body.body.Ainf21[3,2] * spar.body.body.a.SeedLSJac3[2] - spar.body.body.Ainf21[3,3] * spar.body.body.a.SeedLSJac3[3]) / (spar.body.body.I[3,2] + spar.body.body.Ainf22[3,2])
*/
void OET_Example_multibodyWECSingleDoF_eqFunction_3666(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 0;
  const int equationIndexes[2] = {1,3666};
  jacobian->tmpVars[0] /* spar.body.body.z_a.$pDERLSJac3.dummyVarLSJac3[2] JACOBIAN_TMP_VAR */ = DIVISION(((-(data->simulationInfo->realParameter[42987] /* spar.body.body.I[3,1] PARAM */)) - (data->simulationInfo->realParameter[42978] /* spar.body.body.Ainf22[3,1] PARAM */)) * (jacobian->seedVars[4] /* spar.body.body.z_a.SeedLSJac3[1] SEED_VAR */) - (((data->simulationInfo->realParameter[42989] /* spar.body.body.I[3,3] PARAM */) + (data->simulationInfo->realParameter[42980] /* spar.body.body.Ainf22[3,3] PARAM */)) * (jacobian->seedVars[1] /* spar.body.body.z_a.SeedLSJac3[3] SEED_VAR */)) - (((data->simulationInfo->realParameter[42969] /* spar.body.body.Ainf21[3,1] PARAM */)) * (jacobian->seedVars[0] /* spar.body.body.a.SeedLSJac3[1] SEED_VAR */)) - (((data->simulationInfo->realParameter[42970] /* spar.body.body.Ainf21[3,2] PARAM */)) * (jacobian->seedVars[3] /* spar.body.body.a.SeedLSJac3[2] SEED_VAR */)) - (((data->simulationInfo->realParameter[42971] /* spar.body.body.Ainf21[3,3] PARAM */)) * (jacobian->seedVars[2] /* spar.body.body.a.SeedLSJac3[3] SEED_VAR */)),(data->simulationInfo->realParameter[42988] /* spar.body.body.I[3,2] PARAM */) + (data->simulationInfo->realParameter[42979] /* spar.body.body.Ainf22[3,2] PARAM */),"spar.body.body.I[3,2] + spar.body.body.Ainf22[3,2]");
  TRACE_POP
}

/*
equation index: 3667
type: SIMPLE_ASSIGN
$res_LSJac3_1.$pDERLSJac3.dummyVarLSJac3 = (spar.body.body.m[1,1] + spar.body.body.Ainf11[1,1]) * spar.body.body.a.SeedLSJac3[1] + (spar.body.body.m[1,2] + spar.body.body.Ainf11[1,2]) * spar.body.body.a.SeedLSJac3[2] + (spar.body.body.m[1,3] + spar.body.body.Ainf11[1,3]) * spar.body.body.a.SeedLSJac3[3] + spar.body.body.Ainf12[1,1] * spar.body.body.z_a.SeedLSJac3[1] + spar.body.body.Ainf12[1,2] * spar.body.body.z_a.$pDERLSJac3.dummyVarLSJac3[2] + spar.body.body.Ainf12[1,3] * spar.body.body.z_a.SeedLSJac3[3]
*/
void OET_Example_multibodyWECSingleDoF_eqFunction_3667(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 1;
  const int equationIndexes[2] = {1,3667};
  jacobian->resultVars[0] /* $res_LSJac3_1.$pDERLSJac3.dummyVarLSJac3 JACOBIAN_VAR */ = ((data->simulationInfo->realParameter[43017] /* spar.body.body.m[1,1] PARAM */) + (data->simulationInfo->realParameter[42945] /* spar.body.body.Ainf11[1,1] PARAM */)) * (jacobian->seedVars[0] /* spar.body.body.a.SeedLSJac3[1] SEED_VAR */) + ((data->simulationInfo->realParameter[43018] /* spar.body.body.m[1,2] PARAM */) + (data->simulationInfo->realParameter[42946] /* spar.body.body.Ainf11[1,2] PARAM */)) * (jacobian->seedVars[3] /* spar.body.body.a.SeedLSJac3[2] SEED_VAR */) + ((data->simulationInfo->realParameter[43019] /* spar.body.body.m[1,3] PARAM */) + (data->simulationInfo->realParameter[42947] /* spar.body.body.Ainf11[1,3] PARAM */)) * (jacobian->seedVars[2] /* spar.body.body.a.SeedLSJac3[3] SEED_VAR */) + ((data->simulationInfo->realParameter[42954] /* spar.body.body.Ainf12[1,1] PARAM */)) * (jacobian->seedVars[4] /* spar.body.body.z_a.SeedLSJac3[1] SEED_VAR */) + ((data->simulationInfo->realParameter[42955] /* spar.body.body.Ainf12[1,2] PARAM */)) * (jacobian->tmpVars[0] /* spar.body.body.z_a.$pDERLSJac3.dummyVarLSJac3[2] JACOBIAN_TMP_VAR */) + ((data->simulationInfo->realParameter[42956] /* spar.body.body.Ainf12[1,3] PARAM */)) * (jacobian->seedVars[1] /* spar.body.body.z_a.SeedLSJac3[3] SEED_VAR */);
  TRACE_POP
}

/*
equation index: 3668
type: SIMPLE_ASSIGN
$res_LSJac3_2.$pDERLSJac3.dummyVarLSJac3 = (spar.body.body.m[2,1] + spar.body.body.Ainf11[2,1]) * spar.body.body.a.SeedLSJac3[1] + (spar.body.body.m[2,2] + spar.body.body.Ainf11[2,2]) * spar.body.body.a.SeedLSJac3[2] + (spar.body.body.m[2,3] + spar.body.body.Ainf11[2,3]) * spar.body.body.a.SeedLSJac3[3] + spar.body.body.Ainf12[2,1] * spar.body.body.z_a.SeedLSJac3[1] + spar.body.body.Ainf12[2,2] * spar.body.body.z_a.$pDERLSJac3.dummyVarLSJac3[2] + spar.body.body.Ainf12[2,3] * spar.body.body.z_a.SeedLSJac3[3]
*/
void OET_Example_multibodyWECSingleDoF_eqFunction_3668(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 2;
  const int equationIndexes[2] = {1,3668};
  jacobian->resultVars[1] /* $res_LSJac3_2.$pDERLSJac3.dummyVarLSJac3 JACOBIAN_VAR */ = ((data->simulationInfo->realParameter[43020] /* spar.body.body.m[2,1] PARAM */) + (data->simulationInfo->realParameter[42948] /* spar.body.body.Ainf11[2,1] PARAM */)) * (jacobian->seedVars[0] /* spar.body.body.a.SeedLSJac3[1] SEED_VAR */) + ((data->simulationInfo->realParameter[43021] /* spar.body.body.m[2,2] PARAM */) + (data->simulationInfo->realParameter[42949] /* spar.body.body.Ainf11[2,2] PARAM */)) * (jacobian->seedVars[3] /* spar.body.body.a.SeedLSJac3[2] SEED_VAR */) + ((data->simulationInfo->realParameter[43022] /* spar.body.body.m[2,3] PARAM */) + (data->simulationInfo->realParameter[42950] /* spar.body.body.Ainf11[2,3] PARAM */)) * (jacobian->seedVars[2] /* spar.body.body.a.SeedLSJac3[3] SEED_VAR */) + ((data->simulationInfo->realParameter[42957] /* spar.body.body.Ainf12[2,1] PARAM */)) * (jacobian->seedVars[4] /* spar.body.body.z_a.SeedLSJac3[1] SEED_VAR */) + ((data->simulationInfo->realParameter[42958] /* spar.body.body.Ainf12[2,2] PARAM */)) * (jacobian->tmpVars[0] /* spar.body.body.z_a.$pDERLSJac3.dummyVarLSJac3[2] JACOBIAN_TMP_VAR */) + ((data->simulationInfo->realParameter[42959] /* spar.body.body.Ainf12[2,3] PARAM */)) * (jacobian->seedVars[1] /* spar.body.body.z_a.SeedLSJac3[3] SEED_VAR */);
  TRACE_POP
}

/*
equation index: 3669
type: SIMPLE_ASSIGN
$res_LSJac3_3.$pDERLSJac3.dummyVarLSJac3 = (spar.body.body.m[3,1] + spar.body.body.Ainf11[3,1]) * spar.body.body.a.SeedLSJac3[1] + (spar.body.body.m[3,2] + spar.body.body.Ainf11[3,2]) * spar.body.body.a.SeedLSJac3[2] + (spar.body.body.m[3,3] + spar.body.body.Ainf11[3,3]) * spar.body.body.a.SeedLSJac3[3] + spar.body.body.Ainf12[3,1] * spar.body.body.z_a.SeedLSJac3[1] + spar.body.body.Ainf12[3,2] * spar.body.body.z_a.$pDERLSJac3.dummyVarLSJac3[2] + spar.body.body.Ainf12[3,3] * spar.body.body.z_a.SeedLSJac3[3]
*/
void OET_Example_multibodyWECSingleDoF_eqFunction_3669(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 3;
  const int equationIndexes[2] = {1,3669};
  jacobian->resultVars[2] /* $res_LSJac3_3.$pDERLSJac3.dummyVarLSJac3 JACOBIAN_VAR */ = ((data->simulationInfo->realParameter[43023] /* spar.body.body.m[3,1] PARAM */) + (data->simulationInfo->realParameter[42951] /* spar.body.body.Ainf11[3,1] PARAM */)) * (jacobian->seedVars[0] /* spar.body.body.a.SeedLSJac3[1] SEED_VAR */) + ((data->simulationInfo->realParameter[43024] /* spar.body.body.m[3,2] PARAM */) + (data->simulationInfo->realParameter[42952] /* spar.body.body.Ainf11[3,2] PARAM */)) * (jacobian->seedVars[3] /* spar.body.body.a.SeedLSJac3[2] SEED_VAR */) + ((data->simulationInfo->realParameter[43025] /* spar.body.body.m[3,3] PARAM */) + (data->simulationInfo->realParameter[42953] /* spar.body.body.Ainf11[3,3] PARAM */)) * (jacobian->seedVars[2] /* spar.body.body.a.SeedLSJac3[3] SEED_VAR */) + ((data->simulationInfo->realParameter[42960] /* spar.body.body.Ainf12[3,1] PARAM */)) * (jacobian->seedVars[4] /* spar.body.body.z_a.SeedLSJac3[1] SEED_VAR */) + ((data->simulationInfo->realParameter[42961] /* spar.body.body.Ainf12[3,2] PARAM */)) * (jacobian->tmpVars[0] /* spar.body.body.z_a.$pDERLSJac3.dummyVarLSJac3[2] JACOBIAN_TMP_VAR */) + ((data->simulationInfo->realParameter[42962] /* spar.body.body.Ainf12[3,3] PARAM */)) * (jacobian->seedVars[1] /* spar.body.body.z_a.SeedLSJac3[3] SEED_VAR */);
  TRACE_POP
}

/*
equation index: 3670
type: SIMPLE_ASSIGN
$res_LSJac3_4.$pDERLSJac3.dummyVarLSJac3 = (spar.body.body.I[1,1] + spar.body.body.Ainf22[1,1]) * spar.body.body.z_a.SeedLSJac3[1] + (spar.body.body.I[1,2] + spar.body.body.Ainf22[1,2]) * spar.body.body.z_a.$pDERLSJac3.dummyVarLSJac3[2] + (spar.body.body.I[1,3] + spar.body.body.Ainf22[1,3]) * spar.body.body.z_a.SeedLSJac3[3] + spar.body.body.Ainf21[1,1] * spar.body.body.a.SeedLSJac3[1] + spar.body.body.Ainf21[1,2] * spar.body.body.a.SeedLSJac3[2] + spar.body.body.Ainf21[1,3] * spar.body.body.a.SeedLSJac3[3]
*/
void OET_Example_multibodyWECSingleDoF_eqFunction_3670(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 4;
  const int equationIndexes[2] = {1,3670};
  jacobian->resultVars[3] /* $res_LSJac3_4.$pDERLSJac3.dummyVarLSJac3 JACOBIAN_VAR */ = ((data->simulationInfo->realParameter[42981] /* spar.body.body.I[1,1] PARAM */) + (data->simulationInfo->realParameter[42972] /* spar.body.body.Ainf22[1,1] PARAM */)) * (jacobian->seedVars[4] /* spar.body.body.z_a.SeedLSJac3[1] SEED_VAR */) + ((data->simulationInfo->realParameter[42982] /* spar.body.body.I[1,2] PARAM */) + (data->simulationInfo->realParameter[42973] /* spar.body.body.Ainf22[1,2] PARAM */)) * (jacobian->tmpVars[0] /* spar.body.body.z_a.$pDERLSJac3.dummyVarLSJac3[2] JACOBIAN_TMP_VAR */) + ((data->simulationInfo->realParameter[42983] /* spar.body.body.I[1,3] PARAM */) + (data->simulationInfo->realParameter[42974] /* spar.body.body.Ainf22[1,3] PARAM */)) * (jacobian->seedVars[1] /* spar.body.body.z_a.SeedLSJac3[3] SEED_VAR */) + ((data->simulationInfo->realParameter[42963] /* spar.body.body.Ainf21[1,1] PARAM */)) * (jacobian->seedVars[0] /* spar.body.body.a.SeedLSJac3[1] SEED_VAR */) + ((data->simulationInfo->realParameter[42964] /* spar.body.body.Ainf21[1,2] PARAM */)) * (jacobian->seedVars[3] /* spar.body.body.a.SeedLSJac3[2] SEED_VAR */) + ((data->simulationInfo->realParameter[42965] /* spar.body.body.Ainf21[1,3] PARAM */)) * (jacobian->seedVars[2] /* spar.body.body.a.SeedLSJac3[3] SEED_VAR */);
  TRACE_POP
}

/*
equation index: 3671
type: SIMPLE_ASSIGN
$res_LSJac3_5.$pDERLSJac3.dummyVarLSJac3 = (spar.body.body.I[2,1] + spar.body.body.Ainf22[2,1]) * spar.body.body.z_a.SeedLSJac3[1] + (spar.body.body.I[2,2] + spar.body.body.Ainf22[2,2]) * spar.body.body.z_a.$pDERLSJac3.dummyVarLSJac3[2] + (spar.body.body.I[2,3] + spar.body.body.Ainf22[2,3]) * spar.body.body.z_a.SeedLSJac3[3] + spar.body.body.Ainf21[2,1] * spar.body.body.a.SeedLSJac3[1] + spar.body.body.Ainf21[2,2] * spar.body.body.a.SeedLSJac3[2] + spar.body.body.Ainf21[2,3] * spar.body.body.a.SeedLSJac3[3]
*/
void OET_Example_multibodyWECSingleDoF_eqFunction_3671(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 5;
  const int equationIndexes[2] = {1,3671};
  jacobian->resultVars[4] /* $res_LSJac3_5.$pDERLSJac3.dummyVarLSJac3 JACOBIAN_VAR */ = ((data->simulationInfo->realParameter[42984] /* spar.body.body.I[2,1] PARAM */) + (data->simulationInfo->realParameter[42975] /* spar.body.body.Ainf22[2,1] PARAM */)) * (jacobian->seedVars[4] /* spar.body.body.z_a.SeedLSJac3[1] SEED_VAR */) + ((data->simulationInfo->realParameter[42985] /* spar.body.body.I[2,2] PARAM */) + (data->simulationInfo->realParameter[42976] /* spar.body.body.Ainf22[2,2] PARAM */)) * (jacobian->tmpVars[0] /* spar.body.body.z_a.$pDERLSJac3.dummyVarLSJac3[2] JACOBIAN_TMP_VAR */) + ((data->simulationInfo->realParameter[42986] /* spar.body.body.I[2,3] PARAM */) + (data->simulationInfo->realParameter[42977] /* spar.body.body.Ainf22[2,3] PARAM */)) * (jacobian->seedVars[1] /* spar.body.body.z_a.SeedLSJac3[3] SEED_VAR */) + ((data->simulationInfo->realParameter[42966] /* spar.body.body.Ainf21[2,1] PARAM */)) * (jacobian->seedVars[0] /* spar.body.body.a.SeedLSJac3[1] SEED_VAR */) + ((data->simulationInfo->realParameter[42967] /* spar.body.body.Ainf21[2,2] PARAM */)) * (jacobian->seedVars[3] /* spar.body.body.a.SeedLSJac3[2] SEED_VAR */) + ((data->simulationInfo->realParameter[42968] /* spar.body.body.Ainf21[2,3] PARAM */)) * (jacobian->seedVars[2] /* spar.body.body.a.SeedLSJac3[3] SEED_VAR */);
  TRACE_POP
}

OMC_DISABLE_OPT
int OET_Example_multibodyWECSingleDoF_functionJacLSJac3_constantEqns(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = OET_Example_multibodyWECSingleDoF_INDEX_JAC_LSJac3;
  
  TRACE_POP
  return 0;
}

int OET_Example_multibodyWECSingleDoF_functionJacLSJac3_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = OET_Example_multibodyWECSingleDoF_INDEX_JAC_LSJac3;
  OET_Example_multibodyWECSingleDoF_eqFunction_3666(data, threadData, jacobian, parentJacobian);
  OET_Example_multibodyWECSingleDoF_eqFunction_3667(data, threadData, jacobian, parentJacobian);
  OET_Example_multibodyWECSingleDoF_eqFunction_3668(data, threadData, jacobian, parentJacobian);
  OET_Example_multibodyWECSingleDoF_eqFunction_3669(data, threadData, jacobian, parentJacobian);
  OET_Example_multibodyWECSingleDoF_eqFunction_3670(data, threadData, jacobian, parentJacobian);
  OET_Example_multibodyWECSingleDoF_eqFunction_3671(data, threadData, jacobian, parentJacobian);
  TRACE_POP
  return 0;
}
/* constant equations */
/* dynamic equations */

/*
equation index: 3683
type: SIMPLE_ASSIGN
$res_NLSJac4_1.$pDERNLSJac4.dummyVarNLSJac4 = 2.0 * (spar.body.body.Q[1] * spar.body.body.Q.SeedNLSJac4[1] + spar.body.body.Q[2] * spar.body.body.Q.SeedNLSJac4[2] + spar.body.body.Q[3] * spar.body.body.Q.SeedNLSJac4[3] + spar.body.body.Q[4] * spar.body.body.Q.SeedNLSJac4[4])
*/
void OET_Example_multibodyWECSingleDoF_eqFunction_3683(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 0;
  const int equationIndexes[2] = {1,3683};
  jacobian->resultVars[0] /* $res_NLSJac4_1.$pDERNLSJac4.dummyVarNLSJac4 JACOBIAN_VAR */ = (2.0) * (((data->localData[0]->realVars[2729] /* spar.body.body.Q[1] DUMMY_STATE */)) * (jacobian->seedVars[3] /* spar.body.body.Q.SeedNLSJac4[1] SEED_VAR */) + ((data->localData[0]->realVars[2730] /* spar.body.body.Q[2] DUMMY_STATE */)) * (jacobian->seedVars[2] /* spar.body.body.Q.SeedNLSJac4[2] SEED_VAR */) + ((data->localData[0]->realVars[2731] /* spar.body.body.Q[3] DUMMY_STATE */)) * (jacobian->seedVars[0] /* spar.body.body.Q.SeedNLSJac4[3] SEED_VAR */) + ((data->localData[0]->realVars[2732] /* spar.body.body.Q[4] DUMMY_STATE */)) * (jacobian->seedVars[1] /* spar.body.body.Q.SeedNLSJac4[4] SEED_VAR */));
  TRACE_POP
}

/*
equation index: 3684
type: SIMPLE_ASSIGN
$res_NLSJac4_2.$pDERNLSJac4.dummyVarNLSJac4 = (*Real*)($STATESET1.A[1,4]) * spar.body.body.Q.SeedNLSJac4[1] + (*Real*)($STATESET1.A[1,3]) * spar.body.body.Q.SeedNLSJac4[2] + (*Real*)($STATESET1.A[1,2]) * spar.body.body.Q.SeedNLSJac4[3] + (*Real*)($STATESET1.A[1,1]) * spar.body.body.Q.SeedNLSJac4[4]
*/
void OET_Example_multibodyWECSingleDoF_eqFunction_3684(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 1;
  const int equationIndexes[2] = {1,3684};
  jacobian->resultVars[1] /* $res_NLSJac4_2.$pDERNLSJac4.dummyVarNLSJac4 JACOBIAN_VAR */ = (((modelica_real)(data->localData[0]->integerVars[3] /* $STATESET1.A[1,4] variable */))) * (jacobian->seedVars[3] /* spar.body.body.Q.SeedNLSJac4[1] SEED_VAR */) + (((modelica_real)(data->localData[0]->integerVars[2] /* $STATESET1.A[1,3] variable */))) * (jacobian->seedVars[2] /* spar.body.body.Q.SeedNLSJac4[2] SEED_VAR */) + (((modelica_real)(data->localData[0]->integerVars[1] /* $STATESET1.A[1,2] variable */))) * (jacobian->seedVars[0] /* spar.body.body.Q.SeedNLSJac4[3] SEED_VAR */) + (((modelica_real)(data->localData[0]->integerVars[0] /* $STATESET1.A[1,1] variable */))) * (jacobian->seedVars[1] /* spar.body.body.Q.SeedNLSJac4[4] SEED_VAR */);
  TRACE_POP
}

/*
equation index: 3685
type: SIMPLE_ASSIGN
$res_NLSJac4_3.$pDERNLSJac4.dummyVarNLSJac4 = (*Real*)($STATESET1.A[2,4]) * spar.body.body.Q.SeedNLSJac4[1] + (*Real*)($STATESET1.A[2,3]) * spar.body.body.Q.SeedNLSJac4[2] + (*Real*)($STATESET1.A[2,2]) * spar.body.body.Q.SeedNLSJac4[3] + (*Real*)($STATESET1.A[2,1]) * spar.body.body.Q.SeedNLSJac4[4]
*/
void OET_Example_multibodyWECSingleDoF_eqFunction_3685(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 2;
  const int equationIndexes[2] = {1,3685};
  jacobian->resultVars[2] /* $res_NLSJac4_3.$pDERNLSJac4.dummyVarNLSJac4 JACOBIAN_VAR */ = (((modelica_real)(data->localData[0]->integerVars[7] /* $STATESET1.A[2,4] variable */))) * (jacobian->seedVars[3] /* spar.body.body.Q.SeedNLSJac4[1] SEED_VAR */) + (((modelica_real)(data->localData[0]->integerVars[6] /* $STATESET1.A[2,3] variable */))) * (jacobian->seedVars[2] /* spar.body.body.Q.SeedNLSJac4[2] SEED_VAR */) + (((modelica_real)(data->localData[0]->integerVars[5] /* $STATESET1.A[2,2] variable */))) * (jacobian->seedVars[0] /* spar.body.body.Q.SeedNLSJac4[3] SEED_VAR */) + (((modelica_real)(data->localData[0]->integerVars[4] /* $STATESET1.A[2,1] variable */))) * (jacobian->seedVars[1] /* spar.body.body.Q.SeedNLSJac4[4] SEED_VAR */);
  TRACE_POP
}

/*
equation index: 3686
type: SIMPLE_ASSIGN
$res_NLSJac4_4.$pDERNLSJac4.dummyVarNLSJac4 = (*Real*)($STATESET1.A[3,4]) * spar.body.body.Q.SeedNLSJac4[1] + (*Real*)($STATESET1.A[3,3]) * spar.body.body.Q.SeedNLSJac4[2] + (*Real*)($STATESET1.A[3,2]) * spar.body.body.Q.SeedNLSJac4[3] + (*Real*)($STATESET1.A[3,1]) * spar.body.body.Q.SeedNLSJac4[4]
*/
void OET_Example_multibodyWECSingleDoF_eqFunction_3686(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 3;
  const int equationIndexes[2] = {1,3686};
  jacobian->resultVars[3] /* $res_NLSJac4_4.$pDERNLSJac4.dummyVarNLSJac4 JACOBIAN_VAR */ = (((modelica_real)(data->localData[0]->integerVars[11] /* $STATESET1.A[3,4] variable */))) * (jacobian->seedVars[3] /* spar.body.body.Q.SeedNLSJac4[1] SEED_VAR */) + (((modelica_real)(data->localData[0]->integerVars[10] /* $STATESET1.A[3,3] variable */))) * (jacobian->seedVars[2] /* spar.body.body.Q.SeedNLSJac4[2] SEED_VAR */) + (((modelica_real)(data->localData[0]->integerVars[9] /* $STATESET1.A[3,2] variable */))) * (jacobian->seedVars[0] /* spar.body.body.Q.SeedNLSJac4[3] SEED_VAR */) + (((modelica_real)(data->localData[0]->integerVars[8] /* $STATESET1.A[3,1] variable */))) * (jacobian->seedVars[1] /* spar.body.body.Q.SeedNLSJac4[4] SEED_VAR */);
  TRACE_POP
}

OMC_DISABLE_OPT
int OET_Example_multibodyWECSingleDoF_functionJacNLSJac4_constantEqns(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = OET_Example_multibodyWECSingleDoF_INDEX_JAC_NLSJac4;
  
  TRACE_POP
  return 0;
}

int OET_Example_multibodyWECSingleDoF_functionJacNLSJac4_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = OET_Example_multibodyWECSingleDoF_INDEX_JAC_NLSJac4;
  OET_Example_multibodyWECSingleDoF_eqFunction_3683(data, threadData, jacobian, parentJacobian);
  OET_Example_multibodyWECSingleDoF_eqFunction_3684(data, threadData, jacobian, parentJacobian);
  OET_Example_multibodyWECSingleDoF_eqFunction_3685(data, threadData, jacobian, parentJacobian);
  OET_Example_multibodyWECSingleDoF_eqFunction_3686(data, threadData, jacobian, parentJacobian);
  TRACE_POP
  return 0;
}
int OET_Example_multibodyWECSingleDoF_functionJacH_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  TRACE_POP
  return 0;
}
int OET_Example_multibodyWECSingleDoF_functionJacF_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  TRACE_POP
  return 0;
}
int OET_Example_multibodyWECSingleDoF_functionJacD_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  TRACE_POP
  return 0;
}
int OET_Example_multibodyWECSingleDoF_functionJacC_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  TRACE_POP
  return 0;
}
int OET_Example_multibodyWECSingleDoF_functionJacB_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  TRACE_POP
  return 0;
}
/* constant equations */
/* dynamic equations */

OMC_DISABLE_OPT
int OET_Example_multibodyWECSingleDoF_functionJacA_constantEqns(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = OET_Example_multibodyWECSingleDoF_INDEX_JAC_A;
  
  TRACE_POP
  return 0;
}

int OET_Example_multibodyWECSingleDoF_functionJacA_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = OET_Example_multibodyWECSingleDoF_INDEX_JAC_A;
  TRACE_POP
  return 0;
}
/* constant equations */
/* dynamic equations */

/*
equation index: 7656
type: SIMPLE_ASSIGN
$STATESET1.J.$pDERStateSetJac5.dummyVarStateSetJac5 = (-2.0) * (spar.body.body.Q[1] * spar.body.body.Q.SeedStateSetJac5[1] + spar.body.body.Q[2] * spar.body.body.Q.SeedStateSetJac5[2] + spar.body.body.Q[3] * spar.body.body.Q.SeedStateSetJac5[3] + spar.body.body.Q[4] * spar.body.body.Q.SeedStateSetJac5[4])
*/
void OET_Example_multibodyWECSingleDoF_eqFunction_7656(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 0;
  const int equationIndexes[2] = {1,7656};
  jacobian->resultVars[0] /* $STATESET1.J.$pDERStateSetJac5.dummyVarStateSetJac5 JACOBIAN_VAR */ = (-2.0) * (((data->localData[0]->realVars[2729] /* spar.body.body.Q[1] DUMMY_STATE */)) * (jacobian->seedVars[3] /* spar.body.body.Q.SeedStateSetJac5[1] SEED_VAR */) + ((data->localData[0]->realVars[2730] /* spar.body.body.Q[2] DUMMY_STATE */)) * (jacobian->seedVars[2] /* spar.body.body.Q.SeedStateSetJac5[2] SEED_VAR */) + ((data->localData[0]->realVars[2731] /* spar.body.body.Q[3] DUMMY_STATE */)) * (jacobian->seedVars[1] /* spar.body.body.Q.SeedStateSetJac5[3] SEED_VAR */) + ((data->localData[0]->realVars[2732] /* spar.body.body.Q[4] DUMMY_STATE */)) * (jacobian->seedVars[0] /* spar.body.body.Q.SeedStateSetJac5[4] SEED_VAR */));
  TRACE_POP
}

OMC_DISABLE_OPT
int OET_Example_multibodyWECSingleDoF_functionJacStateSetJac5_constantEqns(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = OET_Example_multibodyWECSingleDoF_INDEX_JAC_StateSetJac5;
  
  TRACE_POP
  return 0;
}

int OET_Example_multibodyWECSingleDoF_functionJacStateSetJac5_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = OET_Example_multibodyWECSingleDoF_INDEX_JAC_StateSetJac5;
  OET_Example_multibodyWECSingleDoF_eqFunction_7656(data, threadData, jacobian, parentJacobian);
  TRACE_POP
  return 0;
}

OMC_DISABLE_OPT
int OET_Example_multibodyWECSingleDoF_initialAnalyticJacobianLSJac1(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  size_t count;

  FILE* pFile = openSparsePatternFile(data, threadData, "OET.Example.multibodyWECSingleDoF_JacLSJac1.bin");
  
  initAnalyticJacobian(jacobian, 5, 5, 6, NULL, jacobian->sparsePattern);
  jacobian->sparsePattern = allocSparsePattern(5, 25, 5);
  jacobian->availability = JACOBIAN_AVAILABLE;
  
  /* read lead index of compressed sparse column */
  count = omc_fread(jacobian->sparsePattern->leadindex, sizeof(unsigned int), 5+1, pFile, FALSE);
  if (count != 5+1) {
    throwStreamPrint(threadData, "Error while reading lead index list of sparsity pattern. Expected %d, got %zu", 5+1, count);
  }
  
  /* read sparse index */
  count = omc_fread(jacobian->sparsePattern->index, sizeof(unsigned int), 25, pFile, FALSE);
  if (count != 25) {
    throwStreamPrint(threadData, "Error while reading row index list of sparsity pattern. Expected %d, got %zu", 25, count);
  }
  
  /* write color array */
  /* color 1 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 1, 1, 5);
  /* color 2 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 2, 1, 5);
  /* color 3 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 3, 1, 5);
  /* color 4 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 4, 1, 5);
  /* color 5 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 5, 1, 5);
  
  omc_fclose(pFile);
  
  TRACE_POP
  return 0;
}
OMC_DISABLE_OPT
int OET_Example_multibodyWECSingleDoF_initialAnalyticJacobianNLSJac2(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  size_t count;

  FILE* pFile = openSparsePatternFile(data, threadData, "OET.Example.multibodyWECSingleDoF_JacNLSJac2.bin");
  
  initAnalyticJacobian(jacobian, 4, 4, 4, NULL, jacobian->sparsePattern);
  jacobian->sparsePattern = allocSparsePattern(4, 16, 4);
  jacobian->availability = JACOBIAN_AVAILABLE;
  
  /* read lead index of compressed sparse column */
  count = omc_fread(jacobian->sparsePattern->leadindex, sizeof(unsigned int), 4+1, pFile, FALSE);
  if (count != 4+1) {
    throwStreamPrint(threadData, "Error while reading lead index list of sparsity pattern. Expected %d, got %zu", 4+1, count);
  }
  
  /* read sparse index */
  count = omc_fread(jacobian->sparsePattern->index, sizeof(unsigned int), 16, pFile, FALSE);
  if (count != 16) {
    throwStreamPrint(threadData, "Error while reading row index list of sparsity pattern. Expected %d, got %zu", 16, count);
  }
  
  /* write color array */
  /* color 1 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 1, 1, 4);
  /* color 2 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 2, 1, 4);
  /* color 3 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 3, 1, 4);
  /* color 4 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 4, 1, 4);
  
  omc_fclose(pFile);
  
  TRACE_POP
  return 0;
}
OMC_DISABLE_OPT
int OET_Example_multibodyWECSingleDoF_initialAnalyticJacobianLSJac3(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  size_t count;

  FILE* pFile = openSparsePatternFile(data, threadData, "OET.Example.multibodyWECSingleDoF_JacLSJac3.bin");
  
  initAnalyticJacobian(jacobian, 5, 5, 6, NULL, jacobian->sparsePattern);
  jacobian->sparsePattern = allocSparsePattern(5, 25, 5);
  jacobian->availability = JACOBIAN_AVAILABLE;
  
  /* read lead index of compressed sparse column */
  count = omc_fread(jacobian->sparsePattern->leadindex, sizeof(unsigned int), 5+1, pFile, FALSE);
  if (count != 5+1) {
    throwStreamPrint(threadData, "Error while reading lead index list of sparsity pattern. Expected %d, got %zu", 5+1, count);
  }
  
  /* read sparse index */
  count = omc_fread(jacobian->sparsePattern->index, sizeof(unsigned int), 25, pFile, FALSE);
  if (count != 25) {
    throwStreamPrint(threadData, "Error while reading row index list of sparsity pattern. Expected %d, got %zu", 25, count);
  }
  
  /* write color array */
  /* color 1 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 1, 1, 5);
  /* color 2 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 2, 1, 5);
  /* color 3 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 3, 1, 5);
  /* color 4 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 4, 1, 5);
  /* color 5 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 5, 1, 5);
  
  omc_fclose(pFile);
  
  TRACE_POP
  return 0;
}
OMC_DISABLE_OPT
int OET_Example_multibodyWECSingleDoF_initialAnalyticJacobianNLSJac4(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  size_t count;

  FILE* pFile = openSparsePatternFile(data, threadData, "OET.Example.multibodyWECSingleDoF_JacNLSJac4.bin");
  
  initAnalyticJacobian(jacobian, 4, 4, 4, NULL, jacobian->sparsePattern);
  jacobian->sparsePattern = allocSparsePattern(4, 16, 4);
  jacobian->availability = JACOBIAN_AVAILABLE;
  
  /* read lead index of compressed sparse column */
  count = omc_fread(jacobian->sparsePattern->leadindex, sizeof(unsigned int), 4+1, pFile, FALSE);
  if (count != 4+1) {
    throwStreamPrint(threadData, "Error while reading lead index list of sparsity pattern. Expected %d, got %zu", 4+1, count);
  }
  
  /* read sparse index */
  count = omc_fread(jacobian->sparsePattern->index, sizeof(unsigned int), 16, pFile, FALSE);
  if (count != 16) {
    throwStreamPrint(threadData, "Error while reading row index list of sparsity pattern. Expected %d, got %zu", 16, count);
  }
  
  /* write color array */
  /* color 1 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 1, 1, 4);
  /* color 2 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 2, 1, 4);
  /* color 3 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 3, 1, 4);
  /* color 4 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 4, 1, 4);
  
  omc_fclose(pFile);
  
  TRACE_POP
  return 0;
}
int OET_Example_multibodyWECSingleDoF_initialAnalyticJacobianH(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  TRACE_POP
  jacobian->availability = JACOBIAN_NOT_AVAILABLE;
  return 1;
}
int OET_Example_multibodyWECSingleDoF_initialAnalyticJacobianF(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  TRACE_POP
  jacobian->availability = JACOBIAN_NOT_AVAILABLE;
  return 1;
}
int OET_Example_multibodyWECSingleDoF_initialAnalyticJacobianD(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  TRACE_POP
  jacobian->availability = JACOBIAN_NOT_AVAILABLE;
  return 1;
}
int OET_Example_multibodyWECSingleDoF_initialAnalyticJacobianC(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  TRACE_POP
  jacobian->availability = JACOBIAN_NOT_AVAILABLE;
  return 1;
}
int OET_Example_multibodyWECSingleDoF_initialAnalyticJacobianB(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  TRACE_POP
  jacobian->availability = JACOBIAN_NOT_AVAILABLE;
  return 1;
}
OMC_DISABLE_OPT
int OET_Example_multibodyWECSingleDoF_initialAnalyticJacobianA(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  size_t count;

  FILE* pFile = openSparsePatternFile(data, threadData, "OET.Example.multibodyWECSingleDoF_JacA.bin");
  
  initAnalyticJacobian(jacobian, 206, 206, 0, NULL, jacobian->sparsePattern);
  jacobian->sparsePattern = allocSparsePattern(206, 37317, 194);
  jacobian->availability = JACOBIAN_ONLY_SPARSITY;
  
  /* read lead index of compressed sparse column */
  count = omc_fread(jacobian->sparsePattern->leadindex, sizeof(unsigned int), 206+1, pFile, FALSE);
  if (count != 206+1) {
    throwStreamPrint(threadData, "Error while reading lead index list of sparsity pattern. Expected %d, got %zu", 206+1, count);
  }
  
  /* read sparse index */
  count = omc_fread(jacobian->sparsePattern->index, sizeof(unsigned int), 37317, pFile, FALSE);
  if (count != 37317) {
    throwStreamPrint(threadData, "Error while reading row index list of sparsity pattern. Expected %d, got %zu", 37317, count);
  }
  
  /* write color array */
  /* color 1 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 1, 1, 206);
  /* color 2 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 2, 1, 206);
  /* color 3 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 3, 1, 206);
  /* color 4 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 4, 1, 206);
  /* color 5 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 5, 1, 206);
  /* color 6 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 6, 1, 206);
  /* color 7 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 7, 1, 206);
  /* color 8 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 8, 1, 206);
  /* color 9 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 9, 1, 206);
  /* color 10 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 10, 1, 206);
  /* color 11 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 11, 1, 206);
  /* color 12 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 12, 1, 206);
  /* color 13 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 13, 1, 206);
  /* color 14 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 14, 1, 206);
  /* color 15 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 15, 1, 206);
  /* color 16 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 16, 1, 206);
  /* color 17 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 17, 1, 206);
  /* color 18 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 18, 1, 206);
  /* color 19 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 19, 1, 206);
  /* color 20 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 20, 1, 206);
  /* color 21 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 21, 1, 206);
  /* color 22 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 22, 1, 206);
  /* color 23 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 23, 1, 206);
  /* color 24 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 24, 1, 206);
  /* color 25 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 25, 1, 206);
  /* color 26 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 26, 1, 206);
  /* color 27 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 27, 1, 206);
  /* color 28 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 28, 1, 206);
  /* color 29 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 29, 1, 206);
  /* color 30 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 30, 1, 206);
  /* color 31 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 31, 1, 206);
  /* color 32 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 32, 1, 206);
  /* color 33 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 33, 1, 206);
  /* color 34 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 34, 1, 206);
  /* color 35 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 35, 1, 206);
  /* color 36 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 36, 1, 206);
  /* color 37 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 37, 1, 206);
  /* color 38 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 38, 1, 206);
  /* color 39 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 39, 1, 206);
  /* color 40 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 40, 1, 206);
  /* color 41 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 41, 1, 206);
  /* color 42 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 42, 1, 206);
  /* color 43 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 43, 1, 206);
  /* color 44 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 44, 1, 206);
  /* color 45 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 45, 1, 206);
  /* color 46 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 46, 1, 206);
  /* color 47 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 47, 1, 206);
  /* color 48 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 48, 1, 206);
  /* color 49 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 49, 1, 206);
  /* color 50 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 50, 1, 206);
  /* color 51 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 51, 1, 206);
  /* color 52 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 52, 1, 206);
  /* color 53 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 53, 1, 206);
  /* color 54 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 54, 1, 206);
  /* color 55 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 55, 1, 206);
  /* color 56 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 56, 1, 206);
  /* color 57 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 57, 1, 206);
  /* color 58 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 58, 1, 206);
  /* color 59 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 59, 1, 206);
  /* color 60 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 60, 1, 206);
  /* color 61 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 61, 1, 206);
  /* color 62 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 62, 1, 206);
  /* color 63 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 63, 1, 206);
  /* color 64 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 64, 1, 206);
  /* color 65 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 65, 1, 206);
  /* color 66 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 66, 1, 206);
  /* color 67 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 67, 1, 206);
  /* color 68 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 68, 1, 206);
  /* color 69 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 69, 1, 206);
  /* color 70 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 70, 1, 206);
  /* color 71 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 71, 1, 206);
  /* color 72 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 72, 1, 206);
  /* color 73 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 73, 1, 206);
  /* color 74 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 74, 1, 206);
  /* color 75 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 75, 1, 206);
  /* color 76 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 76, 1, 206);
  /* color 77 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 77, 1, 206);
  /* color 78 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 78, 1, 206);
  /* color 79 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 79, 1, 206);
  /* color 80 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 80, 1, 206);
  /* color 81 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 81, 1, 206);
  /* color 82 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 82, 1, 206);
  /* color 83 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 83, 1, 206);
  /* color 84 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 84, 1, 206);
  /* color 85 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 85, 1, 206);
  /* color 86 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 86, 1, 206);
  /* color 87 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 87, 1, 206);
  /* color 88 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 88, 1, 206);
  /* color 89 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 89, 1, 206);
  /* color 90 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 90, 1, 206);
  /* color 91 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 91, 1, 206);
  /* color 92 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 92, 1, 206);
  /* color 93 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 93, 1, 206);
  /* color 94 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 94, 1, 206);
  /* color 95 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 95, 1, 206);
  /* color 96 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 96, 1, 206);
  /* color 97 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 97, 1, 206);
  /* color 98 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 98, 1, 206);
  /* color 99 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 99, 1, 206);
  /* color 100 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 100, 1, 206);
  /* color 101 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 101, 1, 206);
  /* color 102 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 102, 1, 206);
  /* color 103 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 103, 1, 206);
  /* color 104 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 104, 1, 206);
  /* color 105 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 105, 1, 206);
  /* color 106 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 106, 1, 206);
  /* color 107 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 107, 1, 206);
  /* color 108 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 108, 1, 206);
  /* color 109 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 109, 1, 206);
  /* color 110 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 110, 1, 206);
  /* color 111 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 111, 1, 206);
  /* color 112 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 112, 1, 206);
  /* color 113 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 113, 1, 206);
  /* color 114 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 114, 1, 206);
  /* color 115 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 115, 1, 206);
  /* color 116 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 116, 1, 206);
  /* color 117 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 117, 1, 206);
  /* color 118 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 118, 1, 206);
  /* color 119 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 119, 1, 206);
  /* color 120 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 120, 1, 206);
  /* color 121 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 121, 1, 206);
  /* color 122 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 122, 1, 206);
  /* color 123 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 123, 1, 206);
  /* color 124 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 124, 1, 206);
  /* color 125 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 125, 1, 206);
  /* color 126 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 126, 1, 206);
  /* color 127 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 127, 1, 206);
  /* color 128 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 128, 1, 206);
  /* color 129 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 129, 1, 206);
  /* color 130 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 130, 1, 206);
  /* color 131 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 131, 1, 206);
  /* color 132 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 132, 1, 206);
  /* color 133 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 133, 1, 206);
  /* color 134 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 134, 1, 206);
  /* color 135 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 135, 1, 206);
  /* color 136 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 136, 1, 206);
  /* color 137 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 137, 1, 206);
  /* color 138 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 138, 1, 206);
  /* color 139 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 139, 1, 206);
  /* color 140 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 140, 1, 206);
  /* color 141 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 141, 1, 206);
  /* color 142 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 142, 1, 206);
  /* color 143 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 143, 1, 206);
  /* color 144 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 144, 1, 206);
  /* color 145 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 145, 1, 206);
  /* color 146 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 146, 1, 206);
  /* color 147 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 147, 1, 206);
  /* color 148 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 148, 1, 206);
  /* color 149 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 149, 1, 206);
  /* color 150 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 150, 1, 206);
  /* color 151 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 151, 1, 206);
  /* color 152 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 152, 1, 206);
  /* color 153 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 153, 1, 206);
  /* color 154 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 154, 1, 206);
  /* color 155 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 155, 1, 206);
  /* color 156 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 156, 1, 206);
  /* color 157 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 157, 1, 206);
  /* color 158 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 158, 1, 206);
  /* color 159 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 159, 1, 206);
  /* color 160 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 160, 1, 206);
  /* color 161 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 161, 1, 206);
  /* color 162 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 162, 1, 206);
  /* color 163 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 163, 1, 206);
  /* color 164 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 164, 1, 206);
  /* color 165 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 165, 1, 206);
  /* color 166 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 166, 1, 206);
  /* color 167 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 167, 1, 206);
  /* color 168 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 168, 1, 206);
  /* color 169 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 169, 1, 206);
  /* color 170 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 170, 1, 206);
  /* color 171 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 171, 1, 206);
  /* color 172 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 172, 1, 206);
  /* color 173 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 173, 1, 206);
  /* color 174 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 174, 1, 206);
  /* color 175 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 175, 1, 206);
  /* color 176 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 176, 1, 206);
  /* color 177 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 177, 1, 206);
  /* color 178 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 178, 1, 206);
  /* color 179 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 179, 1, 206);
  /* color 180 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 180, 1, 206);
  /* color 181 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 181, 1, 206);
  /* color 182 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 182, 1, 206);
  /* color 183 with 2 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 183, 2, 206);
  /* color 184 with 2 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 184, 2, 206);
  /* color 185 with 2 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 185, 2, 206);
  /* color 186 with 2 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 186, 2, 206);
  /* color 187 with 2 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 187, 2, 206);
  /* color 188 with 2 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 188, 2, 206);
  /* color 189 with 2 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 189, 2, 206);
  /* color 190 with 2 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 190, 2, 206);
  /* color 191 with 2 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 191, 2, 206);
  /* color 192 with 2 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 192, 2, 206);
  /* color 193 with 2 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 193, 2, 206);
  /* color 194 with 2 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 194, 2, 206);
  
  omc_fclose(pFile);
  
  TRACE_POP
  return 0;
}
OMC_DISABLE_OPT
int OET_Example_multibodyWECSingleDoF_initialAnalyticJacobianStateSetJac5(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  size_t count;

  FILE* pFile = openSparsePatternFile(data, threadData, "OET.Example.multibodyWECSingleDoF_JacStateSetJac5.bin");
  
  initAnalyticJacobian(jacobian, 4, 1, 1, NULL, jacobian->sparsePattern);
  jacobian->sparsePattern = allocSparsePattern(4, 4, 4);
  jacobian->availability = JACOBIAN_AVAILABLE;
  
  /* read lead index of compressed sparse column */
  count = omc_fread(jacobian->sparsePattern->leadindex, sizeof(unsigned int), 4+1, pFile, FALSE);
  if (count != 4+1) {
    throwStreamPrint(threadData, "Error while reading lead index list of sparsity pattern. Expected %d, got %zu", 4+1, count);
  }
  
  /* read sparse index */
  count = omc_fread(jacobian->sparsePattern->index, sizeof(unsigned int), 4, pFile, FALSE);
  if (count != 4) {
    throwStreamPrint(threadData, "Error while reading row index list of sparsity pattern. Expected %d, got %zu", 4, count);
  }
  
  /* write color array */
  /* color 1 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 1, 1, 4);
  /* color 2 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 2, 1, 4);
  /* color 3 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 3, 1, 4);
  /* color 4 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 4, 1, 4);
  
  omc_fclose(pFile);
  
  TRACE_POP
  return 0;
}



