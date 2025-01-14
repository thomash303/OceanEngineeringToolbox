#ifndef OET_Example_multibodyWECSingleDoF__H
#define OET_Example_multibodyWECSingleDoF__H
#include "meta/meta_modelica.h"
#include "util/modelica.h"
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

#include "simulation/simulation_runtime.h"
#ifdef __cplusplus
extern "C" {
#endif

typedef struct {
  real_array _T;
  real_array _w;
} Modelica_Mechanics_MultiBody_Frames_Orientation;
extern struct record_description Modelica_Mechanics_MultiBody_Frames_Orientation__desc;

void Modelica_Mechanics_MultiBody_Frames_Orientation_construct_p(threadData_t *threadData, void* v_ths );
#define Modelica_Mechanics_MultiBody_Frames_Orientation_construct(td, ths ) Modelica_Mechanics_MultiBody_Frames_Orientation_construct_p(td, &ths )
void Modelica_Mechanics_MultiBody_Frames_Orientation_copy_p(void* v_src, void* v_dst);
#define Modelica_Mechanics_MultiBody_Frames_Orientation_copy(src,dst) Modelica_Mechanics_MultiBody_Frames_Orientation_copy_p(&src, &dst)


void Modelica_Mechanics_MultiBody_Frames_Orientation_wrap_vars_p(threadData_t *threadData , void* v_dst , real_array in_T, real_array in_w);
#define Modelica_Mechanics_MultiBody_Frames_Orientation_wrap_vars(td, dst , in_T, in_w) Modelica_Mechanics_MultiBody_Frames_Orientation_wrap_vars_p(td, &dst , in_T, in_w)

// This function is not needed anymore. If you want to know how a record
// is 'assigned to' in simulation context see assignRhsExpToRecordCrefSimContext and
// splitRecordAssignmentToMemberAssignments (simCode). Basically the record is
// split up assignments generated for each member individually.
// void Modelica_Mechanics_MultiBody_Frames_Orientation_copy_to_vars_p(void* v_src , real_array* in_T, real_array* in_w);
// #define Modelica_Mechanics_MultiBody_Frames_Orientation_copy_to_vars(src,...) Modelica_Mechanics_MultiBody_Frames_Orientation_copy_to_vars_p(&src, __VA_ARGS__)

typedef base_array_t Modelica_Mechanics_MultiBody_Frames_Orientation_array;
#define alloc_Modelica_Mechanics_MultiBody_Frames_Orientation_array(dst,ndims,...) generic_array_create(NULL, dst, Modelica_Mechanics_MultiBody_Frames_Orientation_construct_p, ndims, sizeof(Modelica_Mechanics_MultiBody_Frames_Orientation), __VA_ARGS__)
#define Modelica_Mechanics_MultiBody_Frames_Orientation_array_copy_data(src,dst)   generic_array_copy_data(src, &dst, Modelica_Mechanics_MultiBody_Frames_Orientation_copy_p, sizeof(Modelica_Mechanics_MultiBody_Frames_Orientation))
#define Modelica_Mechanics_MultiBody_Frames_Orientation_array_alloc_copy(src,dst)  generic_array_alloc_copy(src, &dst, Modelica_Mechanics_MultiBody_Frames_Orientation_copy_p, sizeof(Modelica_Mechanics_MultiBody_Frames_Orientation))
#define Modelica_Mechanics_MultiBody_Frames_Orientation_array_get(src,ndims,...)   (*(Modelica_Mechanics_MultiBody_Frames_Orientation*)(generic_array_get(&src, sizeof(Modelica_Mechanics_MultiBody_Frames_Orientation), __VA_ARGS__)))
#define Modelica_Mechanics_MultiBody_Frames_Orientation_set(dst,val,...)           generic_array_set(&dst, &val, Modelica_Mechanics_MultiBody_Frames_Orientation_copy_p, sizeof(Modelica_Mechanics_MultiBody_Frames_Orientation), __VA_ARGS__)

DLLDirection
modelica_real omc_Modelica_Math_Vectors_interpolate(threadData_t *threadData, real_array _x, real_array _y, modelica_real _xi, modelica_integer _iLast, modelica_integer *out_iNew);
DLLDirection
modelica_metatype boxptr_Modelica_Math_Vectors_interpolate(threadData_t *threadData, modelica_metatype _x, modelica_metatype _y, modelica_metatype _xi, modelica_metatype _iLast, modelica_metatype *out_iNew);
static const MMC_DEFSTRUCTLIT(boxvar_lit_Modelica_Math_Vectors_interpolate,2,0) {(void*) boxptr_Modelica_Math_Vectors_interpolate,0}};
#define boxvar_Modelica_Math_Vectors_interpolate MMC_REFSTRUCTLIT(boxvar_lit_Modelica_Math_Vectors_interpolate)


