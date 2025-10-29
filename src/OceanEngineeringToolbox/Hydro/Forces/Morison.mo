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
  
  // Calling an outer model at the top-level deployment
  outer Environmental.Environment environment;
 
  // Frame_a connector
  Frame_a frame_a "Coordinate system fixed at body" annotation(
    Placement(transformation(origin = {0, -200}, extent = {{-116, -16}, {-84, 16}}, rotation = -90), iconTransformation(extent = {{-116, -16}, {-84, 16}}, rotation = 90)));
  
  // Morison parameters
  parameter Integer nME "Number of Morison Morison elements" annotation(Dialog(enable = false, tab = "Misc"));
  parameter SI.Position rME[3,nME] "Vector to the Morison element from the CG in the body frame" annotation(Dialog(enable = false, tab = "Misc"));
  parameter Real nHatME[3,nME] "Orientation unit vector in the body frame" annotation(Dialog(enable = false, tab = "Misc"));
  parameter Real Cfk[2,nME] "Froude-Krylov coefficients [normal, tangential]" annotation(Dialog(enable = false, tab = "Misc"));  
  parameter Real Cd[2,nME] "Drag coefficients [normal, tangential]" annotation(Dialog(enable = false, tab = "Misc"));  
  parameter SI.Area Ac[2,nME] "Characteristic drag area [normal, tangential]" annotation(Dialog(enable = false, tab = "Misc"));
  parameter Real Cam[2,nME] "Added mass coefficients [normal, tangential]" annotation(Dialog(enable = false, tab = "Misc"));
  parameter SI.Volume VME[nME] "Displaced volume" annotation(Dialog(enable = false, tab = "Misc"));
  
  
 replaceable SubForces.MorisonForces.MorisonForce morisonForce(nME = nME, rME = rME, nHatME = nHatME, Cfk = Cfk, Cd = Cd, Ac = Ac, Cam = Cam, VME = VME, zeta = environment.wave.zeta, n_omega = environment.wave.n_omega, omega = environment.wave.omega, phi = environment.wave.phi, ramp = environment.wave.ramp, Trmp = environment.Trmp, k = environment.wave.k, waveHeading = environment.wave.waveHeading, waveHeadingSpreadBins = environment.wave.waveHeadingSpreadBins, spreadBinCentres = environment.wave.spreadBinCentres) annotation(Dialog(group = "Wave and current kinematic model selection"),
    Placement(transformation(origin = {0, -24}, extent = {{-10, -10}, {10, 10}})));
  Sensors.AbsoluteSensor absoluteSensor(resolveInFrame = Types.ResolveInFrameA.world, get_r = true, get_v = true, get_a = true, get_w = true, get_z = true, get_angles = false)  annotation(   Placement(transformation(origin = {0, 58}, extent = {{-10, -10}, {10, 10}})));
equation
// below surface check
// regular waves
// to include tangential in FK??
// make the current model change cleaner
// clean up code
// multidirectional
// validation
// need to pass in current, wave directionality, wave spectra
// might need to make regular/irregular spectra
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
