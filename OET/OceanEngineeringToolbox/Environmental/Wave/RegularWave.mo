within OceanEngineeringToolbox.Environmental.Wave;

model RegularWave
  "Model representing a regular wave"

  // Importing from the MSL
  import Modelica.Units.SI; 
  import Modelica.Constants.pi;

  // Spectrum Parameters 
  constant Integer n_omega = 1 "Number of frequency components (default is 100 for irregular)" annotation(
    Dialog(group = "Simulation Parameters"));
  parameter SI.Height Hs = 2.5 "Significant Wave Height" annotation(
    Dialog(group = "Wave Spectrum Parameters"));
  parameter SI.AngularFrequency omegaPeak = 0.9423 "Peak spectral frequency" annotation(
    Dialog(group = "Wave Spectrum Parameters"));
  parameter SI.Height A = Hs/2 "Wave amplitude";
  SI.Height SSE "Sea surface elevation";
  
  // Ramp  
  Real ramp "Ramping function" annotation(
    HideResult = true);
  SI.Time Trmp "Interval for ramping up of waves during start phase [s]" annotation(
    HideResult = true);

equation
  if time < Trmp then
    ramp = 0.5*(1 + cos(pi + (pi*time/Trmp)));
// Ramp up the excitation force during the initial phase
  else
    ramp = 1;
  end if; 
  SSE = ramp.*(A*cos(omegaPeak*time));
  annotation(
    defaultComponentName = "regularWave",
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Regular Wave")}),
    Diagram);

end RegularWave;
