/* Initialization */
#include "OET.Example.multibodyWECSingleDoF_model.h"
#include "OET.Example.multibodyWECSingleDoF_11mix.h"
#include "OET.Example.multibodyWECSingleDoF_12jac.h"
#if defined(__cplusplus)
extern "C" {
#endif

void OET_Example_multibodyWECSingleDoF_functionInitialEquations_0(DATA *data, threadData_t *threadData);
void OET_Example_multibodyWECSingleDoF_functionInitialEquations_1(DATA *data, threadData_t *threadData);
void OET_Example_multibodyWECSingleDoF_functionInitialEquations_2(DATA *data, threadData_t *threadData);
void OET_Example_multibodyWECSingleDoF_functionInitialEquations_3(DATA *data, threadData_t *threadData);
void OET_Example_multibodyWECSingleDoF_functionInitialEquations_4(DATA *data, threadData_t *threadData);
void OET_Example_multibodyWECSingleDoF_functionInitialEquations_5(DATA *data, threadData_t *threadData);
void OET_Example_multibodyWECSingleDoF_functionInitialEquations_6(DATA *data, threadData_t *threadData);

int OET_Example_multibodyWECSingleDoF_functionInitialEquations(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  data->simulationInfo->discreteCall = 1;
  OET_Example_multibodyWECSingleDoF_functionInitialEquations_0(data, threadData);
  OET_Example_multibodyWECSingleDoF_functionInitialEquations_1(data, threadData);
  OET_Example_multibodyWECSingleDoF_functionInitialEquations_2(data, threadData);
  OET_Example_multibodyWECSingleDoF_functionInitialEquations_3(data, threadData);
  OET_Example_multibodyWECSingleDoF_functionInitialEquations_4(data, threadData);
  OET_Example_multibodyWECSingleDoF_functionInitialEquations_5(data, threadData);
  OET_Example_multibodyWECSingleDoF_functionInitialEquations_6(data, threadData);
  data->simulationInfo->discreteCall = 0;
  
  TRACE_POP
  return 0;
}

/* No OET_Example_multibodyWECSingleDoF_functionInitialEquations_lambda0 function */

int OET_Example_multibodyWECSingleDoF_functionRemovedInitialEquations(DATA *data, threadData_t *threadData)
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

