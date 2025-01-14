#include "omc_simulation_settings.h"
#include "OET.Example.multibodyWECSingleDoF_functions.h"
#ifdef __cplusplus
extern "C" {
#endif

#include "OET.Example.multibodyWECSingleDoF_includes.h"


DLLDirection
modelica_real omc_Modelica_Math_Vectors_interpolate(threadData_t *threadData, real_array _x, real_array _y, modelica_real _xi, modelica_integer _iLast, modelica_integer *out_iNew)
{
  modelica_real _yi;
  modelica_integer _iNew;
  modelica_integer _i;
  modelica_integer _nx;
  modelica_integer tmp1;
  modelica_real _x1;
  modelica_real _x2;
  modelica_real _y1;
  modelica_real _y2;
  static int tmp2 = 0;
  static int tmp3 = 0;
  modelica_real tmp4;
  _tailrecursive: OMC_LABEL_UNUSED
  // _yi has no default value.
  _iNew = ((modelica_integer) 1);
  // _i has no default value.
  tmp1 = size_of_dimension_base_array(_x, ((modelica_integer) 1));
  _nx = tmp1;
  // _x1 has no default value.
  // _x2 has no default value.
  // _y1 has no default value.
  // _y2 has no default value.
  {
    if(!(_nx > ((modelica_integer) 0)))
    {
      {
        FILE_INFO info = {"C:/Users/thogan1/AppData/Roaming/.openmodelica/libraries/Modelica 4.0.0+maint.om/Math/package.mo",514,5,514,68,0};
        omc_assert(threadData, info, MMC_STRINGDATA(_OMC_LIT0));
      }
    }
  }

  if((_nx == ((modelica_integer) 1)))
  {
    _yi = real_array_get(_y, 1, ((modelica_integer) 1));
  }
  else
  {
    _i = modelica_integer_min((modelica_integer)(modelica_integer_max((modelica_integer)(_iLast),(modelica_integer)(((modelica_integer) 1)))),(modelica_integer)(_nx - ((modelica_integer) 1)));

    if((_xi >= real_array_get(_x, 1, _i)))
    {
      while(1)
      {
        if(!((_i < _nx) && (_xi >= real_array_get(_x, 1, _i)))) break;
        _i = _i + ((modelica_integer) 1);
      }

      _i = _i - ((modelica_integer) 1);
    }
    else
    {
      while(1)
      {
        if(!((_i > ((modelica_integer) 1)) && (_xi < real_array_get(_x, 1, _i)))) break;
        _i = _i - ((modelica_integer) 1);
      }
    }

    _x1 = real_array_get(_x, 1, _i);

    _x2 = real_array_get(_x, 1, _i + ((modelica_integer) 1));

    _y1 = real_array_get(_y, 1, _i);

    _y2 = real_array_get(_y, 1, _i + ((modelica_integer) 1));

    {
      if(!(_x2 > _x1))
      {
        {
          FILE_INFO info = {"C:/Users/thogan1/AppData/Roaming/.openmodelica/libraries/Modelica 4.0.0+maint.om/Math/package.mo",539,7,539,73,0};
          omc_assert(threadData, info, MMC_STRINGDATA(_OMC_LIT1));
        }
      }
    }

    tmp4 = _x2 - _x1;
    if (tmp4 == 0) {throwStreamPrint(threadData, "Division by zero %s in function context", "(y2 - y1) * (xi - x1) / (x2 - x1)");}
    _yi = _y1 + ((_y2 - _y1) * (_xi - _x1)) / tmp4;

    _iNew = _i;
  }
  _return: OMC_LABEL_UNUSED
  if (out_iNew) { *out_iNew = _iNew; }
  return _yi;
}
modelica_metatype boxptr_Modelica_Math_Vectors_interpolate(threadData_t *threadData, modelica_metatype _x, modelica_metatype _y, modelica_metatype _xi, modelica_metatype _iLast, modelica_metatype *out_iNew)
{
  modelica_real tmp1;
  modelica_integer tmp2;
  modelica_integer _iNew;
  modelica_real _yi;
  modelica_metatype out_yi;
  tmp1 = mmc_unbox_real(_xi);
  tmp2 = mmc_unbox_integer(_iLast);
  _yi = omc_Modelica_Math_Vectors_interpolate(threadData, *((base_array_t*)_x), *((base_array_t*)_y), tmp1, tmp2, &_iNew);
  out_yi = mmc_mk_rcon(_yi);
  if (out_iNew) { *out_iNew = mmc_mk_icon(_iNew); }
  return out_yi;
}

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
real_array omc_Modelica_Mechanics_MultiBody_Frames_axesRotationsAngles(threadData_t *threadData, Modelica_Mechanics_MultiBody_Frames_Orientation _R, integer_array _sequence, modelica_real _guessAngle1)
{
  real_array _angles;
  real_array _e1_1;
  real_array _e2_1a;
  real_array _e3_1;
  real_array _e3_2;
  modelica_real _A;
  modelica_real _B;
  modelica_real _angle_1a;
  modelica_real _angle_1b;
  real_array _T_1a;
  static int tmp1 = 0;
  modelica_boolean tmp2;
  real_array tmp3;
  modelica_boolean tmp4;
  real_array tmp5;
  modelica_boolean tmp6;
  real_array tmp7;
  modelica_boolean tmp8;
  real_array tmp9;
  real_array tmp10;
  index_spec_t tmp11;
  modelica_boolean tmp12;
  real_array tmp13;
  modelica_boolean tmp14;
  real_array tmp15;
  _tailrecursive: OMC_LABEL_UNUSED
  alloc_real_array(&(_angles), 1, (_index_t)3); // _angles has no default value.
  alloc_real_array(&(_e1_1), 1, (_index_t)3); // _e1_1 has no default value.
  alloc_real_array(&(_e2_1a), 1, (_index_t)3); // _e2_1a has no default value.
  alloc_real_array(&(_e3_1), 1, (_index_t)3); // _e3_1 has no default value.
  alloc_real_array(&(_e3_2), 1, (_index_t)3); // _e3_2 has no default value.
  // _A has no default value.
  // _B has no default value.
  // _angle_1a has no default value.
  // _angle_1b has no default value.
  alloc_real_array(&(_T_1a), 2, (_index_t)3, (_index_t)3); // _T_1a has no default value.
  {
    if(!((integer_array_get(_sequence, 1, ((modelica_integer) 1)) != integer_array_get(_sequence, 1, ((modelica_integer) 2))) && (integer_array_get(_sequence, 1, ((modelica_integer) 2)) != integer_array_get(_sequence, 1, ((modelica_integer) 3)))))
    {
      {
        FILE_INFO info = {"C:/Users/thogan1/AppData/Roaming/.openmodelica/libraries/Modelica 4.0.0+maint.om/Mechanics/MultiBody/Frames/axesRotationsAngles.mo",76,3,77,51,0};
        omc_assert(threadData, info, MMC_STRINGDATA(_OMC_LIT12));
      }
    }
  }

  tmp4 = (modelica_boolean)(integer_array_get(_sequence, 1, ((modelica_integer) 1)) == ((modelica_integer) 1));
  if(tmp4)
  {
    tmp5 = _OMC_LIT13;
  }
  else
  {
    tmp2 = (modelica_boolean)(integer_array_get(_sequence, 1, ((modelica_integer) 1)) == ((modelica_integer) 2));
    if(tmp2)
    {
      tmp3 = _OMC_LIT14;
    }
    else
    {
      tmp3 = _OMC_LIT15;
    }
    tmp5 = tmp3;
  }
  real_array_copy_data(tmp5, _e1_1);

  tmp8 = (modelica_boolean)(integer_array_get(_sequence, 1, ((modelica_integer) 2)) == ((modelica_integer) 1));
  if(tmp8)
  {
    tmp9 = _OMC_LIT13;
  }
  else
  {
    tmp6 = (modelica_boolean)(integer_array_get(_sequence, 1, ((modelica_integer) 2)) == ((modelica_integer) 2));
    if(tmp6)
    {
      tmp7 = _OMC_LIT14;
    }
    else
    {
      tmp7 = _OMC_LIT15;
    }
    tmp9 = tmp7;
  }
  real_array_copy_data(tmp9, _e2_1a);

  create_index_spec(&tmp11, 2, (modelica_integer)(0), make_index_array(1, (modelica_integer) integer_array_get(_sequence, 1, ((modelica_integer) 3))), 'S', (modelica_integer)(1), (int*)0, 'W');
  index_alloc_real_array(&_R._T, &tmp11, &tmp10);
  real_array_copy_data(tmp10, _e3_1);

  tmp14 = (modelica_boolean)(integer_array_get(_sequence, 1, ((modelica_integer) 3)) == ((modelica_integer) 1));
  if(tmp14)
  {
    tmp15 = _OMC_LIT13;
  }
  else
  {
    tmp12 = (modelica_boolean)(integer_array_get(_sequence, 1, ((modelica_integer) 3)) == ((modelica_integer) 2));
    if(tmp12)
    {
      tmp13 = _OMC_LIT14;
    }
    else
    {
      tmp13 = _OMC_LIT15;
    }
    tmp15 = tmp13;
  }
  real_array_copy_data(tmp15, _e3_2);

  _A = (real_array_get(_e2_1a, 1, ((modelica_integer) 1))) * (real_array_get(_e3_1, 1, ((modelica_integer) 1))) + (real_array_get(_e2_1a, 1, ((modelica_integer) 2))) * (real_array_get(_e3_1, 1, ((modelica_integer) 2))) + (real_array_get(_e2_1a, 1, ((modelica_integer) 3))) * (real_array_get(_e3_1, 1, ((modelica_integer) 3)));

  _B = ((real_array_get(_e1_1, 1, ((modelica_integer) 2))) * (real_array_get(_e2_1a, 1, ((modelica_integer) 3))) - ((real_array_get(_e1_1, 1, ((modelica_integer) 3))) * (real_array_get(_e2_1a, 1, ((modelica_integer) 2))))) * (real_array_get(_e3_1, 1, ((modelica_integer) 1))) + ((real_array_get(_e1_1, 1, ((modelica_integer) 3))) * (real_array_get(_e2_1a, 1, ((modelica_integer) 1))) - ((real_array_get(_e1_1, 1, ((modelica_integer) 1))) * (real_array_get(_e2_1a, 1, ((modelica_integer) 3))))) * (real_array_get(_e3_1, 1, ((modelica_integer) 2))) + ((real_array_get(_e1_1, 1, ((modelica_integer) 1))) * (real_array_get(_e2_1a, 1, ((modelica_integer) 2))) - ((real_array_get(_e1_1, 1, ((modelica_integer) 2))) * (real_array_get(_e2_1a, 1, ((modelica_integer) 1))))) * (real_array_get(_e3_1, 1, ((modelica_integer) 3)));

  if(((fabs(_A) <= 1e-12) && (fabs(_B) <= 1e-12)))
  {
    real_array_get(_angles, 1, ((modelica_integer) 1)) = _guessAngle1;
  }
  else
  {
    _angle_1a = atan2(_A, (-_B));

    _angle_1b = atan2((-_A), _B);

    real_array_get(_angles, 1, ((modelica_integer) 1)) = ((fabs(_angle_1a - _guessAngle1) <= fabs(_angle_1b - _guessAngle1))?_angle_1a:_angle_1b);
  }

  real_array_copy_data(omc_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_planarRotation(threadData, _e1_1, real_array_get(_angles, 1, ((modelica_integer) 1))), _T_1a);

  real_array_get(_angles, 1, ((modelica_integer) 2)) = omc_Modelica_Mechanics_MultiBody_Frames_planarRotationAngle(threadData, _e2_1a, omc_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_resolve2(threadData, _T_1a, _e3_1), _e3_2);

  real_array_get(_angles, 1, ((modelica_integer) 3)) = omc_Modelica_Mechanics_MultiBody_Frames_planarRotationAngle(threadData, _e3_2, _e2_1a, omc_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_resolve2(threadData, _R._T, omc_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_resolve1(threadData, _T_1a, _e2_1a)));
  _return: OMC_LABEL_UNUSED
  return _angles;
}
modelica_metatype boxptr_Modelica_Mechanics_MultiBody_Frames_axesRotationsAngles(threadData_t *threadData, modelica_metatype _R, modelica_metatype _sequence, modelica_metatype _guessAngle1)
{
  Modelica_Mechanics_MultiBody_Frames_Orientation tmp1;
  modelica_metatype tmpMeta2;
  modelica_metatype tmpMeta3;
  modelica_real tmp4;
  real_array _angles;
  modelica_metatype out_angles;
  tmpMeta2 = (MMC_FETCH(MMC_OFFSET(MMC_UNTAGPTR(_R), 2)));
  tmp1._T = *((base_array_t*)tmpMeta2);
  tmpMeta3 = (MMC_FETCH(MMC_OFFSET(MMC_UNTAGPTR(_R), 3)));
  tmp1._w = *((base_array_t*)tmpMeta3);tmp4 = mmc_unbox_real(_guessAngle1);
  _angles = omc_Modelica_Mechanics_MultiBody_Frames_axesRotationsAngles(threadData, tmp1, *((base_array_t*)_sequence), tmp4);
  out_angles = mmc_mk_modelica_array(_angles);
  return out_angles;
}

DLLDirection
modelica_real omc_Modelica_Mechanics_MultiBody_Frames_planarRotationAngle(threadData_t *threadData, real_array _e, real_array _v1, real_array _v2)
{
  modelica_real _angle;
  _tailrecursive: OMC_LABEL_UNUSED
  // _angle has no default value.
  _angle = atan2((-(((real_array_get(_e, 1, ((modelica_integer) 2))) * (real_array_get(_v1, 1, ((modelica_integer) 3))) - ((real_array_get(_e, 1, ((modelica_integer) 3))) * (real_array_get(_v1, 1, ((modelica_integer) 2))))) * (real_array_get(_v2, 1, ((modelica_integer) 1))) + ((real_array_get(_e, 1, ((modelica_integer) 3))) * (real_array_get(_v1, 1, ((modelica_integer) 1))) - ((real_array_get(_e, 1, ((modelica_integer) 1))) * (real_array_get(_v1, 1, ((modelica_integer) 3))))) * (real_array_get(_v2, 1, ((modelica_integer) 2))) + ((real_array_get(_e, 1, ((modelica_integer) 1))) * (real_array_get(_v1, 1, ((modelica_integer) 2))) - ((real_array_get(_e, 1, ((modelica_integer) 2))) * (real_array_get(_v1, 1, ((modelica_integer) 1))))) * (real_array_get(_v2, 1, ((modelica_integer) 3))))), (real_array_get(_v1, 1, ((modelica_integer) 1))) * (real_array_get(_v2, 1, ((modelica_integer) 1))) + (real_array_get(_v1, 1, ((modelica_integer) 2))) * (real_array_get(_v2, 1, ((modelica_integer) 2))) + (real_array_get(_v1, 1, ((modelica_integer) 3))) * (real_array_get(_v2, 1, ((modelica_integer) 3))) - (((real_array_get(_e, 1, ((modelica_integer) 1))) * (real_array_get(_v1, 1, ((modelica_integer) 1))) + (real_array_get(_e, 1, ((modelica_integer) 2))) * (real_array_get(_v1, 1, ((modelica_integer) 2))) + (real_array_get(_e, 1, ((modelica_integer) 3))) * (real_array_get(_v1, 1, ((modelica_integer) 3)))) * ((real_array_get(_e, 1, ((modelica_integer) 1))) * (real_array_get(_v2, 1, ((modelica_integer) 1))) + (real_array_get(_e, 1, ((modelica_integer) 2))) * (real_array_get(_v2, 1, ((modelica_integer) 2))) + (real_array_get(_e, 1, ((modelica_integer) 3))) * (real_array_get(_v2, 1, ((modelica_integer) 3))))));
  _return: OMC_LABEL_UNUSED
  return _angle;
}
modelica_metatype boxptr_Modelica_Mechanics_MultiBody_Frames_planarRotationAngle(threadData_t *threadData, modelica_metatype _e, modelica_metatype _v1, modelica_metatype _v2)
{
  modelica_real _angle;
  modelica_metatype out_angle;
  _angle = omc_Modelica_Mechanics_MultiBody_Frames_planarRotationAngle(threadData, *((base_array_t*)_e), *((base_array_t*)_v1), *((base_array_t*)_v2));
  out_angle = mmc_mk_rcon(_angle);
  return out_angle;
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
    tmp2 = _OMC_LIT13;
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
    tmp4 = _OMC_LIT14;
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
      tmp7 = _OMC_LIT14;
    }
    else
    {
      tmp7 = _OMC_LIT13;
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

DLLDirection
real_array omc_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_planarRotation(threadData_t *threadData, real_array _e, modelica_real _angle)
{
  real_array _T;
  real_array tmp1;
  real_array tmp2;
  real_array tmp3;
  real_array tmp4;
  real_array tmp5;
  real_array tmp6;
  real_array tmp7;
  real_array tmp8;
  real_array tmp9;
  real_array tmp10;
  _tailrecursive: OMC_LABEL_UNUSED
  alloc_real_array(&(_T), 2, (_index_t)3, (_index_t)3); // _T has no default value.
  promote_alloc_real_array(&_e, ((modelica_integer) 2) - ndims_base_array(&_e), &tmp1);
  promote_alloc_real_array(&_e, ((modelica_integer) 2) - ndims_base_array(&_e), &tmp2);
  transpose_alloc_real_array(&tmp2, &tmp3);
  promote_alloc_real_array(&_e, ((modelica_integer) 2) - ndims_base_array(&_e), &tmp4);
  promote_alloc_real_array(&_e, ((modelica_integer) 2) - ndims_base_array(&_e), &tmp5);
  transpose_alloc_real_array(&tmp5, &tmp6);
  array_alloc_scalar_real_array(&tmp8, 3, (modelica_real)0.0, (modelica_real)((-real_array_get(_e, 1, ((modelica_integer) 3)))) * (sin(_angle)), (modelica_real)(real_array_get(_e, 1, ((modelica_integer) 2))) * (sin(_angle)));
  array_alloc_scalar_real_array(&tmp9, 3, (modelica_real)(real_array_get(_e, 1, ((modelica_integer) 3))) * (sin(_angle)), (modelica_real)0.0, (modelica_real)((-real_array_get(_e, 1, ((modelica_integer) 1)))) * (sin(_angle)));
  array_alloc_scalar_real_array(&tmp10, 3, (modelica_real)((-real_array_get(_e, 1, ((modelica_integer) 2)))) * (sin(_angle)), (modelica_real)(real_array_get(_e, 1, ((modelica_integer) 1))) * (sin(_angle)), (modelica_real)0.0);
  array_alloc_real_array(&tmp7, 3, tmp8, tmp9, tmp10);
  real_array_copy_data(sub_alloc_real_array(add_alloc_real_array(mul_alloc_real_matrix_product_smart(tmp1, tmp3), mul_alloc_real_array_scalar(sub_alloc_real_array(_OMC_LIT16, mul_alloc_real_matrix_product_smart(tmp4, tmp6)), cos(_angle))), tmp7), _T);
  _return: OMC_LABEL_UNUSED
  return _T;
}
modelica_metatype boxptr_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_planarRotation(threadData_t *threadData, modelica_metatype _e, modelica_metatype _angle)
{
  modelica_real tmp1;
  real_array _T;
  modelica_metatype out_T;
  tmp1 = mmc_unbox_real(_angle);
  _T = omc_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_planarRotation(threadData, *((base_array_t*)_e), tmp1);
  out_T = mmc_mk_modelica_array(_T);
  return out_T;
}

DLLDirection
real_array omc_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_resolve1(threadData_t *threadData, real_array _T, real_array _v2)
{
  real_array _v1;
  real_array tmp1;
  _tailrecursive: OMC_LABEL_UNUSED
  alloc_real_array(&(_v1), 1, (_index_t)3); // _v1 has no default value.
  array_alloc_scalar_real_array(&tmp1, 3, (modelica_real)(real_array_get(_T, 2, ((modelica_integer) 1), ((modelica_integer) 1))) * (real_array_get(_v2, 1, ((modelica_integer) 1))) + (real_array_get(_T, 2, ((modelica_integer) 2), ((modelica_integer) 1))) * (real_array_get(_v2, 1, ((modelica_integer) 2))) + (real_array_get(_T, 2, ((modelica_integer) 3), ((modelica_integer) 1))) * (real_array_get(_v2, 1, ((modelica_integer) 3))), (modelica_real)(real_array_get(_T, 2, ((modelica_integer) 1), ((modelica_integer) 2))) * (real_array_get(_v2, 1, ((modelica_integer) 1))) + (real_array_get(_T, 2, ((modelica_integer) 2), ((modelica_integer) 2))) * (real_array_get(_v2, 1, ((modelica_integer) 2))) + (real_array_get(_T, 2, ((modelica_integer) 3), ((modelica_integer) 2))) * (real_array_get(_v2, 1, ((modelica_integer) 3))), (modelica_real)(real_array_get(_T, 2, ((modelica_integer) 1), ((modelica_integer) 3))) * (real_array_get(_v2, 1, ((modelica_integer) 1))) + (real_array_get(_T, 2, ((modelica_integer) 2), ((modelica_integer) 3))) * (real_array_get(_v2, 1, ((modelica_integer) 2))) + (real_array_get(_T, 2, ((modelica_integer) 3), ((modelica_integer) 3))) * (real_array_get(_v2, 1, ((modelica_integer) 3))));
  real_array_copy_data(tmp1, _v1);
  _return: OMC_LABEL_UNUSED
  return _v1;
}
modelica_metatype boxptr_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_resolve1(threadData_t *threadData, modelica_metatype _T, modelica_metatype _v2)
{
  real_array _v1;
  modelica_metatype out_v1;
  _v1 = omc_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_resolve1(threadData, *((base_array_t*)_T), *((base_array_t*)_v2));
  out_v1 = mmc_mk_modelica_array(_v1);
  return out_v1;
}

DLLDirection
real_array omc_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_resolve2(threadData_t *threadData, real_array _T, real_array _v1)
{
  real_array _v2;
  real_array tmp1;
  _tailrecursive: OMC_LABEL_UNUSED
  alloc_real_array(&(_v2), 1, (_index_t)3); // _v2 has no default value.
  array_alloc_scalar_real_array(&tmp1, 3, (modelica_real)(real_array_get(_T, 2, ((modelica_integer) 1), ((modelica_integer) 1))) * (real_array_get(_v1, 1, ((modelica_integer) 1))) + (real_array_get(_T, 2, ((modelica_integer) 1), ((modelica_integer) 2))) * (real_array_get(_v1, 1, ((modelica_integer) 2))) + (real_array_get(_T, 2, ((modelica_integer) 1), ((modelica_integer) 3))) * (real_array_get(_v1, 1, ((modelica_integer) 3))), (modelica_real)(real_array_get(_T, 2, ((modelica_integer) 2), ((modelica_integer) 1))) * (real_array_get(_v1, 1, ((modelica_integer) 1))) + (real_array_get(_T, 2, ((modelica_integer) 2), ((modelica_integer) 2))) * (real_array_get(_v1, 1, ((modelica_integer) 2))) + (real_array_get(_T, 2, ((modelica_integer) 2), ((modelica_integer) 3))) * (real_array_get(_v1, 1, ((modelica_integer) 3))), (modelica_real)(real_array_get(_T, 2, ((modelica_integer) 3), ((modelica_integer) 1))) * (real_array_get(_v1, 1, ((modelica_integer) 1))) + (real_array_get(_T, 2, ((modelica_integer) 3), ((modelica_integer) 2))) * (real_array_get(_v1, 1, ((modelica_integer) 2))) + (real_array_get(_T, 2, ((modelica_integer) 3), ((modelica_integer) 3))) * (real_array_get(_v1, 1, ((modelica_integer) 3))));
  real_array_copy_data(tmp1, _v2);
  _return: OMC_LABEL_UNUSED
  return _v2;
}
modelica_metatype boxptr_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_resolve2(threadData_t *threadData, modelica_metatype _T, modelica_metatype _v1)
{
  real_array _v2;
  modelica_metatype out_v2;
  _v2 = omc_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_resolve2(threadData, *((base_array_t*)_T), *((base_array_t*)_v1));
  out_v2 = mmc_mk_modelica_array(_v2);
  return out_v2;
}

real_array omc_Modelica_Utilities_Streams_readRealMatrix(threadData_t *threadData, modelica_string _fileName, modelica_string _matrixName, modelica_integer _nrow, modelica_integer _ncol, modelica_boolean _verboseRead)
{
  int _verboseRead_ext;
  void *_matrix_c89;
  real_array _matrix;
  alloc_real_array(&(_matrix), 2, (_index_t)_nrow, (_index_t)_ncol); // _matrix has no default value.
  _verboseRead_ext = (int)_verboseRead;_matrix_c89 = (void*) data_of_real_c89_array(_matrix);
  ModelicaIO_readRealMatrix(MMC_STRINGDATA(_fileName), MMC_STRINGDATA(_matrixName), (double*) _matrix_c89, size_of_dimension_base_array(_matrix, ((modelica_integer) 1)), size_of_dimension_base_array(_matrix, ((modelica_integer) 2)), _verboseRead_ext);
  return _matrix;
}
modelica_metatype boxptr_Modelica_Utilities_Streams_readRealMatrix(threadData_t *threadData, modelica_metatype _fileName, modelica_metatype _matrixName, modelica_metatype _nrow, modelica_metatype _ncol, modelica_metatype _verboseRead)
{
  modelica_integer tmp1;
  modelica_integer tmp2;
  modelica_integer tmp3;
  real_array _matrix;
  modelica_metatype out_matrix;
  tmp1 = mmc_unbox_integer(_nrow);
  tmp2 = mmc_unbox_integer(_ncol);
  tmp3 = mmc_unbox_integer(_verboseRead);
  _matrix = omc_Modelica_Utilities_Streams_readRealMatrix(threadData, _fileName, _matrixName, tmp1, tmp2, tmp3);
  out_matrix = mmc_mk_modelica_array(_matrix);
  return out_matrix;
}

#ifdef __cplusplus
}
#endif
