within OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.EnvironmentKinematics.KinematicModels;

model customCurrent
  "Model for custom current profiles"
  
  parameter Real currentSpeed = 0;
equation

  annotation(defaultComponentName = "CustomCurrent",
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Custom Current")}),
    Diagram);
end customCurrent;
