within OceanEngineeringToolbox.Environmental.Wave.WaveRecords;

record SimulationParameters
  "Record containing the simulation parameters"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  
  parameter SI.Time Trmp = 100 "Interval for ramping up of waves during start phase" annotation(
    Dialog(group = "Simulation Parameters"));

end SimulationParameters;
