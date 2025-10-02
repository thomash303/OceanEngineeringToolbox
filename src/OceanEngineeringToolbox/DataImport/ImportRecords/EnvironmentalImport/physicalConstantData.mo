within OceanEngineeringToolbox.DataImport.ImportRecords.EnvironmentalImport;

partial class physicalConstantData
  "Partial class importing the physical constant data"
  import Modelica.Units.SI;
  import Modelica.Utilities.Streams.readRealMatrix;  

  extends InputRecords.FilePath;
protected
  parameter SI.Density rho = scalar(readRealMatrix(file, "hydro.parameters.rho", 1, 1)) "Density of water" annotation(
    Dialog(group = "Environmental Parameters"));
  parameter SI.Position d = scalar(readRealMatrix(file, "hydro.parameters.depth", 1, 1)) "Water depth" annotation(
    Dialog(group = "Environmental Parameters"));
end physicalConstantData;
