within OceanEngineeringToolbox.Environmental.Wave.WaveRecords;

record RandomFrequencyParameters
  "Record containing the random frequency parameters"
  
  // Random frequency selection
  parameter Integer localSeedFrequency = 614657 "Local random seed for frequency selection" annotation(Dialog(enable = false, tab = "Misc"));
  parameter Integer globalSeedFrequency = 30020 "Global random seed for frequency selection" annotation(Dialog(enable = false, tab = "Misc"));
  
end RandomFrequencyParameters;
