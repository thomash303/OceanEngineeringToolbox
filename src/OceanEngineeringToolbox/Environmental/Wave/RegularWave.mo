within OceanEngineeringToolbox.Environmental.Wave;

model RegularWave
  "Model representing a regular wave"

  // Importing from the MSL
  import Modelica.Units.SI; 
  import Modelica.Constants.{pi,g_n};
  
  // Extending and inheriting from the OET
  extends DataImport.InputRecords.FilePath;
  extends DataImport.ImportRecords.EnvironmentalImport.physicalConstantData;

  // Spectrum Parameters 
  constant Integer n_omega = 1 "Number of frequency components" annotation(
    Dialog(group = "Simulation Parameters"));
  parameter SI.Height Hs = 2.5 "Significant Wave Height" annotation(
    Dialog(group = "Wave Spectrum Parameters"));
  parameter SI.AngularFrequency omegaPeak = 0.9423 "Peak spectral frequency" annotation(
    Dialog(group = "Wave Spectrum Parameters"));
  parameter SI.Height A = Hs/2 "Wave amplitude";
  
  // Wave Heading Parameters
  parameter SI.Angle waveHeading = 0 "Wave heading";
  
  // Ramp  
  Real ramp "Ramping function" annotation(
    HideResult = true);
  SI.Time Trmp "Interval for ramping up of waves during start phase" annotation(
    HideResult = true);
    
  parameter SI.WaveNumber k = scalar(WaveFunctions.waveNumber(d, vector(omegaPeak), n_omega)) "Wave number component" annotation(HideResult = true);
  
  // Spectrum Variables
  SI.Position SSE "Sea surface elevation";
  parameter WaveUnits.powerPerUnitLength P = WaveFunctions.wavePower(rho = rho, d = d, k = vector(k), A = A, n_omega = n_omega) "Wave time-average power per unit wave crest length";

equation
  if time < Trmp then
    ramp = 0.5*(1 + cos(pi + (pi*time/Trmp)));
// Ramp up the excitation force during the initial phase
  else
    ramp = 1;
  end if; 
  
  SSE = WaveFunctions.waveElevation(A = A, omegaTime = vector(omegaPeak*time), k = vector(k), ramp = ramp, n_omega = n_omega);
  
  annotation(
    defaultComponentName = "regularWave",
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Regular Wave")}),
    Diagram);

end RegularWave;
