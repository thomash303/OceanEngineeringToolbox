/* Non Linear Systems */
#include "OET.Example.multibodyWECSingleDoF_model.h"
#include "OET.Example.multibodyWECSingleDoF_12jac.h"
#include "simulation/jacobian_util.h"
#if defined(__cplusplus)
extern "C" {
#endif

/* inner equations */

/*
equation index: 3183
type: ARRAY_CALL_ASSIGN

$TMP_3180 = {(*Real*)($STATESET1.A[1,1]) * spar.body.body.Q[4] + (*Real*)($STATESET1.A[1,2]) * spar.body.body.Q[3] + (*Real*)($STATESET1.A[1,3]) * spar.body.body.Q[2] + (*Real*)($STATESET1.A[1,4]) * spar.body.body.Q[1], (*Real*)($STATESET1.A[2,1]) * spar.body.body.Q[4] + (*Real*)($STATESET1.A[2,2]) * spar.body.body.Q[3] + (*Real*)($STATESET1.A[2,3]) * spar.body.body.Q[2] + (*Real*)($STATESET1.A[2,4]) * spar.body.body.Q[1], (*Real*)($STATESET1.A[3,1]) * spar.body.body.Q[4] + (*Real*)($STATESET1.A[3,2]) * spar.body.body.Q[3] + (*Real*)($STATESET1.A[3,3]) * spar.body.body.Q[2] + (*Real*)($STATESET1.A[3,4]) * spar.body.body.Q[1]} - $STATESET1.x
*/
void OET_Example_multibodyWECSingleDoF_eqFunction_3183(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3183};
  real_array tmp0;
  real_array tmp1;
  real_array tmp2;
  array_alloc_scalar_real_array(&tmp0, 3, (modelica_real)(((modelica_real)(data->localData[0]->integerVars[0] /* $STATESET1.A[1,1] variable */))) * ((data->localData[0]->realVars[2732] /* spar.body.body.Q[4] DUMMY_STATE */)) + (((modelica_real)(data->localData[0]->integerVars[1] /* $STATESET1.A[1,2] variable */))) * ((data->localData[0]->realVars[2731] /* spar.body.body.Q[3] DUMMY_STATE */)) + (((modelica_real)(data->localData[0]->integerVars[2] /* $STATESET1.A[1,3] variable */))) * ((data->localData[0]->realVars[2730] /* spar.body.body.Q[2] DUMMY_STATE */)) + (((modelica_real)(data->localData[0]->integerVars[3] /* $STATESET1.A[1,4] variable */))) * ((data->localData[0]->realVars[2729] /* spar.body.body.Q[1] DUMMY_STATE */)), (modelica_real)(((modelica_real)(data->localData[0]->integerVars[4] /* $STATESET1.A[2,1] variable */))) * ((data->localData[0]->realVars[2732] /* spar.body.body.Q[4] DUMMY_STATE */)) + (((modelica_real)(data->localData[0]->integerVars[5] /* $STATESET1.A[2,2] variable */))) * ((data->localData[0]->realVars[2731] /* spar.body.body.Q[3] DUMMY_STATE */)) + (((modelica_real)(data->localData[0]->integerVars[6] /* $STATESET1.A[2,3] variable */))) * ((data->localData[0]->realVars[2730] /* spar.body.body.Q[2] DUMMY_STATE */)) + (((modelica_real)(data->localData[0]->integerVars[7] /* $STATESET1.A[2,4] variable */))) * ((data->localData[0]->realVars[2729] /* spar.body.body.Q[1] DUMMY_STATE */)), (modelica_real)(((modelica_real)(data->localData[0]->integerVars[8] /* $STATESET1.A[3,1] variable */))) * ((data->localData[0]->realVars[2732] /* spar.body.body.Q[4] DUMMY_STATE */)) + (((modelica_real)(data->localData[0]->integerVars[9] /* $STATESET1.A[3,2] variable */))) * ((data->localData[0]->realVars[2731] /* spar.body.body.Q[3] DUMMY_STATE */)) + (((modelica_real)(data->localData[0]->integerVars[10] /* $STATESET1.A[3,3] variable */))) * ((data->localData[0]->realVars[2730] /* spar.body.body.Q[2] DUMMY_STATE */)) + (((modelica_real)(data->localData[0]->integerVars[11] /* $STATESET1.A[3,4] variable */))) * ((data->localData[0]->realVars[2729] /* spar.body.body.Q[1] DUMMY_STATE */)));
  real_array_create(&tmp1, ((modelica_real*)&((&data->localData[0]->realVars[0] /* $STATESET1.x[1] STATE(1) */)[((modelica_integer) 1) - 1])), 1, (_index_t)3);
  real_array_create(&tmp2, ((modelica_real*)&((&(data->localData[0]->realVars[461] /* $TMP_3180[1] variable */))[((modelica_integer) 1) - 1])), 1, (_index_t)3);
  real_array_copy_data(sub_alloc_real_array(tmp0, tmp1), tmp2);
  TRACE_POP
}

