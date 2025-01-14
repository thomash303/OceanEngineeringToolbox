#include "OET.Example.multibodyWECSingleDoF_model.h"
#if defined(__cplusplus)
extern "C" {
#endif
extern void OET_Example_multibodyWECSingleDoF_eqFunction_3126(DATA *data, threadData_t *threadData);

extern void OET_Example_multibodyWECSingleDoF_eqFunction_3125(DATA *data, threadData_t *threadData);

extern void OET_Example_multibodyWECSingleDoF_eqFunction_3124(DATA *data, threadData_t *threadData);

extern void OET_Example_multibodyWECSingleDoF_eqFunction_3123(DATA *data, threadData_t *threadData);

extern void OET_Example_multibodyWECSingleDoF_eqFunction_3122(DATA *data, threadData_t *threadData);

extern void OET_Example_multibodyWECSingleDoF_eqFunction_3121(DATA *data, threadData_t *threadData);

extern void OET_Example_multibodyWECSingleDoF_eqFunction_3120(DATA *data, threadData_t *threadData);

extern void OET_Example_multibodyWECSingleDoF_eqFunction_3119(DATA *data, threadData_t *threadData);

extern void OET_Example_multibodyWECSingleDoF_eqFunction_3118(DATA *data, threadData_t *threadData);

extern void OET_Example_multibodyWECSingleDoF_eqFunction_3117(DATA *data, threadData_t *threadData);

extern void OET_Example_multibodyWECSingleDoF_eqFunction_3116(DATA *data, threadData_t *threadData);

extern void OET_Example_multibodyWECSingleDoF_eqFunction_3115(DATA *data, threadData_t *threadData);

extern void OET_Example_multibodyWECSingleDoF_eqFunction_3114(DATA *data, threadData_t *threadData);

extern void OET_Example_multibodyWECSingleDoF_eqFunction_3113(DATA *data, threadData_t *threadData);

extern void OET_Example_multibodyWECSingleDoF_eqFunction_3112(DATA *data, threadData_t *threadData);

extern void OET_Example_multibodyWECSingleDoF_eqFunction_3111(DATA *data, threadData_t *threadData);

extern void OET_Example_multibodyWECSingleDoF_eqFunction_3110(DATA *data, threadData_t *threadData);

extern void OET_Example_multibodyWECSingleDoF_eqFunction_3109(DATA *data, threadData_t *threadData);

extern void OET_Example_multibodyWECSingleDoF_eqFunction_3108(DATA *data, threadData_t *threadData);

extern void OET_Example_multibodyWECSingleDoF_eqFunction_3107(DATA *data, threadData_t *threadData);

extern void OET_Example_multibodyWECSingleDoF_eqFunction_3106(DATA *data, threadData_t *threadData);


/*
equation index: 3800
type: SIMPLE_ASSIGN
world.axisDiameter = world.axisLength / world.defaultFrameDiameterFraction
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3800(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3800};
  (data->simulationInfo->realParameter[43104] /* world.axisDiameter PARAM */) = DIVISION_SIM((data->simulationInfo->realParameter[43105] /* world.axisLength PARAM */),(data->simulationInfo->realParameter[43111] /* world.defaultFrameDiameterFraction PARAM */),"world.defaultFrameDiameterFraction",equationIndexes);
  TRACE_POP
}

/*
equation index: 3801
type: SIMPLE_ASSIGN
world.headLength = min(world.axisLength, world.axisDiameter * 5.0)
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3801(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3801};
  (data->simulationInfo->realParameter[43134] /* world.headLength PARAM */) = fmin((data->simulationInfo->realParameter[43105] /* world.axisLength PARAM */),((data->simulationInfo->realParameter[43104] /* world.axisDiameter PARAM */)) * (5.0));
  TRACE_POP
}

/*
equation index: 3802
type: SIMPLE_ASSIGN
world.lineLength = max(0.0, world.axisLength - world.headLength)
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3802(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3802};
  (data->simulationInfo->realParameter[43137] /* world.lineLength PARAM */) = fmax(0.0,(data->simulationInfo->realParameter[43105] /* world.axisLength PARAM */) - (data->simulationInfo->realParameter[43134] /* world.headLength PARAM */));
  TRACE_POP
}

/*
equation index: 3803
type: SIMPLE_ASSIGN
world.x_arrowHead.r[1] = world.lineLength
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3803(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3803};
  (data->simulationInfo->realParameter[43147] /* world.x_arrowHead.r[1] PARAM */) = (data->simulationInfo->realParameter[43137] /* world.lineLength PARAM */);
  TRACE_POP
}

/*
equation index: 3804
type: SIMPLE_ASSIGN
world.y_arrowHead.r[2] = world.lineLength
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3804(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3804};
  (data->simulationInfo->realParameter[43166] /* world.y_arrowHead.r[2] PARAM */) = (data->simulationInfo->realParameter[43137] /* world.lineLength PARAM */);
  TRACE_POP
}

/*
equation index: 3805
type: SIMPLE_ASSIGN
world.z_arrowHead.r[3] = world.lineLength
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3805(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3805};
  (data->simulationInfo->realParameter[43182] /* world.z_arrowHead.r[3] PARAM */) = (data->simulationInfo->realParameter[43137] /* world.lineLength PARAM */);
  TRACE_POP
}

/*
equation index: 3807
type: SIMPLE_ASSIGN
prismatic.fixed.flange.s = prismatic.fixed.s0
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3807(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3807};
  (data->simulationInfo->realParameter[42877] /* prismatic.fixed.flange.s PARAM */) = (data->simulationInfo->realParameter[42878] /* prismatic.fixed.s0 PARAM */);
  TRACE_POP
}

/*
equation index: 3808
type: SIMPLE_ASSIGN
world.x_arrowLine.length = world.lineLength
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3808(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3808};
  (data->simulationInfo->realParameter[43150] /* world.x_arrowLine.length PARAM */) = (data->simulationInfo->realParameter[43137] /* world.lineLength PARAM */);
  TRACE_POP
}

/*
equation index: 3809
type: SIMPLE_ASSIGN
world.lineWidth = world.axisDiameter
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3809(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3809};
  (data->simulationInfo->realParameter[43138] /* world.lineWidth PARAM */) = (data->simulationInfo->realParameter[43104] /* world.axisDiameter PARAM */);
  TRACE_POP
}

/*
equation index: 3810
type: SIMPLE_ASSIGN
world.x_arrowLine.width = world.lineWidth
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3810(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3810};
  (data->simulationInfo->realParameter[43151] /* world.x_arrowLine.width PARAM */) = (data->simulationInfo->realParameter[43138] /* world.lineWidth PARAM */);
  TRACE_POP
}

/*
equation index: 3811
type: SIMPLE_ASSIGN
world.x_arrowLine.height = world.lineWidth
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3811(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3811};
  (data->simulationInfo->realParameter[43149] /* world.x_arrowLine.height PARAM */) = (data->simulationInfo->realParameter[43138] /* world.lineWidth PARAM */);
  TRACE_POP
}

/*
equation index: 3812
type: SIMPLE_ASSIGN
world.x_arrowHead.length = world.headLength
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3812(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3812};
  (data->simulationInfo->realParameter[43146] /* world.x_arrowHead.length PARAM */) = (data->simulationInfo->realParameter[43134] /* world.headLength PARAM */);
  TRACE_POP
}

/*
equation index: 3813
type: SIMPLE_ASSIGN
world.headWidth = 3.0 * world.axisDiameter
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3813(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3813};
  (data->simulationInfo->realParameter[43135] /* world.headWidth PARAM */) = (3.0) * ((data->simulationInfo->realParameter[43104] /* world.axisDiameter PARAM */));
  TRACE_POP
}

/*
equation index: 3814
type: SIMPLE_ASSIGN
world.x_arrowHead.width = world.headWidth
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3814(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3814};
  (data->simulationInfo->realParameter[43148] /* world.x_arrowHead.width PARAM */) = (data->simulationInfo->realParameter[43135] /* world.headWidth PARAM */);
  TRACE_POP
}

/*
equation index: 3815
type: SIMPLE_ASSIGN
world.x_arrowHead.height = world.headWidth
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3815(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3815};
  (data->simulationInfo->realParameter[43145] /* world.x_arrowHead.height PARAM */) = (data->simulationInfo->realParameter[43135] /* world.headWidth PARAM */);
  TRACE_POP
}

/*
equation index: 3816
type: SIMPLE_ASSIGN
world.labelStart = 1.05 * world.axisLength
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3816(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3816};
  (data->simulationInfo->realParameter[43136] /* world.labelStart PARAM */) = (1.05) * ((data->simulationInfo->realParameter[43105] /* world.axisLength PARAM */));
  TRACE_POP
}

/*
equation index: 3817
type: SIMPLE_ASSIGN
world.x_label.cylinders[1].r[1] = world.labelStart
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3817(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3817};
  (data->simulationInfo->realParameter[43154] /* world.x_label.cylinders[1].r[1] PARAM */) = (data->simulationInfo->realParameter[43136] /* world.labelStart PARAM */);
  TRACE_POP
}

/*
equation index: 3818
type: SIMPLE_ASSIGN
world.x_label.r_abs[1] = world.labelStart
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3818(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3818};
  (data->simulationInfo->realParameter[43162] /* world.x_label.r_abs[1] PARAM */) = (data->simulationInfo->realParameter[43136] /* world.labelStart PARAM */);
  TRACE_POP
}

/*
equation index: 3819
type: SIMPLE_ASSIGN
world.x_label.r_lines[1] = world.labelStart
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3819(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3819};
  (data->simulationInfo->realParameter[43163] /* world.x_label.r_lines[1] PARAM */) = (data->simulationInfo->realParameter[43136] /* world.labelStart PARAM */);
  TRACE_POP
}

/*
equation index: 3820
type: SIMPLE_ASSIGN
world.scaledLabel = 3.0 * world.axisDiameter
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3820(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3820};
  (data->simulationInfo->realParameter[43144] /* world.scaledLabel PARAM */) = (3.0) * ((data->simulationInfo->realParameter[43104] /* world.axisDiameter PARAM */));
  TRACE_POP
}

/*
equation index: 3821
type: SIMPLE_ASSIGN
world.x_label.lines[1,2,1] = world.scaledLabel
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3821(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3821};
  (data->simulationInfo->realParameter[43158] /* world.x_label.lines[1,2,1] PARAM */) = (data->simulationInfo->realParameter[43144] /* world.scaledLabel PARAM */);
  TRACE_POP
}

/*
equation index: 3822
type: SIMPLE_ASSIGN
world.x_label.lines[1,2,2] = world.scaledLabel
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3822(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3822};
  (data->simulationInfo->realParameter[43159] /* world.x_label.lines[1,2,2] PARAM */) = (data->simulationInfo->realParameter[43144] /* world.scaledLabel PARAM */);
  TRACE_POP
}

/*
equation index: 3823
type: SIMPLE_ASSIGN
world.x_label.lines[2,1,2] = world.scaledLabel
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3823(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3823};
  (data->simulationInfo->realParameter[43160] /* world.x_label.lines[2,1,2] PARAM */) = (data->simulationInfo->realParameter[43144] /* world.scaledLabel PARAM */);
  TRACE_POP
}

/*
equation index: 3824
type: SIMPLE_ASSIGN
world.x_label.lines[2,2,1] = world.scaledLabel
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3824(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3824};
  (data->simulationInfo->realParameter[43161] /* world.x_label.lines[2,2,1] PARAM */) = (data->simulationInfo->realParameter[43144] /* world.scaledLabel PARAM */);
  TRACE_POP
}

/*
equation index: 3825
type: SIMPLE_ASSIGN
world.x_label.cylinders[1].width = world.axisDiameter
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3825(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3825};
  (data->simulationInfo->realParameter[43155] /* world.x_label.cylinders[1].width PARAM */) = (data->simulationInfo->realParameter[43104] /* world.axisDiameter PARAM */);
  TRACE_POP
}

/*
equation index: 3826
type: SIMPLE_ASSIGN
world.x_label.cylinders[1].height = world.axisDiameter
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3826(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3826};
  (data->simulationInfo->realParameter[43152] /* world.x_label.cylinders[1].height PARAM */) = (data->simulationInfo->realParameter[43104] /* world.axisDiameter PARAM */);
  TRACE_POP
}

/*
equation index: 3827
type: SIMPLE_ASSIGN
world.x_label.cylinders[2].width = world.axisDiameter
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3827(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3827};
  (data->simulationInfo->realParameter[43156] /* world.x_label.cylinders[2].width PARAM */) = (data->simulationInfo->realParameter[43104] /* world.axisDiameter PARAM */);
  TRACE_POP
}

/*
equation index: 3828
type: SIMPLE_ASSIGN
world.x_label.cylinders[2].height = world.axisDiameter
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3828(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3828};
  (data->simulationInfo->realParameter[43153] /* world.x_label.cylinders[2].height PARAM */) = (data->simulationInfo->realParameter[43104] /* world.axisDiameter PARAM */);
  TRACE_POP
}

/*
equation index: 3829
type: SIMPLE_ASSIGN
world.x_label.diameter = world.axisDiameter
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3829(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3829};
  (data->simulationInfo->realParameter[43157] /* world.x_label.diameter PARAM */) = (data->simulationInfo->realParameter[43104] /* world.axisDiameter PARAM */);
  TRACE_POP
}

/*
equation index: 3830
type: SIMPLE_ASSIGN
world.y_arrowLine.length = world.lineLength
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3830(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3830};
  (data->simulationInfo->realParameter[43169] /* world.y_arrowLine.length PARAM */) = (data->simulationInfo->realParameter[43137] /* world.lineLength PARAM */);
  TRACE_POP
}

/*
equation index: 3831
type: SIMPLE_ASSIGN
world.y_arrowLine.width = world.lineWidth
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3831(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3831};
  (data->simulationInfo->realParameter[43170] /* world.y_arrowLine.width PARAM */) = (data->simulationInfo->realParameter[43138] /* world.lineWidth PARAM */);
  TRACE_POP
}

/*
equation index: 3832
type: SIMPLE_ASSIGN
world.y_arrowLine.height = world.lineWidth
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3832(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3832};
  (data->simulationInfo->realParameter[43168] /* world.y_arrowLine.height PARAM */) = (data->simulationInfo->realParameter[43138] /* world.lineWidth PARAM */);
  TRACE_POP
}

/*
equation index: 3833
type: SIMPLE_ASSIGN
world.y_arrowHead.length = world.headLength
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3833(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3833};
  (data->simulationInfo->realParameter[43165] /* world.y_arrowHead.length PARAM */) = (data->simulationInfo->realParameter[43134] /* world.headLength PARAM */);
  TRACE_POP
}

/*
equation index: 3834
type: SIMPLE_ASSIGN
world.y_arrowHead.width = world.headWidth
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3834(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3834};
  (data->simulationInfo->realParameter[43167] /* world.y_arrowHead.width PARAM */) = (data->simulationInfo->realParameter[43135] /* world.headWidth PARAM */);
  TRACE_POP
}

/*
equation index: 3835
type: SIMPLE_ASSIGN
world.y_arrowHead.height = world.headWidth
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3835(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3835};
  (data->simulationInfo->realParameter[43164] /* world.y_arrowHead.height PARAM */) = (data->simulationInfo->realParameter[43135] /* world.headWidth PARAM */);
  TRACE_POP
}

/*
equation index: 3836
type: SIMPLE_ASSIGN
world.y_label.cylinders[1].r[2] = world.labelStart
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3836(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3836};
  (data->simulationInfo->realParameter[43173] /* world.y_label.cylinders[1].r[2] PARAM */) = (data->simulationInfo->realParameter[43136] /* world.labelStart PARAM */);
  TRACE_POP
}

/*
equation index: 3837
type: SIMPLE_ASSIGN
world.y_label.r_abs[2] = world.labelStart
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3837(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3837};
  (data->simulationInfo->realParameter[43178] /* world.y_label.r_abs[2] PARAM */) = (data->simulationInfo->realParameter[43136] /* world.labelStart PARAM */);
  TRACE_POP
}

/*
equation index: 3838
type: SIMPLE_ASSIGN
world.y_label.r_lines[2] = world.labelStart
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3838(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3838};
  (data->simulationInfo->realParameter[43179] /* world.y_label.r_lines[2] PARAM */) = (data->simulationInfo->realParameter[43136] /* world.labelStart PARAM */);
  TRACE_POP
}

/*
equation index: 3839
type: SIMPLE_ASSIGN
world.y_label.lines[1,2,1] = world.scaledLabel
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3839(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3839};
  (data->simulationInfo->realParameter[43177] /* world.y_label.lines[1,2,1] PARAM */) = (data->simulationInfo->realParameter[43144] /* world.scaledLabel PARAM */);
  TRACE_POP
}

/*
equation index: 3840
type: SIMPLE_ASSIGN
world.y_label.cylinders[1].width = world.axisDiameter
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3840(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3840};
  (data->simulationInfo->realParameter[43174] /* world.y_label.cylinders[1].width PARAM */) = (data->simulationInfo->realParameter[43104] /* world.axisDiameter PARAM */);
  TRACE_POP
}

/*
equation index: 3841
type: SIMPLE_ASSIGN
world.y_label.cylinders[1].height = world.axisDiameter
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3841(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3841};
  (data->simulationInfo->realParameter[43171] /* world.y_label.cylinders[1].height PARAM */) = (data->simulationInfo->realParameter[43104] /* world.axisDiameter PARAM */);
  TRACE_POP
}

/*
equation index: 3842
type: SIMPLE_ASSIGN
world.y_label.cylinders[2].width = world.axisDiameter
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3842(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3842};
  (data->simulationInfo->realParameter[43175] /* world.y_label.cylinders[2].width PARAM */) = (data->simulationInfo->realParameter[43104] /* world.axisDiameter PARAM */);
  TRACE_POP
}

/*
equation index: 3843
type: SIMPLE_ASSIGN
world.y_label.cylinders[2].height = world.axisDiameter
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3843(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3843};
  (data->simulationInfo->realParameter[43172] /* world.y_label.cylinders[2].height PARAM */) = (data->simulationInfo->realParameter[43104] /* world.axisDiameter PARAM */);
  TRACE_POP
}

/*
equation index: 3844
type: SIMPLE_ASSIGN
world.y_label.diameter = world.axisDiameter
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3844(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3844};
  (data->simulationInfo->realParameter[43176] /* world.y_label.diameter PARAM */) = (data->simulationInfo->realParameter[43104] /* world.axisDiameter PARAM */);
  TRACE_POP
}

/*
equation index: 3845
type: SIMPLE_ASSIGN
world.z_arrowLine.length = world.lineLength
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3845(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3845};
  (data->simulationInfo->realParameter[43185] /* world.z_arrowLine.length PARAM */) = (data->simulationInfo->realParameter[43137] /* world.lineLength PARAM */);
  TRACE_POP
}

/*
equation index: 3846
type: SIMPLE_ASSIGN
world.z_arrowLine.width = world.lineWidth
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3846(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3846};
  (data->simulationInfo->realParameter[43186] /* world.z_arrowLine.width PARAM */) = (data->simulationInfo->realParameter[43138] /* world.lineWidth PARAM */);
  TRACE_POP
}

/*
equation index: 3847
type: SIMPLE_ASSIGN
world.z_arrowLine.height = world.lineWidth
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3847(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3847};
  (data->simulationInfo->realParameter[43184] /* world.z_arrowLine.height PARAM */) = (data->simulationInfo->realParameter[43138] /* world.lineWidth PARAM */);
  TRACE_POP
}

/*
equation index: 3848
type: SIMPLE_ASSIGN
world.z_arrowHead.length = world.headLength
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3848(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3848};
  (data->simulationInfo->realParameter[43181] /* world.z_arrowHead.length PARAM */) = (data->simulationInfo->realParameter[43134] /* world.headLength PARAM */);
  TRACE_POP
}

/*
equation index: 3849
type: SIMPLE_ASSIGN
world.z_arrowHead.width = world.headWidth
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3849(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3849};
  (data->simulationInfo->realParameter[43183] /* world.z_arrowHead.width PARAM */) = (data->simulationInfo->realParameter[43135] /* world.headWidth PARAM */);
  TRACE_POP
}

/*
equation index: 3850
type: SIMPLE_ASSIGN
world.z_arrowHead.height = world.headWidth
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3850(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3850};
  (data->simulationInfo->realParameter[43180] /* world.z_arrowHead.height PARAM */) = (data->simulationInfo->realParameter[43135] /* world.headWidth PARAM */);
  TRACE_POP
}

/*
equation index: 3851
type: SIMPLE_ASSIGN
world.z_label.cylinders[1].r[3] = world.labelStart
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3851(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3851};
  (data->simulationInfo->realParameter[43190] /* world.z_label.cylinders[1].r[3] PARAM */) = (data->simulationInfo->realParameter[43136] /* world.labelStart PARAM */);
  TRACE_POP
}

/*
equation index: 3852
type: SIMPLE_ASSIGN
world.z_label.r_abs[3] = world.labelStart
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3852(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3852};
  (data->simulationInfo->realParameter[43201] /* world.z_label.r_abs[3] PARAM */) = (data->simulationInfo->realParameter[43136] /* world.labelStart PARAM */);
  TRACE_POP
}

/*
equation index: 3853
type: SIMPLE_ASSIGN
world.z_label.r_lines[3] = world.labelStart
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3853(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3853};
  (data->simulationInfo->realParameter[43202] /* world.z_label.r_lines[3] PARAM */) = (data->simulationInfo->realParameter[43136] /* world.labelStart PARAM */);
  TRACE_POP
}

/*
equation index: 3854
type: SIMPLE_ASSIGN
world.z_label.lines[1,2,1] = world.scaledLabel
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3854(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3854};
  (data->simulationInfo->realParameter[43195] /* world.z_label.lines[1,2,1] PARAM */) = (data->simulationInfo->realParameter[43144] /* world.scaledLabel PARAM */);
  TRACE_POP
}

/*
equation index: 3855
type: SIMPLE_ASSIGN
world.z_label.lines[2,1,2] = world.scaledLabel
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3855(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3855};
  (data->simulationInfo->realParameter[43196] /* world.z_label.lines[2,1,2] PARAM */) = (data->simulationInfo->realParameter[43144] /* world.scaledLabel PARAM */);
  TRACE_POP
}

