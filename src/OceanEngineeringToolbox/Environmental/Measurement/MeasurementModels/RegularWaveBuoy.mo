within OceanEngineeringToolbox.Environmental.Measurement.MeasurementModels;

model RegularWaveBuoy
  "Model representing a wave buoy to measure regular waves"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Constants.pi;
  
    // Spectrum Parameters 
  parameter SI.Height A "Wave amplitude" annotation(HideResult = true);
  parameter SI.AngularFrequency omegaPeak "Peak spectral frequency" annotation(HideResult = true);
  
  // Spectrum Variables
  parameter SI.WaveNumber k "Wave number component" annotation(HideResult = true);
  SI.Height SSE "Sea surface elevation";
  
  // Ramp  
  Real ramp "Ramping function" annotation(
    HideResult = true);
  SI.Time Trmp "Interval for ramping up of waves during start phase" annotation(HideResult = true);
  parameter SI.Angle theta "Wave heading";
  
  // Coordinates
  parameter SI.Position x "x-coordinate of the buoy";
  parameter SI.Position y "y-coordinate of the buoy";

equation

  if time < Trmp then
    ramp = 0.5*(1 + cos(pi + (pi*time/Trmp)));
// Ramp up the excitation force during the initial phase
  else
    ramp = 1;
  end if; 
  SSE = ramp.*(A*cos(omegaPeak*time - k*(x*cos(theta) + y*sin(theta))));

end RegularWaveBuoy;
