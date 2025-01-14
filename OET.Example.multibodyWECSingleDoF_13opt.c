/* Optimization */
#include "OET.Example.multibodyWECSingleDoF_model.h"
#include "OET.Example.multibodyWECSingleDoF_12jac.h"
#if defined(__cplusplus)
extern "C" {
#endif
int OET_Example_multibodyWECSingleDoF_mayer(DATA* data, modelica_real** res,short *i) {
  throwStreamPrint(NULL, "The model was not compiled with -g=Optimica and the corresponding goal function. The optimization solver cannot be used.");
  return 0;
}
int OET_Example_multibodyWECSingleDoF_lagrange(DATA* data, modelica_real** res, short * i1, short*i2) {
  throwStreamPrint(NULL, "The model was not compiled with -g=Optimica and the corresponding goal function. The optimization solver cannot be used.");
  return 0;
}
int OET_Example_multibodyWECSingleDoF_pickUpBoundsForInputsInOptimization(DATA* data, modelica_real* min, modelica_real* max, modelica_real*nominal, modelica_boolean *useNominal, char ** name, modelica_real * start, modelica_real * startTimeOpt) {
  throwStreamPrint(NULL, "The model was not compiled with -g=Optimica and the corresponding goal function. The optimization solver cannot be used.");
  return 0;
}
int OET_Example_multibodyWECSingleDoF_setInputData(DATA *data, const modelica_boolean file) {
  throwStreamPrint(NULL, "The model was not compiled with -g=Optimica and the corresponding goal function. The optimization solver cannot be used.");
  return 0;
}
int OET_Example_multibodyWECSingleDoF_getTimeGrid(DATA *data, modelica_integer * nsi, modelica_real**t) {
  throwStreamPrint(NULL, "The model was not compiled with -g=Optimica and the corresponding goal function. The optimization solver cannot be used.");
  return 0;
}
#if defined(__cplusplus)
}
#endif