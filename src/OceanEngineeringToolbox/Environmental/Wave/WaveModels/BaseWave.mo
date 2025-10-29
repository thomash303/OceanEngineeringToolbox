within OceanEngineeringToolbox.Environmental.Wave.WaveModels;

partial model BaseWave
  "Partial model representing the base wave"

  // Importing from the MSL
  import Modelica.Units.SI; 
  import Modelica.Constants.pi;
  
  // Extending and inheriting from the OET
  extends DataImport.InputRecords.FilePath(redeclare parameter String file);
  extends DataImport.ImportRecords.EnvironmentalImport.physicalConstantData;
  extends WaveRecords.WaveParameters;
  extends WaveRecords.MultidirectionalParameters;
  extends WaveRecords.WaveSpectrumParameters;
  extends WaveRecords.RandomPhaseParameters;
  extends WaveRecords.SimulationParameters(redeclare parameter SI.Time Trmp);
  
  // Wave Parameters
  parameter SI.AngularFrequency omegaPeak = 2*pi/Tp "Peak angular frequency" annotation(Dialog(enable = false, tab = "Misc"));
  // Wave Parameters
  parameter Integer n_omega "Number of frequency components (default is 100 for irregular)";
    
  // Multidirectional wave Parameters
  parameter SI.Angle waveHeading = 0 "Wave heading" annotation(Dialog(group = "Multidirectional Wave Parameters"));
  // Ramp
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