/*
equation index: 3856
type: SIMPLE_ASSIGN
world.z_label.lines[2,2,1] = world.scaledLabel
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3856(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3856};
  (data->simulationInfo->realParameter[43197] /* world.z_label.lines[2,2,1] PARAM */) = (data->simulationInfo->realParameter[43144] /* world.scaledLabel PARAM */);
  TRACE_POP
}

/*
equation index: 3857
type: SIMPLE_ASSIGN
world.z_label.lines[2,2,2] = world.scaledLabel
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3857(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3857};
  (data->simulationInfo->realParameter[43198] /* world.z_label.lines[2,2,2] PARAM */) = (data->simulationInfo->realParameter[43144] /* world.scaledLabel PARAM */);
  TRACE_POP
}

/*
equation index: 3858
type: SIMPLE_ASSIGN
world.z_label.lines[3,1,2] = world.scaledLabel
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3858(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3858};
  (data->simulationInfo->realParameter[43199] /* world.z_label.lines[3,1,2] PARAM */) = (data->simulationInfo->realParameter[43144] /* world.scaledLabel PARAM */);
  TRACE_POP
}

/*
equation index: 3859
type: SIMPLE_ASSIGN
world.z_label.lines[3,2,1] = world.scaledLabel
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3859(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3859};
  (data->simulationInfo->realParameter[43200] /* world.z_label.lines[3,2,1] PARAM */) = (data->simulationInfo->realParameter[43144] /* world.scaledLabel PARAM */);
  TRACE_POP
}

/*
equation index: 3860
type: SIMPLE_ASSIGN
world.z_label.cylinders[1].width = world.axisDiameter
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3860(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3860};
  (data->simulationInfo->realParameter[43191] /* world.z_label.cylinders[1].width PARAM */) = (data->simulationInfo->realParameter[43104] /* world.axisDiameter PARAM */);
  TRACE_POP
}

/*
equation index: 3861
type: SIMPLE_ASSIGN
world.z_label.cylinders[1].height = world.axisDiameter
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3861(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3861};
  (data->simulationInfo->realParameter[43187] /* world.z_label.cylinders[1].height PARAM */) = (data->simulationInfo->realParameter[43104] /* world.axisDiameter PARAM */);
  TRACE_POP
}

/*
equation index: 3862
type: SIMPLE_ASSIGN
world.z_label.cylinders[2].width = world.axisDiameter
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3862(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3862};
  (data->simulationInfo->realParameter[43192] /* world.z_label.cylinders[2].width PARAM */) = (data->simulationInfo->realParameter[43104] /* world.axisDiameter PARAM */);
  TRACE_POP
}

/*
equation index: 3863
type: SIMPLE_ASSIGN
world.z_label.cylinders[2].height = world.axisDiameter
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3863(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3863};
  (data->simulationInfo->realParameter[43188] /* world.z_label.cylinders[2].height PARAM */) = (data->simulationInfo->realParameter[43104] /* world.axisDiameter PARAM */);
  TRACE_POP
}

/*
equation index: 3864
type: SIMPLE_ASSIGN
world.z_label.cylinders[3].width = world.axisDiameter
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3864(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3864};
  (data->simulationInfo->realParameter[43193] /* world.z_label.cylinders[3].width PARAM */) = (data->simulationInfo->realParameter[43104] /* world.axisDiameter PARAM */);
  TRACE_POP
}

/*
equation index: 3865
type: SIMPLE_ASSIGN
world.z_label.cylinders[3].height = world.axisDiameter
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3865(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3865};
  (data->simulationInfo->realParameter[43189] /* world.z_label.cylinders[3].height PARAM */) = (data->simulationInfo->realParameter[43104] /* world.axisDiameter PARAM */);
  TRACE_POP
}

/*
equation index: 3866
type: SIMPLE_ASSIGN
world.z_label.diameter = world.axisDiameter
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3866(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3866};
  (data->simulationInfo->realParameter[43194] /* world.z_label.diameter PARAM */) = (data->simulationInfo->realParameter[43104] /* world.axisDiameter PARAM */);
  TRACE_POP
}

/*
equation index: 3867
type: SIMPLE_ASSIGN
spar.body.body.specularCoefficient = world.defaultSpecularCoefficient
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3867(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3867};
  (data->simulationInfo->realParameter[43033] /* spar.body.body.specularCoefficient PARAM */) = (data->simulationInfo->realParameter[43116] /* world.defaultSpecularCoefficient PARAM */);
  TRACE_POP
}

/*
equation index: 3868
type: SIMPLE_ASSIGN
spar.body.fixedTranslation.shape.length = spar.body.fixedTranslation.length
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3868(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3868};
  (data->simulationInfo->realParameter[43056] /* spar.body.fixedTranslation.shape.length PARAM */) = (data->simulationInfo->realParameter[43044] /* spar.body.fixedTranslation.length PARAM */);
  TRACE_POP
}

/*
equation index: 3869
type: SIMPLE_ASSIGN
spar.body.fixedTranslation.width = spar.body.fixedTranslation.length / world.defaultWidthFraction
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3869(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3869};
  (data->simulationInfo->realParameter[43060] /* spar.body.fixedTranslation.width PARAM */) = DIVISION_SIM((data->simulationInfo->realParameter[43044] /* spar.body.fixedTranslation.length PARAM */),(data->simulationInfo->realParameter[43117] /* world.defaultWidthFraction PARAM */),"world.defaultWidthFraction",equationIndexes);
  TRACE_POP
}

/*
equation index: 3870
type: SIMPLE_ASSIGN
spar.body.fixedTranslation.shape.width = spar.body.fixedTranslation.width
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3870(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3870};
  (data->simulationInfo->realParameter[43058] /* spar.body.fixedTranslation.shape.width PARAM */) = (data->simulationInfo->realParameter[43060] /* spar.body.fixedTranslation.width PARAM */);
  TRACE_POP
}

/*
equation index: 3871
type: SIMPLE_ASSIGN
spar.body.fixedTranslation.height = spar.body.fixedTranslation.width
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3871(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3871};
  (data->simulationInfo->realParameter[43043] /* spar.body.fixedTranslation.height PARAM */) = (data->simulationInfo->realParameter[43060] /* spar.body.fixedTranslation.width PARAM */);
  TRACE_POP
}

/*
equation index: 3872
type: SIMPLE_ASSIGN
spar.body.fixedTranslation.shape.height = spar.body.fixedTranslation.height
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3872(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3872};
  (data->simulationInfo->realParameter[43055] /* spar.body.fixedTranslation.shape.height PARAM */) = (data->simulationInfo->realParameter[43043] /* spar.body.fixedTranslation.height PARAM */);
  TRACE_POP
}

/*
equation index: 3873
type: SIMPLE_ASSIGN
spar.body.fixedTranslation.shape.extra = spar.body.fixedTranslation.extra
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3873(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3873};
  (data->simulationInfo->realParameter[43054] /* spar.body.fixedTranslation.shape.extra PARAM */) = (data->simulationInfo->realParameter[43042] /* spar.body.fixedTranslation.extra PARAM */);
  TRACE_POP
}

/*
equation index: 3874
type: SIMPLE_ASSIGN
spar.body.fixedTranslation.shape.specularCoefficient = world.defaultSpecularCoefficient
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3874(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3874};
  (data->simulationInfo->realParameter[43057] /* spar.body.fixedTranslation.shape.specularCoefficient PARAM */) = (data->simulationInfo->realParameter[43116] /* world.defaultSpecularCoefficient PARAM */);
  TRACE_POP
}

/*
equation index: 3875
type: SIMPLE_ASSIGN
spar.body.fixedTranslation.specularCoefficient = world.defaultSpecularCoefficient
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3875(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3875};
  (data->simulationInfo->realParameter[43059] /* spar.body.fixedTranslation.specularCoefficient PARAM */) = (data->simulationInfo->realParameter[43116] /* world.defaultSpecularCoefficient PARAM */);
  TRACE_POP
}

/*
equation index: 3876
type: SIMPLE_ASSIGN
spar.body.fixedTranslation1.shape.length = spar.body.fixedTranslation1.length
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3876(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3876};
  (data->simulationInfo->realParameter[43078] /* spar.body.fixedTranslation1.shape.length PARAM */) = (data->simulationInfo->realParameter[43066] /* spar.body.fixedTranslation1.length PARAM */);
  TRACE_POP
}

/*
equation index: 3877
type: SIMPLE_ASSIGN
spar.body.fixedTranslation1.width = spar.body.fixedTranslation1.length / world.defaultWidthFraction
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3877(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3877};
  (data->simulationInfo->realParameter[43082] /* spar.body.fixedTranslation1.width PARAM */) = DIVISION_SIM((data->simulationInfo->realParameter[43066] /* spar.body.fixedTranslation1.length PARAM */),(data->simulationInfo->realParameter[43117] /* world.defaultWidthFraction PARAM */),"world.defaultWidthFraction",equationIndexes);
  TRACE_POP
}

/*
equation index: 3878
type: SIMPLE_ASSIGN
spar.body.fixedTranslation1.shape.width = spar.body.fixedTranslation1.width
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3878(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3878};
  (data->simulationInfo->realParameter[43080] /* spar.body.fixedTranslation1.shape.width PARAM */) = (data->simulationInfo->realParameter[43082] /* spar.body.fixedTranslation1.width PARAM */);
  TRACE_POP
}

/*
equation index: 3879
type: SIMPLE_ASSIGN
spar.body.fixedTranslation1.height = spar.body.fixedTranslation1.width
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3879(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3879};
  (data->simulationInfo->realParameter[43065] /* spar.body.fixedTranslation1.height PARAM */) = (data->simulationInfo->realParameter[43082] /* spar.body.fixedTranslation1.width PARAM */);
  TRACE_POP
}

/*
equation index: 3880
type: SIMPLE_ASSIGN
spar.body.fixedTranslation1.shape.height = spar.body.fixedTranslation1.height
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3880(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3880};
  (data->simulationInfo->realParameter[43077] /* spar.body.fixedTranslation1.shape.height PARAM */) = (data->simulationInfo->realParameter[43065] /* spar.body.fixedTranslation1.height PARAM */);
  TRACE_POP
}

/*
equation index: 3881
type: SIMPLE_ASSIGN
spar.body.fixedTranslation1.shape.extra = spar.body.fixedTranslation1.extra
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3881(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3881};
  (data->simulationInfo->realParameter[43076] /* spar.body.fixedTranslation1.shape.extra PARAM */) = (data->simulationInfo->realParameter[43064] /* spar.body.fixedTranslation1.extra PARAM */);
  TRACE_POP
}

/*
equation index: 3882
type: SIMPLE_ASSIGN
spar.body.fixedTranslation1.shape.specularCoefficient = world.defaultSpecularCoefficient
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3882(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3882};
  (data->simulationInfo->realParameter[43079] /* spar.body.fixedTranslation1.shape.specularCoefficient PARAM */) = (data->simulationInfo->realParameter[43116] /* world.defaultSpecularCoefficient PARAM */);
  TRACE_POP
}

/*
equation index: 3883
type: SIMPLE_ASSIGN
spar.body.fixedTranslation1.specularCoefficient = world.defaultSpecularCoefficient
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3883(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3883};
  (data->simulationInfo->realParameter[43081] /* spar.body.fixedTranslation1.specularCoefficient PARAM */) = (data->simulationInfo->realParameter[43116] /* world.defaultSpecularCoefficient PARAM */);
  TRACE_POP
}

/*
equation index: 3884
type: SIMPLE_ASSIGN
spar.body.fixedShape.specularCoefficient = world.defaultSpecularCoefficient
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3884(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3884};
  (data->simulationInfo->realParameter[43041] /* spar.body.fixedShape.specularCoefficient PARAM */) = (data->simulationInfo->realParameter[43116] /* world.defaultSpecularCoefficient PARAM */);
  TRACE_POP
}

/*
equation index: 3885
type: SIMPLE_ASSIGN
spar.body.absoluteSensor.specularCoefficient = world.defaultSpecularCoefficient
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3885(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3885};
  (data->simulationInfo->realParameter[42908] /* spar.body.absoluteSensor.specularCoefficient PARAM */) = (data->simulationInfo->realParameter[43116] /* world.defaultSpecularCoefficient PARAM */);
  TRACE_POP
}

/*
equation index: 3886
type: SIMPLE_ASSIGN
spar.body.absoluteSensor.arrow.arrowLine.specularCoefficient = world.defaultSpecularCoefficient
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3886(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3886};
  (data->simulationInfo->realParameter[42905] /* spar.body.absoluteSensor.arrow.arrowLine.specularCoefficient PARAM */) = (data->simulationInfo->realParameter[43116] /* world.defaultSpecularCoefficient PARAM */);
  TRACE_POP
}

/*
equation index: 3887
type: SIMPLE_ASSIGN
spar.body.absoluteSensor.arrow.specularCoefficient = world.defaultSpecularCoefficient
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3887(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3887};
  (data->simulationInfo->realParameter[42906] /* spar.body.absoluteSensor.arrow.specularCoefficient PARAM */) = (data->simulationInfo->realParameter[43116] /* world.defaultSpecularCoefficient PARAM */);
  TRACE_POP
}

/*
equation index: 3888
type: SIMPLE_ASSIGN
spar.absoluteSensor.specularCoefficient = world.defaultSpecularCoefficient
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3888(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3888};
  (data->simulationInfo->realParameter[42897] /* spar.absoluteSensor.specularCoefficient PARAM */) = (data->simulationInfo->realParameter[43116] /* world.defaultSpecularCoefficient PARAM */);
  TRACE_POP
}

/*
equation index: 3889
type: SIMPLE_ASSIGN
spar.absoluteSensor.arrow.arrowLine.specularCoefficient = world.defaultSpecularCoefficient
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3889(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3889};
  (data->simulationInfo->realParameter[42894] /* spar.absoluteSensor.arrow.arrowLine.specularCoefficient PARAM */) = (data->simulationInfo->realParameter[43116] /* world.defaultSpecularCoefficient PARAM */);
  TRACE_POP
}

/*
equation index: 3890
type: SIMPLE_ASSIGN
spar.absoluteSensor.arrow.specularCoefficient = world.defaultSpecularCoefficient
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3890(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3890};
  (data->simulationInfo->realParameter[42895] /* spar.absoluteSensor.arrow.specularCoefficient PARAM */) = (data->simulationInfo->realParameter[43116] /* world.defaultSpecularCoefficient PARAM */);
  TRACE_POP
}

/*
equation index: 3891
type: SIMPLE_ASSIGN
float.body.body.specularCoefficient = world.defaultSpecularCoefficient
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3891(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3891};
  (data->simulationInfo->realParameter[152] /* float.body.body.specularCoefficient PARAM */) = (data->simulationInfo->realParameter[43116] /* world.defaultSpecularCoefficient PARAM */);
  TRACE_POP
}

/*
equation index: 3892
type: SIMPLE_ASSIGN
float.body.fixedTranslation.shape.length = float.body.fixedTranslation.length
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3892(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3892};
  (data->simulationInfo->realParameter[177] /* float.body.fixedTranslation.shape.length PARAM */) = (data->simulationInfo->realParameter[165] /* float.body.fixedTranslation.length PARAM */);
  TRACE_POP
}

/*
equation index: 3893
type: SIMPLE_ASSIGN
float.body.fixedTranslation.width = float.body.fixedTranslation.length / world.defaultWidthFraction
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3893(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3893};
  (data->simulationInfo->realParameter[181] /* float.body.fixedTranslation.width PARAM */) = DIVISION_SIM((data->simulationInfo->realParameter[165] /* float.body.fixedTranslation.length PARAM */),(data->simulationInfo->realParameter[43117] /* world.defaultWidthFraction PARAM */),"world.defaultWidthFraction",equationIndexes);
  TRACE_POP
}

/*
equation index: 3894
type: SIMPLE_ASSIGN
float.body.fixedTranslation.shape.width = float.body.fixedTranslation.width
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3894(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3894};
  (data->simulationInfo->realParameter[179] /* float.body.fixedTranslation.shape.width PARAM */) = (data->simulationInfo->realParameter[181] /* float.body.fixedTranslation.width PARAM */);
  TRACE_POP
}

/*
equation index: 3895
type: SIMPLE_ASSIGN
float.body.fixedTranslation.height = float.body.fixedTranslation.width
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3895(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3895};
  (data->simulationInfo->realParameter[164] /* float.body.fixedTranslation.height PARAM */) = (data->simulationInfo->realParameter[181] /* float.body.fixedTranslation.width PARAM */);
  TRACE_POP
}

/*
equation index: 3896
type: SIMPLE_ASSIGN
float.body.fixedTranslation.shape.height = float.body.fixedTranslation.height
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3896(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3896};
  (data->simulationInfo->realParameter[176] /* float.body.fixedTranslation.shape.height PARAM */) = (data->simulationInfo->realParameter[164] /* float.body.fixedTranslation.height PARAM */);
  TRACE_POP
}

/*
equation index: 3897
type: SIMPLE_ASSIGN
float.body.fixedTranslation.shape.extra = float.body.fixedTranslation.extra
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3897(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3897};
  (data->simulationInfo->realParameter[175] /* float.body.fixedTranslation.shape.extra PARAM */) = (data->simulationInfo->realParameter[161] /* float.body.fixedTranslation.extra PARAM */);
  TRACE_POP
}

/*
equation index: 3898
type: SIMPLE_ASSIGN
float.body.fixedTranslation.shape.specularCoefficient = world.defaultSpecularCoefficient
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3898(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3898};
  (data->simulationInfo->realParameter[178] /* float.body.fixedTranslation.shape.specularCoefficient PARAM */) = (data->simulationInfo->realParameter[43116] /* world.defaultSpecularCoefficient PARAM */);
  TRACE_POP
}

/*
equation index: 3899
type: SIMPLE_ASSIGN
float.body.fixedTranslation.specularCoefficient = world.defaultSpecularCoefficient
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3899(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3899};
  (data->simulationInfo->realParameter[180] /* float.body.fixedTranslation.specularCoefficient PARAM */) = (data->simulationInfo->realParameter[43116] /* world.defaultSpecularCoefficient PARAM */);
  TRACE_POP
}

/*
equation index: 3900
type: SIMPLE_ASSIGN
float.body.fixedTranslation1.shape.length = float.body.fixedTranslation1.length
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3900(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3900};
  (data->simulationInfo->realParameter[199] /* float.body.fixedTranslation1.shape.length PARAM */) = (data->simulationInfo->realParameter[187] /* float.body.fixedTranslation1.length PARAM */);
  TRACE_POP
}

/*
equation index: 3901
type: SIMPLE_ASSIGN
float.body.fixedTranslation1.width = float.body.fixedTranslation1.length / world.defaultWidthFraction
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3901(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3901};
  (data->simulationInfo->realParameter[203] /* float.body.fixedTranslation1.width PARAM */) = DIVISION_SIM((data->simulationInfo->realParameter[187] /* float.body.fixedTranslation1.length PARAM */),(data->simulationInfo->realParameter[43117] /* world.defaultWidthFraction PARAM */),"world.defaultWidthFraction",equationIndexes);
  TRACE_POP
}

/*
equation index: 3902
type: SIMPLE_ASSIGN
float.body.fixedTranslation1.shape.width = float.body.fixedTranslation1.width
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3902(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3902};
  (data->simulationInfo->realParameter[201] /* float.body.fixedTranslation1.shape.width PARAM */) = (data->simulationInfo->realParameter[203] /* float.body.fixedTranslation1.width PARAM */);
  TRACE_POP
}

/*
equation index: 3903
type: SIMPLE_ASSIGN
float.body.fixedTranslation1.height = float.body.fixedTranslation1.width
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3903(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3903};
  (data->simulationInfo->realParameter[186] /* float.body.fixedTranslation1.height PARAM */) = (data->simulationInfo->realParameter[203] /* float.body.fixedTranslation1.width PARAM */);
  TRACE_POP
}

/*
equation index: 3904
type: SIMPLE_ASSIGN
float.body.fixedTranslation1.shape.height = float.body.fixedTranslation1.height
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3904(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3904};
  (data->simulationInfo->realParameter[198] /* float.body.fixedTranslation1.shape.height PARAM */) = (data->simulationInfo->realParameter[186] /* float.body.fixedTranslation1.height PARAM */);
  TRACE_POP
}

/*
equation index: 3905
type: SIMPLE_ASSIGN
float.body.fixedTranslation1.shape.extra = float.body.fixedTranslation1.extra
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3905(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3905};
  (data->simulationInfo->realParameter[197] /* float.body.fixedTranslation1.shape.extra PARAM */) = (data->simulationInfo->realParameter[185] /* float.body.fixedTranslation1.extra PARAM */);
  TRACE_POP
}

/*
equation index: 3906
type: SIMPLE_ASSIGN
float.body.fixedTranslation1.shape.specularCoefficient = world.defaultSpecularCoefficient
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3906(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3906};
  (data->simulationInfo->realParameter[200] /* float.body.fixedTranslation1.shape.specularCoefficient PARAM */) = (data->simulationInfo->realParameter[43116] /* world.defaultSpecularCoefficient PARAM */);
  TRACE_POP
}

/*
equation index: 3907
type: SIMPLE_ASSIGN
float.body.fixedTranslation1.specularCoefficient = world.defaultSpecularCoefficient
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3907(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3907};
  (data->simulationInfo->realParameter[202] /* float.body.fixedTranslation1.specularCoefficient PARAM */) = (data->simulationInfo->realParameter[43116] /* world.defaultSpecularCoefficient PARAM */);
  TRACE_POP
}

/*
equation index: 3908
type: SIMPLE_ASSIGN
float.body.fixedShape.specularCoefficient = world.defaultSpecularCoefficient
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3908(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3908};
  (data->simulationInfo->realParameter[160] /* float.body.fixedShape.specularCoefficient PARAM */) = (data->simulationInfo->realParameter[43116] /* world.defaultSpecularCoefficient PARAM */);
  TRACE_POP
}

/*
equation index: 3909
type: SIMPLE_ASSIGN
float.body.absoluteSensor.specularCoefficient = world.defaultSpecularCoefficient
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3909(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3909};
  (data->simulationInfo->realParameter[27] /* float.body.absoluteSensor.specularCoefficient PARAM */) = (data->simulationInfo->realParameter[43116] /* world.defaultSpecularCoefficient PARAM */);
  TRACE_POP
}

