within OceanEngineeringToolbox.Hydro.Forces.SubForces.RadiationForces;

model RadiationB2BCoupler
  "Model to couple bodies for B2B radiation simulations"
  
  // Importing from the MSL
  import Modelica.Units.SI;

  // Extending and inheriting from the OET
  extends DataImport.InputRecords.FilePath;
  extends DataImport.ImportRecords.MultibodyImport.multibodyData;
  
  outer DataImport.FileDirectory fileDirectory;
  
  SI.Velocity vCoupled[nDoF] "Vector containing velocities of all hydrodynamic bodies";
  SI.Acceleration aCoupled[nDoF] "Vector containing accelerations of all hydrodynamic bodies";
  
  annotation(
    defaultComponentName = "radiationB2BCoupler",
    defaultComponentPrefixes = "inner",
    missingInnerMessage = "No \"radiationB2BCoupler\" component is defined. Drag the RadiationB2BCoupler model into the top level of your model.");

end RadiationB2BCoupler;