DLLDirection
modelica_real omc_Modelica_Math_Vectors_length(threadData_t *threadData, real_array _v);
DLLDirection
modelica_metatype boxptr_Modelica_Math_Vectors_length(threadData_t *threadData, modelica_metatype _v);
static const MMC_DEFSTRUCTLIT(boxvar_lit_Modelica_Math_Vectors_length,2,0) {(void*) boxptr_Modelica_Math_Vectors_length,0}};
#define boxvar_Modelica_Math_Vectors_length MMC_REFSTRUCTLIT(boxvar_lit_Modelica_Math_Vectors_length)


DLLDirection
real_array omc_Modelica_Math_Vectors_normalize(threadData_t *threadData, real_array _v, modelica_real _eps);
DLLDirection
modelica_metatype boxptr_Modelica_Math_Vectors_normalize(threadData_t *threadData, modelica_metatype _v, modelica_metatype _eps);
static const MMC_DEFSTRUCTLIT(boxvar_lit_Modelica_Math_Vectors_normalize,2,0) {(void*) boxptr_Modelica_Math_Vectors_normalize,0}};
#define boxvar_Modelica_Math_Vectors_normalize MMC_REFSTRUCTLIT(boxvar_lit_Modelica_Math_Vectors_normalize)


DLLDirection
Modelica_Mechanics_MultiBody_Frames_Orientation omc_Modelica_Mechanics_MultiBody_Frames_Orientation (threadData_t *threadData, real_array omc_T, real_array omc_w);

DLLDirection
modelica_metatype boxptr_Modelica_Mechanics_MultiBody_Frames_Orientation(threadData_t *threadData, modelica_metatype _T, modelica_metatype _w);
static const MMC_DEFSTRUCTLIT(boxvar_lit_Modelica_Mechanics_MultiBody_Frames_Orientation,2,0) {(void*) boxptr_Modelica_Mechanics_MultiBody_Frames_Orientation,0}};
#define boxvar_Modelica_Mechanics_MultiBody_Frames_Orientation MMC_REFSTRUCTLIT(boxvar_lit_Modelica_Mechanics_MultiBody_Frames_Orientation)


DLLDirection
real_array omc_Modelica_Mechanics_MultiBody_Frames_axesRotationsAngles(threadData_t *threadData, Modelica_Mechanics_MultiBody_Frames_Orientation _R, integer_array _sequence, modelica_real _guessAngle1);
DLLDirection
modelica_metatype boxptr_Modelica_Mechanics_MultiBody_Frames_axesRotationsAngles(threadData_t *threadData, modelica_metatype _R, modelica_metatype _sequence, modelica_metatype _guessAngle1);
static const MMC_DEFSTRUCTLIT(boxvar_lit_Modelica_Mechanics_MultiBody_Frames_axesRotationsAngles,2,0) {(void*) boxptr_Modelica_Mechanics_MultiBody_Frames_axesRotationsAngles,0}};
#define boxvar_Modelica_Mechanics_MultiBody_Frames_axesRotationsAngles MMC_REFSTRUCTLIT(boxvar_lit_Modelica_Mechanics_MultiBody_Frames_axesRotationsAngles)


DLLDirection
modelica_real omc_Modelica_Mechanics_MultiBody_Frames_planarRotationAngle(threadData_t *threadData, real_array _e, real_array _v1, real_array _v2);
DLLDirection
modelica_metatype boxptr_Modelica_Mechanics_MultiBody_Frames_planarRotationAngle(threadData_t *threadData, modelica_metatype _e, modelica_metatype _v1, modelica_metatype _v2);
static const MMC_DEFSTRUCTLIT(boxvar_lit_Modelica_Mechanics_MultiBody_Frames_planarRotationAngle,2,0) {(void*) boxptr_Modelica_Mechanics_MultiBody_Frames_planarRotationAngle,0}};
#define boxvar_Modelica_Mechanics_MultiBody_Frames_planarRotationAngle MMC_REFSTRUCTLIT(boxvar_lit_Modelica_Mechanics_MultiBody_Frames_planarRotationAngle)