/*
equation index: 3910
type: SIMPLE_ASSIGN
float.body.absoluteSensor.arrow.arrowLine.specularCoefficient = world.defaultSpecularCoefficient
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3910(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3910};
  (data->simulationInfo->realParameter[24] /* float.body.absoluteSensor.arrow.arrowLine.specularCoefficient PARAM */) = (data->simulationInfo->realParameter[43116] /* world.defaultSpecularCoefficient PARAM */);
  TRACE_POP
}

/*
equation index: 3911
type: SIMPLE_ASSIGN
float.body.absoluteSensor.arrow.specularCoefficient = world.defaultSpecularCoefficient
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3911(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3911};
  (data->simulationInfo->realParameter[25] /* float.body.absoluteSensor.arrow.specularCoefficient PARAM */) = (data->simulationInfo->realParameter[43116] /* world.defaultSpecularCoefficient PARAM */);
  TRACE_POP
}

/*
equation index: 3912
type: SIMPLE_ASSIGN
float.hydrostatic.absoluteSensor.specularCoefficient = world.defaultSpecularCoefficient
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3912(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3912};
  (data->simulationInfo->realParameter[3606] /* float.hydrostatic.absoluteSensor.specularCoefficient PARAM */) = (data->simulationInfo->realParameter[43116] /* world.defaultSpecularCoefficient PARAM */);
  TRACE_POP
}

/*
equation index: 3913
type: SIMPLE_ASSIGN
float.hydrostatic.absoluteSensor.arrow.arrowLine.specularCoefficient = world.defaultSpecularCoefficient
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3913(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3913};
  (data->simulationInfo->realParameter[3603] /* float.hydrostatic.absoluteSensor.arrow.arrowLine.specularCoefficient PARAM */) = (data->simulationInfo->realParameter[43116] /* world.defaultSpecularCoefficient PARAM */);
  TRACE_POP
}

/*
equation index: 3914
type: SIMPLE_ASSIGN
float.hydrostatic.absoluteSensor.arrow.specularCoefficient = world.defaultSpecularCoefficient
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3914(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3914};
  (data->simulationInfo->realParameter[3604] /* float.hydrostatic.absoluteSensor.arrow.specularCoefficient PARAM */) = (data->simulationInfo->realParameter[43116] /* world.defaultSpecularCoefficient PARAM */);
  TRACE_POP
}

/*
equation index: 3915
type: SIMPLE_ASSIGN
float.radiation.absoluteSensor.specularCoefficient = world.defaultSpecularCoefficient
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3915(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3915};
  (data->simulationInfo->realParameter[3656] /* float.radiation.absoluteSensor.specularCoefficient PARAM */) = (data->simulationInfo->realParameter[43116] /* world.defaultSpecularCoefficient PARAM */);
  TRACE_POP
}

/*
equation index: 3916
type: SIMPLE_ASSIGN
float.radiation.absoluteSensor.arrow.arrowLine.specularCoefficient = world.defaultSpecularCoefficient
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3916(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3916};
  (data->simulationInfo->realParameter[3653] /* float.radiation.absoluteSensor.arrow.arrowLine.specularCoefficient PARAM */) = (data->simulationInfo->realParameter[43116] /* world.defaultSpecularCoefficient PARAM */);
  TRACE_POP
}

/*
equation index: 3917
type: SIMPLE_ASSIGN
float.radiation.absoluteSensor.arrow.specularCoefficient = world.defaultSpecularCoefficient
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3917(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3917};
  (data->simulationInfo->realParameter[3654] /* float.radiation.absoluteSensor.arrow.specularCoefficient PARAM */) = (data->simulationInfo->realParameter[43116] /* world.defaultSpecularCoefficient PARAM */);
  TRACE_POP
}

/*
equation index: 3918
type: SIMPLE_ASSIGN
float.absoluteSensor.specularCoefficient = world.defaultSpecularCoefficient
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3918(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3918};
  (data->simulationInfo->realParameter[16] /* float.absoluteSensor.specularCoefficient PARAM */) = (data->simulationInfo->realParameter[43116] /* world.defaultSpecularCoefficient PARAM */);
  TRACE_POP
}

/*
equation index: 3919
type: SIMPLE_ASSIGN
float.absoluteSensor.arrow.arrowLine.specularCoefficient = world.defaultSpecularCoefficient
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3919(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3919};
  (data->simulationInfo->realParameter[13] /* float.absoluteSensor.arrow.arrowLine.specularCoefficient PARAM */) = (data->simulationInfo->realParameter[43116] /* world.defaultSpecularCoefficient PARAM */);
  TRACE_POP
}

/*
equation index: 3920
type: SIMPLE_ASSIGN
float.absoluteSensor.arrow.specularCoefficient = world.defaultSpecularCoefficient
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3920(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3920};
  (data->simulationInfo->realParameter[14] /* float.absoluteSensor.arrow.specularCoefficient PARAM */) = (data->simulationInfo->realParameter[43116] /* world.defaultSpecularCoefficient PARAM */);
  TRACE_POP
}

/*
equation index: 3921
type: SIMPLE_ASSIGN
prismatic.boxWidth = world.defaultJointWidth
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3921(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3921};
  (data->simulationInfo->realParameter[42866] /* prismatic.boxWidth PARAM */) = (data->simulationInfo->realParameter[43113] /* world.defaultJointWidth PARAM */);
  TRACE_POP
}

/*
equation index: 3922
type: SIMPLE_ASSIGN
prismatic.box.width = prismatic.boxWidth
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3922(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3922};
  (data->simulationInfo->realParameter[42864] /* prismatic.box.width PARAM */) = (data->simulationInfo->realParameter[42866] /* prismatic.boxWidth PARAM */);
  TRACE_POP
}

/*
equation index: 3923
type: SIMPLE_ASSIGN
prismatic.boxHeight = prismatic.boxWidth
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3923(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3923};
  (data->simulationInfo->realParameter[42865] /* prismatic.boxHeight PARAM */) = (data->simulationInfo->realParameter[42866] /* prismatic.boxWidth PARAM */);
  TRACE_POP
}

/*
equation index: 3924
type: SIMPLE_ASSIGN
prismatic.box.height = prismatic.boxHeight
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3924(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3924};
  (data->simulationInfo->realParameter[42862] /* prismatic.box.height PARAM */) = (data->simulationInfo->realParameter[42865] /* prismatic.boxHeight PARAM */);
  TRACE_POP
}

/*
equation index: 3925
type: SIMPLE_ASSIGN
prismatic.box.specularCoefficient = world.defaultSpecularCoefficient
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3925(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3925};
  (data->simulationInfo->realParameter[42863] /* prismatic.box.specularCoefficient PARAM */) = (data->simulationInfo->realParameter[43116] /* world.defaultSpecularCoefficient PARAM */);
  TRACE_POP
}

/*
equation index: 3926
type: SIMPLE_ASSIGN
prismatic.specularCoefficient = world.defaultSpecularCoefficient
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3926(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3926};
  (data->simulationInfo->realParameter[42886] /* prismatic.specularCoefficient PARAM */) = (data->simulationInfo->realParameter[43116] /* world.defaultSpecularCoefficient PARAM */);
  TRACE_POP
}

/*
equation index: 3927
type: SIMPLE_ASSIGN
environment.regularWave.Trmp = environment.Trmp
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3927(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3927};
  (data->simulationInfo->realParameter[4] /* environment.regularWave.Trmp PARAM */) = (data->simulationInfo->realParameter[1] /* environment.Trmp PARAM */);
  TRACE_POP
}

/*
equation index: 3929
type: SIMPLE_ASSIGN
float.frame_a.f[1] = prismatic.constantForce.f_constant
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3929(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3929};
  (data->simulationInfo->realParameter[3601] /* float.frame_a.f[1] PARAM */) = (data->simulationInfo->realParameter[42871] /* prismatic.constantForce.f_constant PARAM */);
  TRACE_POP
}

/*
equation index: 3930
type: SIMPLE_ASSIGN
world.frame_b.f[1] = -prismatic.constantForce.f_constant
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3930(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3930};
  (data->simulationInfo->realParameter[43118] /* world.frame_b.f[1] PARAM */) = (-(data->simulationInfo->realParameter[42871] /* prismatic.constantForce.f_constant PARAM */));
  TRACE_POP
}

/*
equation index: 3931
type: SIMPLE_ASSIGN
prismatic.frame_a.f[1] = prismatic.constantForce.f_constant
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3931(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3931};
  (data->simulationInfo->realParameter[42879] /* prismatic.frame_a.f[1] PARAM */) = (data->simulationInfo->realParameter[42871] /* prismatic.constantForce.f_constant PARAM */);
  TRACE_POP
}

/*
equation index: 3932
type: SIMPLE_ASSIGN
prismatic.frame_b.f[1] = -prismatic.constantForce.f_constant
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3932(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3932};
  (data->simulationInfo->realParameter[42880] /* prismatic.frame_b.f[1] PARAM */) = (-(data->simulationInfo->realParameter[42871] /* prismatic.constantForce.f_constant PARAM */));
  TRACE_POP
}

/*
equation index: 3933
type: SIMPLE_ASSIGN
prismatic.f = prismatic.constantForce.f_constant
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3933(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3933};
  (data->simulationInfo->realParameter[42876] /* prismatic.f PARAM */) = (data->simulationInfo->realParameter[42871] /* prismatic.constantForce.f_constant PARAM */);
  TRACE_POP
}

/*
equation index: 3934
type: SIMPLE_ASSIGN
prismatic.internalAxis.f = prismatic.constantForce.f_constant
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3934(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3934};
  (data->simulationInfo->realParameter[42881] /* prismatic.internalAxis.f PARAM */) = (data->simulationInfo->realParameter[42871] /* prismatic.constantForce.f_constant PARAM */);
  TRACE_POP
}

/*
equation index: 3935
type: SIMPLE_ASSIGN
prismatic.internalAxis.flange.f = prismatic.constantForce.f_constant
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3935(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3935};
  (data->simulationInfo->realParameter[42882] /* prismatic.internalAxis.flange.f PARAM */) = (data->simulationInfo->realParameter[42871] /* prismatic.constantForce.f_constant PARAM */);
  TRACE_POP
}

/*
equation index: 3936
type: SIMPLE_ASSIGN
prismatic.constantForce.flange.f = -prismatic.constantForce.f_constant
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3936(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3936};
  (data->simulationInfo->realParameter[42872] /* prismatic.constantForce.flange.f PARAM */) = (-(data->simulationInfo->realParameter[42871] /* prismatic.constantForce.f_constant PARAM */));
  TRACE_POP
}

/*
equation index: 3937
type: SIMPLE_ASSIGN
prismatic.constantForce.f = -prismatic.constantForce.f_constant
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_3937(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3937};
  (data->simulationInfo->realParameter[42870] /* prismatic.constantForce.f PARAM */) = (-(data->simulationInfo->realParameter[42871] /* prismatic.constantForce.f_constant PARAM */));
  TRACE_POP
}
extern void OET_Example_multibodyWECSingleDoF_eqFunction_2991(DATA *data, threadData_t *threadData);

extern void OET_Example_multibodyWECSingleDoF_eqFunction_2989(DATA *data, threadData_t *threadData);

extern void OET_Example_multibodyWECSingleDoF_eqFunction_2987(DATA *data, threadData_t *threadData);

extern void OET_Example_multibodyWECSingleDoF_eqFunction_2985(DATA *data, threadData_t *threadData);

extern void OET_Example_multibodyWECSingleDoF_eqFunction_2983(DATA *data, threadData_t *threadData);

extern void OET_Example_multibodyWECSingleDoF_eqFunction_2981(DATA *data, threadData_t *threadData);


/*
equation index: 4209
type: SIMPLE_ASSIGN
prismatic.box.shapeType = "box"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4209(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4209};
  (data->simulationInfo->stringParameter[46] /* prismatic.box.shapeType PARAM */) = _OMC_LIT20;
  TRACE_POP
}

/*
equation index: 4222
type: SIMPLE_ASSIGN
environment.regularWave.omegaPeak = environment.omegaPeak
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4222(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4222};
  (data->simulationInfo->realParameter[5] /* environment.regularWave.omegaPeak PARAM */) = (data->simulationInfo->realParameter[2] /* environment.omegaPeak PARAM */);
  TRACE_POP
}

/*
equation index: 4223
type: SIMPLE_ASSIGN
environment.regularWave.Hs = environment.Hs
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4223(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4223};
  (data->simulationInfo->realParameter[3] /* environment.regularWave.Hs PARAM */) = (data->simulationInfo->realParameter[0] /* environment.Hs PARAM */);
  TRACE_POP
}

/*
equation index: 4224
type: SIMPLE_ASSIGN
environment.waveSelector = "Regular"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4224(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4224};
  (data->simulationInfo->stringParameter[1] /* environment.waveSelector PARAM */) = _OMC_LIT21;
  TRACE_POP
}

/*
equation index: 4234
type: SIMPLE_ASSIGN
float.absoluteSensor.arrow.arrowLine.quantity = float.absoluteSensor.arrow.quantity
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4234(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4234};
  (data->simulationInfo->integerParameter[13] /* float.absoluteSensor.arrow.arrowLine.quantity PARAM */) = (data->simulationInfo->integerParameter[14] /* float.absoluteSensor.arrow.quantity PARAM */);
  TRACE_POP
}

/*
equation index: 4245
type: SIMPLE_ASSIGN
float.absoluteSensor.absoluteAngles.guessAngle1 = float.absoluteSensor.guessAngle1
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4245(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4245};
  (data->simulationInfo->realParameter[12] /* float.absoluteSensor.absoluteAngles.guessAngle1 PARAM */) = (data->simulationInfo->realParameter[15] /* float.absoluteSensor.guessAngle1 PARAM */);
  TRACE_POP
}

/*
equation index: 4270
type: SIMPLE_ASSIGN
float.excitation.excitationRegularWave.Trmp = environment.Trmp
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4270(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4270};
  (data->simulationInfo->realParameter[3337] /* float.excitation.excitationRegularWave.Trmp PARAM */) = (data->simulationInfo->realParameter[1] /* environment.Trmp PARAM */);
  TRACE_POP
}

/*
equation index: 4271
type: SIMPLE_ASSIGN
float.excitation.excitationRegularWave.omegaPeak = environment.regularWave.omegaPeak
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4271(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4271};
  (data->simulationInfo->realParameter[3339] /* float.excitation.excitationRegularWave.omegaPeak PARAM */) = (data->simulationInfo->realParameter[5] /* environment.regularWave.omegaPeak PARAM */);
  TRACE_POP
}

/*
equation index: 4272
type: SIMPLE_ASSIGN
float.excitation.excitationRegularWave.rho = Modelica.Utilities.Streams.readRealMatrix("C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/RM3HydroCoeff.mat", "hydro.parameters.rho", 1, 1, true)[1, 1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4272(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4272};
  (data->simulationInfo->realParameter[3340] /* float.excitation.excitationRegularWave.rho PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, _OMC_LIT22, _OMC_LIT23, ((modelica_integer) 1), ((modelica_integer) 1), 1 /* true */), 0, 0);
  TRACE_POP
}

/*
equation index: 4273
type: ARRAY_CALL_ASSIGN

float.excitation.excitationRegularWave.F_excIm = Modelica.Utilities.Streams.readRealMatrix("C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/RM3HydroCoeff.mat", "hydro.coefficients.excitation.spectralDecomp.im" + float.excitation.excitationRegularWave.bodyIndexString, 6, 260, true)
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4273(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4273};
  modelica_metatype tmpMeta0;
  real_array tmp1;
  tmpMeta0 = stringAppend(_OMC_LIT24,(data->simulationInfo->stringParameter[21] /* float.excitation.excitationRegularWave.bodyIndexString PARAM */));
  real_array_create(&tmp1, ((modelica_real*)&((&(data->simulationInfo->realParameter[217] /* float.excitation.excitationRegularWave.F_excIm[1,1] PARAM */))[(((modelica_integer) 1) - 1) * 260 + (((modelica_integer) 1)-1)])), 2, (_index_t)6, (_index_t)260);
  real_array_copy_data(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, _OMC_LIT22, tmpMeta0, ((modelica_integer) 6), ((modelica_integer) 260), 1 /* true */), tmp1);
  TRACE_POP
}

/*
equation index: 4274
type: ARRAY_CALL_ASSIGN

float.excitation.excitationRegularWave.F_excRe = Modelica.Utilities.Streams.readRealMatrix("C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/RM3HydroCoeff.mat", "hydro.coefficients.excitation.spectralDecomp.re" + float.excitation.excitationRegularWave.bodyIndexString, 6, 260, true)
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4274(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4274};
  modelica_metatype tmpMeta2;
  real_array tmp3;
  tmpMeta2 = stringAppend(_OMC_LIT25,(data->simulationInfo->stringParameter[21] /* float.excitation.excitationRegularWave.bodyIndexString PARAM */));
  real_array_create(&tmp3, ((modelica_real*)&((&(data->simulationInfo->realParameter[1777] /* float.excitation.excitationRegularWave.F_excRe[1,1] PARAM */))[(((modelica_integer) 1) - 1) * 260 + (((modelica_integer) 1)-1)])), 2, (_index_t)6, (_index_t)260);
  real_array_copy_data(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, _OMC_LIT22, tmpMeta2, ((modelica_integer) 6), ((modelica_integer) 260), 1 /* true */), tmp3);
  TRACE_POP
}

/*
equation index: 4275
type: ARRAY_CALL_ASSIGN

float.excitation.excitationRegularWave.w = vector(Modelica.Utilities.Streams.readRealMatrix("C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/RM3HydroCoeff.mat", "hydro.parameters.w", 260, 1, true))
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4275(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4275};
  modelica_integer tmp4;
  void * tmp5;
  modelica_integer tmp6;
  real_array tmp7;
  real_array tmp8;
  real_array tmp9;
  tmp7 = omc_Modelica_Utilities_Streams_readRealMatrix(threadData, _OMC_LIT22, _OMC_LIT26, ((modelica_integer) 260), ((modelica_integer) 1), 1 /* true */);
    tmp4=0;
  tmp4++;
  if (tmp4 > 1) {
    throwStreamPrint(threadData, "Called vector with >1 dimensions with size >1: Modelica.Utilities.Streams.readRealMatrix(\"C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/RM3HydroCoeff.mat\", \"hydro.parameters.w\", 260, 1, true)");
  }
  tmp6 = base_array_nr_of_elements(tmp7);
  tmp5 = omc_alloc_interface.malloc(sizeof(modelica_real)*tmp6);
  memcpy(tmp5, tmp7.data, sizeof(modelica_real)*tmp6);
  simple_alloc_1d_base_array(&tmp8, tmp6, tmp5);real_array_create(&tmp9, ((modelica_real*)&((&(data->simulationInfo->realParameter[3341] /* float.excitation.excitationRegularWave.w[1] PARAM */))[((modelica_integer) 1) - 1])), 1, (_index_t)260);
  real_array_copy_data(tmp8, tmp9);
  TRACE_POP
}

/*
equation index: 4278
type: SIMPLE_ASSIGN
float.excitation.excitationRegularWave.nbodies_read = Modelica.Utilities.Streams.readRealMatrix("C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/RM3HydroCoeff.mat", "hydro.bodies.Nb", 1, 1, true)[1, 1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4278(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4278};
  (data->simulationInfo->realParameter[3338] /* float.excitation.excitationRegularWave.nbodies_read PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, _OMC_LIT22, _OMC_LIT27, ((modelica_integer) 1), ((modelica_integer) 1), 1 /* true */), 0, 0);
  TRACE_POP
}

/*
equation index: 4279
type: SIMPLE_ASSIGN
float.excitation.excitationRegularWave.nbodies = integer(float.excitation.excitationRegularWave.nbodies_read)
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4279(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4279};
  (data->simulationInfo->integerParameter[86] /* float.excitation.excitationRegularWave.nbodies PARAM */) = ((modelica_integer)floor((data->simulationInfo->realParameter[3338] /* float.excitation.excitationRegularWave.nbodies_read PARAM */)));
  TRACE_POP
}

/*
equation index: 4280
type: SIMPLE_ASSIGN
float.excitation.excitationRegularWave.nDoF = 6 * float.excitation.excitationRegularWave.nbodies
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4280(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4280};
  (data->simulationInfo->integerParameter[85] /* float.excitation.excitationRegularWave.nDoF PARAM */) = (((modelica_integer) 6)) * ((data->simulationInfo->integerParameter[86] /* float.excitation.excitationRegularWave.nbodies PARAM */));
  TRACE_POP
}

/*
equation index: 4282
type: SIMPLE_ASSIGN
float.excitation.excitationRegularWave.fileDir = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/RM3HydroCoeff.mat"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4282(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4282};
  (data->simulationInfo->stringParameter[22] /* float.excitation.excitationRegularWave.fileDir PARAM */) = _OMC_LIT22;
  TRACE_POP
}

/*
equation index: 4283
type: SIMPLE_ASSIGN
float.excitation.excitationRegularWave.hydroCoeffFile = "/RM3HydroCoeff.mat"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4283(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4283};
  (data->simulationInfo->stringParameter[24] /* float.excitation.excitationRegularWave.hydroCoeffFile PARAM */) = _OMC_LIT28;
  TRACE_POP
}

/*
equation index: 4284
type: SIMPLE_ASSIGN
float.excitation.excitationRegularWave.filePath = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4284(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4284};
  (data->simulationInfo->stringParameter[23] /* float.excitation.excitationRegularWave.filePath PARAM */) = _OMC_LIT29;
  TRACE_POP
}

/*
equation index: 4286
type: SIMPLE_ASSIGN
float.excitation.waveSelector = "Regular"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4286(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4286};
  (data->simulationInfo->stringParameter[28] /* float.excitation.waveSelector PARAM */) = _OMC_LIT21;
  TRACE_POP
}

/*
equation index: 4288
type: SIMPLE_ASSIGN
float.excitation.fileDir = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/RM3HydroCoeff.mat"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4288(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4288};
  (data->simulationInfo->stringParameter[25] /* float.excitation.fileDir PARAM */) = _OMC_LIT22;
  TRACE_POP
}

/*
equation index: 4289
type: SIMPLE_ASSIGN
float.excitation.hydroCoeffFile = "/RM3HydroCoeff.mat"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4289(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4289};
  (data->simulationInfo->stringParameter[27] /* float.excitation.hydroCoeffFile PARAM */) = _OMC_LIT28;
  TRACE_POP
}

