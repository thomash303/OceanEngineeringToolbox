/* External objects file */
#include "OET.Example.multibodyWECSingleDoF_model.h"
#if defined(__cplusplus)
extern "C" {
#endif

void OET_Example_multibodyWECSingleDoF_callExternalObjectDestructors(DATA *data, threadData_t *threadData)
{
  if(data->simulationInfo->extObjs)
  {
    free(data->simulationInfo->extObjs);
    data->simulationInfo->extObjs = 0;
  }
}
#if defined(__cplusplus)
}
#endif

