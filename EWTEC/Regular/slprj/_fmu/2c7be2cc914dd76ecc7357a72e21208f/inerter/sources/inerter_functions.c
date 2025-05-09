#include "omc_simulation_settings.h"
#include "inerter_functions.h"
#ifdef __cplusplus
extern "C" {
#endif

#include "inerter_includes.h"


DLLDirection
modelica_real omc_Modelica_Math_Vectors_length(threadData_t *threadData, real_array _v)
{
  modelica_real _result;
  modelica_real tmp1;
  _tailrecursive: OMC_LABEL_UNUSED
  // _result has no default value.
  tmp1 = mul_real_scalar_product(_v, _v);
  if(!(tmp1 >= 0.0))
  {
    FILE_INFO info = {"",0,0,0,0,0};
    omc_assert(threadData, info, "Model error: Argument of sqrt(v * v) was %g should be >= 0", tmp1);
  }
  _result = sqrt(tmp1);
  _return: OMC_LABEL_UNUSED
  return _result;
}
modelica_metatype boxptr_Modelica_Math_Vectors_length(threadData_t *threadData, modelica_metatype _v)
{
  modelica_real _result;
  modelica_metatype out_result;
  _result = omc_Modelica_Math_Vectors_length(threadData, *((base_array_t*)_v));
  out_result = mmc_mk_rcon(_result);
  return out_result;
}

DLLDirection
real_array omc_Modelica_Math_Vectors_normalize(threadData_t *threadData, real_array _v, modelica_real _eps)
{
  real_array _result;
  modelica_integer tmp1;
  modelica_boolean tmp2;
  real_array tmp3;
  _tailrecursive: OMC_LABEL_UNUSED
  tmp1 = size_of_dimension_base_array(_v, ((modelica_integer) 1));
  alloc_real_array(&(_result), 1, (_index_t)tmp1); // _result has no default value.
  tmp2 = (modelica_boolean)(omc_Modelica_Math_Vectors_length(threadData, _v) >= _eps);
  if(tmp2)
  {
    tmp3 = div_alloc_real_array_scalar(_v, omc_Modelica_Math_Vectors_length(threadData, _v));
  }
  else
  {
    tmp3 = div_alloc_real_array_scalar(_v, _eps);
  }
  real_array_copy_data(tmp3, _result);
  _return: OMC_LABEL_UNUSED
  return _result;
}
modelica_metatype boxptr_Modelica_Math_Vectors_normalize(threadData_t *threadData, modelica_metatype _v, modelica_metatype _eps)
{
  modelica_real tmp1;
  real_array _result;
  modelica_integer tmp2;
  modelica_metatype out_result;
  tmp1 = mmc_unbox_real(_eps);
  _result = omc_Modelica_Math_Vectors_normalize(threadData, *((base_array_t*)_v), tmp1);
  out_result = mmc_mk_modelica_array(_result);
  return out_result;
}

Modelica_Mechanics_MultiBody_Frames_Orientation omc_Modelica_Mechanics_MultiBody_Frames_Orientation(threadData_t *threadData, real_array omc_T, real_array omc_w)
{
  Modelica_Mechanics_MultiBody_Frames_Orientation tmp1;
  tmp1._T = omc_T;
  tmp1._w = omc_w;
  return tmp1;
}

modelica_metatype boxptr_Modelica_Mechanics_MultiBody_Frames_Orientation(threadData_t *threadData, modelica_metatype _T, modelica_metatype _w)
{
  return mmc_mk_box3(3, &Modelica_Mechanics_MultiBody_Frames_Orientation__desc, _T, _w);
}

DLLDirection
real_array omc_Modelica_Mechanics_MultiBody_Frames_resolve2(threadData_t *threadData, Modelica_Mechanics_MultiBody_Frames_Orientation _R, real_array _v1)
{
  real_array _v2;
  real_array tmp1;
  _tailrecursive: OMC_LABEL_UNUSED
  alloc_real_array(&(_v2), 1, (_index_t)3); // _v2 has no default value.
  array_alloc_scalar_real_array(&tmp1, 3, (modelica_real)(real_array_get(_R._T, 2, ((modelica_integer) 1), ((modelica_integer) 1))) * (real_array_get(_v1, 1, ((modelica_integer) 1))) + (real_array_get(_R._T, 2, ((modelica_integer) 1), ((modelica_integer) 2))) * (real_array_get(_v1, 1, ((modelica_integer) 2))) + (real_array_get(_R._T, 2, ((modelica_integer) 1), ((modelica_integer) 3))) * (real_array_get(_v1, 1, ((modelica_integer) 3))), (modelica_real)(real_array_get(_R._T, 2, ((modelica_integer) 2), ((modelica_integer) 1))) * (real_array_get(_v1, 1, ((modelica_integer) 1))) + (real_array_get(_R._T, 2, ((modelica_integer) 2), ((modelica_integer) 2))) * (real_array_get(_v1, 1, ((modelica_integer) 2))) + (real_array_get(_R._T, 2, ((modelica_integer) 2), ((modelica_integer) 3))) * (real_array_get(_v1, 1, ((modelica_integer) 3))), (modelica_real)(real_array_get(_R._T, 2, ((modelica_integer) 3), ((modelica_integer) 1))) * (real_array_get(_v1, 1, ((modelica_integer) 1))) + (real_array_get(_R._T, 2, ((modelica_integer) 3), ((modelica_integer) 2))) * (real_array_get(_v1, 1, ((modelica_integer) 2))) + (real_array_get(_R._T, 2, ((modelica_integer) 3), ((modelica_integer) 3))) * (real_array_get(_v1, 1, ((modelica_integer) 3))));
  real_array_copy_data(tmp1, _v2);
  _return: OMC_LABEL_UNUSED
  return _v2;
}
modelica_metatype boxptr_Modelica_Mechanics_MultiBody_Frames_resolve2(threadData_t *threadData, modelica_metatype _R, modelica_metatype _v1)
{
  Modelica_Mechanics_MultiBody_Frames_Orientation tmp1;
  modelica_metatype tmpMeta2;
  modelica_metatype tmpMeta3;
  real_array _v2;
  modelica_metatype out_v2;
  tmpMeta2 = (MMC_FETCH(MMC_OFFSET(MMC_UNTAGPTR(_R), 2)));
  tmp1._T = *((base_array_t*)tmpMeta2);
  tmpMeta3 = (MMC_FETCH(MMC_OFFSET(MMC_UNTAGPTR(_R), 3)));
  tmp1._w = *((base_array_t*)tmpMeta3);
  _v2 = omc_Modelica_Mechanics_MultiBody_Frames_resolve2(threadData, tmp1, *((base_array_t*)_v1));
  out_v2 = mmc_mk_modelica_array(_v2);
  return out_v2;
}

DLLDirection
real_array omc_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_from__nxy(threadData_t *threadData, real_array _n_x, real_array _n_y)
{
  real_array _T;
  real_array _e_x;
  modelica_boolean tmp1;
  real_array tmp2;
  real_array _e_y;
  modelica_boolean tmp3;
  real_array tmp4;
  real_array _n_z_aux;
  real_array tmp5;
  real_array _n_y_aux;
  modelica_boolean tmp6;
  real_array tmp7;
  modelica_boolean tmp8;
  real_array tmp9;
  real_array _e_z_aux;
  real_array tmp10;
  real_array _e_z;
  real_array tmp11;
  real_array tmp12;
  _tailrecursive: OMC_LABEL_UNUSED
  alloc_real_array(&(_T), 2, (_index_t)3, (_index_t)3); // _T has no default value.
  alloc_real_array(&(_e_x), 1, (_index_t)3);
  tmp1 = (modelica_boolean)(omc_Modelica_Math_Vectors_length(threadData, _n_x) < 1e-10);
  if(tmp1)
  {
    tmp2 = _OMC_LIT1;
  }
  else
  {
    tmp2 = omc_Modelica_Math_Vectors_normalize(threadData, _n_x, 1e-13);
  }
  real_array_copy_data(tmp2, _e_x);
  
  alloc_real_array(&(_e_y), 1, (_index_t)3);
  tmp3 = (modelica_boolean)(omc_Modelica_Math_Vectors_length(threadData, _n_y) < 1e-10);
  if(tmp3)
  {
    tmp4 = _OMC_LIT2;
  }
  else
  {
    tmp4 = omc_Modelica_Math_Vectors_normalize(threadData, _n_y, 1e-13);
  }
  real_array_copy_data(tmp4, _e_y);
  
  alloc_real_array(&(_n_z_aux), 1, (_index_t)3);
  array_alloc_scalar_real_array(&tmp5, 3, (modelica_real)(real_array_get(_e_x, 1, ((modelica_integer) 2))) * (real_array_get(_e_y, 1, ((modelica_integer) 3))) - ((real_array_get(_e_x, 1, ((modelica_integer) 3))) * (real_array_get(_e_y, 1, ((modelica_integer) 2)))), (modelica_real)(real_array_get(_e_x, 1, ((modelica_integer) 3))) * (real_array_get(_e_y, 1, ((modelica_integer) 1))) - ((real_array_get(_e_x, 1, ((modelica_integer) 1))) * (real_array_get(_e_y, 1, ((modelica_integer) 3)))), (modelica_real)(real_array_get(_e_x, 1, ((modelica_integer) 1))) * (real_array_get(_e_y, 1, ((modelica_integer) 2))) - ((real_array_get(_e_x, 1, ((modelica_integer) 2))) * (real_array_get(_e_y, 1, ((modelica_integer) 1)))));
  real_array_copy_data(tmp5, _n_z_aux);
  
  alloc_real_array(&(_n_y_aux), 1, (_index_t)3);
  tmp8 = (modelica_boolean)((real_array_get(_n_z_aux, 1, ((modelica_integer) 1))) * (real_array_get(_n_z_aux, 1, ((modelica_integer) 1))) + (real_array_get(_n_z_aux, 1, ((modelica_integer) 2))) * (real_array_get(_n_z_aux, 1, ((modelica_integer) 2))) + (real_array_get(_n_z_aux, 1, ((modelica_integer) 3))) * (real_array_get(_n_z_aux, 1, ((modelica_integer) 3))) > 1e-6);
  if(tmp8)
  {
    tmp9 = _e_y;
  }
  else
  {
    tmp6 = (modelica_boolean)(fabs(real_array_get(_e_x, 1, ((modelica_integer) 1))) > 1e-6);
    if(tmp6)
    {
      tmp7 = _OMC_LIT2;
    }
    else
    {
      tmp7 = _OMC_LIT1;
    }
    tmp9 = tmp7;
  }
  real_array_copy_data(tmp9, _n_y_aux);
  
  alloc_real_array(&(_e_z_aux), 1, (_index_t)3);
  array_alloc_scalar_real_array(&tmp10, 3, (modelica_real)(real_array_get(_e_x, 1, ((modelica_integer) 2))) * (real_array_get(_n_y_aux, 1, ((modelica_integer) 3))) - ((real_array_get(_e_x, 1, ((modelica_integer) 3))) * (real_array_get(_n_y_aux, 1, ((modelica_integer) 2)))), (modelica_real)(real_array_get(_e_x, 1, ((modelica_integer) 3))) * (real_array_get(_n_y_aux, 1, ((modelica_integer) 1))) - ((real_array_get(_e_x, 1, ((modelica_integer) 1))) * (real_array_get(_n_y_aux, 1, ((modelica_integer) 3)))), (modelica_real)(real_array_get(_e_x, 1, ((modelica_integer) 1))) * (real_array_get(_n_y_aux, 1, ((modelica_integer) 2))) - ((real_array_get(_e_x, 1, ((modelica_integer) 2))) * (real_array_get(_n_y_aux, 1, ((modelica_integer) 1)))));
  real_array_copy_data(tmp10, _e_z_aux);
  
  alloc_real_array(&(_e_z), 1, (_index_t)3);
  real_array_copy_data(omc_Modelica_Math_Vectors_normalize(threadData, _e_z_aux, 1e-13), _e_z);
  
  array_alloc_scalar_real_array(&tmp12, 3, (modelica_real)(real_array_get(_e_z, 1, ((modelica_integer) 2))) * (real_array_get(_e_x, 1, ((modelica_integer) 3))) - ((real_array_get(_e_z, 1, ((modelica_integer) 3))) * (real_array_get(_e_x, 1, ((modelica_integer) 2)))), (modelica_real)(real_array_get(_e_z, 1, ((modelica_integer) 3))) * (real_array_get(_e_x, 1, ((modelica_integer) 1))) - ((real_array_get(_e_z, 1, ((modelica_integer) 1))) * (real_array_get(_e_x, 1, ((modelica_integer) 3)))), (modelica_real)(real_array_get(_e_z, 1, ((modelica_integer) 1))) * (real_array_get(_e_x, 1, ((modelica_integer) 2))) - ((real_array_get(_e_z, 1, ((modelica_integer) 2))) * (real_array_get(_e_x, 1, ((modelica_integer) 1)))));
  array_alloc_real_array(&tmp11, 3, _e_x, tmp12, _e_z);
  real_array_copy_data(tmp11, _T);
  _return: OMC_LABEL_UNUSED
  return _T;
}
modelica_metatype boxptr_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_from__nxy(threadData_t *threadData, modelica_metatype _n_x, modelica_metatype _n_y)
{
  real_array _T;
  modelica_metatype out_T;
  _T = omc_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_from__nxy(threadData, *((base_array_t*)_n_x), *((base_array_t*)_n_y));
  out_T = mmc_mk_modelica_array(_T);
  return out_T;
}

#ifdef __cplusplus
}
#endif