void residualFunc3189(RESIDUAL_USERDATA* userData, const double* xloc, double* res, const int* iflag)
{
  TRACE_PUSH
  DATA *data = userData->data;
  threadData_t *threadData = userData->threadData;
  const int equationIndexes[2] = {1,3189};
  int i,j;
  modelica_real tmp0;
  modelica_real tmp1;
  modelica_real tmp2;
  modelica_real tmp3;
  /* iteration variables */
  for (i=0; i<4; i++) {
    if (isinf(xloc[i]) || isnan(xloc[i])) {
      errorStreamPrint(LOG_NLS, 0, "residualFunc3189: Iteration variable `%s` is inf or nan.",
        modelInfoGetEquation(&data->modelData->modelDataXml, 3189).vars[i]);
      for (j=0; j<4; j++) {
        res[j] = NAN;
      }
      throwStreamPrintWithEquationIndexes(threadData, omc_dummyFileInfo, equationIndexes, "residualFunc3189 failed at time=%.15g.\nFor more information please use -lv LOG_NLS.", data->localData[0]->timeValue);
      return;
    }
  }
  (data->localData[0]->realVars[2731] /* spar.body.body.Q[3] DUMMY_STATE */) = xloc[0];
  (data->localData[0]->realVars[2732] /* spar.body.body.Q[4] DUMMY_STATE */) = xloc[1];
  (data->localData[0]->realVars[2729] /* spar.body.body.Q[1] DUMMY_STATE */) = xloc[2];
  (data->localData[0]->realVars[2730] /* spar.body.body.Q[2] DUMMY_STATE */) = xloc[3];
  /* backup outputs */
  /* pre body */
  /* local constraints */
  OET_Example_multibodyWECSingleDoF_eqFunction_3183(data, threadData);
  /* body */
  tmp0 = (data->localData[0]->realVars[2732] /* spar.body.body.Q[4] DUMMY_STATE */);
  tmp1 = (data->localData[0]->realVars[2731] /* spar.body.body.Q[3] DUMMY_STATE */);
  tmp2 = (data->localData[0]->realVars[2730] /* spar.body.body.Q[2] DUMMY_STATE */);
  tmp3 = (data->localData[0]->realVars[2729] /* spar.body.body.Q[1] DUMMY_STATE */);
  res[0] = -1.0 + (tmp0 * tmp0) + (tmp1 * tmp1) + (tmp2 * tmp2) + (tmp3 * tmp3);

  res[1] = (data->localData[0]->realVars[461] /* $TMP_3180[1] variable */);

  res[2] = (data->localData[0]->realVars[462] /* $TMP_3180[2] variable */);

  res[3] = (data->localData[0]->realVars[463] /* $TMP_3180[3] variable */);
  /* restore known outputs */
  TRACE_POP
}

