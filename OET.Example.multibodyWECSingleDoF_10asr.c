/* Asserts */
#include "OET.Example.multibodyWECSingleDoF_model.h"
#if defined(__cplusplus)
extern "C" {
#endif


/*
equation index: 7655
type: ALGORITHM

  assert(environment.SSE >= 0.0, "Variable violating min constraint: 0.0 <= environment.SSE, has value: " + String(environment.SSE, "g"));
*/
void OET_Example_multibodyWECSingleDoF_eqFunction_7655(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,7655};
  modelica_boolean tmp0;
  static const MMC_DEFSTRINGLIT(tmp1,70,"Variable violating min constraint: 0.0 <= environment.SSE, has value: ");
  modelica_string tmp2;
  modelica_metatype tmpMeta3;
  static int tmp4 = 0;
  if(!tmp4)
  {
    tmp0 = GreaterEq((data->localData[0]->realVars[467] /* environment.SSE variable */),0.0);
    if(!tmp0)
    {
      tmp2 = modelica_real_to_modelica_string_format((data->localData[0]->realVars[467] /* environment.SSE variable */), (modelica_string) mmc_strings_len1[103]);
      tmpMeta3 = stringAppend(MMC_REFSTRINGLIT(tmp1),tmp2);
      {
        const char* assert_cond = "(environment.SSE >= 0.0)";
        if (data->simulationInfo->noThrowAsserts) {
          FILE_INFO info = {"c:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/OET.mo",2903,7,2903,63,0};
          infoStreamPrintWithEquationIndexes(LOG_ASSERT, info, 0, equationIndexes, "The following assertion has been violated %sat time %f\n(%s) --> \"%s\"", initial() ? "during initialization " : "", data->localData[0]->timeValue, assert_cond, MMC_STRINGDATA(tmpMeta3));
        } else {
          FILE_INFO info = {"c:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/OET.mo",2903,7,2903,63,0};
          omc_assert_warning_withEquationIndexes(info, equationIndexes, "The following assertion has been violated %sat time %f\n(%s) --> \"%s\"", initial() ? "during initialization " : "", data->localData[0]->timeValue, assert_cond, MMC_STRINGDATA(tmpMeta3));
        }
      }
      tmp4 = 1;
    }
  }
  TRACE_POP
}
/* function to check assert after a step is done */
OMC_DISABLE_OPT
int OET_Example_multibodyWECSingleDoF_checkForAsserts(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  OET_Example_multibodyWECSingleDoF_eqFunction_7655(data, threadData);
  
  TRACE_POP
  return 0;
}

#if defined(__cplusplus)
}
#endif

