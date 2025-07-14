within OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.EnvironmentKinematics.KinematicModels;

model linearCurrent
  "Model for linear current profiles"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  
  parameter SI.Velocity currentSpeedMWL "Current speed at the mean water level";
  SI.Velocity currentSpeed "Current speed at desired depth";
  parameter SI.Height currentDepth "Depth with zero current";
  
equation
  currentSpeed = currentSpeedMWL*(1+z/currentDepth);

  annotation(defaultComponentName = "LinearCurrent",
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Linear Current")}),
    Diagram);
end linearCurrent;