OMC_DISABLE_OPT
void initializeSparsePatternNLS3189(NONLINEAR_SYSTEM_DATA* inSysData)
{
  int i=0;
  const int colPtrIndex[1+4] = {0,4,4,4,4};
  const int rowIndex[16] = {0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3};
  /* sparsity pattern available */
  inSysData->isPatternAvailable = TRUE;
  inSysData->sparsePattern = allocSparsePattern(4, 16, 4);
  
  /* write lead index of compressed sparse column */
  memcpy(inSysData->sparsePattern->leadindex, colPtrIndex, (4+1)*sizeof(unsigned int));
  
  for(i=2;i<4+1;++i)
    inSysData->sparsePattern->leadindex[i] += inSysData->sparsePattern->leadindex[i-1];
  
  /* call sparse index */
  memcpy(inSysData->sparsePattern->index, rowIndex, 16*sizeof(unsigned int));
  
  /* write color array */
  /* color 1 with 1 columns */
  const int indices_1[1] = {3};
  for(i=0; i<1; i++)
    inSysData->sparsePattern->colorCols[indices_1[i]] = 1;
  
  /* color 2 with 1 columns */
  const int indices_2[1] = {2};
  for(i=0; i<1; i++)
    inSysData->sparsePattern->colorCols[indices_2[i]] = 2;
  
  /* color 3 with 1 columns */
  const int indices_3[1] = {1};
  for(i=0; i<1; i++)
    inSysData->sparsePattern->colorCols[indices_3[i]] = 3;
  
  /* color 4 with 1 columns */
  const int indices_4[1] = {0};
  for(i=0; i<1; i++)
    inSysData->sparsePattern->colorCols[indices_4[i]] = 4;
}

void freeSparsePatternNLS3189(NONLINEAR_SYSTEM_DATA* inSysData)
{
  if (inSysData->isPatternAvailable) {
    freeSparsePattern(inSysData->sparsePattern);
    free(inSysData->sparsePattern);
    inSysData->sparsePattern = NULL;
    inSysData->isPatternAvailable = FALSE;
  }
}
OMC_DISABLE_OPT
void initializeNonlinearPatternNLS3189(NONLINEAR_SYSTEM_DATA* inSysData)
{
  int i=0;
  inSysData->nonlinearPattern = (NONLINEAR_PATTERN*) malloc(sizeof(NONLINEAR_PATTERN));
  inSysData->nonlinearPattern->numberOfVars = 4;
  inSysData->nonlinearPattern->numberOfEqns = 4;
  inSysData->nonlinearPattern->numberOfNonlinear = 4;
  inSysData->nonlinearPattern->indexVar = (unsigned int*) malloc((4+1)*sizeof(unsigned int));
  inSysData->nonlinearPattern->indexEqn = (unsigned int*) malloc((4+1)*sizeof(unsigned int));
  inSysData->nonlinearPattern->columns = (unsigned int*) malloc(4*sizeof(unsigned int));
  inSysData->nonlinearPattern->rows = (unsigned int*) malloc(4*sizeof(unsigned int));
  /* initialize and accumulate index vectors */
  const int index_var[1+4] = {0,4,0,0,0};
  const int index_eqn[1+4] = {0,4,0,0,0};
  memcpy(inSysData->nonlinearPattern->indexVar, index_var, (4+1)*sizeof(unsigned int));
  memcpy(inSysData->nonlinearPattern->indexEqn, index_eqn, (4+1)*sizeof(unsigned int));
  for(i=2;i<4+1;++i)
    inSysData->nonlinearPattern->indexVar[i] += inSysData->nonlinearPattern->indexVar[i-1];
  for(i=2;i<4+1;++i)
    inSysData->nonlinearPattern->indexEqn[i] += inSysData->nonlinearPattern->indexEqn[i-1];
  /* initialize columns and rows */
  const int columns[4] = {0,1,2,3};
  const int rows[4] = {0,0,0,0};
  memcpy(inSysData->nonlinearPattern->columns, columns, 4*sizeof(unsigned int));
  memcpy(inSysData->nonlinearPattern->rows, rows, 4*sizeof(unsigned int));
}

