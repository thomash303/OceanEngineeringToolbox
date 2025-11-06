within OceanEngineeringToolbox.Environmental.Wave.WaveRecords;

record RandomPhaseParameters
  "Record containing the random phase parameters"

  // Importing from the MSL
  import Modelica.Units.SI;
  
  // Extending from the OET
  extends WaveParameters;
  
  // Random phase selection
  parameter Integer localSeedPhase = 614757 "Local random seed for phase shifts" annotation(
    Dialog(group = "Random Phase Parameters", enable = waveSelector <> "None"));
  parameter Integer globalSeedPhase = 40020 "Global random seed for phase shifts" annotation(
    Dialog(group = "Random Phase Parameters", enable = waveSelector <> "None"));
  
  
end RandomPhaseParameters;
