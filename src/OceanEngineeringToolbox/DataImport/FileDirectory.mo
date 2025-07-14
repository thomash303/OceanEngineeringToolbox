within OceanEngineeringToolbox.DataImport;

model FileDirectory
  "Model to define the file directory to the hydrodynamic data"
  extends DataImport.InputRecords.FilePath(filePath = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox", hydroCoeffFile = "/applications/Validation/RM3/RM3HydroCoeff.mat");
  annotation(
    defaultComponentName = "fileDirectory",
    defaultComponentPrefixes = "inner",
    missingInnerMessage = "No \"filepath\" component is defined. Drag the OET.Hydro.FilePath model into the top level of your model.");

end FileDirectory;