OMC_DISABLE_OPT
void initializeStaticDataNLS3189(DATA* data, threadData_t *threadData, NONLINEAR_SYSTEM_DATA *sysData, modelica_boolean initSparsePattern, modelica_boolean initNonlinearPattern)
{
  int i=0;
  /* static nls data for spar.body.body.Q[3] */
  sysData->nominal[i] = data->modelData->realVarsData[2731].attribute /* spar.body.body.Q[3] */.nominal;
  sysData->min[i]     = data->modelData->realVarsData[2731].attribute /* spar.body.body.Q[3] */.min;
  sysData->max[i++]   = data->modelData->realVarsData[2731].attribute /* spar.body.body.Q[3] */.max;
  /* static nls data for spar.body.body.Q[4] */
  sysData->nominal[i] = data->modelData->realVarsData[2732].attribute /* spar.body.body.Q[4] */.nominal;
  sysData->min[i]     = data->modelData->realVarsData[2732].attribute /* spar.body.body.Q[4] */.min;
  sysData->max[i++]   = data->modelData->realVarsData[2732].attribute /* spar.body.body.Q[4] */.max;
  /* static nls data for spar.body.body.Q[1] */
  sysData->nominal[i] = data->modelData->realVarsData[2729].attribute /* spar.body.body.Q[1] */.nominal;
  sysData->min[i]     = data->modelData->realVarsData[2729].attribute /* spar.body.body.Q[1] */.min;
  sysData->max[i++]   = data->modelData->realVarsData[2729].attribute /* spar.body.body.Q[1] */.max;
  /* static nls data for spar.body.body.Q[2] */
  sysData->nominal[i] = data->modelData->realVarsData[2730].attribute /* spar.body.body.Q[2] */.nominal;
  sysData->min[i]     = data->modelData->realVarsData[2730].attribute /* spar.body.body.Q[2] */.min;
  sysData->max[i++]   = data->modelData->realVarsData[2730].attribute /* spar.body.body.Q[2] */.max;
  /* initial sparse pattern */
  if (initSparsePattern) {
    initializeSparsePatternNLS3189(sysData);
  }
  if (initNonlinearPattern) {
    initializeNonlinearPatternNLS3189(sysData);
  }
}

OMC_DISABLE_OPT
void freeStaticDataNLS3189(DATA* data, threadData_t *threadData, NONLINEAR_SYSTEM_DATA *sysData)
{
  freeSparsePatternNLS3189(sysData);
}

OMC_DISABLE_OPT
void getIterationVarsNLS3189(DATA* data, double *array)
{
  array[0] = (data->localData[0]->realVars[2731] /* spar.body.body.Q[3] DUMMY_STATE */);
  array[1] = (data->localData[0]->realVars[2732] /* spar.body.body.Q[4] DUMMY_STATE */);
  array[2] = (data->localData[0]->realVars[2729] /* spar.body.body.Q[1] DUMMY_STATE */);
  array[3] = (data->localData[0]->realVars[2730] /* spar.body.body.Q[2] DUMMY_STATE */);
}


/* inner equations */

