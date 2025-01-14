#if defined(__cplusplus)
  extern "C" {
#endif
  int OET_Example_multibodyWECSingleDoF_mayer(DATA* data, modelica_real** res, short*);
  int OET_Example_multibodyWECSingleDoF_lagrange(DATA* data, modelica_real** res, short *, short *);
  int OET_Example_multibodyWECSingleDoF_pickUpBoundsForInputsInOptimization(DATA* data, modelica_real* min, modelica_real* max, modelica_real*nominal, modelica_boolean *useNominal, char ** name, modelica_real * start, modelica_real * startTimeOpt);
  int OET_Example_multibodyWECSingleDoF_setInputData(DATA *data, const modelica_boolean file);
  int OET_Example_multibodyWECSingleDoF_getTimeGrid(DATA *data, modelica_integer * nsi, modelica_real**t);
#if defined(__cplusplus)
}
#endif