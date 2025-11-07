within OceanEngineeringToolbox.Mooring.LinearMooring;

model linearMooring "Model representing a linear mooring (coefficients input in Modelica)"
  // Importing from the MSL
  import Modelica.Mechanics.MultiBody.Interfaces.Frame_a;
  import Modelica.Mechanics.MultiBody.Types;
  import Modelica.Mechanics.MultiBody.Sensors;
  import Modelica.Units.SI;
  // Frame_a connector
  Frame_a frame_a "Coordinate system fixed at body" annotation(
    HideResult = true,
    Placement(transformation(extent = {{-116, -16}, {-84, 16}})));
  parameter Boolean enableMooringForce = true "Switch to enable/disable mooring force calculation" annotation(
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "Mooring Parameters"));
  parameter SI.TranslationalSpringConstant Km[6, 6] = {{0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0}} "Mooring stiffness vector" annotation(
    HideResult = true,
    Dialog(group = "Mooring Coefficients"));
  parameter SI.TranslationalDampingConstant Cm[6, 6] = {{0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0}} "Mooring damping vector" annotation(
    HideResult = true,
    Dialog(group = "Mooring Coefficients"));
  parameter SI.Force pre_Tension[6] = {0, 0, 0, 0, 0, 0} "Pretension force" annotation(
    HideResult = true,
    Dialog(group = "Mooring Parameters"));
  SI.Position s_ref[6] = {0, 0, 0, 0, 0, 0} "Reference or equilibirum position (Unstretched spring length/angle)" annotation(
    HideResult = true,
    Dialog(group = "Mooring Parameters"));
  Forces.linearMooringForce linearMooringForce(Km = Km, Cm = Cm, pre_Tension = pre_Tension, s_ref = s_ref) if enableMooringForce annotation(
    Placement(transformation(origin = {2, 0}, extent = {{-14, -14}, {14, 14}})));
  Sensors.AbsoluteSensor absoluteSensor(get_r = true, get_angles = true, get_v = true, get_w = true, animation = false, resolveInFrame = Types.ResolveInFrameA.world) annotation(
    Placement(transformation(origin = {2, 66}, extent = {{-12, -12}, {12, 12}})));
equation
// add pre tension
  connect(absoluteSensor.frame_a, frame_a) annotation(
    Line(points = {{-10, 66}, {-10, 72}, {-100, 72}, {-100, 0}}, color = {95, 95, 95}));
  connect(absoluteSensor.r, linearMooringForce.u_abs) annotation(
    Line(points = {{-10, 53}, {-9, 53}, {-9, 16}}, color = {0, 0, 127}, thickness = 0.5));
  connect(absoluteSensor.angles, linearMooringForce.theta_abs) annotation(
    Line(points = {{4, 53}, {-3, 53}, {-3, 16}}, color = {0, 0, 127}, thickness = 0.5));
  connect(absoluteSensor.v, linearMooringForce.v_abs) annotation(
    Line(points = {{-5, 53}, {3, 53}, {3, 16}}, color = {0, 0, 127}, thickness = 0.5));
  connect(absoluteSensor.w, linearMooringForce.omega_abs) annotation(
    Line(points = {{9, 53}, {9, 16}}, color = {0, 0, 127}, thickness = 0.5));
  connect(linearMooringForce.frame_a, frame_a) annotation(
    Line(points = {{-12, 0}, {-100, 0}}, color = {95, 95, 95}));
annotation(
    Icon(
        coordinateSystem(
            preserveAspectRatio = true,
            extent = {{-100, -100}, {100, 100}}
        ),
        graphics = {
            Text(
                textColor = {0, 0, 255},
                extent = {{-150, 145}, {150, 105}},
                textString = "%name"
            ),
            Rectangle(
                lineColor = {194, 178, 128},
                fillColor = {194, 178, 128},
                fillPattern = FillPattern.Solid,
                lineThickness = 1.5,
                extent = {{-100, -100}, {100, -85}}
            ),
            Line(
                origin = {-20.5618, 28.9888},
                points = {
                    {100, -120},
                    {90, -100},
                    {75, -80},
                    {55, -60},
                    {30, -40},
                    {5, -20},
                    {-25, 0}
                },
                color = {139, 69, 19},
                thickness = 12,
                smooth = Smooth.Bezier
            )
        }
    ),
    Diagram
);


end linearMooring;