void residualFunc3687(RESIDUAL_USERDATA* userData, const double* xloc, double* res, const int* iflag)
{
  TRACE_PUSH
  DATA *data = userData->data;
  threadData_t *threadData = userData->threadData;
  const int equationIndexes[2] = {1,3687};
  int i,j;
  modelica_real tmp0;
  modelica_real tmp1;
  modelica_real tmp2;
  modelica_real tmp3;
  /* iteration variables */
  for (i=0; i<4; i++) {
    if (isinf(xloc[i]) || isnan(xloc[i])) {
      errorStreamPrint(LOG_NLS, 0, "residualFunc3687: Iteration variable `%s` is inf or nan.",
        modelInfoGetEquation(&data->modelData->modelDataXml, 3687).vars[i]);
      for (j=0; j<4; j++) {
        res[j] = NAN;
      }
      throwStreamPrintWithEquationIndexes(threadData, omc_dummyFileInfo, equationIndexes, "residualFunc3687 failed at time=%.15g.\nFor more information please use -lv LOG_NLS.", data->localData[0]->timeValue);
      return;
    }
  }
  (data->localData[0]->realVars[2731] /* spar.body.body.Q[3] DUMMY_STATE */) = xloc[0];
  (data->localData[0]->realVars[2732] /* spar.body.body.Q[4] DUMMY_STATE */) = xloc[1];
  (data->localData[0]->realVars[2730] /* spar.body.body.Q[2] DUMMY_STATE */) = xloc[2];
  (data->localData[0]->realVars[2729] /* spar.body.body.Q[1] DUMMY_STATE */) = xloc[3];
  /* backup outputs */
  /* pre body */
  /* body */
  tmp0 = (data->localData[0]->realVars[2732] /* spar.body.body.Q[4] DUMMY_STATE */);
  tmp1 = (data->localData[0]->realVars[2731] /* spar.body.body.Q[3] DUMMY_STATE */);
  tmp2 = (data->localData[0]->realVars[2730] /* spar.body.body.Q[2] DUMMY_STATE */);
  tmp3 = (data->localData[0]->realVars[2729] /* spar.body.body.Q[1] DUMMY_STATE */);
  res[0] = -1.0 + (tmp0 * tmp0) + (tmp1 * tmp1) + (tmp2 * tmp2) + (tmp3 * tmp3);

  res[1] = (((modelica_real)(data->localData[0]->integerVars[3] /* $STATESET1.A[1,4] variable */))) * ((data->localData[0]->realVars[2729] /* spar.body.body.Q[1] DUMMY_STATE */)) + (((modelica_real)(data->localData[0]->integerVars[2] /* $STATESET1.A[1,3] variable */))) * ((data->localData[0]->realVars[2730] /* spar.body.body.Q[2] DUMMY_STATE */)) + (((modelica_real)(data->localData[0]->integerVars[1] /* $STATESET1.A[1,2] variable */))) * ((data->localData[0]->realVars[2731] /* spar.body.body.Q[3] DUMMY_STATE */)) + (((modelica_real)(data->localData[0]->integerVars[0] /* $STATESET1.A[1,1] variable */))) * ((data->localData[0]->realVars[2732] /* spar.body.body.Q[4] DUMMY_STATE */)) - (data->localData[0]->realVars[0] /* $STATESET1.x[1] STATE(1) */);

  res[2] = (((modelica_real)(data->localData[0]->integerVars[7] /* $STATESET1.A[2,4] variable */))) * ((data->localData[0]->realVars[2729] /* spar.body.body.Q[1] DUMMY_STATE */)) + (((modelica_real)(data->localData[0]->integerVars[6] /* $STATESET1.A[2,3] variable */))) * ((data->localData[0]->realVars[2730] /* spar.body.body.Q[2] DUMMY_STATE */)) + (((modelica_real)(data->localData[0]->integerVars[5] /* $STATESET1.A[2,2] variable */))) * ((data->localData[0]->realVars[2731] /* spar.body.body.Q[3] DUMMY_STATE */)) + (((modelica_real)(data->localData[0]->integerVars[4] /* $STATESET1.A[2,1] variable */))) * ((data->localData[0]->realVars[2732] /* spar.body.body.Q[4] DUMMY_STATE */)) - (data->localData[0]->realVars[1] /* $STATESET1.x[2] STATE(1) */);

  res[3] = (((modelica_real)(data->localData[0]->integerVars[11] /* $STATESET1.A[3,4] variable */))) * ((data->localData[0]->realVars[2729] /* spar.body.body.Q[1] DUMMY_STATE */)) + (((modelica_real)(data->localData[0]->integerVars[10] /* $STATESET1.A[3,3] variable */))) * ((data->localData[0]->realVars[2730] /* spar.body.body.Q[2] DUMMY_STATE */)) + (((modelica_real)(data->localData[0]->integerVars[9] /* $STATESET1.A[3,2] variable */))) * ((data->localData[0]->realVars[2731] /* spar.body.body.Q[3] DUMMY_STATE */)) + (((modelica_real)(data->localData[0]->integerVars[8] /* $STATESET1.A[3,1] variable */))) * ((data->localData[0]->realVars[2732] /* spar.body.body.Q[4] DUMMY_STATE */)) - (data->localData[0]->realVars[2] /* $STATESET1.x[3] STATE(1) */);
  /* restore known outputs */
  TRACE_POP
}

OMC_DISABLE_OPT
void initializeSparsePatternNLS3687(NONLINEAR_SYSTEM_DATA* inSysData)
{
  int i=0;
  const int colPtrIndex[1+4] = {0,4,4,4,4};
  const int rowIndex[16] = {0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3};
  /* sparsity pattern available */
  inSysData->isPatternAvailable = TRUE;
  inSysData->sparsePattern = allocSparsePattern(4, 16, 4);
  
  /* write lead index of compressed sparse column */
  memcpy(inSysData->sparsePattern->leadindex, colPtrIndex, (4+1)*sizeof(unsigned int));
  
  for(i=2;i<4+1;++i)
    inSysData->sparsePattern->leadindex[i] += inSysData->sparsePattern->leadindex[i-1];
  
  /* call sparse index */
  memcpy(inSysData->sparsePattern->index, rowIndex, 16*sizeof(unsigned int));
  
  /* write color array */
  /* color 1 with 1 columns */
  const int indices_1[1] = {3};
  for(i=0; i<1; i++)
    inSysData->sparsePattern->colorCols[indices_1[i]] = 1;
  
  /* color 2 with 1 columns */
  const int indices_2[1] = {2};
  for(i=0; i<1; i++)
    inSysData->sparsePattern->colorCols[indices_2[i]] = 2;
  
  /* color 3 with 1 columns */
  const int indices_3[1] = {1};
  for(i=0; i<1; i++)
    inSysData->sparsePattern->colorCols[indices_3[i]] = 3;
  
  /* color 4 with 1 columns */
  const int indices_4[1] = {0};
  for(i=0; i<1; i++)
    inSysData->sparsePattern->colorCols[indices_4[i]] = 4;
}

