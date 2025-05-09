/* Initialization */
#include "inerter_test2_model.h"
#include "inerter_test2_11mix.h"
#include "inerter_test2_12jac.h"
#if defined(__cplusplus)
extern "C" {
#endif

void inerter_test2_functionInitialEquations_0(DATA *data, threadData_t *threadData);
void inerter_test2_functionInitialEquations_1(DATA *data, threadData_t *threadData);

int inerter_test2_functionInitialEquations(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  data->simulationInfo->discreteCall = 1;
  inerter_test2_functionInitialEquations_0(data, threadData);
  inerter_test2_functionInitialEquations_1(data, threadData);
  data->simulationInfo->discreteCall = 0;
  
  TRACE_POP
  return 0;
}

/* No inerter_test2_functionInitialEquations_lambda0 function */

int inerter_test2_functionRemovedInitialEquations(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int *equationIndexes = NULL;
  double res = 0.0;

  
  TRACE_POP
  return 0;
}


#if defined(__cplusplus)
}
#endif

