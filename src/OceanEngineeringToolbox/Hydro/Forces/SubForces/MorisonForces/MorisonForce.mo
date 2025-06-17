within OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces;

model MorisonForce
  "Model representing the Morison force"
  // This has yet to be developed.
  
  // Importing from the MSL
  import Modelica.Units.SI; 
  import Modelica.Constants.pi;
  
  parameter String kinematicType = "None";
  parameter String currentType = "None";
  Real currentVelocityVector[6] = {current, 0, 0, 0, 0, 0};
  Real currentVelocityAmplitude;
  Real current = ramp*currentVelocityAmplitude;
  Real ramp;
  Real waterVelocity;

  
  parameter SI.Velocity currentSpeedMWL "Current speed at the mean water level";
  parameter SI.Height currentDepth "Depth with zero current";
  parameter Integer powerLawExp "Power law exponent";
  
  EnvironmentKinematics.waveKinematics waveKinematics if kinematicType == "waveOnly" or kinematicType == "waveAndCurrent" annotation(
    Placement(transformation(origin = {2, 48}, extent = {{-10, -10}, {10, 10}})));
  EnvironmentKinematics.currentKinematics currentKinematics if kinematicType == "currentOnly" or kinematicType == "waveAndCurrent" annotation(
    Placement(transformation(origin = {2, -34}, extent = {{-10, -10}, {10, 10}})));


equation

  if kinematicType == "None" then
    waterVelocity = 0;
  elseif kinematicType == "waveOnly" then
    waterVelocity = waveKinematics.waveVelocityVector;
  elseif kinematicType == "currentOnly" then
    waterVelocity = currentKinematics.currentVelocityVector;
  elseif kinematicType == "waveAndCurrent" then
    waterVelocity = waveKinematics.waveVelocityVector + currentKinematics.currentVelocityVector;    
  end if;





end MorisonForce;
