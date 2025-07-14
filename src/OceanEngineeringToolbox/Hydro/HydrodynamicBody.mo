within OceanEngineeringToolbox.Hydro;

model HydrodynamicBody
  "Model containing the hydrodynamic body used to represent the dynamics floating body. Instantiated directly in the top-level of the model."
  
  // Importing and inheriting from the MSL
  import Modelica.Units.SI;
  import Modelica.Mechanics.MultiBody.Interfaces.PartialTwoFrames;
  
  extends PartialTwoFrames;

  // Extending from the OceanEngineeringToolbox
  extends DataImport.InputRecords.FilePath(filePath = fileDirectory.filePath, hydroCoeffFile = fileDirectory.hydroCoeffFile);
  extends DataImport.InputRecords.animationFile(geometryFile = "None");
  extends DataImport.InputRecords.BodyIndex;
  import Modelica.Utilities.Streams.readRealMatrix;
  
  // Simulation parameters w/ implicit connections
  outer DataImport.FileDirectory fileDirectory;
  
  // Mass parameters
  parameter SI.Mass M[1,1] = readRealMatrix(fileDir, "hydro.bodies.m" + bodyIndexString, 1, 1) "Total mass of the body (optional input if user wants to specify a mass that is not necessarily in static equilibirum)" annotation(
    Dialog(group = "Mass")); 
  Multibody.Body body(filePath = fileDirectory.filePath, hydroCoeffFile = fileDirectory.hydroCoeffFile, bodyIndex = bodyIndex, animationEnable = animationEnable, geometryFile = geometryFile, bodyColour = bodyColour, ra_CM = ra_CM, rCM_b = rCM_b, ra_b = ra_b, M = M, I_11 = I_11, I_22 = I_22, I_33 = I_33, I_21 = I_21, I_31 = I_31, I_32 = I_32) annotation(
    Placement(transformation(origin = {0, -38}, extent = {{-12, -12}, {12, 12}})));
  parameter SI.Length ra_CM[3] = {0, 0, 0} "Position vector between joint A and the centre of mass" annotation(
    Dialog(group = "Mass"));
  parameter SI.Length rCM_b[3] = {0, 0, 0} "Position vector between the centre of mass and joint B" annotation(
    Dialog(group = "Mass"));
  parameter SI.Length ra_b[3] = ra_CM + rCM_b "Position vector between joint A and joint B" annotation(
    Dialog(group = "Mass"));
  parameter SI.Inertia I_11 = 0.001 "Element (1,1) of inertia tensor" annotation(
    Dialog(group = "Mass"));
  parameter SI.Inertia I_22 = 0.001 "Element (2,2) of inertia tensor" annotation(
    Dialog(group = "Mass"));
  parameter SI.Inertia I_33 = 0.001 "Element (3,3) of inertia tensor" annotation(
    Dialog(group = "Mass"));
  parameter SI.Inertia I_21 = 0 "Element (2,1) of inertia tensor" annotation(
    Dialog(group = "Mass"));
  parameter SI.Inertia I_31 = 0 "Element (3,1) of inertia tensor" annotation(
    Dialog(group = "Mass"));
  parameter SI.Inertia I_32 = 0 "Element (3,2) of inertia tensor" annotation(
    Dialog(group = "Mass"));

  // Excitation
  Forces.Excitation excitation(filePath = fileDirectory.filePath, hydroCoeffFile = fileDirectory.hydroCoeffFile, bodyIndex = bodyIndex) if enableExcitationForce annotation(
    Placement(transformation(origin = {-32, 48}, extent = {{18, -18}, {-18, 18}})));
  parameter Boolean enableExcitationForce = true "Switch to enable/disable excitation force calculation" annotation(
    choices(checkBox = true),
    Dialog(group = "Excitation"));
  // Radiation
    Forces.Radiation radiation(filePath = fileDirectory.filePath, hydroCoeffFile = fileDirectory.hydroCoeffFile, bodyIndex = bodyIndex) if enableRadiationForce annotation(
    Placement(transformation(origin = {34, 48}, extent = {{-18, -18}, {18, 18}})));
  parameter Boolean enableRadiationForce = true "Switch to enable/disable radiation force calculation" annotation(
    choices(checkBox = true),
    Dialog(group = "Radiation"));
  // Hydrostatic
  Forces.Hydrostatic hydrostatic(filePath = fileDirectory.filePath, hydroCoeffFile = fileDirectory.hydroCoeffFile, bodyIndex = bodyIndex) if enableHydrostaticForce annotation(
    Placement(transformation(origin = {-80, 48}, extent = {{18, -18}, {-18, 18}})));
  parameter Boolean enableHydrostaticForce = true "Switch to enable/disable hydrostatic force calculation" annotation(
    choices(checkBox = true),
    Dialog(group = "Hydrostatic"));  
  // Damping/drag
  Forces.DampingDrag dampingDrag(filePath = fileDirectory.filePath, hydroCoeffFile = fileDirectory.hydroCoeffFile, Cv = Cv, Cd = Cd, Ad = Ad) if enableDampingDragForce annotation(
    Placement(transformation(origin = {78, 48}, extent = {{-18, -18}, {18, 18}})));
  parameter Boolean enableDampingDragForce = true "Switch to enable/disable damping/drag force calculation" annotation(
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "Damping/Drag"));
  // Drag coefficients
  parameter Real Cv[6] = {0, 0, 0, 0, 0, 0} "Linear damping coefficient vector" annotation(HideResult = true, Dialog(group = "Damping/Drag"));
  parameter Real Cd[6] = {0, 0, 0, 0, 0, 0} "Quadratic drag coefficient vector" annotation(HideResult = true, Dialog(group = "Damping/Drag"));
  parameter Real Ad[6] = {0, 0, 0, 0, 0, 0} "Characteristic area vector" annotation(HideResult = true, Dialog(group = "Damping/Drag"));


