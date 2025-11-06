within OceanEngineeringToolbox.Environmental.Wave.WaveModels;

partial model BaseWave
  "Partial model representing the base wave"

  // Importing from the MSL
  import Modelica.Units.SI; 
  import Modelica.Constants.pi;
  
  // Extending and inheriting from the OET
  extends DataImport.InputRecords.FilePath;
  extends DataImport.ImportRecords.EnvironmentalImport.physicalConstantData;
  
  // Calling an outer model at the top-level deployment
  outer Environmental.Environment environment;
  
  // Wave Parameters
  parameter SI.Height Hs(min=0) = 2 "Significant wave height" annotation(
    Dialog(group = "Wave Parameters"));
  parameter SI.Time Tp(min=0) = 8 "Peak wave period" annotation(
    Dialog(group = "Wave Parameters"));
  parameter SI.AngularFrequency omegaPeak = 2*pi/Tp "Peak angular frequency" annotation(Dialog(enable = false, tab = "Misc"));
  parameter Integer n_omega "Number of frequency components (default is 100 for irregular)" annotation(Dialog(enable = false, tab = "Misc"));
  
  // Multidirectional wave parameters
  parameter SI.Angle waveHeading = 0 "Wave heading ([0-360) or [0-2pi))" annotation(Dialog(group = "Multidirectional Wave Parameters"));
  
  // Ramp parameters  
  parameter SI.Time Trmp = environment.Trmp "Interval for ramping up of waves during start phase" annotation(Dialog(enable = false, tab = "Misc"));

  // Ramp variables
  Real ramp "Ramping function" annotation(
    HideResult = true);
  
equation
  // Ramp up the excitation force during the initial phase
  if time < Trmp then
    ramp = 0.5*(1 + cos(pi + (pi*time/Trmp)));
  else
    ramp = 1;
  end if; 
end BaseWave;
