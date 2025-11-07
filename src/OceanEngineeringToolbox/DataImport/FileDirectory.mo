within OceanEngineeringToolbox.DataImport;

model FileDirectory "Model to define the file directory to the hydrodynamic data"
  extends DataImport.InputRecords.FilePath;
  annotation(
    defaultComponentName = "fileDirectory",
    defaultComponentPrefixes = "inner",
    missingInnerMessage = "No \"filepath\" component is defined. Drag the OET.Hydro.FilePath model into the top level of your model.",
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-90, -45}, {90, 100}}), graphics = {Text(origin = {-2, -42}, textColor = {0, 0, 255}, extent = {{-150, 145}, {150, 105}}, textString = "%name"), Rectangle(lineColor = {153, 102, 0}, fillColor = {255, 204, 0}, fillPattern = FillPattern.Solid, lineThickness = 2, extent = {{-80, -40}, {80, 40}}, radius = 5), Rectangle(lineColor = {153, 102, 0}, fillColor = {255, 230, 128}, fillPattern = FillPattern.Solid, lineThickness = 2, extent = {{-80, 20}, {-40, 60}}, radius = 3), Line(points = {{-70, 10}, {70, 10}}, color = {200, 200, 200}, thickness = 1), Line(points = {{-70, 0}, {70, 0}}, color = {200, 200, 200}, thickness = 1), Line(points = {{-70, -10}, {70, -10}}, color = {200, 200, 200}, thickness = 1)}));
end FileDirectory;
