within OceanEngineeringToolbox.DataImport.ImportRecords.MultibodyImport;

partial class massB2BData
  "Partial class importing the mass data (with B2B interactions)"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Utilities.Streams.readRealMatrix;
  
  // Inheriting from the OET
  extends InputRecords.FilePath;
  extends InputRecords.BodyIndex;
  extends multibodyData;
  
protected
  parameter SI.Mass AinfEx[bodyDoF, nDoF-bodyDoF] = readRealMatrix(file, "hydro.coefficients.radiation.stateSpace.B2B.AinfEx" + bodyIndexString, bodyDoF, nDoF-bodyDoF) "Added mass at maximum (cut-off) frequency for the B2B case";

end massB2BData;
