/* Initialization */
#include "inerter_model.h"
#include "inerter_11mix.h"
#include "inerter_12jac.h"
#if defined(__cplusplus)
extern "C" {
#endif

void inerter_functionInitialEquations_0(DATA *data, threadData_t *threadData);
void inerter_functionInitialEquations_1(DATA *data, threadData_t *threadData);

int inerter_functionInitialEquations(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  data->simulationInfo->discreteCall = 1;
  inerter_functionInitialEquations_0(data, threadData);
  inerter_functionInitialEquations_1(data, threadData);
  data->simulationInfo->discreteCall = 0;
  
  TRACE_POP
  return 0;
}

/* No inerter_functionInitialEquations_lambda0 function */

int inerter_functionRemovedInitialEquations(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int *equationIndexes = NULL;
  double res = 0.0;

  res = (data->modelData->realVarsData[0] /* prismatic.s STATE(1,prismatic.v) */).attribute .start - (data->localData[0]->realVars[0] /* prismatic.s STATE(1,prismatic.v) */);
  if(fabs(res) > 1e-5)
  {
    errorStreamPrint(LOG_INIT, 0, "The initialization problem is inconsistent due to the following equation: 0 != %g = $START.prismatic.s - prismatic.s", res);
    return 1;
  }
  
  TRACE_POP
  return 0;
}


#if defined(__cplusplus)
}
#endif

