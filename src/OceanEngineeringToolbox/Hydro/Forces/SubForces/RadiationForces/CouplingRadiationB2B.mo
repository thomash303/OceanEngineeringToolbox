within OceanEngineeringToolbox.Hydro.Forces.SubForces.RadiationForces;

model CouplingRadiationB2B

  // Importing from the MSL
  import Modelica.Units.SI;

  // Extending and inheriting from the OET
  extends DataImport.InputRecords.FilePath(filePath = fileDirectory.filePath, hydroCoeffFile = fileDirectory.hydroCoeffFile);
  extends DataImport.ImportRecords.MultibodyImport.multibodyData(filePath = fileDirectory.filePath, hydroCoeffFile = fileDirectory.hydroCoeffFile);
  
  outer DataImport.FileDirectory fileDirectory;
  
  SI.Velocity vCoupled[nDoF] "Vector containing velocities of all hydrodynamic bodies";
/*  SI.Acceleration aCouopled[nDoF] "Vector containing translational accelerations of all hydrodynamic bodies";
  SI.AngularAcceleration alphaCoupled[nDoF] "Vector containing angular accelerations of all hydrodynamic bodies";*/
  
  /*
  redeclare parameter String filePath = fileDirectory.filePath;
  redeclare parameter String hydroCoeffFile = fileDirectory.hydroCoeffFile; */
  annotation(
    defaultComponentName = "couplingRadiationB2B",
    defaultComponentPrefixes = "inner",
    missingInnerMessage = "No \"couplingRadiationB2B\" component is defined. Drag the OET.Hydro.CoupledB2B model into the top level of your model.");

end CouplingRadiationB2B;
