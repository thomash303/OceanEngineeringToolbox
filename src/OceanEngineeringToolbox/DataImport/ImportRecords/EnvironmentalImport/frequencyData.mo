within OceanEngineeringToolbox.DataImport.ImportRecords.EnvironmentalImport;

partial class frequencyData
  "partial class importing the frequency data"
  import Modelica.Units.SI; 
  import Modelica.Utilities.Streams.{readMatrixSize, readRealMatrix};
  
  extends InputRecords.FilePath;
protected
  parameter Integer nF[2] = readMatrixSize(file, "hydro.parameters.w") "Dimensions of the frequency vector";
  parameter SI.AngularFrequency w[nF[1]] = vector(readRealMatrix(file, "hydro.parameters.w", nF[1], 1)) "Excitation force angular frequency vector";
end frequencyData;
