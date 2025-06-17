within OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.EnvironmentKinematics.KinematicModels;

model powerLawCurrent
  "Model for power law current profiles"
  
  // Importing from the MSL
  import Modelica.Units.SI;

  parameter SI.Velocity currentSpeedMWL "Current speed at the mean water level";
  SI.Velocity currentSpeed "Current speed at desired depth";
  parameter SI.Height currentDepth "Depth with zero current";
  parameter Integer powerLawExp "Power law exponent";

equation

  annotation(defaultComponentName = "PowerLawCurrent",
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Power Law Current")}),
    Diagram);
end powerLawCurrent;