void freeSparsePatternNLS3687(NONLINEAR_SYSTEM_DATA* inSysData)
{
  if (inSysData->isPatternAvailable) {
    freeSparsePattern(inSysData->sparsePattern);
    free(inSysData->sparsePattern);
    inSysData->sparsePattern = NULL;
    inSysData->isPatternAvailable = FALSE;
  }
}
OMC_DISABLE_OPT
void initializeNonlinearPatternNLS3687(NONLINEAR_SYSTEM_DATA* inSysData)
{
  int i=0;
  inSysData->nonlinearPattern = (NONLINEAR_PATTERN*) malloc(sizeof(NONLINEAR_PATTERN));
  inSysData->nonlinearPattern->numberOfVars = 4;
  inSysData->nonlinearPattern->numberOfEqns = 4;
  inSysData->nonlinearPattern->numberOfNonlinear = 4;
  inSysData->nonlinearPattern->indexVar = (unsigned int*) malloc((4+1)*sizeof(unsigned int));
  inSysData->nonlinearPattern->indexEqn = (unsigned int*) malloc((4+1)*sizeof(unsigned int));
  inSysData->nonlinearPattern->columns = (unsigned int*) malloc(4*sizeof(unsigned int));
  inSysData->nonlinearPattern->rows = (unsigned int*) malloc(4*sizeof(unsigned int));
  /* initialize and accumulate index vectors */
  const int index_var[1+4] = {0,4,0,0,0};
  const int index_eqn[1+4] = {0,4,0,0,0};
  memcpy(inSysData->nonlinearPattern->indexVar, index_var, (4+1)*sizeof(unsigned int));
  memcpy(inSysData->nonlinearPattern->indexEqn, index_eqn, (4+1)*sizeof(unsigned int));
  for(i=2;i<4+1;++i)
    inSysData->nonlinearPattern->indexVar[i] += inSysData->nonlinearPattern->indexVar[i-1];
  for(i=2;i<4+1;++i)
    inSysData->nonlinearPattern->indexEqn[i] += inSysData->nonlinearPattern->indexEqn[i-1];
  /* initialize columns and rows */
  const int columns[4] = {0,1,2,3};
  const int rows[4] = {0,0,0,0};
  memcpy(inSysData->nonlinearPattern->columns, columns, 4*sizeof(unsigned int));
  memcpy(inSysData->nonlinearPattern->rows, rows, 4*sizeof(unsigned int));
}

OMC_DISABLE_OPT
void initializeStaticDataNLS3687(DATA* data, threadData_t *threadData, NONLINEAR_SYSTEM_DATA *sysData, modelica_boolean initSparsePattern, modelica_boolean initNonlinearPattern)
{
  int i=0;
  /* static nls data for spar.body.body.Q[3] */
  sysData->nominal[i] = data->modelData->realVarsData[2731].attribute /* spar.body.body.Q[3] */.nominal;
  sysData->min[i]     = data->modelData->realVarsData[2731].attribute /* spar.body.body.Q[3] */.min;
  sysData->max[i++]   = data->modelData->realVarsData[2731].attribute /* spar.body.body.Q[3] */.max;
  /* static nls data for spar.body.body.Q[4] */
  sysData->nominal[i] = data->modelData->realVarsData[2732].attribute /* spar.body.body.Q[4] */.nominal;
  sysData->min[i]     = data->modelData->realVarsData[2732].attribute /* spar.body.body.Q[4] */.min;
  sysData->max[i++]   = data->modelData->realVarsData[2732].attribute /* spar.body.body.Q[4] */.max;
  /* static nls data for spar.body.body.Q[2] */
  sysData->nominal[i] = data->modelData->realVarsData[2730].attribute /* spar.body.body.Q[2] */.nominal;
  sysData->min[i]     = data->modelData->realVarsData[2730].attribute /* spar.body.body.Q[2] */.min;
  sysData->max[i++]   = data->modelData->realVarsData[2730].attribute /* spar.body.body.Q[2] */.max;
  /* static nls data for spar.body.body.Q[1] */
  sysData->nominal[i] = data->modelData->realVarsData[2729].attribute /* spar.body.body.Q[1] */.nominal;
  sysData->min[i]     = data->modelData->realVarsData[2729].attribute /* spar.body.body.Q[1] */.min;
  sysData->max[i++]   = data->modelData->realVarsData[2729].attribute /* spar.body.body.Q[1] */.max;
  /* initial sparse pattern */
  if (initSparsePattern) {
    initializeSparsePatternNLS3687(sysData);
  }
  if (initNonlinearPattern) {
    initializeNonlinearPatternNLS3687(sysData);
  }
}

