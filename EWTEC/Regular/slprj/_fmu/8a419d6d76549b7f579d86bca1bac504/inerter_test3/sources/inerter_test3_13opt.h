#if defined(__cplusplus)
  extern "C" {
#endif
  int inerter_test3_mayer(DATA* data, modelica_real** res, short*);
  int inerter_test3_lagrange(DATA* data, modelica_real** res, short *, short *);
  int inerter_test3_pickUpBoundsForInputsInOptimization(DATA* data, modelica_real* min, modelica_real* max, modelica_real*nominal, modelica_boolean *useNominal, char ** name, modelica_real * start, modelica_real * startTimeOpt);
  int inerter_test3_setInputData(DATA *data, const modelica_boolean file);
  int inerter_test3_getTimeGrid(DATA *data, modelica_integer * nsi, modelica_real**t);
#if defined(__cplusplus)
}
#endif