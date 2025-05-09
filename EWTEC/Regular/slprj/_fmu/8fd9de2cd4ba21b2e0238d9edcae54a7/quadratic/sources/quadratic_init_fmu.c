#include "simulation_data.h"

OMC_DISABLE_OPT

void quadratic_read_simulation_info(SIMULATION_INFO* simulationInfo)
{
  simulationInfo->startTime = 0.0;
  simulationInfo->stopTime = 1.0;
  simulationInfo->stepSize = 0.002;
  simulationInfo->tolerance = 1e-6;
  simulationInfo->solverMethod = "dassl";
  simulationInfo->outputFormat = "mat";
  simulationInfo->variableFilter = ".*";
  simulationInfo->OPENMODELICAHOME = "C:/Program Files/OpenModelica1.24.3-64bit";
}

void quadratic_read_input_fmu(MODEL_DATA* modelData)
{
  modelData->realVarsData[0].info.id = 1000;
  modelData->realVarsData[0].info.name = "u";
  modelData->realVarsData[0].info.comment = "";
  modelData->realVarsData[0].info.info.filename = "quadratic";
  modelData->realVarsData[0].info.info.lineStart = 2;
  modelData->realVarsData[0].info.info.colStart = 3;
  modelData->realVarsData[0].info.info.lineEnd = 3;
  modelData->realVarsData[0].info.info.colEnd = 157;
  modelData->realVarsData[0].info.info.readonly = 0;
  modelData->realVarsData[0].attribute.unit = "";
  modelData->realVarsData[0].attribute.displayUnit = "";
  modelData->realVarsData[0].attribute.min = -DBL_MAX;
  modelData->realVarsData[0].attribute.max = DBL_MAX;
  modelData->realVarsData[0].attribute.fixed = 1;
  modelData->realVarsData[0].attribute.useNominal = 0;
  modelData->realVarsData[0].attribute.nominal = 1.0;
  modelData->realVarsData[0].attribute.start = 0.0;
  modelData->realVarsData[1].info.id = 1001;
  modelData->realVarsData[1].info.name = "y";
  modelData->realVarsData[1].info.comment = "";
  modelData->realVarsData[1].info.info.filename = "quadratic";
  modelData->realVarsData[1].info.info.lineStart = 4;
  modelData->realVarsData[1].info.info.colStart = 3;
  modelData->realVarsData[1].info.info.lineEnd = 5;
  modelData->realVarsData[1].info.info.colEnd = 154;
  modelData->realVarsData[1].info.info.readonly = 0;
  modelData->realVarsData[1].attribute.unit = "";
  modelData->realVarsData[1].attribute.displayUnit = "";
  modelData->realVarsData[1].attribute.min = -DBL_MAX;
  modelData->realVarsData[1].attribute.max = DBL_MAX;
  modelData->realVarsData[1].attribute.fixed = 0;
  modelData->realVarsData[1].attribute.useNominal = 0;
  modelData->realVarsData[1].attribute.nominal = 1.0;
  modelData->realVarsData[1].attribute.start = 0.0;
  modelData->realParameterData[0].info.id = 1002;
  modelData->realParameterData[0].info.name = "gain.k";
  modelData->realParameterData[0].info.comment = "Gain value multiplied with input signal";
  modelData->realParameterData[0].info.info.filename = "C:/Users/thogan1/AppData/Roaming/.openmodelica/libraries/Modelica 4.0.0+maint.om/Blocks/Math.mo";
  modelData->realParameterData[0].info.info.lineStart = 543;
  modelData->realParameterData[0].info.info.colStart = 5;
  modelData->realParameterData[0].info.info.lineEnd = 544;
  modelData->realParameterData[0].info.info.colEnd = 48;
  modelData->realParameterData[0].info.info.readonly = 0;
  modelData->realParameterData[0].attribute.unit = "1";
  modelData->realParameterData[0].attribute.displayUnit = "";
  modelData->realParameterData[0].attribute.min = -DBL_MAX;
  modelData->realParameterData[0].attribute.max = DBL_MAX;
  modelData->realParameterData[0].attribute.fixed = 1;
  modelData->realParameterData[0].attribute.useNominal = 0;
  modelData->realParameterData[0].attribute.nominal = 1.0;
  modelData->realParameterData[0].attribute.start = 2.0;
}