/*
equation index: 4290
type: SIMPLE_ASSIGN
float.excitation.filePath = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4290(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4290};
  (data->simulationInfo->stringParameter[26] /* float.excitation.filePath PARAM */) = _OMC_LIT29;
  TRACE_POP
}

/*
equation index: 4293
type: ARRAY_CALL_ASSIGN

float.radiation.radiationForce.D = Modelica.Utilities.Streams.readRealMatrix("C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/RM3HydroCoeff.mat", "hydro.coefficients.radiation.stateSpace.noB2B.D1", 6, 6, true)
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4293(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4293};
  real_array tmp10;
  real_array_create(&tmp10, ((modelica_real*)&((&(data->simulationInfo->realParameter[42825] /* float.radiation.radiationForce.D[1,1] PARAM */))[(((modelica_integer) 1) - 1) * 6 + (((modelica_integer) 1)-1)])), 2, (_index_t)6, (_index_t)6);
  real_array_copy_data(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, _OMC_LIT22, _OMC_LIT30, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), tmp10);
  TRACE_POP
}

/*
equation index: 4294
type: ARRAY_CALL_ASSIGN

float.radiation.radiationForce.C = Modelica.Utilities.Streams.readRealMatrix("C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/RM3HydroCoeff.mat", "hydro.coefficients.radiation.stateSpace.noB2B.C1", 6, 192, true)
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4294(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4294};
  real_array tmp11;
  real_array_create(&tmp11, ((modelica_real*)&((&(data->simulationInfo->realParameter[41673] /* float.radiation.radiationForce.C[1,1] PARAM */))[(((modelica_integer) 1) - 1) * 192 + (((modelica_integer) 1)-1)])), 2, (_index_t)6, (_index_t)192);
  real_array_copy_data(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, _OMC_LIT22, _OMC_LIT31, ((modelica_integer) 6), ((modelica_integer) 192), 1 /* true */), tmp11);
  TRACE_POP
}

/*
equation index: 4295
type: ARRAY_CALL_ASSIGN

float.radiation.radiationForce.B = Modelica.Utilities.Streams.readRealMatrix("C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/RM3HydroCoeff.mat", "hydro.coefficients.radiation.stateSpace.noB2B.B1", 192, 6, true)
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4295(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4295};
  real_array tmp12;
  real_array_create(&tmp12, ((modelica_real*)&((&(data->simulationInfo->realParameter[40521] /* float.radiation.radiationForce.B[1,1] PARAM */))[(((modelica_integer) 1) - 1) * 6 + (((modelica_integer) 1)-1)])), 2, (_index_t)192, (_index_t)6);
  real_array_copy_data(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, _OMC_LIT22, _OMC_LIT32, ((modelica_integer) 192), ((modelica_integer) 6), 1 /* true */), tmp12);
  TRACE_POP
}

/*
equation index: 4296
type: ARRAY_CALL_ASSIGN

float.radiation.radiationForce.A = Modelica.Utilities.Streams.readRealMatrix("C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/RM3HydroCoeff.mat", "hydro.coefficients.radiation.stateSpace.noB2B.A1", 192, 192, true)
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4296(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4296};
  real_array tmp13;
  real_array_create(&tmp13, ((modelica_real*)&((&(data->simulationInfo->realParameter[3657] /* float.radiation.radiationForce.A[1,1] PARAM */))[(((modelica_integer) 1) - 1) * 192 + (((modelica_integer) 1)-1)])), 2, (_index_t)192, (_index_t)192);
  real_array_copy_data(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, _OMC_LIT22, _OMC_LIT33, ((modelica_integer) 192), ((modelica_integer) 192), 1 /* true */), tmp13);
  TRACE_POP
}

/*
equation index: 4299
type: SIMPLE_ASSIGN
float.radiation.radiationForce.nbodies_read = Modelica.Utilities.Streams.readRealMatrix("C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/RM3HydroCoeff.mat", "hydro.bodies.Nb", 1, 1, true)[1, 1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4299(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4299};
  (data->simulationInfo->realParameter[42861] /* float.radiation.radiationForce.nbodies_read PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, _OMC_LIT22, _OMC_LIT27, ((modelica_integer) 1), ((modelica_integer) 1), 1 /* true */), 0, 0);
  TRACE_POP
}

/*
equation index: 4300
type: SIMPLE_ASSIGN
float.radiation.radiationForce.nbodies = integer(float.radiation.radiationForce.nbodies_read)
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4300(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4300};
  (data->simulationInfo->integerParameter[125] /* float.radiation.radiationForce.nbodies PARAM */) = ((modelica_integer)floor((data->simulationInfo->realParameter[42861] /* float.radiation.radiationForce.nbodies_read PARAM */)));
  TRACE_POP
}

/*
equation index: 4301
type: SIMPLE_ASSIGN
float.radiation.radiationForce.nDoF = 6 * float.radiation.radiationForce.nbodies
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4301(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4301};
  (data->simulationInfo->integerParameter[122] /* float.radiation.radiationForce.nDoF PARAM */) = (((modelica_integer) 6)) * ((data->simulationInfo->integerParameter[125] /* float.radiation.radiationForce.nbodies PARAM */));
  TRACE_POP
}

/*
equation index: 4303
type: SIMPLE_ASSIGN
float.radiation.radiationForce.bodyIndexString = "1"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4303(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4303};
  (data->simulationInfo->stringParameter[42] /* float.radiation.radiationForce.bodyIndexString PARAM */) = _OMC_LIT11;
  TRACE_POP
}

/*
equation index: 4305
type: SIMPLE_ASSIGN
float.radiation.radiationForce.fileDir = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/RM3HydroCoeff.mat"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4305(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4305};
  (data->simulationInfo->stringParameter[43] /* float.radiation.radiationForce.fileDir PARAM */) = _OMC_LIT22;
  TRACE_POP
}

/*
equation index: 4306
type: SIMPLE_ASSIGN
float.radiation.radiationForce.hydroCoeffFile = "/RM3HydroCoeff.mat"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4306(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4306};
  (data->simulationInfo->stringParameter[45] /* float.radiation.radiationForce.hydroCoeffFile PARAM */) = _OMC_LIT28;
  TRACE_POP
}

/*
equation index: 4307
type: SIMPLE_ASSIGN
float.radiation.radiationForce.filePath = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4307(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4307};
  (data->simulationInfo->stringParameter[44] /* float.radiation.radiationForce.filePath PARAM */) = _OMC_LIT29;
  TRACE_POP
}

/*
equation index: 4309
type: SIMPLE_ASSIGN
float.radiation.absoluteSensor.arrow.arrowLine.quantity = float.radiation.absoluteSensor.arrow.quantity
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4309(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4309};
  (data->simulationInfo->integerParameter[107] /* float.radiation.absoluteSensor.arrow.arrowLine.quantity PARAM */) = (data->simulationInfo->integerParameter[108] /* float.radiation.absoluteSensor.arrow.quantity PARAM */);
  TRACE_POP
}

/*
equation index: 4331
type: SIMPLE_ASSIGN
float.radiation.fileDir = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/RM3HydroCoeff.mat"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4331(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4331};
  (data->simulationInfo->stringParameter[39] /* float.radiation.fileDir PARAM */) = _OMC_LIT22;
  TRACE_POP
}

/*
equation index: 4332
type: SIMPLE_ASSIGN
float.radiation.hydroCoeffFile = "/RM3HydroCoeff.mat"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4332(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4332};
  (data->simulationInfo->stringParameter[41] /* float.radiation.hydroCoeffFile PARAM */) = _OMC_LIT28;
  TRACE_POP
}

/*
equation index: 4333
type: SIMPLE_ASSIGN
float.radiation.filePath = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4333(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4333};
  (data->simulationInfo->stringParameter[40] /* float.radiation.filePath PARAM */) = _OMC_LIT29;
  TRACE_POP
}

/*
equation index: 4336
type: SIMPLE_ASSIGN
float.hydrostatic.hydrostaticForce.fileDir = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/RM3HydroCoeff.mat"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4336(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4336};
  (data->simulationInfo->stringParameter[35] /* float.hydrostatic.hydrostaticForce.fileDir PARAM */) = _OMC_LIT22;
  TRACE_POP
}

/*
equation index: 4337
type: ARRAY_CALL_ASSIGN

float.hydrostatic.hydrostaticForce.Khs = Modelica.Utilities.Streams.readRealMatrix(float.hydrostatic.hydrostaticForce.fileDir, "hydro.coefficients.hydrostatic.Khs" + float.hydrostatic.hydrostaticForce.bodyIndexString, 6, 6, true)
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4337(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4337};
  modelica_metatype tmpMeta14;
  real_array tmp15;
  tmpMeta14 = stringAppend(_OMC_LIT34,(data->simulationInfo->stringParameter[34] /* float.hydrostatic.hydrostaticForce.bodyIndexString PARAM */));
  real_array_create(&tmp15, ((modelica_real*)&((&(data->simulationInfo->realParameter[3607] /* float.hydrostatic.hydrostaticForce.Khs[1,1] PARAM */))[(((modelica_integer) 1) - 1) * 6 + (((modelica_integer) 1)-1)])), 2, (_index_t)6, (_index_t)6);
  real_array_copy_data(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[35] /* float.hydrostatic.hydrostaticForce.fileDir PARAM */), tmpMeta14, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), tmp15);
  TRACE_POP
}

/*
equation index: 4338
type: SIMPLE_ASSIGN
float.hydrostatic.hydrostaticForce.nbodies_read = Modelica.Utilities.Streams.readRealMatrix(float.hydrostatic.hydrostaticForce.fileDir, "hydro.bodies.Nb", 1, 1, true)[1, 1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4338(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4338};
  (data->simulationInfo->realParameter[3643] /* float.hydrostatic.hydrostaticForce.nbodies_read PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[35] /* float.hydrostatic.hydrostaticForce.fileDir PARAM */), _OMC_LIT27, ((modelica_integer) 1), ((modelica_integer) 1), 1 /* true */), 0, 0);
  TRACE_POP
}

/*
equation index: 4339
type: SIMPLE_ASSIGN
float.hydrostatic.hydrostaticForce.nbodies = integer(float.hydrostatic.hydrostaticForce.nbodies_read)
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4339(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4339};
  (data->simulationInfo->integerParameter[104] /* float.hydrostatic.hydrostaticForce.nbodies PARAM */) = ((modelica_integer)floor((data->simulationInfo->realParameter[3643] /* float.hydrostatic.hydrostaticForce.nbodies_read PARAM */)));
  TRACE_POP
}

/*
equation index: 4340
type: SIMPLE_ASSIGN
float.hydrostatic.hydrostaticForce.nDoF = 6 * float.hydrostatic.hydrostaticForce.nbodies
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4340(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4340};
  (data->simulationInfo->integerParameter[103] /* float.hydrostatic.hydrostaticForce.nDoF PARAM */) = (((modelica_integer) 6)) * ((data->simulationInfo->integerParameter[104] /* float.hydrostatic.hydrostaticForce.nbodies PARAM */));
  TRACE_POP
}

/*
equation index: 4343
type: SIMPLE_ASSIGN
float.hydrostatic.hydrostaticForce.hydroCoeffFile = "/RM3HydroCoeff.mat"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4343(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4343};
  (data->simulationInfo->stringParameter[37] /* float.hydrostatic.hydrostaticForce.hydroCoeffFile PARAM */) = _OMC_LIT28;
  TRACE_POP
}

/*
equation index: 4344
type: SIMPLE_ASSIGN
float.hydrostatic.hydrostaticForce.filePath = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4344(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4344};
  (data->simulationInfo->stringParameter[36] /* float.hydrostatic.hydrostaticForce.filePath PARAM */) = _OMC_LIT29;
  TRACE_POP
}

/*
equation index: 4346
type: SIMPLE_ASSIGN
float.hydrostatic.absoluteSensor.arrow.arrowLine.quantity = float.hydrostatic.absoluteSensor.arrow.quantity
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4346(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4346};
  (data->simulationInfo->integerParameter[92] /* float.hydrostatic.absoluteSensor.arrow.arrowLine.quantity PARAM */) = (data->simulationInfo->integerParameter[93] /* float.hydrostatic.absoluteSensor.arrow.quantity PARAM */);
  TRACE_POP
}

/*
equation index: 4347
type: SIMPLE_ASSIGN
float.hydrostatic.absoluteSensor.absoluteAngles.guessAngle1 = float.hydrostatic.absoluteSensor.guessAngle1
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4347(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4347};
  (data->simulationInfo->realParameter[3602] /* float.hydrostatic.absoluteSensor.absoluteAngles.guessAngle1 PARAM */) = (data->simulationInfo->realParameter[3605] /* float.hydrostatic.absoluteSensor.guessAngle1 PARAM */);
  TRACE_POP
}

/*
equation index: 4366
type: SIMPLE_ASSIGN
float.hydrostatic.fileDir = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/RM3HydroCoeff.mat"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4366(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4366};
  (data->simulationInfo->stringParameter[31] /* float.hydrostatic.fileDir PARAM */) = _OMC_LIT22;
  TRACE_POP
}

/*
equation index: 4367
type: SIMPLE_ASSIGN
float.hydrostatic.hydroCoeffFile = "/RM3HydroCoeff.mat"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4367(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4367};
  (data->simulationInfo->stringParameter[33] /* float.hydrostatic.hydroCoeffFile PARAM */) = _OMC_LIT28;
  TRACE_POP
}

/*
equation index: 4368
type: SIMPLE_ASSIGN
float.hydrostatic.filePath = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4368(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4368};
  (data->simulationInfo->stringParameter[32] /* float.hydrostatic.filePath PARAM */) = _OMC_LIT29;
  TRACE_POP
}

/*
equation index: 4384
type: SIMPLE_ASSIGN
float.body.absoluteSensor.arrow.arrowLine.quantity = float.body.absoluteSensor.arrow.quantity
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4384(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4384};
  (data->simulationInfo->integerParameter[48] /* float.body.absoluteSensor.arrow.arrowLine.quantity PARAM */) = (data->simulationInfo->integerParameter[49] /* float.body.absoluteSensor.arrow.quantity PARAM */);
  TRACE_POP
}

/*
equation index: 4395
type: SIMPLE_ASSIGN
float.body.absoluteSensor.absoluteAngles.guessAngle1 = float.body.absoluteSensor.guessAngle1
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4395(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4395};
  (data->simulationInfo->realParameter[23] /* float.body.absoluteSensor.absoluteAngles.guessAngle1 PARAM */) = (data->simulationInfo->realParameter[26] /* float.body.absoluteSensor.guessAngle1 PARAM */);
  TRACE_POP
}

/*
equation index: 4418
type: SIMPLE_ASSIGN
float.body.geometryFile = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox" + float.geometryFile
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4418(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4418};
  modelica_metatype tmpMeta16;
  tmpMeta16 = stringAppend(_OMC_LIT29,(data->simulationInfo->stringParameter[29] /* float.geometryFile PARAM */));
  (data->simulationInfo->stringParameter[17] /* float.body.geometryFile PARAM */) = tmpMeta16;
  TRACE_POP
}

/*
equation index: 4419
type: SIMPLE_ASSIGN
float.body.fixedShape.shapeType = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox" + float.body.geometryFile
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4419(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4419};
  modelica_metatype tmpMeta17;
  tmpMeta17 = stringAppend(_OMC_LIT29,(data->simulationInfo->stringParameter[17] /* float.body.geometryFile PARAM */));
  (data->simulationInfo->stringParameter[12] /* float.body.fixedShape.shapeType PARAM */) = tmpMeta17;
  TRACE_POP
}

/*
equation index: 4421
type: SIMPLE_ASSIGN
float.body.fixedTranslation1.shape.shapeType = float.body.fixedTranslation1.shapeType
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4421(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4421};
  (data->simulationInfo->stringParameter[15] /* float.body.fixedTranslation1.shape.shapeType PARAM */) = (data->simulationInfo->stringParameter[16] /* float.body.fixedTranslation1.shapeType PARAM */);
  TRACE_POP
}

/*
equation index: 4435
type: SIMPLE_ASSIGN
float.body.fixedTranslation.shape.shapeType = float.body.fixedTranslation.shapeType
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4435(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4435};
  (data->simulationInfo->stringParameter[13] /* float.body.fixedTranslation.shape.shapeType PARAM */) = (data->simulationInfo->stringParameter[14] /* float.body.fixedTranslation.shapeType PARAM */);
  TRACE_POP
}

/*
equation index: 4449
type: SIMPLE_ASSIGN
float.body.I_32 = float.I_32
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4449(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4449};
  (data->simulationInfo->realParameter[21] /* float.body.I_32 PARAM */) = (data->simulationInfo->realParameter[10] /* float.I_32 PARAM */);
  TRACE_POP
}

/*
equation index: 4450
type: SIMPLE_ASSIGN
float.body.I_31 = float.I_31
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4450(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4450};
  (data->simulationInfo->realParameter[20] /* float.body.I_31 PARAM */) = (data->simulationInfo->realParameter[9] /* float.I_31 PARAM */);
  TRACE_POP
}

/*
equation index: 4451
type: SIMPLE_ASSIGN
float.body.I_21 = float.I_21
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4451(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4451};
  (data->simulationInfo->realParameter[18] /* float.body.I_21 PARAM */) = (data->simulationInfo->realParameter[7] /* float.I_21 PARAM */);
  TRACE_POP
}

/*
equation index: 4452
type: SIMPLE_ASSIGN
float.body.I_33 = float.I_33
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4452(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4452};
  (data->simulationInfo->realParameter[22] /* float.body.I_33 PARAM */) = (data->simulationInfo->realParameter[11] /* float.I_33 PARAM */);
  TRACE_POP
}

/*
equation index: 4453
type: SIMPLE_ASSIGN
float.body.I_22 = float.I_22
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4453(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4453};
  (data->simulationInfo->realParameter[19] /* float.body.I_22 PARAM */) = (data->simulationInfo->realParameter[8] /* float.I_22 PARAM */);
  TRACE_POP
}

/*
equation index: 4454
type: SIMPLE_ASSIGN
float.body.I_11 = float.I_11
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4454(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4454};
  (data->simulationInfo->realParameter[17] /* float.body.I_11 PARAM */) = (data->simulationInfo->realParameter[6] /* float.I_11 PARAM */);
  TRACE_POP
}

/*
equation index: 4455
type: SIMPLE_ASSIGN
float.body.ra_b[3] = float.ra_b[3]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4455(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4455};
  (data->simulationInfo->realParameter[216] /* float.body.ra_b[3] PARAM */) = (data->simulationInfo->realParameter[3652] /* float.ra_b[3] PARAM */);
  TRACE_POP
}

/*
equation index: 4456
type: SIMPLE_ASSIGN
float.body.ra_b[2] = float.ra_b[2]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4456(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4456};
  (data->simulationInfo->realParameter[215] /* float.body.ra_b[2] PARAM */) = (data->simulationInfo->realParameter[3651] /* float.ra_b[2] PARAM */);
  TRACE_POP
}

/*
equation index: 4457
type: SIMPLE_ASSIGN
float.body.ra_b[1] = float.ra_b[1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4457(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4457};
  (data->simulationInfo->realParameter[214] /* float.body.ra_b[1] PARAM */) = (data->simulationInfo->realParameter[3650] /* float.ra_b[1] PARAM */);
  TRACE_POP
}

/*
equation index: 4464
type: SIMPLE_ASSIGN
float.body.body.phi_start[3] = float.body.body.angles_start[3]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4464(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4464};
  (data->simulationInfo->realParameter[148] /* float.body.body.phi_start[3] PARAM */) = (data->simulationInfo->realParameter[134] /* float.body.body.angles_start[3] PARAM */);
  TRACE_POP
}

/*
equation index: 4465
type: SIMPLE_ASSIGN
float.body.body.phi_start[2] = float.body.body.angles_start[2]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4465(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4465};
  (data->simulationInfo->realParameter[147] /* float.body.body.phi_start[2] PARAM */) = (data->simulationInfo->realParameter[133] /* float.body.body.angles_start[2] PARAM */);
  TRACE_POP
}

/*
equation index: 4466
type: SIMPLE_ASSIGN
float.body.body.phi_start[1] = float.body.body.angles_start[1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4466(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4466};
  (data->simulationInfo->realParameter[146] /* float.body.body.phi_start[1] PARAM */) = (data->simulationInfo->realParameter[132] /* float.body.body.angles_start[1] PARAM */);
  TRACE_POP
}

/*
equation index: 4467
type: ARRAY_CALL_ASSIGN

float.body.body.Q_start = {0.0, 0.0, 0.0, 1.0}
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4467(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4467};
  real_array tmp18;
  real_array_create(&tmp18, ((modelica_real*)&((&(data->simulationInfo->realParameter[116] /* float.body.body.Q_start[1] PARAM */))[((modelica_integer) 1) - 1])), 1, (_index_t)4);
  real_array_copy_data(_OMC_LIT35, tmp18);
  TRACE_POP
}

/*
equation index: 4481
type: SIMPLE_ASSIGN
float.body.body.I_33 = float.body.I_33
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4481(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4481};
  (data->simulationInfo->realParameter[114] /* float.body.body.I_33 PARAM */) = (data->simulationInfo->realParameter[22] /* float.body.I_33 PARAM */);
  TRACE_POP
}

/*
equation index: 4482
type: SIMPLE_ASSIGN
float.body.body.I[3,3] = float.body.body.I_33
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4482(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4482};
  (data->simulationInfo->realParameter[108] /* float.body.body.I[3,3] PARAM */) = (data->simulationInfo->realParameter[114] /* float.body.body.I_33 PARAM */);
  TRACE_POP
}

/*
equation index: 4483
type: SIMPLE_ASSIGN
float.body.body.I_32 = float.body.I_32
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4483(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4483};
  (data->simulationInfo->realParameter[113] /* float.body.body.I_32 PARAM */) = (data->simulationInfo->realParameter[21] /* float.body.I_32 PARAM */);
  TRACE_POP
}

/*
equation index: 4484
type: SIMPLE_ASSIGN
float.body.body.I[3,2] = float.body.body.I_32
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4484(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4484};
  (data->simulationInfo->realParameter[107] /* float.body.body.I[3,2] PARAM */) = (data->simulationInfo->realParameter[113] /* float.body.body.I_32 PARAM */);
  TRACE_POP
}

