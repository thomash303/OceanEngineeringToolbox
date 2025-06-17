within OceanEngineeringToolbox.DataImport.ImportRecords.MultibodyImport;

partial class multibodyData
  "Partial class importing the multibody data"
  import Modelica.Utilities.Streams.readRealMatrix;
  extends InputRecords.FilePath;
protected
  parameter Real nbodies_read = scalar(readRealMatrix(fileDir, "hydro.bodies.Nb", 1, 1)) "Number of bodies";
  parameter Integer nbodies = integer(nbodies_read) "Number of bodies";
  parameter Integer bodyDoF = 6 "Degrees-of-Freedom per body";
  // assuming all bodies are 6 DoF
  parameter Integer nDoF = nbodies*bodyDoF "Total Degrees-of-Freedom";
end multibodyData;
