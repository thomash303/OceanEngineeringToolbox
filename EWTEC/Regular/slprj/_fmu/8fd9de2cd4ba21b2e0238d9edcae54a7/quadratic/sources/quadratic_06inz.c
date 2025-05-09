/* Initialization */
#include "quadratic_model.h"
#include "quadratic_11mix.h"
#include "quadratic_12jac.h"
#if defined(__cplusplus)
extern "C" {
#endif

void quadratic_functionInitialEquations_0(DATA *data, threadData_t *threadData);
extern void quadratic_eqFunction_2(DATA *data, threadData_t *threadData);

OMC_DISABLE_OPT
void quadratic_functionInitialEquations_0(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  quadratic_eqFunction_2(data, threadData);
  TRACE_POP
}

int quadratic_functionInitialEquations(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  data->simulationInfo->discreteCall = 1;
  quadratic_functionInitialEquations_0(data, threadData);
  data->simulationInfo->discreteCall = 0;
  
  TRACE_POP
  return 0;
}

/* No quadratic_functionInitialEquations_lambda0 function */

int quadratic_functionRemovedInitialEquations(DATA *data, threadData_t *threadData)
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

