within OceanEngineeringToolbox.Hydro.Forces.SubForces.RadiationForces;

model RadiationB2BCoupler "Model to couple bodies for B2B radiation simulations"
  // Importing from the MSL
  import Modelica.Units.SI;
  // Extending and inheriting from the OET
  extends DataImport.InputRecords.FilePath;
  extends DataImport.ImportRecords.MultibodyImport.multibodyData;
  outer DataImport.FileDirectory fileDirectory;
  SI.Velocity vCoupled[nDoF] "Vector containing velocities of all hydrodynamic bodies";
  SI.Acceleration aCoupled[nDoF] "Vector containing accelerations of all hydrodynamic bodies";
annotation(
    defaultComponentName = "radiationB2BCoupler",
    defaultComponentPrefixes = "inner",
    missingInnerMessage = "No \"radiationB2BCoupler\" component is defined. Drag the RadiationB2BCoupler model into the top level of your model.",
    Icon(
        coordinateSystem(
            preserveAspectRatio = true,
            extent = {{-100, -100}, {100, 100}}
        ),
        graphics = {
            // Model name text
            Text(
                origin = {-8, -42},
                textColor = {0, 0, 255},
                extent = {{-150, 145}, {150, 105}},
                textString = "%name"
            ),
            // Concentric circles as thick blue lines
            Ellipse(lineColor = {0, 102, 204}, lineThickness = 4, extent = {{-60, -60}, {60, 60}}),
            Ellipse(lineColor = {0, 102, 204}, lineThickness = 4, extent = {{-50, -50}, {50, 50}}),
            Ellipse(lineColor = {0, 102, 204}, lineThickness = 4, extent = {{-40, -40}, {40, 40}}),
            Ellipse(lineColor = {0, 102, 204}, lineThickness = 4, extent = {{-30, -30}, {30, 30}}),
            Ellipse(lineColor = {0, 102, 204}, lineThickness = 4, extent = {{-20, -20}, {20, 20}}),
            // Outward arrow with proper arrowhead
            Line(
                points = {{0, 0}, {70, 50}},
                color = {255, 0, 0},
                thickness = 3,
                arrow = {Arrow.None, Arrow.Filled},
                arrowSize = 5
            )
        }
    )
);

end RadiationB2BCoupler;
