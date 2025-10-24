within OceanEngineeringToolbox.Hydro.Forces;

model Morison
  "Model representing the Morison force"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Mechanics.MultiBody.Interfaces.Frame_a;
  import Modelica.Mechanics.MultiBody.Types;
  import Modelica.Mechanics.MultiBody.Sensors;
  
    // Importing and extending from the OET
  import OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.CurrentModels.*;
  import OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.WaveModels.*;
 
  // Frame_a connector
  Frame_a frame_a "Coordinate system fixed at body" annotation(
    Placement(transformation(origin = {0, -200}, extent = {{-116, -16}, {-84, 16}}, rotation = -90), iconTransformation(extent = {{-116, -16}, {-84, 16}}, rotation = 90)));
  
  parameter Integer nME = 2 "Number of Morison Morison elements";
  parameter SI.Position rME[3,nME] "Vector to the Morison element from the CG in the body frame";
  parameter Real nHatME[3,nME] "Orientation unit vector in the body frame";
  parameter Real Cd[3,nME] = zeros(3,nME) "Normal drag coefficients";
  parameter SI.Area Adn[3,nME] "Normal drag area";
  parameter SI.Area Adt[3,nME] "Tangential drag area";
  parameter Real Camn[3,nME] "Normal added mass coefficients";
  parameter Real Camt[3,nME] "Tangential added mass coefficients";
  parameter SI.Volume VME[nME] "Displaced volume";
  
  
  SubForces.MorisonForces.MorisonForce morisonForce(nME = nME, rME = rME, nHatME = nHatME, Cd = Cd, Adn = Adn, Adt = Adt, Camn = Camn, Camt = Camt, VME = VME, redeclare NoCurrent currentModel "No current", redeclare NoWaveKin waveModel "No wave kinematics") annotation(
    Placement(transformation(origin = {0, -24}, extent = {{-10, -10}, {10, 10}})));
  Sensors.AbsoluteSensor absoluteSensor(resolveInFrame = Types.ResolveInFrameA.world, get_r = true, get_v = true, get_a = true, get_w = true, get_z = true, get_angles = false)  annotation(
    Placement(transformation(origin = {0, 58}, extent = {{-10, -10}, {10, 10}})));
equation
// sign in wave kinematics
// global or local kinematics
// below surface check
// calculation of kinematics not at cg (will need to also rotate r from local to global frame)
// MSL behaving like it does intrinsic zyx
  connect(frame_a, morisonForce.frame_a) annotation(
    Line(points = {{0, -100}, {0, -34}}));
 connect(absoluteSensor.frame_a, frame_a) annotation(
    Line(points = {{-10, 58}, {36, 58}, {36, -100}, {0, -100}}, color = {95, 95, 95}));
 connect(absoluteSensor.r, morisonForce.u_abs) annotation(
    Line(points = {{-10, 48}, {0, 48}, {0, -12}}, color = {0, 0, 127}, thickness = 0.5));
 connect(absoluteSensor.v, morisonForce.v_abs) annotation(
    Line(points = {{-6, 48}, {-8, 48}, {-8, -12}}, color = {0, 0, 127}, thickness = 0.5));
 connect(absoluteSensor.w, morisonForce.omega_abs) annotation(
    Line(points = {{6, 48}, {-4, 48}, {-4, -12}}, color = {0, 0, 127}, thickness = 0.5));
 connect(absoluteSensor.a, morisonForce.a_abs) annotation(
    Line(points = {{-2, 48}, {4, 48}, {4, -12}}, color = {0, 0, 127}, thickness = 0.5));
 connect(absoluteSensor.z, morisonForce.alpha_abs) annotation(
    Line(points = {{10, 48}, {10, 17}, {8, 17}, {8, -12}}, color = {0, 0, 127}, thickness = 0.5));
end Morison;
