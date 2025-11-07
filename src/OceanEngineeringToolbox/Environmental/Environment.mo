within OceanEngineeringToolbox.Environmental;

model Environment "Model representing the environmental conditions"
  outer DataImport.FileDirectory fileDirectory;
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Constants.pi;
  import OceanEngineeringToolbox.Environmental.Wave.WaveModels.*;
  import OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.EqualEnergyDiscritization.*;
  import OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.RandomDiscritization.*;
  import OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.*;
  // Wave parameters
  replaceable RegularWave wave(file = fileDirectory.file) constrainedby BaseWave "Wave type" annotation(
     Dialog(group = "Wave Parameters"),
     choices(choice(redeclare NoWave wave(file = fileDirectory.file) "No wave"), choice(redeclare RegularWave wave(file = fileDirectory.file) "Regular wave"), choice(redeclare IrregularWave wave(file = fileDirectory.file) "Irregular wave"), choice(redeclare SpectrumImportWave wave(file = fileDirectory.file) "Spectrum import wave")));
  // Current parameters
  parameter SI.Velocity Uc0 = 1 "Current velocity at the mean water level" annotation(
    Dialog(group = "Current Parameters (for Morison only)"));
  parameter SI.Angle currentHeading = 0 "Current heading" annotation(
    Dialog(group = "Current Parameters (for Morison only)"));
  parameter SI.Height currentDepth = 100 "Current depth" annotation(
    Dialog(group = "Current Parameters (for Morison only)"));
  parameter Real alphaCur = 0.14 "Current power-law exponent" annotation(
    Dialog(group = "Current Parameters (for Morison only)"));
  // Simulation parameters
  parameter SI.Time Trmp = 100 "Interval for ramping up of waves during start phase" annotation(
    Dialog(group = "Simulation Parameters"));
  annotation(
    defaultComponentName = "environment",
    defaultComponentPrefixes = "inner",
    missingInnerMessage = "No \"environment\" component is defined. Drag the OET.Wave.Environment model into the top level of your model.",
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 60}}), graphics = {Text(origin = {-6, -82},textColor = {0, 0, 255}, extent = {{-150, 145}, {150, 105}}, textString = "%name"), Polygon(lineColor = {0, 0, 175}, fillColor = {0, 0, 175}, fillPattern = FillPattern.Solid, lineThickness = 2, points = {{-100, -20}, {-97.5, -16.8}, {-95, -13.7}, {-92.5, -10.6}, {-90, -7.4}, {-87.5, -4.3}, {-85, -1.1}, {-82.5, 2}, {-80, 5}, {-77.5, 7.7}, {-75, 10.1}, {-72.5, 12}, {-70, 13.5}, {-67.5, 14.4}, {-65, 14.8}, {-62.5, 14.5}, {-60, 13.6}, {-57.5, 12}, {-55, 9.8}, {-52.5, 7}, {-50, 3.8}, {-47.5, 0.3}, {-45, -3.3}, {-42.5, -6.8}, {-40, -10}, {-37.5, -12.8}, {-35, -15.1}, {-32.5, -16.9}, {-30, -18.1}, {-27.5, -18.7}, {-25, -18.8}, {-22.5, -18.2}, {-20, -17}, {-17.5, -15.2}, {-15, -12.9}, {-12.5, -10.1}, {-10, -6.9}, {-8, -4}, {-6, -2}, {-4, -0.5}, {-2.5, 1.2}, {0, 2.5}, {2.5, 1.2}, {4, -0.5}, {6, -2}, {8, -4}, {10, -6.9}, {12.5, -10.1}, {15, -12.9}, {17.5, -15.2}, {20, -17}, {22.5, -18.2}, {25, -18.8}, {27.5, -18.7}, {30, -18.1}, {32.5, -16.9}, {35, -15.1}, {37.5, -12.8}, {40, -10}, {42.5, -6.8}, {45, -3.3}, {47.5, 0.3}, {50, 3.8}, {52.5, 7}, {55, 9.8}, {57.5, 12}, {60, 13.6}, {62.5, 14.5}, {65, 14.8}, {67.5, 14.4}, {70, 13.5}, {72.5, 12}, {75, 10.1}, {77.5, 7.7}, {80, 5}, {82.5, 2}, {85, -1.1}, {87.5, -4.3}, {90, -7.4}, {92.5, -10.6}, {95, -13.7}, {97.5, -16.8}, {100, -20}, {100, -100}, {-100, -100}, {-100, -20}}), Line(points = {{-100, -20}, {-97.5, -16.8}, {-95, -13.7}, {-92.5, -10.6}, {-90, -7.4}, {-87.5, -4.3}, {-85, -1.1}, {-82.5, 2}, {-80, 5}, {-77.5, 7.7}, {-75, 10.1}, {-72.5, 12}, {-70, 13.5}, {-67.5, 14.4}, {-65, 14.8}, {-62.5, 14.5}, {-60, 13.6}, {-57.5, 12}, {-55, 9.8}, {-52.5, 7}, {-50, 3.8}, {-47.5, 0.3}, {-45, -3.3}, {-42.5, -6.8}, {-40, -10}, {-37.5, -12.8}, {-35, -15.1}, {-32.5, -16.9}, {-30, -18.1}, {-27.5, -18.7}, {-25, -18.8}, {-22.5, -18.2}, {-20, -17}, {-17.5, -15.2}, {-15, -12.9}, {-12.5, -10.1}, {-10, -6.9}, {-8, -4}, {-6, -2}, {-4, -0.5}, {-2.5, 1.2}, {0, 2.5}, {2.5, 1.2}, {4, -0.5}, {6, -2}, {8, -4}, {10, -6.9}, {12.5, -10.1}, {15, -12.9}, {17.5, -15.2}, {20, -17}, {22.5, -18.2}, {25, -18.8}, {27.5, -18.7}, {30, -18.1}, {32.5, -16.9}, {35, -15.1}, {37.5, -12.8}, {40, -10}, {42.5, -6.8}, {45, -3.3}, {47.5, 0.3}, {50, 3.8}, {52.5, 7}, {55, 9.8}, {57.5, 12}, {60, 13.6}, {62.5, 14.5}, {65, 14.8}, {67.5, 14.4}, {70, 13.5}, {72.5, 12}, {75, 10.1}, {77.5, 7.7}, {80, 5}, {82.5, 2}, {85, -1.1}, {87.5, -4.3}, {90, -7.4}, {92.5, -10.6}, {95, -13.7}, {97.5, -16.8}, {100, -20}}, color = {0, 0, 255}, smooth = Smooth.Bezier), Line(
  origin = {0.337079, -26.9663},points = {{-85, -22}, {-67.5, -20}, {-50, -22}, {-32.5, -20}},
  color = {255, 255, 255},
  thickness = 2,
  smooth = Smooth.Bezier
),
Line(
  origin = {0, -6.06742},points = {{-85, -30}, {-67.5, -28}, {-50, -30}, {-32.5, -28}},
  color = {255, 255, 255},
  thickness = 2,
  smooth = Smooth.Bezier
),
Line(
  origin = {-0.337079, -4.7191},points = {{-85, -38}, {-67.5, -36}, {-50, -38}, {-32.5, -36}},
  color = {255, 255, 255},
  thickness = 2,
  smooth = Smooth.Bezier
), Rectangle(lineColor = {194, 178, 128}, fillColor = {194, 178, 128}, fillPattern = FillPattern.Solid, lineThickness = 1.5, extent = {{-100, -100}, {100, -85}})}),
    Diagram(coordinateSystem(extent = {{-20, 80}, {20, -80}})));
end Environment;
