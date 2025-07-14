within OceanEngineeringToolbox.DataImport.ImportRecords.EnvironmentalImport;

partial class frequencyData
  "partial class importing the frequency data"
  import Modelica.Units.SI; 
  import Modelica.Utilities.Streams.{readMatrixSize, readRealMatrix};
  
  extends InputRecords.FilePath;
protected
  parameter Integer wDim[2] = readMatrixSize(fileDir, "hydro.parameters.w") "Dimensions of the frequency vector";
  parameter SI.AngularFrequency w[wDim[1]] = vector(readRealMatrix(fileDir, "hydro.parameters.w", wDim[1], 1)) "Excitation force angular frequency vector";
end frequencyData;