DLLDirection
real_array omc_Modelica_Mechanics_MultiBody_Frames_resolve2(threadData_t *threadData, Modelica_Mechanics_MultiBody_Frames_Orientation _R, real_array _v1);
DLLDirection
modelica_metatype boxptr_Modelica_Mechanics_MultiBody_Frames_resolve2(threadData_t *threadData, modelica_metatype _R, modelica_metatype _v1);
static const MMC_DEFSTRUCTLIT(boxvar_lit_Modelica_Mechanics_MultiBody_Frames_resolve2,2,0) {(void*) boxptr_Modelica_Mechanics_MultiBody_Frames_resolve2,0}};
#define boxvar_Modelica_Mechanics_MultiBody_Frames_resolve2 MMC_REFSTRUCTLIT(boxvar_lit_Modelica_Mechanics_MultiBody_Frames_resolve2)


DLLDirection
real_array omc_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_from__nxy(threadData_t *threadData, real_array _n_x, real_array _n_y);
DLLDirection
modelica_metatype boxptr_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_from__nxy(threadData_t *threadData, modelica_metatype _n_x, modelica_metatype _n_y);
static const MMC_DEFSTRUCTLIT(boxvar_lit_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_from__nxy,2,0) {(void*) boxptr_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_from__nxy,0}};
#define boxvar_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_from__nxy MMC_REFSTRUCTLIT(boxvar_lit_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_from__nxy)


DLLDirection
real_array omc_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_planarRotation(threadData_t *threadData, real_array _e, modelica_real _angle);
DLLDirection
modelica_metatype boxptr_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_planarRotation(threadData_t *threadData, modelica_metatype _e, modelica_metatype _angle);
static const MMC_DEFSTRUCTLIT(boxvar_lit_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_planarRotation,2,0) {(void*) boxptr_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_planarRotation,0}};
#define boxvar_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_planarRotation MMC_REFSTRUCTLIT(boxvar_lit_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_planarRotation)


DLLDirection
real_array omc_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_resolve1(threadData_t *threadData, real_array _T, real_array _v2);
DLLDirection
modelica_metatype boxptr_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_resolve1(threadData_t *threadData, modelica_metatype _T, modelica_metatype _v2);
static const MMC_DEFSTRUCTLIT(boxvar_lit_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_resolve1,2,0) {(void*) boxptr_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_resolve1,0}};
#define boxvar_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_resolve1 MMC_REFSTRUCTLIT(boxvar_lit_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_resolve1)


DLLDirection
real_array omc_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_resolve2(threadData_t *threadData, real_array _T, real_array _v1);
DLLDirection
modelica_metatype boxptr_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_resolve2(threadData_t *threadData, modelica_metatype _T, modelica_metatype _v1);
static const MMC_DEFSTRUCTLIT(boxvar_lit_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_resolve2,2,0) {(void*) boxptr_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_resolve2,0}};
#define boxvar_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_resolve2 MMC_REFSTRUCTLIT(boxvar_lit_Modelica_Mechanics_MultiBody_Frames_TransformationMatrices_resolve2)


DLLDirection
real_array omc_Modelica_Utilities_Streams_readRealMatrix(threadData_t *threadData, modelica_string _fileName, modelica_string _matrixName, modelica_integer _nrow, modelica_integer _ncol, modelica_boolean _verboseRead);
DLLDirection
modelica_metatype boxptr_Modelica_Utilities_Streams_readRealMatrix(threadData_t *threadData, modelica_metatype _fileName, modelica_metatype _matrixName, modelica_metatype _nrow, modelica_metatype _ncol, modelica_metatype _verboseRead);
static const MMC_DEFSTRUCTLIT(boxvar_lit_Modelica_Utilities_Streams_readRealMatrix,2,0) {(void*) boxptr_Modelica_Utilities_Streams_readRealMatrix,0}};
#define boxvar_Modelica_Utilities_Streams_readRealMatrix MMC_REFSTRUCTLIT(boxvar_lit_Modelica_Utilities_Streams_readRealMatrix)

/*
 * The function has annotation(Include=...>) or is builtin
 * the external function definition should be present
 * in one of these files and have this prototype:
 * extern void ModelicaIO_readRealMatrix(const char* (*_fileName*), const char* (*_matrixName*), double* (*_matrix*), size_t, size_t, int (*_verboseRead*));
 */
#include "OET.Example.multibodyWECSingleDoF_model.h"


#ifdef __cplusplus
}
#endif
#endif

