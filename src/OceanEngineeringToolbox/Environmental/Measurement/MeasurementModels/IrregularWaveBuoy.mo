within OceanEngineeringToolbox.Environmental.Measurement.MeasurementModels;

model IrregularWaveBuoy
  "Model representing a wave buoy to measure irregular waves"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Constants.pi;
  
      // Spectrum Parameters 
  parameter SI.Height zeta[n_omega]"Wave amplitude component" annotation(HideResult = true);

  // Frequency variables
  parameter SI.AngularFrequency omega[n_omega] "Frequency components selected for simulation" annotation(HideResult = true);
  constant Integer n_omega "Number of frequency components (default is 100 for irregular)" annotation(HideResult = true);
  
    // Random phase selection
  parameter SI.Angle phi[n_omega] "Wave components phase shift" annotation(HideResult = true);
  
  // Spectrum Variables
  parameter SI.WaveNumber k[n_omega] "Wave number component" annotation(HideResult = true);
  SI.Height SSE "Sea surface elevation";
  
  
  // Ramp  
  Real ramp "Ramping function" annotation(
    HideResult = true);
  SI.Time Trmp "Interval for ramping up of waves during start phase" annotation(HideResult = true);
  parameter Real theta(quantity="Angle", unit="deg") "Wave heading";

  
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
  SSE = ramp.*sum(zeta.*cos(omega*time - k*(x*cos(theta) + y*sin(theta)) + phi));

end IrregularWaveBuoy;
