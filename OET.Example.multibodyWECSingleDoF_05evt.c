/* Events: Sample, Zero Crossings, Relations, Discrete Changes */
#include "OET.Example.multibodyWECSingleDoF_model.h"
#if defined(__cplusplus)
extern "C" {
#endif

/* Initializes the raw time events of the simulation using the now
   calcualted parameters. */
void OET_Example_multibodyWECSingleDoF_function_initSample(DATA *data, threadData_t *threadData)
{
  long i=0;
}

const char *OET_Example_multibodyWECSingleDoF_zeroCrossingDescription(int i, int **out_EquationIndexes)
{
  static const char *res[] = {"time < environment.Trmp"};
  static const int occurEqs0[] = {1,3584};
  static const int *occurEqs[] = {occurEqs0};
  *out_EquationIndexes = (int*) occurEqs[i];
  return res[i];
}

/* forwarded equations */

int OET_Example_multibodyWECSingleDoF_function_ZeroCrossingsEquations(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  data->simulationInfo->callStatistics.functionZeroCrossingsEquations++;

  
  TRACE_POP
  return 0;
}

int OET_Example_multibodyWECSingleDoF_function_ZeroCrossings(DATA *data, threadData_t *threadData, double *gout)
{
  TRACE_PUSH
  const int *equationIndexes = NULL;

  modelica_boolean tmp4;
  modelica_real tmp5;
  modelica_real tmp6;

#if !defined(OMC_MINIMAL_RUNTIME)
  if (measure_time_flag) rt_tick(SIM_TIMER_ZC);
#endif
  data->simulationInfo->callStatistics.functionZeroCrossings++;

  tmp5 = 1.0;
  tmp6 = fabs((data->simulationInfo->realParameter[1] /* environment.Trmp PARAM */));
  tmp4 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[1] /* environment.Trmp PARAM */), tmp5, tmp6, data->simulationInfo->storedRelations[0]);
  gout[0] = (tmp4) ? 1 : -1;

#if !defined(OMC_MINIMAL_RUNTIME)
  if (measure_time_flag) rt_accumulate(SIM_TIMER_ZC);
#endif

  TRACE_POP
  return 0;
}

const char *OET_Example_multibodyWECSingleDoF_relationDescription(int i)
{
  const char *res[] = {"time < environment.Trmp"};
  return res[i];
}

int OET_Example_multibodyWECSingleDoF_function_updateRelations(DATA *data, threadData_t *threadData, int evalforZeroCross)
{
  TRACE_PUSH
  const int *equationIndexes = NULL;

  modelica_boolean tmp7;
  modelica_real tmp8;
  modelica_real tmp9;
  
  if(evalforZeroCross) {
    tmp8 = 1.0;
    tmp9 = fabs((data->simulationInfo->realParameter[1] /* environment.Trmp PARAM */));
    tmp7 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[1] /* environment.Trmp PARAM */), tmp8, tmp9, data->simulationInfo->storedRelations[0]);
    data->simulationInfo->relations[0] = tmp7;
  } else {
    data->simulationInfo->relations[0] = (data->localData[0]->timeValue < (data->simulationInfo->realParameter[1] /* environment.Trmp PARAM */));
  }
  
  TRACE_POP
  return 0;
}

#if defined(__cplusplus)
}
#endif

