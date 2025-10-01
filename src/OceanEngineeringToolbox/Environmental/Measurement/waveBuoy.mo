within OceanEngineeringToolbox.Environmental.Measurement;

model waveBuoy
  "Model representing a wave buoy to exactly measure the incident wave elevation at the specified location"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  
  // Calling an outer model at the top-level deployment
  outer Environment environment;
  
  // Coordinates
  parameter SI.Position x = 0 "x-coordinate of the buoy" annotation(Dialog(group = "Coordinates"));
  parameter SI.Position y = 0 "y-coordinate of the buoy" annotation(Dialog(group = "Coordinates"));
  
  MeasurementModels.RegularWaveBuoy regularWaveBuoy(A = environment.regularWave.A, omegaPeak = environment.regularWave.omegaPeak, Trmp = environment.Trmp, k = environment.regularWave.k, theta = environment.waveHeading, x = x, y = y)  annotation(
    Placement(transformation(origin = {-12, 34}, extent = {{-10, -10}, {10, 10}})));

protected
  // Spectrum Parameters
  parameter String waveSelector = environment.waveSelector annotation(HideResult = true);

equation

end waveBuoy;