/*
equation index: 4485
type: SIMPLE_ASSIGN
float.body.body.I_31 = float.body.I_31
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4485(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4485};
  (data->simulationInfo->realParameter[112] /* float.body.body.I_31 PARAM */) = (data->simulationInfo->realParameter[20] /* float.body.I_31 PARAM */);
  TRACE_POP
}

/*
equation index: 4486
type: SIMPLE_ASSIGN
float.body.body.I[3,1] = float.body.body.I_31
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4486(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4486};
  (data->simulationInfo->realParameter[106] /* float.body.body.I[3,1] PARAM */) = (data->simulationInfo->realParameter[112] /* float.body.body.I_31 PARAM */);
  TRACE_POP
}

/*
equation index: 4487
type: SIMPLE_ASSIGN
float.body.body.I[2,3] = float.body.body.I_32
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4487(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4487};
  (data->simulationInfo->realParameter[105] /* float.body.body.I[2,3] PARAM */) = (data->simulationInfo->realParameter[113] /* float.body.body.I_32 PARAM */);
  TRACE_POP
}

/*
equation index: 4488
type: SIMPLE_ASSIGN
float.body.body.I_22 = float.body.I_22
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4488(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4488};
  (data->simulationInfo->realParameter[111] /* float.body.body.I_22 PARAM */) = (data->simulationInfo->realParameter[19] /* float.body.I_22 PARAM */);
  TRACE_POP
}

/*
equation index: 4489
type: SIMPLE_ASSIGN
float.body.body.I[2,2] = float.body.body.I_22
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4489(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4489};
  (data->simulationInfo->realParameter[104] /* float.body.body.I[2,2] PARAM */) = (data->simulationInfo->realParameter[111] /* float.body.body.I_22 PARAM */);
  TRACE_POP
}

/*
equation index: 4490
type: SIMPLE_ASSIGN
float.body.body.I_21 = float.body.I_21
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4490(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4490};
  (data->simulationInfo->realParameter[110] /* float.body.body.I_21 PARAM */) = (data->simulationInfo->realParameter[18] /* float.body.I_21 PARAM */);
  TRACE_POP
}

/*
equation index: 4491
type: SIMPLE_ASSIGN
float.body.body.I[2,1] = float.body.body.I_21
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4491(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4491};
  (data->simulationInfo->realParameter[103] /* float.body.body.I[2,1] PARAM */) = (data->simulationInfo->realParameter[110] /* float.body.body.I_21 PARAM */);
  TRACE_POP
}

/*
equation index: 4492
type: SIMPLE_ASSIGN
float.body.body.I[1,3] = float.body.body.I_31
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4492(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4492};
  (data->simulationInfo->realParameter[102] /* float.body.body.I[1,3] PARAM */) = (data->simulationInfo->realParameter[112] /* float.body.body.I_31 PARAM */);
  TRACE_POP
}

/*
equation index: 4493
type: SIMPLE_ASSIGN
float.body.body.I[1,2] = float.body.body.I_21
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4493(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4493};
  (data->simulationInfo->realParameter[101] /* float.body.body.I[1,2] PARAM */) = (data->simulationInfo->realParameter[110] /* float.body.body.I_21 PARAM */);
  TRACE_POP
}

/*
equation index: 4494
type: SIMPLE_ASSIGN
float.body.body.I_11 = float.body.I_11
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4494(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4494};
  (data->simulationInfo->realParameter[109] /* float.body.body.I_11 PARAM */) = (data->simulationInfo->realParameter[17] /* float.body.I_11 PARAM */);
  TRACE_POP
}

/*
equation index: 4495
type: SIMPLE_ASSIGN
float.body.body.I[1,1] = float.body.body.I_11
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4495(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4495};
  (data->simulationInfo->realParameter[100] /* float.body.body.I[1,1] PARAM */) = (data->simulationInfo->realParameter[109] /* float.body.body.I_11 PARAM */);
  TRACE_POP
}

/*
equation index: 4508
type: SIMPLE_ASSIGN
float.body.body.fileDir = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/RM3HydroCoeff.mat"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4508(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4508};
  (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */) = _OMC_LIT22;
  TRACE_POP
}

/*
equation index: 4509
type: SIMPLE_ASSIGN
float.body.body.Ainf[6,6] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + float.body.body.bodyIndexString, 6, 6, true)[6, 6]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4509(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4509};
  modelica_metatype tmpMeta19;
  tmpMeta19 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[63] /* float.body.body.Ainf[6,6] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta19, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 5, 5);
  TRACE_POP
}

/*
equation index: 4510
type: SIMPLE_ASSIGN
float.body.body.Ainf22[3,3] = float.body.body.Ainf[6,6]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4510(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4510};
  (data->simulationInfo->realParameter[99] /* float.body.body.Ainf22[3,3] PARAM */) = (data->simulationInfo->realParameter[63] /* float.body.body.Ainf[6,6] PARAM */);
  TRACE_POP
}

/*
equation index: 4511
type: SIMPLE_ASSIGN
float.body.body.Ainf[6,5] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + float.body.body.bodyIndexString, 6, 6, true)[6, 5]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4511(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4511};
  modelica_metatype tmpMeta20;
  tmpMeta20 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[62] /* float.body.body.Ainf[6,5] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta20, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 5, 4);
  TRACE_POP
}

/*
equation index: 4512
type: SIMPLE_ASSIGN
float.body.body.Ainf22[3,2] = float.body.body.Ainf[6,5]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4512(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4512};
  (data->simulationInfo->realParameter[98] /* float.body.body.Ainf22[3,2] PARAM */) = (data->simulationInfo->realParameter[62] /* float.body.body.Ainf[6,5] PARAM */);
  TRACE_POP
}

/*
equation index: 4513
type: SIMPLE_ASSIGN
float.body.body.Ainf[6,4] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + float.body.body.bodyIndexString, 6, 6, true)[6, 4]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4513(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4513};
  modelica_metatype tmpMeta21;
  tmpMeta21 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[61] /* float.body.body.Ainf[6,4] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta21, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 5, 3);
  TRACE_POP
}

/*
equation index: 4514
type: SIMPLE_ASSIGN
float.body.body.Ainf22[3,1] = float.body.body.Ainf[6,4]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4514(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4514};
  (data->simulationInfo->realParameter[97] /* float.body.body.Ainf22[3,1] PARAM */) = (data->simulationInfo->realParameter[61] /* float.body.body.Ainf[6,4] PARAM */);
  TRACE_POP
}

/*
equation index: 4515
type: SIMPLE_ASSIGN
float.body.body.Ainf[5,6] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + float.body.body.bodyIndexString, 6, 6, true)[5, 6]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4515(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4515};
  modelica_metatype tmpMeta22;
  tmpMeta22 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[57] /* float.body.body.Ainf[5,6] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta22, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 4, 5);
  TRACE_POP
}

/*
equation index: 4516
type: SIMPLE_ASSIGN
float.body.body.Ainf22[2,3] = float.body.body.Ainf[5,6]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4516(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4516};
  (data->simulationInfo->realParameter[96] /* float.body.body.Ainf22[2,3] PARAM */) = (data->simulationInfo->realParameter[57] /* float.body.body.Ainf[5,6] PARAM */);
  TRACE_POP
}

/*
equation index: 4517
type: SIMPLE_ASSIGN
float.body.body.Ainf[5,5] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + float.body.body.bodyIndexString, 6, 6, true)[5, 5]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4517(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4517};
  modelica_metatype tmpMeta23;
  tmpMeta23 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[56] /* float.body.body.Ainf[5,5] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta23, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 4, 4);
  TRACE_POP
}

/*
equation index: 4518
type: SIMPLE_ASSIGN
float.body.body.Ainf22[2,2] = float.body.body.Ainf[5,5]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4518(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4518};
  (data->simulationInfo->realParameter[95] /* float.body.body.Ainf22[2,2] PARAM */) = (data->simulationInfo->realParameter[56] /* float.body.body.Ainf[5,5] PARAM */);
  TRACE_POP
}

/*
equation index: 4519
type: SIMPLE_ASSIGN
float.body.body.Ainf[5,4] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + float.body.body.bodyIndexString, 6, 6, true)[5, 4]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4519(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4519};
  modelica_metatype tmpMeta24;
  tmpMeta24 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[55] /* float.body.body.Ainf[5,4] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta24, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 4, 3);
  TRACE_POP
}

/*
equation index: 4520
type: SIMPLE_ASSIGN
float.body.body.Ainf22[2,1] = float.body.body.Ainf[5,4]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4520(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4520};
  (data->simulationInfo->realParameter[94] /* float.body.body.Ainf22[2,1] PARAM */) = (data->simulationInfo->realParameter[55] /* float.body.body.Ainf[5,4] PARAM */);
  TRACE_POP
}

/*
equation index: 4521
type: SIMPLE_ASSIGN
float.body.body.Ainf[4,6] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + float.body.body.bodyIndexString, 6, 6, true)[4, 6]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4521(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4521};
  modelica_metatype tmpMeta25;
  tmpMeta25 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[51] /* float.body.body.Ainf[4,6] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta25, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 3, 5);
  TRACE_POP
}

/*
equation index: 4522
type: SIMPLE_ASSIGN
float.body.body.Ainf22[1,3] = float.body.body.Ainf[4,6]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4522(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4522};
  (data->simulationInfo->realParameter[93] /* float.body.body.Ainf22[1,3] PARAM */) = (data->simulationInfo->realParameter[51] /* float.body.body.Ainf[4,6] PARAM */);
  TRACE_POP
}

/*
equation index: 4523
type: SIMPLE_ASSIGN
float.body.body.Ainf[4,5] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + float.body.body.bodyIndexString, 6, 6, true)[4, 5]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4523(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4523};
  modelica_metatype tmpMeta26;
  tmpMeta26 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[50] /* float.body.body.Ainf[4,5] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta26, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 3, 4);
  TRACE_POP
}

/*
equation index: 4524
type: SIMPLE_ASSIGN
float.body.body.Ainf22[1,2] = float.body.body.Ainf[4,5]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4524(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4524};
  (data->simulationInfo->realParameter[92] /* float.body.body.Ainf22[1,2] PARAM */) = (data->simulationInfo->realParameter[50] /* float.body.body.Ainf[4,5] PARAM */);
  TRACE_POP
}

/*
equation index: 4525
type: SIMPLE_ASSIGN
float.body.body.Ainf[4,4] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + float.body.body.bodyIndexString, 6, 6, true)[4, 4]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4525(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4525};
  modelica_metatype tmpMeta27;
  tmpMeta27 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[49] /* float.body.body.Ainf[4,4] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta27, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 3, 3);
  TRACE_POP
}

/*
equation index: 4526
type: SIMPLE_ASSIGN
float.body.body.Ainf22[1,1] = float.body.body.Ainf[4,4]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4526(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4526};
  (data->simulationInfo->realParameter[91] /* float.body.body.Ainf22[1,1] PARAM */) = (data->simulationInfo->realParameter[49] /* float.body.body.Ainf[4,4] PARAM */);
  TRACE_POP
}

/*
equation index: 4527
type: SIMPLE_ASSIGN
float.body.body.Ainf[6,3] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + float.body.body.bodyIndexString, 6, 6, true)[6, 3]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4527(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4527};
  modelica_metatype tmpMeta28;
  tmpMeta28 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[60] /* float.body.body.Ainf[6,3] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta28, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 5, 2);
  TRACE_POP
}

/*
equation index: 4528
type: SIMPLE_ASSIGN
float.body.body.Ainf21[3,3] = float.body.body.Ainf[6,3]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4528(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4528};
  (data->simulationInfo->realParameter[90] /* float.body.body.Ainf21[3,3] PARAM */) = (data->simulationInfo->realParameter[60] /* float.body.body.Ainf[6,3] PARAM */);
  TRACE_POP
}

/*
equation index: 4529
type: SIMPLE_ASSIGN
float.body.body.Ainf[6,2] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + float.body.body.bodyIndexString, 6, 6, true)[6, 2]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4529(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4529};
  modelica_metatype tmpMeta29;
  tmpMeta29 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[59] /* float.body.body.Ainf[6,2] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta29, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 5, 1);
  TRACE_POP
}

/*
equation index: 4530
type: SIMPLE_ASSIGN
float.body.body.Ainf21[3,2] = float.body.body.Ainf[6,2]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4530(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4530};
  (data->simulationInfo->realParameter[89] /* float.body.body.Ainf21[3,2] PARAM */) = (data->simulationInfo->realParameter[59] /* float.body.body.Ainf[6,2] PARAM */);
  TRACE_POP
}

/*
equation index: 4531
type: SIMPLE_ASSIGN
float.body.body.Ainf[6,1] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + float.body.body.bodyIndexString, 6, 6, true)[6, 1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4531(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4531};
  modelica_metatype tmpMeta30;
  tmpMeta30 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[58] /* float.body.body.Ainf[6,1] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta30, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 5, 0);
  TRACE_POP
}

/*
equation index: 4532
type: SIMPLE_ASSIGN
float.body.body.Ainf21[3,1] = float.body.body.Ainf[6,1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4532(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4532};
  (data->simulationInfo->realParameter[88] /* float.body.body.Ainf21[3,1] PARAM */) = (data->simulationInfo->realParameter[58] /* float.body.body.Ainf[6,1] PARAM */);
  TRACE_POP
}

/*
equation index: 4533
type: SIMPLE_ASSIGN
float.body.body.Ainf[5,3] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + float.body.body.bodyIndexString, 6, 6, true)[5, 3]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4533(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4533};
  modelica_metatype tmpMeta31;
  tmpMeta31 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[54] /* float.body.body.Ainf[5,3] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta31, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 4, 2);
  TRACE_POP
}

/*
equation index: 4534
type: SIMPLE_ASSIGN
float.body.body.Ainf21[2,3] = float.body.body.Ainf[5,3]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4534(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4534};
  (data->simulationInfo->realParameter[87] /* float.body.body.Ainf21[2,3] PARAM */) = (data->simulationInfo->realParameter[54] /* float.body.body.Ainf[5,3] PARAM */);
  TRACE_POP
}

/*
equation index: 4535
type: SIMPLE_ASSIGN
float.body.body.Ainf[5,2] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + float.body.body.bodyIndexString, 6, 6, true)[5, 2]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4535(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4535};
  modelica_metatype tmpMeta32;
  tmpMeta32 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[53] /* float.body.body.Ainf[5,2] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta32, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 4, 1);
  TRACE_POP
}

/*
equation index: 4536
type: SIMPLE_ASSIGN
float.body.body.Ainf21[2,2] = float.body.body.Ainf[5,2]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4536(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4536};
  (data->simulationInfo->realParameter[86] /* float.body.body.Ainf21[2,2] PARAM */) = (data->simulationInfo->realParameter[53] /* float.body.body.Ainf[5,2] PARAM */);
  TRACE_POP
}

/*
equation index: 4537
type: SIMPLE_ASSIGN
float.body.body.Ainf[5,1] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + float.body.body.bodyIndexString, 6, 6, true)[5, 1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4537(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4537};
  modelica_metatype tmpMeta33;
  tmpMeta33 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[52] /* float.body.body.Ainf[5,1] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta33, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 4, 0);
  TRACE_POP
}

/*
equation index: 4538
type: SIMPLE_ASSIGN
float.body.body.Ainf21[2,1] = float.body.body.Ainf[5,1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4538(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4538};
  (data->simulationInfo->realParameter[85] /* float.body.body.Ainf21[2,1] PARAM */) = (data->simulationInfo->realParameter[52] /* float.body.body.Ainf[5,1] PARAM */);
  TRACE_POP
}

/*
equation index: 4539
type: SIMPLE_ASSIGN
float.body.body.Ainf[4,3] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + float.body.body.bodyIndexString, 6, 6, true)[4, 3]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4539(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4539};
  modelica_metatype tmpMeta34;
  tmpMeta34 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[48] /* float.body.body.Ainf[4,3] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta34, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 3, 2);
  TRACE_POP
}

/*
equation index: 4540
type: SIMPLE_ASSIGN
float.body.body.Ainf21[1,3] = float.body.body.Ainf[4,3]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4540(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4540};
  (data->simulationInfo->realParameter[84] /* float.body.body.Ainf21[1,3] PARAM */) = (data->simulationInfo->realParameter[48] /* float.body.body.Ainf[4,3] PARAM */);
  TRACE_POP
}

/*
equation index: 4541
type: SIMPLE_ASSIGN
float.body.body.Ainf[4,2] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + float.body.body.bodyIndexString, 6, 6, true)[4, 2]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4541(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4541};
  modelica_metatype tmpMeta35;
  tmpMeta35 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[47] /* float.body.body.Ainf[4,2] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta35, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 3, 1);
  TRACE_POP
}

/*
equation index: 4542
type: SIMPLE_ASSIGN
float.body.body.Ainf21[1,2] = float.body.body.Ainf[4,2]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4542(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4542};
  (data->simulationInfo->realParameter[83] /* float.body.body.Ainf21[1,2] PARAM */) = (data->simulationInfo->realParameter[47] /* float.body.body.Ainf[4,2] PARAM */);
  TRACE_POP
}

/*
equation index: 4543
type: SIMPLE_ASSIGN
float.body.body.Ainf[4,1] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + float.body.body.bodyIndexString, 6, 6, true)[4, 1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4543(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4543};
  modelica_metatype tmpMeta36;
  tmpMeta36 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[46] /* float.body.body.Ainf[4,1] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta36, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 3, 0);
  TRACE_POP
}

/*
equation index: 4544
type: SIMPLE_ASSIGN
float.body.body.Ainf21[1,1] = float.body.body.Ainf[4,1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4544(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4544};
  (data->simulationInfo->realParameter[82] /* float.body.body.Ainf21[1,1] PARAM */) = (data->simulationInfo->realParameter[46] /* float.body.body.Ainf[4,1] PARAM */);
  TRACE_POP
}

/*
equation index: 4545
type: SIMPLE_ASSIGN
float.body.body.Ainf[3,6] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + float.body.body.bodyIndexString, 6, 6, true)[3, 6]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4545(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4545};
  modelica_metatype tmpMeta37;
  tmpMeta37 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[45] /* float.body.body.Ainf[3,6] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta37, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 2, 5);
  TRACE_POP
}

/*
equation index: 4546
type: SIMPLE_ASSIGN
float.body.body.Ainf12[3,3] = float.body.body.Ainf[3,6]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4546(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4546};
  (data->simulationInfo->realParameter[81] /* float.body.body.Ainf12[3,3] PARAM */) = (data->simulationInfo->realParameter[45] /* float.body.body.Ainf[3,6] PARAM */);
  TRACE_POP
}

/*
equation index: 4547
type: SIMPLE_ASSIGN
float.body.body.Ainf[3,5] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + float.body.body.bodyIndexString, 6, 6, true)[3, 5]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4547(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4547};
  modelica_metatype tmpMeta38;
  tmpMeta38 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[44] /* float.body.body.Ainf[3,5] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta38, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 2, 4);
  TRACE_POP
}

/*
equation index: 4548
type: SIMPLE_ASSIGN
float.body.body.Ainf12[3,2] = float.body.body.Ainf[3,5]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4548(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4548};
  (data->simulationInfo->realParameter[80] /* float.body.body.Ainf12[3,2] PARAM */) = (data->simulationInfo->realParameter[44] /* float.body.body.Ainf[3,5] PARAM */);
  TRACE_POP
}

/*
equation index: 4549
type: SIMPLE_ASSIGN
float.body.body.Ainf[3,4] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + float.body.body.bodyIndexString, 6, 6, true)[3, 4]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4549(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4549};
  modelica_metatype tmpMeta39;
  tmpMeta39 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[43] /* float.body.body.Ainf[3,4] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta39, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 2, 3);
  TRACE_POP
}

/*
equation index: 4550
type: SIMPLE_ASSIGN
float.body.body.Ainf12[3,1] = float.body.body.Ainf[3,4]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4550(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4550};
  (data->simulationInfo->realParameter[79] /* float.body.body.Ainf12[3,1] PARAM */) = (data->simulationInfo->realParameter[43] /* float.body.body.Ainf[3,4] PARAM */);
  TRACE_POP
}

/*
equation index: 4551
type: SIMPLE_ASSIGN
float.body.body.Ainf[2,6] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + float.body.body.bodyIndexString, 6, 6, true)[2, 6]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4551(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4551};
  modelica_metatype tmpMeta40;
  tmpMeta40 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[39] /* float.body.body.Ainf[2,6] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta40, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 1, 5);
  TRACE_POP
}

/*
equation index: 4552
type: SIMPLE_ASSIGN
float.body.body.Ainf12[2,3] = float.body.body.Ainf[2,6]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4552(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4552};
  (data->simulationInfo->realParameter[78] /* float.body.body.Ainf12[2,3] PARAM */) = (data->simulationInfo->realParameter[39] /* float.body.body.Ainf[2,6] PARAM */);
  TRACE_POP
}

/*
equation index: 4553
type: SIMPLE_ASSIGN
float.body.body.Ainf[2,5] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + float.body.body.bodyIndexString, 6, 6, true)[2, 5]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4553(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4553};
  modelica_metatype tmpMeta41;
  tmpMeta41 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[38] /* float.body.body.Ainf[2,5] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta41, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 1, 4);
  TRACE_POP
}

/*
equation index: 4554
type: SIMPLE_ASSIGN
float.body.body.Ainf12[2,2] = float.body.body.Ainf[2,5]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4554(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4554};
  (data->simulationInfo->realParameter[77] /* float.body.body.Ainf12[2,2] PARAM */) = (data->simulationInfo->realParameter[38] /* float.body.body.Ainf[2,5] PARAM */);
  TRACE_POP
}

/*
equation index: 4555
type: SIMPLE_ASSIGN
float.body.body.Ainf[2,4] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + float.body.body.bodyIndexString, 6, 6, true)[2, 4]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4555(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4555};
  modelica_metatype tmpMeta42;
  tmpMeta42 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[37] /* float.body.body.Ainf[2,4] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta42, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 1, 3);
  TRACE_POP
}

/*
equation index: 4556
type: SIMPLE_ASSIGN
float.body.body.Ainf12[2,1] = float.body.body.Ainf[2,4]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4556(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4556};
  (data->simulationInfo->realParameter[76] /* float.body.body.Ainf12[2,1] PARAM */) = (data->simulationInfo->realParameter[37] /* float.body.body.Ainf[2,4] PARAM */);
  TRACE_POP
}