OMC_DISABLE_OPT
void freeStaticDataNLS3687(DATA* data, threadData_t *threadData, NONLINEAR_SYSTEM_DATA *sysData)
{
  freeSparsePatternNLS3687(sysData);
}

OMC_DISABLE_OPT
void getIterationVarsNLS3687(DATA* data, double *array)
{
  array[0] = (data->localData[0]->realVars[2731] /* spar.body.body.Q[3] DUMMY_STATE */);
  array[1] = (data->localData[0]->realVars[2732] /* spar.body.body.Q[4] DUMMY_STATE */);
  array[2] = (data->localData[0]->realVars[2730] /* spar.body.body.Q[2] DUMMY_STATE */);
  array[3] = (data->localData[0]->realVars[2729] /* spar.body.body.Q[1] DUMMY_STATE */);
}

/* Prototypes for the strict sets (Dynamic Tearing) */

/* Global constraints for the casual sets */
/* function initialize non-linear systems */
void OET_Example_multibodyWECSingleDoF_initialNonLinearSystem(int nNonLinearSystems, NONLINEAR_SYSTEM_DATA* nonLinearSystemData)
{
  
  nonLinearSystemData[1].equationIndex = 3687;
  nonLinearSystemData[1].size = 4;
  nonLinearSystemData[1].homotopySupport = 0 /* false */;
  nonLinearSystemData[1].mixedSystem = 0 /* false */;
  nonLinearSystemData[1].residualFunc = residualFunc3687;
  nonLinearSystemData[1].strictTearingFunctionCall = NULL;
  nonLinearSystemData[1].analyticalJacobianColumn = OET_Example_multibodyWECSingleDoF_functionJacNLSJac4_column;
  nonLinearSystemData[1].initialAnalyticalJacobian = OET_Example_multibodyWECSingleDoF_initialAnalyticJacobianNLSJac4;
  nonLinearSystemData[1].jacobianIndex = 3 /*jacInx*/;
  nonLinearSystemData[1].initializeStaticNLSData = initializeStaticDataNLS3687;
  nonLinearSystemData[1].freeStaticNLSData = freeStaticDataNLS3687;
  nonLinearSystemData[1].getIterationVars = getIterationVarsNLS3687;
  nonLinearSystemData[1].checkConstraints = NULL;
  
  
  nonLinearSystemData[0].equationIndex = 3189;
  nonLinearSystemData[0].size = 4;
  nonLinearSystemData[0].homotopySupport = 0 /* false */;
  nonLinearSystemData[0].mixedSystem = 0 /* false */;
  nonLinearSystemData[0].residualFunc = residualFunc3189;
  nonLinearSystemData[0].strictTearingFunctionCall = NULL;
  nonLinearSystemData[0].analyticalJacobianColumn = OET_Example_multibodyWECSingleDoF_functionJacNLSJac2_column;
  nonLinearSystemData[0].initialAnalyticalJacobian = OET_Example_multibodyWECSingleDoF_initialAnalyticJacobianNLSJac2;
  nonLinearSystemData[0].jacobianIndex = 1 /*jacInx*/;
  nonLinearSystemData[0].initializeStaticNLSData = initializeStaticDataNLS3189;
  nonLinearSystemData[0].freeStaticNLSData = freeStaticDataNLS3189;
  nonLinearSystemData[0].getIterationVars = getIterationVarsNLS3189;
  nonLinearSystemData[0].checkConstraints = NULL;
}

#if defined(__cplusplus)
}
#endif

