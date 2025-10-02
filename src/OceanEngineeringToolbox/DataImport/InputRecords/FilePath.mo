within OceanEngineeringToolbox.DataImport.InputRecords;

partial class FilePath
  "Partial class containing the user input file path to the hydrodynamic data"
  
  // Importing from the MSL
  import Modelica.Utilities.Files.loadResource;
  
  parameter String file = loadResource("C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/applications/Validation/RM3/RM3HydroCoeff.mat") "File containing the hydrodynamic coefficient data" annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Select the file containing the hydrodynamic coefficient data")));
  
  annotation(
    defaultComponentName = "fileDirectory",
    defaultComponentPrefixes = "inner",
    missingInnerMessage = "No \"filepath\" component is defined. Drag the OET.Hydro.FilePath model into the top level of your model.");
end FilePath;