/*
equation index: 4557
type: SIMPLE_ASSIGN
float.body.body.Ainf[1,6] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + float.body.body.bodyIndexString, 6, 6, true)[1, 6]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4557(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4557};
  modelica_metatype tmpMeta43;
  tmpMeta43 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[33] /* float.body.body.Ainf[1,6] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta43, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 0, 5);
  TRACE_POP
}

/*
equation index: 4558
type: SIMPLE_ASSIGN
float.body.body.Ainf12[1,3] = float.body.body.Ainf[1,6]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4558(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4558};
  (data->simulationInfo->realParameter[75] /* float.body.body.Ainf12[1,3] PARAM */) = (data->simulationInfo->realParameter[33] /* float.body.body.Ainf[1,6] PARAM */);
  TRACE_POP
}

/*
equation index: 4559
type: SIMPLE_ASSIGN
float.body.body.Ainf[1,5] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + float.body.body.bodyIndexString, 6, 6, true)[1, 5]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4559(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4559};
  modelica_metatype tmpMeta44;
  tmpMeta44 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[32] /* float.body.body.Ainf[1,5] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta44, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 0, 4);
  TRACE_POP
}

/*
equation index: 4560
type: SIMPLE_ASSIGN
float.body.body.Ainf12[1,2] = float.body.body.Ainf[1,5]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4560(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4560};
  (data->simulationInfo->realParameter[74] /* float.body.body.Ainf12[1,2] PARAM */) = (data->simulationInfo->realParameter[32] /* float.body.body.Ainf[1,5] PARAM */);
  TRACE_POP
}

/*
equation index: 4561
type: SIMPLE_ASSIGN
float.body.body.Ainf[1,4] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + float.body.body.bodyIndexString, 6, 6, true)[1, 4]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4561(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4561};
  modelica_metatype tmpMeta45;
  tmpMeta45 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[31] /* float.body.body.Ainf[1,4] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta45, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 0, 3);
  TRACE_POP
}

/*
equation index: 4562
type: SIMPLE_ASSIGN
float.body.body.Ainf12[1,1] = float.body.body.Ainf[1,4]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4562(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4562};
  (data->simulationInfo->realParameter[73] /* float.body.body.Ainf12[1,1] PARAM */) = (data->simulationInfo->realParameter[31] /* float.body.body.Ainf[1,4] PARAM */);
  TRACE_POP
}

/*
equation index: 4563
type: SIMPLE_ASSIGN
float.body.body.Ainf[3,3] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + float.body.body.bodyIndexString, 6, 6, true)[3, 3]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4563(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4563};
  modelica_metatype tmpMeta46;
  tmpMeta46 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42] /* float.body.body.Ainf[3,3] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta46, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 2, 2);
  TRACE_POP
}

/*
equation index: 4564
type: SIMPLE_ASSIGN
float.body.body.Ainf11[3,3] = float.body.body.Ainf[3,3]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4564(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4564};
  (data->simulationInfo->realParameter[72] /* float.body.body.Ainf11[3,3] PARAM */) = (data->simulationInfo->realParameter[42] /* float.body.body.Ainf[3,3] PARAM */);
  TRACE_POP
}

/*
equation index: 4565
type: SIMPLE_ASSIGN
float.body.body.Ainf[3,2] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + float.body.body.bodyIndexString, 6, 6, true)[3, 2]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4565(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4565};
  modelica_metatype tmpMeta47;
  tmpMeta47 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[41] /* float.body.body.Ainf[3,2] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta47, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 2, 1);
  TRACE_POP
}

/*
equation index: 4566
type: SIMPLE_ASSIGN
float.body.body.Ainf11[3,2] = float.body.body.Ainf[3,2]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4566(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4566};
  (data->simulationInfo->realParameter[71] /* float.body.body.Ainf11[3,2] PARAM */) = (data->simulationInfo->realParameter[41] /* float.body.body.Ainf[3,2] PARAM */);
  TRACE_POP
}

/*
equation index: 4567
type: SIMPLE_ASSIGN
float.body.body.Ainf[3,1] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + float.body.body.bodyIndexString, 6, 6, true)[3, 1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4567(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4567};
  modelica_metatype tmpMeta48;
  tmpMeta48 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[40] /* float.body.body.Ainf[3,1] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta48, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 2, 0);
  TRACE_POP
}

/*
equation index: 4568
type: SIMPLE_ASSIGN
float.body.body.Ainf11[3,1] = float.body.body.Ainf[3,1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4568(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4568};
  (data->simulationInfo->realParameter[70] /* float.body.body.Ainf11[3,1] PARAM */) = (data->simulationInfo->realParameter[40] /* float.body.body.Ainf[3,1] PARAM */);
  TRACE_POP
}

/*
equation index: 4569
type: SIMPLE_ASSIGN
float.body.body.Ainf[2,3] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + float.body.body.bodyIndexString, 6, 6, true)[2, 3]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4569(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4569};
  modelica_metatype tmpMeta49;
  tmpMeta49 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[36] /* float.body.body.Ainf[2,3] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta49, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 1, 2);
  TRACE_POP
}

/*
equation index: 4570
type: SIMPLE_ASSIGN
float.body.body.Ainf11[2,3] = float.body.body.Ainf[2,3]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4570(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4570};
  (data->simulationInfo->realParameter[69] /* float.body.body.Ainf11[2,3] PARAM */) = (data->simulationInfo->realParameter[36] /* float.body.body.Ainf[2,3] PARAM */);
  TRACE_POP
}

/*
equation index: 4571
type: SIMPLE_ASSIGN
float.body.body.Ainf[2,2] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + float.body.body.bodyIndexString, 6, 6, true)[2, 2]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4571(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4571};
  modelica_metatype tmpMeta50;
  tmpMeta50 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[35] /* float.body.body.Ainf[2,2] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta50, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 1, 1);
  TRACE_POP
}

/*
equation index: 4572
type: SIMPLE_ASSIGN
float.body.body.Ainf11[2,2] = float.body.body.Ainf[2,2]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4572(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4572};
  (data->simulationInfo->realParameter[68] /* float.body.body.Ainf11[2,2] PARAM */) = (data->simulationInfo->realParameter[35] /* float.body.body.Ainf[2,2] PARAM */);
  TRACE_POP
}

/*
equation index: 4573
type: SIMPLE_ASSIGN
float.body.body.Ainf[2,1] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + float.body.body.bodyIndexString, 6, 6, true)[2, 1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4573(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4573};
  modelica_metatype tmpMeta51;
  tmpMeta51 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[34] /* float.body.body.Ainf[2,1] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta51, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 1, 0);
  TRACE_POP
}

/*
equation index: 4574
type: SIMPLE_ASSIGN
float.body.body.Ainf11[2,1] = float.body.body.Ainf[2,1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4574(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4574};
  (data->simulationInfo->realParameter[67] /* float.body.body.Ainf11[2,1] PARAM */) = (data->simulationInfo->realParameter[34] /* float.body.body.Ainf[2,1] PARAM */);
  TRACE_POP
}

/*
equation index: 4575
type: SIMPLE_ASSIGN
float.body.body.Ainf[1,3] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + float.body.body.bodyIndexString, 6, 6, true)[1, 3]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4575(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4575};
  modelica_metatype tmpMeta52;
  tmpMeta52 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[30] /* float.body.body.Ainf[1,3] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta52, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 0, 2);
  TRACE_POP
}

/*
equation index: 4576
type: SIMPLE_ASSIGN
float.body.body.Ainf11[1,3] = float.body.body.Ainf[1,3]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4576(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4576};
  (data->simulationInfo->realParameter[66] /* float.body.body.Ainf11[1,3] PARAM */) = (data->simulationInfo->realParameter[30] /* float.body.body.Ainf[1,3] PARAM */);
  TRACE_POP
}

/*
equation index: 4577
type: SIMPLE_ASSIGN
float.body.body.Ainf[1,2] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + float.body.body.bodyIndexString, 6, 6, true)[1, 2]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4577(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4577};
  modelica_metatype tmpMeta53;
  tmpMeta53 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[29] /* float.body.body.Ainf[1,2] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta53, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 0, 1);
  TRACE_POP
}

/*
equation index: 4578
type: SIMPLE_ASSIGN
float.body.body.Ainf11[1,2] = float.body.body.Ainf[1,2]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4578(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4578};
  (data->simulationInfo->realParameter[65] /* float.body.body.Ainf11[1,2] PARAM */) = (data->simulationInfo->realParameter[29] /* float.body.body.Ainf[1,2] PARAM */);
  TRACE_POP
}

/*
equation index: 4579
type: SIMPLE_ASSIGN
float.body.body.Ainf[1,1] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + float.body.body.bodyIndexString, 6, 6, true)[1, 1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4579(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4579};
  modelica_metatype tmpMeta54;
  tmpMeta54 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[28] /* float.body.body.Ainf[1,1] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta54, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 0, 0);
  TRACE_POP
}

/*
equation index: 4580
type: SIMPLE_ASSIGN
float.body.body.Ainf11[1,1] = float.body.body.Ainf[1,1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4580(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4580};
  (data->simulationInfo->realParameter[64] /* float.body.body.Ainf11[1,1] PARAM */) = (data->simulationInfo->realParameter[28] /* float.body.body.Ainf[1,1] PARAM */);
  TRACE_POP
}

/*
equation index: 4581
type: SIMPLE_ASSIGN
float.body.body.M[1,1] = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.bodies.m" + float.body.body.bodyIndexString, 1, 1, true)[1, 1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4581(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4581};
  modelica_metatype tmpMeta55;
  tmpMeta55 = stringAppend(_OMC_LIT37,(data->simulationInfo->stringParameter[5] /* float.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[115] /* float.body.body.M[1,1] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), tmpMeta55, ((modelica_integer) 1), ((modelica_integer) 1), 1 /* true */), 0, 0);
  TRACE_POP
}

/*
equation index: 4582
type: SIMPLE_ASSIGN
float.body.body.m[3,3] = float.body.body.M[1,1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4582(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4582};
  (data->simulationInfo->realParameter[144] /* float.body.body.m[3,3] PARAM */) = (data->simulationInfo->realParameter[115] /* float.body.body.M[1,1] PARAM */);
  TRACE_POP
}

/*
equation index: 4586
type: SIMPLE_ASSIGN
float.body.body.m[2,2] = float.body.body.M[1,1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4586(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4586};
  (data->simulationInfo->realParameter[140] /* float.body.body.m[2,2] PARAM */) = (data->simulationInfo->realParameter[115] /* float.body.body.M[1,1] PARAM */);
  TRACE_POP
}

/*
equation index: 4590
type: SIMPLE_ASSIGN
float.body.body.m[1,1] = float.body.body.M[1,1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4590(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4590};
  (data->simulationInfo->realParameter[136] /* float.body.body.m[1,1] PARAM */) = (data->simulationInfo->realParameter[115] /* float.body.body.M[1,1] PARAM */);
  TRACE_POP
}

/*
equation index: 4591
type: SIMPLE_ASSIGN
float.body.body.nbodies_read = Modelica.Utilities.Streams.readRealMatrix(float.body.body.fileDir, "hydro.bodies.Nb", 1, 1, true)[1, 1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4591(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4591};
  (data->simulationInfo->realParameter[145] /* float.body.body.nbodies_read PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[6] /* float.body.body.fileDir PARAM */), _OMC_LIT27, ((modelica_integer) 1), ((modelica_integer) 1), 1 /* true */), 0, 0);
  TRACE_POP
}

/*
equation index: 4592
type: SIMPLE_ASSIGN
float.body.body.nbodies = integer(float.body.body.nbodies_read)
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4592(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4592};
  (data->simulationInfo->integerParameter[73] /* float.body.body.nbodies PARAM */) = ((modelica_integer)floor((data->simulationInfo->realParameter[145] /* float.body.body.nbodies_read PARAM */)));
  TRACE_POP
}

/*
equation index: 4593
type: SIMPLE_ASSIGN
float.body.body.nDoF = 6 * float.body.body.nbodies
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4593(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4593};
  (data->simulationInfo->integerParameter[72] /* float.body.body.nDoF PARAM */) = (((modelica_integer) 6)) * ((data->simulationInfo->integerParameter[73] /* float.body.body.nbodies PARAM */));
  TRACE_POP
}

/*
equation index: 4596
type: SIMPLE_ASSIGN
float.body.body.hydroCoeffFile = "/RM3HydroCoeff.mat"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4596(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4596};
  (data->simulationInfo->stringParameter[8] /* float.body.body.hydroCoeffFile PARAM */) = _OMC_LIT28;
  TRACE_POP
}

/*
equation index: 4597
type: SIMPLE_ASSIGN
float.body.body.filePath = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4597(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4597};
  (data->simulationInfo->stringParameter[7] /* float.body.body.filePath PARAM */) = _OMC_LIT29;
  TRACE_POP
}

/*
equation index: 4600
type: SIMPLE_ASSIGN
float.body.fileDir = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/RM3HydroCoeff.mat"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4600(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4600};
  (data->simulationInfo->stringParameter[10] /* float.body.fileDir PARAM */) = _OMC_LIT22;
  TRACE_POP
}

/*
equation index: 4601
type: SIMPLE_ASSIGN
float.body.hydroCoeffFile = "/RM3HydroCoeff.mat"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4601(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4601};
  (data->simulationInfo->stringParameter[18] /* float.body.hydroCoeffFile PARAM */) = _OMC_LIT28;
  TRACE_POP
}

/*
equation index: 4602
type: SIMPLE_ASSIGN
float.body.filePath = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4602(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4602};
  (data->simulationInfo->stringParameter[11] /* float.body.filePath PARAM */) = _OMC_LIT29;
  TRACE_POP
}

/*
equation index: 4613
type: SIMPLE_ASSIGN
spar.absoluteSensor.arrow.arrowLine.quantity = spar.absoluteSensor.arrow.quantity
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4613(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4613};
  (data->simulationInfo->integerParameter[140] /* spar.absoluteSensor.arrow.arrowLine.quantity PARAM */) = (data->simulationInfo->integerParameter[141] /* spar.absoluteSensor.arrow.quantity PARAM */);
  TRACE_POP
}

/*
equation index: 4624
type: SIMPLE_ASSIGN
spar.absoluteSensor.absoluteAngles.guessAngle1 = spar.absoluteSensor.guessAngle1
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4624(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4624};
  (data->simulationInfo->realParameter[42893] /* spar.absoluteSensor.absoluteAngles.guessAngle1 PARAM */) = (data->simulationInfo->realParameter[42896] /* spar.absoluteSensor.guessAngle1 PARAM */);
  TRACE_POP
}

/*
equation index: 4666
type: SIMPLE_ASSIGN
spar.body.absoluteSensor.arrow.arrowLine.quantity = spar.body.absoluteSensor.arrow.quantity
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4666(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4666};
  (data->simulationInfo->integerParameter[175] /* spar.body.absoluteSensor.arrow.arrowLine.quantity PARAM */) = (data->simulationInfo->integerParameter[176] /* spar.body.absoluteSensor.arrow.quantity PARAM */);
  TRACE_POP
}

/*
equation index: 4677
type: SIMPLE_ASSIGN
spar.body.absoluteSensor.absoluteAngles.guessAngle1 = spar.body.absoluteSensor.guessAngle1
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4677(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4677};
  (data->simulationInfo->realParameter[42904] /* spar.body.absoluteSensor.absoluteAngles.guessAngle1 PARAM */) = (data->simulationInfo->realParameter[42907] /* spar.body.absoluteSensor.guessAngle1 PARAM */);
  TRACE_POP
}

/*
equation index: 4700
type: SIMPLE_ASSIGN
spar.body.geometryFile = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox" + spar.geometryFile
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4700(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4700};
  modelica_metatype tmpMeta56;
  tmpMeta56 = stringAppend(_OMC_LIT29,(data->simulationInfo->stringParameter[62] /* spar.geometryFile PARAM */));
  (data->simulationInfo->stringParameter[59] /* spar.body.geometryFile PARAM */) = tmpMeta56;
  TRACE_POP
}

/*
equation index: 4701
type: SIMPLE_ASSIGN
spar.body.fixedShape.shapeType = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox" + spar.body.geometryFile
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4701(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4701};
  modelica_metatype tmpMeta57;
  tmpMeta57 = stringAppend(_OMC_LIT29,(data->simulationInfo->stringParameter[59] /* spar.body.geometryFile PARAM */));
  (data->simulationInfo->stringParameter[54] /* spar.body.fixedShape.shapeType PARAM */) = tmpMeta57;
  TRACE_POP
}

/*
equation index: 4703
type: SIMPLE_ASSIGN
spar.body.fixedTranslation1.shape.shapeType = spar.body.fixedTranslation1.shapeType
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4703(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4703};
  (data->simulationInfo->stringParameter[57] /* spar.body.fixedTranslation1.shape.shapeType PARAM */) = (data->simulationInfo->stringParameter[58] /* spar.body.fixedTranslation1.shapeType PARAM */);
  TRACE_POP
}

/*
equation index: 4717
type: SIMPLE_ASSIGN
spar.body.fixedTranslation.shape.shapeType = spar.body.fixedTranslation.shapeType
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4717(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4717};
  (data->simulationInfo->stringParameter[55] /* spar.body.fixedTranslation.shape.shapeType PARAM */) = (data->simulationInfo->stringParameter[56] /* spar.body.fixedTranslation.shapeType PARAM */);
  TRACE_POP
}

/*
equation index: 4731
type: SIMPLE_ASSIGN
spar.body.I_32 = spar.I_32
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4731(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4731};
  (data->simulationInfo->realParameter[42902] /* spar.body.I_32 PARAM */) = (data->simulationInfo->realParameter[42891] /* spar.I_32 PARAM */);
  TRACE_POP
}

/*
equation index: 4732
type: SIMPLE_ASSIGN
spar.body.I_31 = spar.I_31
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4732(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4732};
  (data->simulationInfo->realParameter[42901] /* spar.body.I_31 PARAM */) = (data->simulationInfo->realParameter[42890] /* spar.I_31 PARAM */);
  TRACE_POP
}

/*
equation index: 4733
type: SIMPLE_ASSIGN
spar.body.I_21 = spar.I_21
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4733(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4733};
  (data->simulationInfo->realParameter[42899] /* spar.body.I_21 PARAM */) = (data->simulationInfo->realParameter[42888] /* spar.I_21 PARAM */);
  TRACE_POP
}

/*
equation index: 4734
type: SIMPLE_ASSIGN
spar.body.I_33 = spar.I_33
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4734(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4734};
  (data->simulationInfo->realParameter[42903] /* spar.body.I_33 PARAM */) = (data->simulationInfo->realParameter[42892] /* spar.I_33 PARAM */);
  TRACE_POP
}

/*
equation index: 4735
type: SIMPLE_ASSIGN
spar.body.I_22 = spar.I_22
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4735(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4735};
  (data->simulationInfo->realParameter[42900] /* spar.body.I_22 PARAM */) = (data->simulationInfo->realParameter[42889] /* spar.I_22 PARAM */);
  TRACE_POP
}

/*
equation index: 4736
type: SIMPLE_ASSIGN
spar.body.I_11 = spar.I_11
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4736(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4736};
  (data->simulationInfo->realParameter[42898] /* spar.body.I_11 PARAM */) = (data->simulationInfo->realParameter[42887] /* spar.I_11 PARAM */);
  TRACE_POP
}

/*
equation index: 4737
type: SIMPLE_ASSIGN
spar.body.ra_b[3] = spar.ra_b[3]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4737(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4737};
  (data->simulationInfo->realParameter[43094] /* spar.body.ra_b[3] PARAM */) = (data->simulationInfo->realParameter[43103] /* spar.ra_b[3] PARAM */);
  TRACE_POP
}

/*
equation index: 4738
type: SIMPLE_ASSIGN
spar.body.ra_b[2] = spar.ra_b[2]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4738(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4738};
  (data->simulationInfo->realParameter[43093] /* spar.body.ra_b[2] PARAM */) = (data->simulationInfo->realParameter[43102] /* spar.ra_b[2] PARAM */);
  TRACE_POP
}

/*
equation index: 4739
type: SIMPLE_ASSIGN
spar.body.ra_b[1] = spar.ra_b[1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4739(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4739};
  (data->simulationInfo->realParameter[43092] /* spar.body.ra_b[1] PARAM */) = (data->simulationInfo->realParameter[43101] /* spar.ra_b[1] PARAM */);
  TRACE_POP
}

/*
equation index: 4746
type: SIMPLE_ASSIGN
spar.body.body.phi_start[3] = spar.body.body.angles_start[3]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4746(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4746};
  (data->simulationInfo->realParameter[43029] /* spar.body.body.phi_start[3] PARAM */) = (data->simulationInfo->realParameter[43015] /* spar.body.body.angles_start[3] PARAM */);
  TRACE_POP
}

/*
equation index: 4747
type: SIMPLE_ASSIGN
spar.body.body.phi_start[2] = spar.body.body.angles_start[2]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4747(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4747};
  (data->simulationInfo->realParameter[43028] /* spar.body.body.phi_start[2] PARAM */) = (data->simulationInfo->realParameter[43014] /* spar.body.body.angles_start[2] PARAM */);
  TRACE_POP
}

/*
equation index: 4748
type: SIMPLE_ASSIGN
spar.body.body.phi_start[1] = spar.body.body.angles_start[1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4748(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4748};
  (data->simulationInfo->realParameter[43027] /* spar.body.body.phi_start[1] PARAM */) = (data->simulationInfo->realParameter[43013] /* spar.body.body.angles_start[1] PARAM */);
  TRACE_POP
}

/*
equation index: 4749
type: ARRAY_CALL_ASSIGN

spar.body.body.Q_start = {0.0, 0.0, 0.0, 1.0}
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4749(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4749};
  real_array tmp58;
  real_array_create(&tmp58, ((modelica_real*)&((&(data->simulationInfo->realParameter[42997] /* spar.body.body.Q_start[1] PARAM */))[((modelica_integer) 1) - 1])), 1, (_index_t)4);
  real_array_copy_data(_OMC_LIT35, tmp58);
  TRACE_POP
}

