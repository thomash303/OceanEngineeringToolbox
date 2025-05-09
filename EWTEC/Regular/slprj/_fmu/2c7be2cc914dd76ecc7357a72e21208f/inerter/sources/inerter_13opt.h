#if defined(__cplusplus)
  extern "C" {
#endif
  int inerter_mayer(DATA* data, modelica_real** res, short*);
  int inerter_lagrange(DATA* data, modelica_real** res, short *, short *);
  int inerter_pickUpBoundsForInputsInOptimization(DATA* data, modelica_real* min, modelica_real* max, modelica_real*nominal, modelica_boolean *useNominal, char ** name, modelica_real * start, modelica_real * startTimeOpt);
  int inerter_setInputData(DATA *data, const modelica_boolean file);
  int inerter_getTimeGrid(DATA *data, modelica_integer * nsi, modelica_real**t);
#if defined(__cplusplus)
}
#endif