equation
//Conections
  connect(hydrostatic.frame_a, body.frame_c) annotation(
    Line(points = {{-62, 48}, {-56, 48}, {-56, -26}, {0, -26}}, color = {95, 95, 95}));
  connect(dampingDrag.frame_a, body.frame_c) annotation(
    Line(points = {{60, 48}, {56, 48}, {56, -26}, {0, -26}}, color = {95, 95, 95}));
  connect(radiation.frame_a, body.frame_c) annotation(
    Line(points = {{16, 48}, {0, 48}, {0, -26}}, color = {95, 95, 95}));
  connect(excitation.frame_a, body.frame_c) annotation(
    Line(points = {{-14, 48}, {0, 48}, {0, -26}}, color = {95, 95, 95}));
  connect(body.frame_a, frame_a) annotation(
    Line(points = {{-12, -38}, {-100, -38}, {-100, 0}}, color = {95, 95, 95}));
  connect(body.frame_b, frame_b) annotation(
    Line(points = {{12, -38}, {100, -38}, {100, 0}}, color = {95, 95, 95}));

annotation(
  Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {
    // Name at the top
    Text(
      extent = {{-150, 145}, {150, 105}},
      textString = "%name",
      textColor = {0, 0, 255}
    ),

    // Outer block
    Rectangle(
      extent = {{-100, -100}, {100, 100}},
      lineColor = {0, 0, 0}
    ),

    // Label "Hydro Body" in the center
    Text(
      extent = {{-100, 95}, {100, 55}},
      textString = "Hydro Body"
    ),

    // CG circle
    Ellipse(
      extent = {{-10, -10}, {10, 10}},
      lineColor = {0, 0, 0},
      fillColor = {255, 255, 255},
      fillPattern = FillPattern.Solid
    ),

    // Upper-right quarter (black)
    Polygon(
      points = {{0, 0}, {10, 0}, {10, 10}, {0, 10}},
      fillColor = {0, 0, 0},
      fillPattern = FillPattern.Solid,
      lineColor = {0, 0, 0}
    ),

    // Lower-left quarter (black)
    Polygon(
      points = {{0, 0}, {-10, 0}, {-10, -10}, {0, -10}},
      fillColor = {0, 0, 0},
      fillPattern = FillPattern.Solid,
      lineColor = {0, 0, 0}
    ),

    // ra_CM label to the left of CG
    Text(
      extent = {{-100, -15}, {-10, -30}},
      textString = "ra_CM = %ra_CM",
      textColor = {0, 0, 0},
      horizontalAlignment = TextAlignment.Right
    ),

    // rCM_b label to the right of CG
    Text(
      extent = {{10, -15}, {100, -30}},
      textString = "rCM_b = %rCM_b",
      textColor = {0, 0, 0},
      horizontalAlignment = TextAlignment.Left
    )
  }),
  Diagram
);

end HydrodynamicBody;