/*
equation index: 4763
type: SIMPLE_ASSIGN
spar.body.body.I_33 = spar.body.I_33
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4763(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4763};
  (data->simulationInfo->realParameter[42995] /* spar.body.body.I_33 PARAM */) = (data->simulationInfo->realParameter[42903] /* spar.body.I_33 PARAM */);
  TRACE_POP
}

/*
equation index: 4764
type: SIMPLE_ASSIGN
spar.body.body.I[3,3] = spar.body.body.I_33
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4764(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4764};
  (data->simulationInfo->realParameter[42989] /* spar.body.body.I[3,3] PARAM */) = (data->simulationInfo->realParameter[42995] /* spar.body.body.I_33 PARAM */);
  TRACE_POP
}

/*
equation index: 4765
type: SIMPLE_ASSIGN
spar.body.body.I_32 = spar.body.I_32
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4765(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4765};
  (data->simulationInfo->realParameter[42994] /* spar.body.body.I_32 PARAM */) = (data->simulationInfo->realParameter[42902] /* spar.body.I_32 PARAM */);
  TRACE_POP
}

/*
equation index: 4766
type: SIMPLE_ASSIGN
spar.body.body.I[3,2] = spar.body.body.I_32
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4766(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4766};
  (data->simulationInfo->realParameter[42988] /* spar.body.body.I[3,2] PARAM */) = (data->simulationInfo->realParameter[42994] /* spar.body.body.I_32 PARAM */);
  TRACE_POP
}

/*
equation index: 4767
type: SIMPLE_ASSIGN
spar.body.body.I_31 = spar.body.I_31
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4767(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4767};
  (data->simulationInfo->realParameter[42993] /* spar.body.body.I_31 PARAM */) = (data->simulationInfo->realParameter[42901] /* spar.body.I_31 PARAM */);
  TRACE_POP
}

/*
equation index: 4768
type: SIMPLE_ASSIGN
spar.body.body.I[3,1] = spar.body.body.I_31
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4768(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4768};
  (data->simulationInfo->realParameter[42987] /* spar.body.body.I[3,1] PARAM */) = (data->simulationInfo->realParameter[42993] /* spar.body.body.I_31 PARAM */);
  TRACE_POP
}

/*
equation index: 4769
type: SIMPLE_ASSIGN
spar.body.body.I[2,3] = spar.body.body.I_32
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4769(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4769};
  (data->simulationInfo->realParameter[42986] /* spar.body.body.I[2,3] PARAM */) = (data->simulationInfo->realParameter[42994] /* spar.body.body.I_32 PARAM */);
  TRACE_POP
}

/*
equation index: 4770
type: SIMPLE_ASSIGN
spar.body.body.I_22 = spar.body.I_22
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4770(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4770};
  (data->simulationInfo->realParameter[42992] /* spar.body.body.I_22 PARAM */) = (data->simulationInfo->realParameter[42900] /* spar.body.I_22 PARAM */);
  TRACE_POP
}

/*
equation index: 4771
type: SIMPLE_ASSIGN
spar.body.body.I[2,2] = spar.body.body.I_22
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4771(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4771};
  (data->simulationInfo->realParameter[42985] /* spar.body.body.I[2,2] PARAM */) = (data->simulationInfo->realParameter[42992] /* spar.body.body.I_22 PARAM */);
  TRACE_POP
}

/*
equation index: 4772
type: SIMPLE_ASSIGN
spar.body.body.I_21 = spar.body.I_21
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4772(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4772};
  (data->simulationInfo->realParameter[42991] /* spar.body.body.I_21 PARAM */) = (data->simulationInfo->realParameter[42899] /* spar.body.I_21 PARAM */);
  TRACE_POP
}

/*
equation index: 4773
type: SIMPLE_ASSIGN
spar.body.body.I[2,1] = spar.body.body.I_21
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4773(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4773};
  (data->simulationInfo->realParameter[42984] /* spar.body.body.I[2,1] PARAM */) = (data->simulationInfo->realParameter[42991] /* spar.body.body.I_21 PARAM */);
  TRACE_POP
}

/*
equation index: 4774
type: SIMPLE_ASSIGN
spar.body.body.I[1,3] = spar.body.body.I_31
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4774(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4774};
  (data->simulationInfo->realParameter[42983] /* spar.body.body.I[1,3] PARAM */) = (data->simulationInfo->realParameter[42993] /* spar.body.body.I_31 PARAM */);
  TRACE_POP
}

/*
equation index: 4775
type: SIMPLE_ASSIGN
spar.body.body.I[1,2] = spar.body.body.I_21
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4775(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4775};
  (data->simulationInfo->realParameter[42982] /* spar.body.body.I[1,2] PARAM */) = (data->simulationInfo->realParameter[42991] /* spar.body.body.I_21 PARAM */);
  TRACE_POP
}

/*
equation index: 4776
type: SIMPLE_ASSIGN
spar.body.body.I_11 = spar.body.I_11
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4776(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4776};
  (data->simulationInfo->realParameter[42990] /* spar.body.body.I_11 PARAM */) = (data->simulationInfo->realParameter[42898] /* spar.body.I_11 PARAM */);
  TRACE_POP
}

/*
equation index: 4777
type: SIMPLE_ASSIGN
spar.body.body.I[1,1] = spar.body.body.I_11
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4777(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4777};
  (data->simulationInfo->realParameter[42981] /* spar.body.body.I[1,1] PARAM */) = (data->simulationInfo->realParameter[42990] /* spar.body.body.I_11 PARAM */);
  TRACE_POP
}

/*
equation index: 4790
type: SIMPLE_ASSIGN
spar.body.body.fileDir = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/RM3HydroCoeff.mat"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4790(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4790};
  (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */) = _OMC_LIT22;
  TRACE_POP
}

/*
equation index: 4791
type: SIMPLE_ASSIGN
spar.body.body.Ainf[6,6] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + spar.body.body.bodyIndexString, 6, 6, true)[6, 6]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4791(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4791};
  modelica_metatype tmpMeta59;
  tmpMeta59 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42944] /* spar.body.body.Ainf[6,6] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta59, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 5, 5);
  TRACE_POP
}

/*
equation index: 4792
type: SIMPLE_ASSIGN
spar.body.body.Ainf22[3,3] = spar.body.body.Ainf[6,6]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4792(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4792};
  (data->simulationInfo->realParameter[42980] /* spar.body.body.Ainf22[3,3] PARAM */) = (data->simulationInfo->realParameter[42944] /* spar.body.body.Ainf[6,6] PARAM */);
  TRACE_POP
}

/*
equation index: 4793
type: SIMPLE_ASSIGN
spar.body.body.Ainf[6,5] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + spar.body.body.bodyIndexString, 6, 6, true)[6, 5]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4793(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4793};
  modelica_metatype tmpMeta60;
  tmpMeta60 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42943] /* spar.body.body.Ainf[6,5] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta60, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 5, 4);
  TRACE_POP
}

/*
equation index: 4794
type: SIMPLE_ASSIGN
spar.body.body.Ainf22[3,2] = spar.body.body.Ainf[6,5]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4794(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4794};
  (data->simulationInfo->realParameter[42979] /* spar.body.body.Ainf22[3,2] PARAM */) = (data->simulationInfo->realParameter[42943] /* spar.body.body.Ainf[6,5] PARAM */);
  TRACE_POP
}

/*
equation index: 4795
type: SIMPLE_ASSIGN
spar.body.body.Ainf[6,4] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + spar.body.body.bodyIndexString, 6, 6, true)[6, 4]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4795(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4795};
  modelica_metatype tmpMeta61;
  tmpMeta61 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42942] /* spar.body.body.Ainf[6,4] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta61, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 5, 3);
  TRACE_POP
}

/*
equation index: 4796
type: SIMPLE_ASSIGN
spar.body.body.Ainf22[3,1] = spar.body.body.Ainf[6,4]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4796(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4796};
  (data->simulationInfo->realParameter[42978] /* spar.body.body.Ainf22[3,1] PARAM */) = (data->simulationInfo->realParameter[42942] /* spar.body.body.Ainf[6,4] PARAM */);
  TRACE_POP
}

/*
equation index: 4797
type: SIMPLE_ASSIGN
spar.body.body.Ainf[5,6] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + spar.body.body.bodyIndexString, 6, 6, true)[5, 6]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4797(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4797};
  modelica_metatype tmpMeta62;
  tmpMeta62 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42938] /* spar.body.body.Ainf[5,6] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta62, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 4, 5);
  TRACE_POP
}

/*
equation index: 4798
type: SIMPLE_ASSIGN
spar.body.body.Ainf22[2,3] = spar.body.body.Ainf[5,6]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4798(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4798};
  (data->simulationInfo->realParameter[42977] /* spar.body.body.Ainf22[2,3] PARAM */) = (data->simulationInfo->realParameter[42938] /* spar.body.body.Ainf[5,6] PARAM */);
  TRACE_POP
}

/*
equation index: 4799
type: SIMPLE_ASSIGN
spar.body.body.Ainf[5,5] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + spar.body.body.bodyIndexString, 6, 6, true)[5, 5]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4799(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4799};
  modelica_metatype tmpMeta63;
  tmpMeta63 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42937] /* spar.body.body.Ainf[5,5] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta63, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 4, 4);
  TRACE_POP
}

/*
equation index: 4800
type: SIMPLE_ASSIGN
spar.body.body.Ainf22[2,2] = spar.body.body.Ainf[5,5]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4800(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4800};
  (data->simulationInfo->realParameter[42976] /* spar.body.body.Ainf22[2,2] PARAM */) = (data->simulationInfo->realParameter[42937] /* spar.body.body.Ainf[5,5] PARAM */);
  TRACE_POP
}

/*
equation index: 4801
type: SIMPLE_ASSIGN
spar.body.body.Ainf[5,4] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + spar.body.body.bodyIndexString, 6, 6, true)[5, 4]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4801(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4801};
  modelica_metatype tmpMeta64;
  tmpMeta64 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42936] /* spar.body.body.Ainf[5,4] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta64, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 4, 3);
  TRACE_POP
}

/*
equation index: 4802
type: SIMPLE_ASSIGN
spar.body.body.Ainf22[2,1] = spar.body.body.Ainf[5,4]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4802(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4802};
  (data->simulationInfo->realParameter[42975] /* spar.body.body.Ainf22[2,1] PARAM */) = (data->simulationInfo->realParameter[42936] /* spar.body.body.Ainf[5,4] PARAM */);
  TRACE_POP
}

/*
equation index: 4803
type: SIMPLE_ASSIGN
spar.body.body.Ainf[4,6] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + spar.body.body.bodyIndexString, 6, 6, true)[4, 6]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4803(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4803};
  modelica_metatype tmpMeta65;
  tmpMeta65 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42932] /* spar.body.body.Ainf[4,6] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta65, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 3, 5);
  TRACE_POP
}

/*
equation index: 4804
type: SIMPLE_ASSIGN
spar.body.body.Ainf22[1,3] = spar.body.body.Ainf[4,6]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4804(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4804};
  (data->simulationInfo->realParameter[42974] /* spar.body.body.Ainf22[1,3] PARAM */) = (data->simulationInfo->realParameter[42932] /* spar.body.body.Ainf[4,6] PARAM */);
  TRACE_POP
}

/*
equation index: 4805
type: SIMPLE_ASSIGN
spar.body.body.Ainf[4,5] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + spar.body.body.bodyIndexString, 6, 6, true)[4, 5]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4805(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4805};
  modelica_metatype tmpMeta66;
  tmpMeta66 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42931] /* spar.body.body.Ainf[4,5] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta66, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 3, 4);
  TRACE_POP
}

/*
equation index: 4806
type: SIMPLE_ASSIGN
spar.body.body.Ainf22[1,2] = spar.body.body.Ainf[4,5]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4806(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4806};
  (data->simulationInfo->realParameter[42973] /* spar.body.body.Ainf22[1,2] PARAM */) = (data->simulationInfo->realParameter[42931] /* spar.body.body.Ainf[4,5] PARAM */);
  TRACE_POP
}

/*
equation index: 4807
type: SIMPLE_ASSIGN
spar.body.body.Ainf[4,4] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + spar.body.body.bodyIndexString, 6, 6, true)[4, 4]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4807(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4807};
  modelica_metatype tmpMeta67;
  tmpMeta67 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42930] /* spar.body.body.Ainf[4,4] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta67, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 3, 3);
  TRACE_POP
}

/*
equation index: 4808
type: SIMPLE_ASSIGN
spar.body.body.Ainf22[1,1] = spar.body.body.Ainf[4,4]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4808(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4808};
  (data->simulationInfo->realParameter[42972] /* spar.body.body.Ainf22[1,1] PARAM */) = (data->simulationInfo->realParameter[42930] /* spar.body.body.Ainf[4,4] PARAM */);
  TRACE_POP
}

/*
equation index: 4809
type: SIMPLE_ASSIGN
spar.body.body.Ainf[6,3] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + spar.body.body.bodyIndexString, 6, 6, true)[6, 3]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4809(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4809};
  modelica_metatype tmpMeta68;
  tmpMeta68 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42941] /* spar.body.body.Ainf[6,3] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta68, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 5, 2);
  TRACE_POP
}

/*
equation index: 4810
type: SIMPLE_ASSIGN
spar.body.body.Ainf21[3,3] = spar.body.body.Ainf[6,3]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4810(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4810};
  (data->simulationInfo->realParameter[42971] /* spar.body.body.Ainf21[3,3] PARAM */) = (data->simulationInfo->realParameter[42941] /* spar.body.body.Ainf[6,3] PARAM */);
  TRACE_POP
}

/*
equation index: 4811
type: SIMPLE_ASSIGN
spar.body.body.Ainf[6,2] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + spar.body.body.bodyIndexString, 6, 6, true)[6, 2]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4811(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4811};
  modelica_metatype tmpMeta69;
  tmpMeta69 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42940] /* spar.body.body.Ainf[6,2] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta69, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 5, 1);
  TRACE_POP
}

/*
equation index: 4812
type: SIMPLE_ASSIGN
spar.body.body.Ainf21[3,2] = spar.body.body.Ainf[6,2]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4812(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4812};
  (data->simulationInfo->realParameter[42970] /* spar.body.body.Ainf21[3,2] PARAM */) = (data->simulationInfo->realParameter[42940] /* spar.body.body.Ainf[6,2] PARAM */);
  TRACE_POP
}

/*
equation index: 4813
type: SIMPLE_ASSIGN
spar.body.body.Ainf[6,1] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + spar.body.body.bodyIndexString, 6, 6, true)[6, 1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4813(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4813};
  modelica_metatype tmpMeta70;
  tmpMeta70 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42939] /* spar.body.body.Ainf[6,1] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta70, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 5, 0);
  TRACE_POP
}

/*
equation index: 4814
type: SIMPLE_ASSIGN
spar.body.body.Ainf21[3,1] = spar.body.body.Ainf[6,1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4814(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4814};
  (data->simulationInfo->realParameter[42969] /* spar.body.body.Ainf21[3,1] PARAM */) = (data->simulationInfo->realParameter[42939] /* spar.body.body.Ainf[6,1] PARAM */);
  TRACE_POP
}

/*
equation index: 4815
type: SIMPLE_ASSIGN
spar.body.body.Ainf[5,3] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + spar.body.body.bodyIndexString, 6, 6, true)[5, 3]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4815(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4815};
  modelica_metatype tmpMeta71;
  tmpMeta71 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42935] /* spar.body.body.Ainf[5,3] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta71, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 4, 2);
  TRACE_POP
}

/*
equation index: 4816
type: SIMPLE_ASSIGN
spar.body.body.Ainf21[2,3] = spar.body.body.Ainf[5,3]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4816(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4816};
  (data->simulationInfo->realParameter[42968] /* spar.body.body.Ainf21[2,3] PARAM */) = (data->simulationInfo->realParameter[42935] /* spar.body.body.Ainf[5,3] PARAM */);
  TRACE_POP
}

/*
equation index: 4817
type: SIMPLE_ASSIGN
spar.body.body.Ainf[5,2] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + spar.body.body.bodyIndexString, 6, 6, true)[5, 2]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4817(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4817};
  modelica_metatype tmpMeta72;
  tmpMeta72 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42934] /* spar.body.body.Ainf[5,2] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta72, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 4, 1);
  TRACE_POP
}

/*
equation index: 4818
type: SIMPLE_ASSIGN
spar.body.body.Ainf21[2,2] = spar.body.body.Ainf[5,2]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4818(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4818};
  (data->simulationInfo->realParameter[42967] /* spar.body.body.Ainf21[2,2] PARAM */) = (data->simulationInfo->realParameter[42934] /* spar.body.body.Ainf[5,2] PARAM */);
  TRACE_POP
}

/*
equation index: 4819
type: SIMPLE_ASSIGN
spar.body.body.Ainf[5,1] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + spar.body.body.bodyIndexString, 6, 6, true)[5, 1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4819(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4819};
  modelica_metatype tmpMeta73;
  tmpMeta73 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42933] /* spar.body.body.Ainf[5,1] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta73, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 4, 0);
  TRACE_POP
}

/*
equation index: 4820
type: SIMPLE_ASSIGN
spar.body.body.Ainf21[2,1] = spar.body.body.Ainf[5,1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4820(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4820};
  (data->simulationInfo->realParameter[42966] /* spar.body.body.Ainf21[2,1] PARAM */) = (data->simulationInfo->realParameter[42933] /* spar.body.body.Ainf[5,1] PARAM */);
  TRACE_POP
}

/*
equation index: 4821
type: SIMPLE_ASSIGN
spar.body.body.Ainf[4,3] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + spar.body.body.bodyIndexString, 6, 6, true)[4, 3]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4821(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4821};
  modelica_metatype tmpMeta74;
  tmpMeta74 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42929] /* spar.body.body.Ainf[4,3] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta74, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 3, 2);
  TRACE_POP
}

/*
equation index: 4822
type: SIMPLE_ASSIGN
spar.body.body.Ainf21[1,3] = spar.body.body.Ainf[4,3]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4822(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4822};
  (data->simulationInfo->realParameter[42965] /* spar.body.body.Ainf21[1,3] PARAM */) = (data->simulationInfo->realParameter[42929] /* spar.body.body.Ainf[4,3] PARAM */);
  TRACE_POP
}

/*
equation index: 4823
type: SIMPLE_ASSIGN
spar.body.body.Ainf[4,2] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + spar.body.body.bodyIndexString, 6, 6, true)[4, 2]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4823(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4823};
  modelica_metatype tmpMeta75;
  tmpMeta75 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42928] /* spar.body.body.Ainf[4,2] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta75, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 3, 1);
  TRACE_POP
}

/*
equation index: 4824
type: SIMPLE_ASSIGN
spar.body.body.Ainf21[1,2] = spar.body.body.Ainf[4,2]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4824(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4824};
  (data->simulationInfo->realParameter[42964] /* spar.body.body.Ainf21[1,2] PARAM */) = (data->simulationInfo->realParameter[42928] /* spar.body.body.Ainf[4,2] PARAM */);
  TRACE_POP
}

/*
equation index: 4825
type: SIMPLE_ASSIGN
spar.body.body.Ainf[4,1] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + spar.body.body.bodyIndexString, 6, 6, true)[4, 1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4825(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4825};
  modelica_metatype tmpMeta76;
  tmpMeta76 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42927] /* spar.body.body.Ainf[4,1] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta76, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 3, 0);
  TRACE_POP
}

/*
equation index: 4826
type: SIMPLE_ASSIGN
spar.body.body.Ainf21[1,1] = spar.body.body.Ainf[4,1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4826(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4826};
  (data->simulationInfo->realParameter[42963] /* spar.body.body.Ainf21[1,1] PARAM */) = (data->simulationInfo->realParameter[42927] /* spar.body.body.Ainf[4,1] PARAM */);
  TRACE_POP
}

/*
equation index: 4827
type: SIMPLE_ASSIGN
spar.body.body.Ainf[3,6] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + spar.body.body.bodyIndexString, 6, 6, true)[3, 6]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4827(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4827};
  modelica_metatype tmpMeta77;
  tmpMeta77 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42926] /* spar.body.body.Ainf[3,6] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta77, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 2, 5);
  TRACE_POP
}

/*
equation index: 4828
type: SIMPLE_ASSIGN
spar.body.body.Ainf12[3,3] = spar.body.body.Ainf[3,6]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4828(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4828};
  (data->simulationInfo->realParameter[42962] /* spar.body.body.Ainf12[3,3] PARAM */) = (data->simulationInfo->realParameter[42926] /* spar.body.body.Ainf[3,6] PARAM */);
  TRACE_POP
}

/*
equation index: 4829
type: SIMPLE_ASSIGN
spar.body.body.Ainf[3,5] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + spar.body.body.bodyIndexString, 6, 6, true)[3, 5]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4829(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4829};
  modelica_metatype tmpMeta78;
  tmpMeta78 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42925] /* spar.body.body.Ainf[3,5] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta78, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 2, 4);
  TRACE_POP
}

/*
equation index: 4830
type: SIMPLE_ASSIGN
spar.body.body.Ainf12[3,2] = spar.body.body.Ainf[3,5]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4830(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4830};
  (data->simulationInfo->realParameter[42961] /* spar.body.body.Ainf12[3,2] PARAM */) = (data->simulationInfo->realParameter[42925] /* spar.body.body.Ainf[3,5] PARAM */);
  TRACE_POP
}

/*
equation index: 4831
type: SIMPLE_ASSIGN
spar.body.body.Ainf[3,4] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + spar.body.body.bodyIndexString, 6, 6, true)[3, 4]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4831(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4831};
  modelica_metatype tmpMeta79;
  tmpMeta79 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42924] /* spar.body.body.Ainf[3,4] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta79, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 2, 3);
  TRACE_POP
}

/*
equation index: 4832
type: SIMPLE_ASSIGN
spar.body.body.Ainf12[3,1] = spar.body.body.Ainf[3,4]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4832(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4832};
  (data->simulationInfo->realParameter[42960] /* spar.body.body.Ainf12[3,1] PARAM */) = (data->simulationInfo->realParameter[42924] /* spar.body.body.Ainf[3,4] PARAM */);
  TRACE_POP
}

