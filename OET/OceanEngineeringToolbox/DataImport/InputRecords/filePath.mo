within OceanEngineeringToolbox.DataImport.InputRecords;

partial class FilePath
  "Partial class containing the user input file path to the hydrodynamic data"
  parameter String filePath "File path" annotation(
    Dialog(group = "Body Data"));
  parameter String hydroCoeffFile "Hydro coefficient file name" annotation(
    Dialog(group = "Body Data"));
protected
  parameter String fileDir = filePath + hydroCoeffFile "Full file directory";
  annotation(
    defaultComponentName = "fileDirectory",
    defaultComponentPrefixes = "inner",
    missingInnerMessage = "No \"filepath\" component is defined. Drag the OET.Hydro.FilePath model into the top level of your model.");
end FilePath;
