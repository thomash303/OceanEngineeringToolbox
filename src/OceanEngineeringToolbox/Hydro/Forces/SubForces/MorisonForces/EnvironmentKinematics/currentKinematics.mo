within OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.EnvironmentKinematics;

model currentKinematics
  "Model representing the current kinematics"
  
  // Importing from the MSL
  import Modelica.Units.SI; 
  import Modelica.Constants.pi;
  
  parameter String currentType = "None";
  Real currentVelocityVector[6] = {current, 0, 0, 0, 0, 0};
  Real currentVelocityAmplitude;
  Real current = ramp*currentVelocityAmplitude;
  Real ramp;

  
  parameter SI.Velocity currentSpeedMWL "Current speed at the mean water level";
  parameter SI.Height currentDepth "Depth with zero current";
  parameter Integer powerLawExp "Power law exponent";

  
  
  KinematicModels.constantCurrent ConstantCurrent(currentSpeedMWL = currentSpeedMWL) if currentType == "ConstantCurrent" annotation(
    Placement(transformation(origin = {-12, 42}, extent = {{-10, -10}, {10, 10}})));
  KinematicModels.linearCurrent LinearCurrent(currentSpeedMWL = currentSpeedMWL, currentDepth = currentDepth) if currentType == "LinearCurrent" annotation(
    Placement(transformation(origin = {-14, 8}, extent = {{-10, -10}, {10, 10}})));
  KinematicModels.powerLawCurrent PowerLawCurrent(currentSpeedMWL = currentSpeedMWL, currentDepth = currentDepth, powerLawExp = powerLawExp) if currentType == "PowerLawCurrent" annotation(
    Placement(transformation(origin = {-12, -22}, extent = {{-10, -10}, {10, 10}})));
  KinematicModels.customCurrent CustomCurrent if currentType == "CustomCurrent" annotation(
    Placement(transformation(origin = {-12, -54}, extent = {{-10, -10}, {10, 10}})));
protected

equation

  if currentType == "None" then
    currentVelocityAmplitude = 0;
  elseif currentType == "Constant" then
    currentVelocityAmplitude = ConstantCurrent.currentSpeed;
  elseif currentType == "Linear" then
    currentVelocityAmplitude = LinearCurrent.currentSpeed;
  elseif currentType == "PowerLaw" then
    currentVelocityAmplitude = PowerLawCurrent.currentSpeed;
  elseif currentType == "Custom" then
    currentVelocityAmplitude = CustomCurrent.currentSpeed;
  end if; 
   
   
end currentKinematics;
