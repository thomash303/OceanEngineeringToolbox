within OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.EnvironmentKinematics.KinematicModels;

model constantCurrent
  "Model for constant current profiles"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  
  parameter SI.Velocity currentSpeedMWL "Current speed at the mean water level";
  parameter SI.Velocity currentSpeed = currentSpeedMWL "Current speed at desired depth";

  annotation(defaultComponentName = "ConstantCurrent",
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Constant Current")}),
    Diagram);
end constantCurrent;
