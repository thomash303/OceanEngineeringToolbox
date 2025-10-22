within OceanEngineeringToolbox.Hydro.Forces;

model Morison
  "Model representing the Morison force"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Mechanics.MultiBody.Interfaces.Frame_a;
 
  // Frame_a connector
  Frame_a frame_a "Coordinate system fixed at body" annotation(
    Placement(transformation(origin = {0, -200}, extent = {{-116, -16}, {-84, 16}}, rotation = -90), iconTransformation(extent = {{-116, -16}, {-84, 16}}, rotation = 90)));
  
  parameter Integer nME "Number of Morison Morison elements";
  parameter SI.Position rME[3,nME] "Vector to the Morison element from the CG";
  parameter Real nHatME[3,nME] "Orientation unit vector";
  parameter Real Cdn[3,nME] "Normal drag coefficients";
  parameter Real Cdt[3,nME] "Tangential drag coefficients";
  parameter SI.Area Adn[3,nME] "Normal drag area";
  parameter SI.Area Adt[3,nME] "Tangential drag area";
  parameter Real Camn[3,nME] "Normal added mass coefficients";
  parameter Real Camt[3,nME] "Tangential added mass coefficients";
  parameter SI.Volume VME[nME] "Displaced volume";
  
  
  SubForces.MorisonForces.MorisonForce morisonForce(nME = nME, rME = rME, nHatME = nHatME, Cdn = Cdn, Cdt = Cdt, Adn = Adn, Adt = Adt, Camn = Camn, Camt = Camt, VME = VME) annotation(
    Placement(transformation(origin = {4, -8}, extent = {{-10, -10}, {10, 10}})));
equation

// sign in wave kinematics
// global or local kinematics
// below surface check
// calculation of kinematics not at cg

end Morison;
