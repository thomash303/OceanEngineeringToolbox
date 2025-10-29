within OceanEngineeringToolbox.Environmental.Current.CurrentRecords;

record CurrentParameters

  // Importing from the MSL
  import Modelica.Units.SI;

  // Current parameters
  parameter SI.Velocity Uc0 = 1 "Current velocity at the mean water level" annotation(Dialog(group = "Current Parameters (for Morison only)"));
  parameter SI.Angle currentHeading = 0 "Current heading" annotation(Dialog(group = "Current Parameters (for Morison only)"));
  
end CurrentParameters;