/*
equation index: 4833
type: SIMPLE_ASSIGN
spar.body.body.Ainf[2,6] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + spar.body.body.bodyIndexString, 6, 6, true)[2, 6]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4833(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4833};
  modelica_metatype tmpMeta80;
  tmpMeta80 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42920] /* spar.body.body.Ainf[2,6] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta80, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 1, 5);
  TRACE_POP
}

/*
equation index: 4834
type: SIMPLE_ASSIGN
spar.body.body.Ainf12[2,3] = spar.body.body.Ainf[2,6]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4834(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4834};
  (data->simulationInfo->realParameter[42959] /* spar.body.body.Ainf12[2,3] PARAM */) = (data->simulationInfo->realParameter[42920] /* spar.body.body.Ainf[2,6] PARAM */);
  TRACE_POP
}

/*
equation index: 4835
type: SIMPLE_ASSIGN
spar.body.body.Ainf[2,5] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + spar.body.body.bodyIndexString, 6, 6, true)[2, 5]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4835(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4835};
  modelica_metatype tmpMeta81;
  tmpMeta81 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42919] /* spar.body.body.Ainf[2,5] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta81, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 1, 4);
  TRACE_POP
}

/*
equation index: 4836
type: SIMPLE_ASSIGN
spar.body.body.Ainf12[2,2] = spar.body.body.Ainf[2,5]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4836(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4836};
  (data->simulationInfo->realParameter[42958] /* spar.body.body.Ainf12[2,2] PARAM */) = (data->simulationInfo->realParameter[42919] /* spar.body.body.Ainf[2,5] PARAM */);
  TRACE_POP
}

/*
equation index: 4837
type: SIMPLE_ASSIGN
spar.body.body.Ainf[2,4] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + spar.body.body.bodyIndexString, 6, 6, true)[2, 4]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4837(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4837};
  modelica_metatype tmpMeta82;
  tmpMeta82 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42918] /* spar.body.body.Ainf[2,4] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta82, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 1, 3);
  TRACE_POP
}

/*
equation index: 4838
type: SIMPLE_ASSIGN
spar.body.body.Ainf12[2,1] = spar.body.body.Ainf[2,4]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4838(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4838};
  (data->simulationInfo->realParameter[42957] /* spar.body.body.Ainf12[2,1] PARAM */) = (data->simulationInfo->realParameter[42918] /* spar.body.body.Ainf[2,4] PARAM */);
  TRACE_POP
}

/*
equation index: 4839
type: SIMPLE_ASSIGN
spar.body.body.Ainf[1,6] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + spar.body.body.bodyIndexString, 6, 6, true)[1, 6]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4839(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4839};
  modelica_metatype tmpMeta83;
  tmpMeta83 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42914] /* spar.body.body.Ainf[1,6] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta83, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 0, 5);
  TRACE_POP
}

/*
equation index: 4840
type: SIMPLE_ASSIGN
spar.body.body.Ainf12[1,3] = spar.body.body.Ainf[1,6]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4840(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4840};
  (data->simulationInfo->realParameter[42956] /* spar.body.body.Ainf12[1,3] PARAM */) = (data->simulationInfo->realParameter[42914] /* spar.body.body.Ainf[1,6] PARAM */);
  TRACE_POP
}

/*
equation index: 4841
type: SIMPLE_ASSIGN
spar.body.body.Ainf[1,5] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + spar.body.body.bodyIndexString, 6, 6, true)[1, 5]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4841(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4841};
  modelica_metatype tmpMeta84;
  tmpMeta84 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42913] /* spar.body.body.Ainf[1,5] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta84, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 0, 4);
  TRACE_POP
}

/*
equation index: 4842
type: SIMPLE_ASSIGN
spar.body.body.Ainf12[1,2] = spar.body.body.Ainf[1,5]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4842(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4842};
  (data->simulationInfo->realParameter[42955] /* spar.body.body.Ainf12[1,2] PARAM */) = (data->simulationInfo->realParameter[42913] /* spar.body.body.Ainf[1,5] PARAM */);
  TRACE_POP
}

/*
equation index: 4843
type: SIMPLE_ASSIGN
spar.body.body.Ainf[1,4] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + spar.body.body.bodyIndexString, 6, 6, true)[1, 4]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4843(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4843};
  modelica_metatype tmpMeta85;
  tmpMeta85 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42912] /* spar.body.body.Ainf[1,4] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta85, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 0, 3);
  TRACE_POP
}

/*
equation index: 4844
type: SIMPLE_ASSIGN
spar.body.body.Ainf12[1,1] = spar.body.body.Ainf[1,4]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4844(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4844};
  (data->simulationInfo->realParameter[42954] /* spar.body.body.Ainf12[1,1] PARAM */) = (data->simulationInfo->realParameter[42912] /* spar.body.body.Ainf[1,4] PARAM */);
  TRACE_POP
}

/*
equation index: 4845
type: SIMPLE_ASSIGN
spar.body.body.Ainf[3,3] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + spar.body.body.bodyIndexString, 6, 6, true)[3, 3]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4845(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4845};
  modelica_metatype tmpMeta86;
  tmpMeta86 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42923] /* spar.body.body.Ainf[3,3] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta86, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 2, 2);
  TRACE_POP
}

/*
equation index: 4846
type: SIMPLE_ASSIGN
spar.body.body.Ainf11[3,3] = spar.body.body.Ainf[3,3]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4846(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4846};
  (data->simulationInfo->realParameter[42953] /* spar.body.body.Ainf11[3,3] PARAM */) = (data->simulationInfo->realParameter[42923] /* spar.body.body.Ainf[3,3] PARAM */);
  TRACE_POP
}

/*
equation index: 4847
type: SIMPLE_ASSIGN
spar.body.body.Ainf[3,2] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + spar.body.body.bodyIndexString, 6, 6, true)[3, 2]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4847(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4847};
  modelica_metatype tmpMeta87;
  tmpMeta87 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42922] /* spar.body.body.Ainf[3,2] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta87, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 2, 1);
  TRACE_POP
}

/*
equation index: 4848
type: SIMPLE_ASSIGN
spar.body.body.Ainf11[3,2] = spar.body.body.Ainf[3,2]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4848(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4848};
  (data->simulationInfo->realParameter[42952] /* spar.body.body.Ainf11[3,2] PARAM */) = (data->simulationInfo->realParameter[42922] /* spar.body.body.Ainf[3,2] PARAM */);
  TRACE_POP
}

/*
equation index: 4849
type: SIMPLE_ASSIGN
spar.body.body.Ainf[3,1] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + spar.body.body.bodyIndexString, 6, 6, true)[3, 1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4849(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4849};
  modelica_metatype tmpMeta88;
  tmpMeta88 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42921] /* spar.body.body.Ainf[3,1] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta88, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 2, 0);
  TRACE_POP
}

/*
equation index: 4850
type: SIMPLE_ASSIGN
spar.body.body.Ainf11[3,1] = spar.body.body.Ainf[3,1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4850(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4850};
  (data->simulationInfo->realParameter[42951] /* spar.body.body.Ainf11[3,1] PARAM */) = (data->simulationInfo->realParameter[42921] /* spar.body.body.Ainf[3,1] PARAM */);
  TRACE_POP
}

/*
equation index: 4851
type: SIMPLE_ASSIGN
spar.body.body.Ainf[2,3] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + spar.body.body.bodyIndexString, 6, 6, true)[2, 3]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4851(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4851};
  modelica_metatype tmpMeta89;
  tmpMeta89 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42917] /* spar.body.body.Ainf[2,3] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta89, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 1, 2);
  TRACE_POP
}

/*
equation index: 4852
type: SIMPLE_ASSIGN
spar.body.body.Ainf11[2,3] = spar.body.body.Ainf[2,3]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4852(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4852};
  (data->simulationInfo->realParameter[42950] /* spar.body.body.Ainf11[2,3] PARAM */) = (data->simulationInfo->realParameter[42917] /* spar.body.body.Ainf[2,3] PARAM */);
  TRACE_POP
}

/*
equation index: 4853
type: SIMPLE_ASSIGN
spar.body.body.Ainf[2,2] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + spar.body.body.bodyIndexString, 6, 6, true)[2, 2]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4853(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4853};
  modelica_metatype tmpMeta90;
  tmpMeta90 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42916] /* spar.body.body.Ainf[2,2] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta90, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 1, 1);
  TRACE_POP
}

/*
equation index: 4854
type: SIMPLE_ASSIGN
spar.body.body.Ainf11[2,2] = spar.body.body.Ainf[2,2]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4854(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4854};
  (data->simulationInfo->realParameter[42949] /* spar.body.body.Ainf11[2,2] PARAM */) = (data->simulationInfo->realParameter[42916] /* spar.body.body.Ainf[2,2] PARAM */);
  TRACE_POP
}

/*
equation index: 4855
type: SIMPLE_ASSIGN
spar.body.body.Ainf[2,1] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + spar.body.body.bodyIndexString, 6, 6, true)[2, 1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4855(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4855};
  modelica_metatype tmpMeta91;
  tmpMeta91 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42915] /* spar.body.body.Ainf[2,1] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta91, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 1, 0);
  TRACE_POP
}

/*
equation index: 4856
type: SIMPLE_ASSIGN
spar.body.body.Ainf11[2,1] = spar.body.body.Ainf[2,1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4856(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4856};
  (data->simulationInfo->realParameter[42948] /* spar.body.body.Ainf11[2,1] PARAM */) = (data->simulationInfo->realParameter[42915] /* spar.body.body.Ainf[2,1] PARAM */);
  TRACE_POP
}

/*
equation index: 4857
type: SIMPLE_ASSIGN
spar.body.body.Ainf[1,3] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + spar.body.body.bodyIndexString, 6, 6, true)[1, 3]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4857(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4857};
  modelica_metatype tmpMeta92;
  tmpMeta92 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42911] /* spar.body.body.Ainf[1,3] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta92, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 0, 2);
  TRACE_POP
}

/*
equation index: 4858
type: SIMPLE_ASSIGN
spar.body.body.Ainf11[1,3] = spar.body.body.Ainf[1,3]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4858(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4858};
  (data->simulationInfo->realParameter[42947] /* spar.body.body.Ainf11[1,3] PARAM */) = (data->simulationInfo->realParameter[42911] /* spar.body.body.Ainf[1,3] PARAM */);
  TRACE_POP
}

/*
equation index: 4859
type: SIMPLE_ASSIGN
spar.body.body.Ainf[1,2] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + spar.body.body.bodyIndexString, 6, 6, true)[1, 2]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4859(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4859};
  modelica_metatype tmpMeta93;
  tmpMeta93 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42910] /* spar.body.body.Ainf[1,2] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta93, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 0, 1);
  TRACE_POP
}

/*
equation index: 4860
type: SIMPLE_ASSIGN
spar.body.body.Ainf11[1,2] = spar.body.body.Ainf[1,2]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4860(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4860};
  (data->simulationInfo->realParameter[42946] /* spar.body.body.Ainf11[1,2] PARAM */) = (data->simulationInfo->realParameter[42910] /* spar.body.body.Ainf[1,2] PARAM */);
  TRACE_POP
}

/*
equation index: 4861
type: SIMPLE_ASSIGN
spar.body.body.Ainf[1,1] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + spar.body.body.bodyIndexString, 6, 6, true)[1, 1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4861(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4861};
  modelica_metatype tmpMeta94;
  tmpMeta94 = stringAppend(_OMC_LIT36,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42909] /* spar.body.body.Ainf[1,1] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta94, ((modelica_integer) 6), ((modelica_integer) 6), 1 /* true */), 0, 0);
  TRACE_POP
}

/*
equation index: 4862
type: SIMPLE_ASSIGN
spar.body.body.Ainf11[1,1] = spar.body.body.Ainf[1,1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4862(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4862};
  (data->simulationInfo->realParameter[42945] /* spar.body.body.Ainf11[1,1] PARAM */) = (data->simulationInfo->realParameter[42909] /* spar.body.body.Ainf[1,1] PARAM */);
  TRACE_POP
}

/*
equation index: 4863
type: SIMPLE_ASSIGN
spar.body.body.M[1,1] = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.bodies.m" + spar.body.body.bodyIndexString, 1, 1, true)[1, 1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4863(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4863};
  modelica_metatype tmpMeta95;
  tmpMeta95 = stringAppend(_OMC_LIT37,(data->simulationInfo->stringParameter[47] /* spar.body.body.bodyIndexString PARAM */));
  (data->simulationInfo->realParameter[42996] /* spar.body.body.M[1,1] PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), tmpMeta95, ((modelica_integer) 1), ((modelica_integer) 1), 1 /* true */), 0, 0);
  TRACE_POP
}

/*
equation index: 4864
type: SIMPLE_ASSIGN
spar.body.body.m[3,3] = spar.body.body.M[1,1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4864(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4864};
  (data->simulationInfo->realParameter[43025] /* spar.body.body.m[3,3] PARAM */) = (data->simulationInfo->realParameter[42996] /* spar.body.body.M[1,1] PARAM */);
  TRACE_POP
}

/*
equation index: 4868
type: SIMPLE_ASSIGN
spar.body.body.m[2,2] = spar.body.body.M[1,1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4868(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4868};
  (data->simulationInfo->realParameter[43021] /* spar.body.body.m[2,2] PARAM */) = (data->simulationInfo->realParameter[42996] /* spar.body.body.M[1,1] PARAM */);
  TRACE_POP
}

/*
equation index: 4872
type: SIMPLE_ASSIGN
spar.body.body.m[1,1] = spar.body.body.M[1,1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4872(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4872};
  (data->simulationInfo->realParameter[43017] /* spar.body.body.m[1,1] PARAM */) = (data->simulationInfo->realParameter[42996] /* spar.body.body.M[1,1] PARAM */);
  TRACE_POP
}

/*
equation index: 4873
type: SIMPLE_ASSIGN
spar.body.body.nbodies_read = Modelica.Utilities.Streams.readRealMatrix(spar.body.body.fileDir, "hydro.bodies.Nb", 1, 1, true)[1, 1]
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4873(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4873};
  (data->simulationInfo->realParameter[43026] /* spar.body.body.nbodies_read PARAM */) = real_get_2D(omc_Modelica_Utilities_Streams_readRealMatrix(threadData, (data->simulationInfo->stringParameter[48] /* spar.body.body.fileDir PARAM */), _OMC_LIT27, ((modelica_integer) 1), ((modelica_integer) 1), 1 /* true */), 0, 0);
  TRACE_POP
}

/*
equation index: 4874
type: SIMPLE_ASSIGN
spar.body.body.nbodies = integer(spar.body.body.nbodies_read)
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4874(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4874};
  (data->simulationInfo->integerParameter[200] /* spar.body.body.nbodies PARAM */) = ((modelica_integer)floor((data->simulationInfo->realParameter[43026] /* spar.body.body.nbodies_read PARAM */)));
  TRACE_POP
}

/*
equation index: 4875
type: SIMPLE_ASSIGN
spar.body.body.nDoF = 6 * spar.body.body.nbodies
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4875(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4875};
  (data->simulationInfo->integerParameter[199] /* spar.body.body.nDoF PARAM */) = (((modelica_integer) 6)) * ((data->simulationInfo->integerParameter[200] /* spar.body.body.nbodies PARAM */));
  TRACE_POP
}

/*
equation index: 4878
type: SIMPLE_ASSIGN
spar.body.body.hydroCoeffFile = "/RM3HydroCoeff.mat"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4878(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4878};
  (data->simulationInfo->stringParameter[50] /* spar.body.body.hydroCoeffFile PARAM */) = _OMC_LIT28;
  TRACE_POP
}

/*
equation index: 4879
type: SIMPLE_ASSIGN
spar.body.body.filePath = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4879(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4879};
  (data->simulationInfo->stringParameter[49] /* spar.body.body.filePath PARAM */) = _OMC_LIT29;
  TRACE_POP
}

/*
equation index: 4882
type: SIMPLE_ASSIGN
spar.body.fileDir = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/RM3HydroCoeff.mat"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4882(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4882};
  (data->simulationInfo->stringParameter[52] /* spar.body.fileDir PARAM */) = _OMC_LIT22;
  TRACE_POP
}

/*
equation index: 4883
type: SIMPLE_ASSIGN
spar.body.hydroCoeffFile = "/RM3HydroCoeff.mat"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4883(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4883};
  (data->simulationInfo->stringParameter[60] /* spar.body.hydroCoeffFile PARAM */) = _OMC_LIT28;
  TRACE_POP
}

/*
equation index: 4884
type: SIMPLE_ASSIGN
spar.body.filePath = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4884(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4884};
  (data->simulationInfo->stringParameter[53] /* spar.body.filePath PARAM */) = _OMC_LIT29;
  TRACE_POP
}

/*
equation index: 4886
type: SIMPLE_ASSIGN
fileDirectory.fileDir = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/RM3HydroCoeff.mat"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4886(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4886};
  (data->simulationInfo->stringParameter[2] /* fileDirectory.fileDir PARAM */) = _OMC_LIT22;
  TRACE_POP
}

/*
equation index: 4887
type: SIMPLE_ASSIGN
fileDirectory.hydroCoeffFile = "/RM3HydroCoeff.mat"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4887(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4887};
  (data->simulationInfo->stringParameter[4] /* fileDirectory.hydroCoeffFile PARAM */) = _OMC_LIT28;
  TRACE_POP
}

/*
equation index: 4888
type: SIMPLE_ASSIGN
fileDirectory.filePath = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox"
*/
OMC_DISABLE_OPT
static void OET_Example_multibodyWECSingleDoF_eqFunction_4888(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4888};
  (data->simulationInfo->stringParameter[3] /* fileDirectory.filePath PARAM */) = _OMC_LIT29;
  TRACE_POP
}
OMC_DISABLE_OPT
void OET_Example_multibodyWECSingleDoF_updateBoundParameters_0(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  OET_Example_multibodyWECSingleDoF_eqFunction_3126(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3125(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3124(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3123(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3122(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3121(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3120(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3119(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3118(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3117(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3116(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3115(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3114(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3113(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3112(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3111(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3110(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3109(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3108(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3107(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3106(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3800(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3801(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3802(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3803(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3804(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3805(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3807(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3808(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3809(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3810(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3811(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3812(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3813(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3814(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3815(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3816(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3817(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3818(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3819(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3820(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3821(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3822(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3823(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3824(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3825(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3826(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3827(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3828(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3829(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3830(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3831(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3832(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3833(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3834(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3835(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3836(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3837(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3838(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3839(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3840(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3841(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3842(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3843(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3844(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3845(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3846(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3847(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3848(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3849(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3850(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3851(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3852(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3853(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3854(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3855(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3856(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3857(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3858(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3859(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3860(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3861(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3862(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3863(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3864(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3865(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3866(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3867(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3868(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3869(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3870(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3871(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3872(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3873(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3874(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3875(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3876(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3877(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3878(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3879(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3880(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3881(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3882(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3883(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3884(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3885(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3886(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3887(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3888(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3889(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3890(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3891(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3892(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3893(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3894(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3895(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3896(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3897(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3898(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3899(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3900(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3901(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3902(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3903(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3904(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3905(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3906(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3907(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3908(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3909(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3910(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3911(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3912(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3913(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3914(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3915(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3916(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3917(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3918(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3919(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3920(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3921(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3922(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3923(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3924(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3925(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3926(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3927(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3929(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3930(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3931(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3932(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3933(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3934(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3935(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3936(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_3937(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_2991(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_2989(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_2987(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_2985(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_2983(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_2981(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4209(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4222(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4223(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4224(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4234(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4245(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4270(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4271(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4272(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4273(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4274(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4275(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4278(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4279(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4280(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4282(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4283(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4284(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4286(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4288(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4289(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4290(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4293(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4294(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4295(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4296(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4299(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4300(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4301(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4303(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4305(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4306(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4307(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4309(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4331(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4332(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4333(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4336(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4337(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4338(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4339(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4340(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4343(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4344(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4346(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4347(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4366(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4367(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4368(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4384(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4395(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4418(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4419(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4421(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4435(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4449(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4450(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4451(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4452(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4453(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4454(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4455(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4456(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4457(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4464(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4465(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4466(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4467(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4481(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4482(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4483(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4484(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4485(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4486(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4487(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4488(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4489(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4490(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4491(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4492(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4493(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4494(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4495(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4508(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4509(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4510(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4511(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4512(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4513(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4514(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4515(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4516(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4517(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4518(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4519(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4520(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4521(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4522(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4523(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4524(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4525(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4526(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4527(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4528(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4529(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4530(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4531(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4532(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4533(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4534(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4535(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4536(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4537(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4538(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4539(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4540(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4541(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4542(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4543(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4544(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4545(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4546(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4547(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4548(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4549(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4550(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4551(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4552(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4553(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4554(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4555(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4556(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4557(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4558(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4559(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4560(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4561(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4562(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4563(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4564(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4565(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4566(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4567(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4568(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4569(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4570(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4571(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4572(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4573(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4574(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4575(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4576(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4577(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4578(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4579(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4580(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4581(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4582(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4586(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4590(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4591(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4592(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4593(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4596(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4597(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4600(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4601(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4602(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4613(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4624(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4666(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4677(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4700(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4701(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4703(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4717(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4731(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4732(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4733(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4734(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4735(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4736(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4737(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4738(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4739(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4746(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4747(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4748(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4749(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4763(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4764(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4765(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4766(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4767(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4768(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4769(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4770(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4771(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4772(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4773(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4774(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4775(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4776(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4777(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4790(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4791(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4792(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4793(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4794(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4795(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4796(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4797(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4798(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4799(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4800(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4801(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4802(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4803(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4804(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4805(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4806(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4807(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4808(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4809(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4810(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4811(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4812(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4813(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4814(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4815(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4816(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4817(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4818(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4819(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4820(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4821(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4822(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4823(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4824(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4825(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4826(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4827(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4828(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4829(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4830(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4831(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4832(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4833(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4834(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4835(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4836(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4837(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4838(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4839(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4840(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4841(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4842(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4843(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4844(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4845(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4846(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4847(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4848(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4849(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4850(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4851(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4852(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4853(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4854(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4855(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4856(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4857(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4858(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4859(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4860(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4861(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4862(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4863(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4864(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4868(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4872(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4873(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4874(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4875(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4878(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4879(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4882(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4883(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4884(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4886(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4887(data, threadData);
  OET_Example_multibodyWECSingleDoF_eqFunction_4888(data, threadData);
  TRACE_POP
}
#if defined(__cplusplus)
}
#endif