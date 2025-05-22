within OceanEngineeringToolbox.DataImport.ImportRecords.HydroImport;

partial class hydrostaticData
  "Partial class importing the hydrostatic force data"
  import Modelica.Units.SI;
  import Modelica.Utilities.Streams.readRealMatrix;  

  extends InputRecords.FilePath;
  extends InputRecords.BodyIndex;
  extends MultibodyImport.multibodyData;
protected
  parameter SI.TranslationalSpringConstant Khs[bodyDoF, bodyDoF] = readRealMatrix(fileDir, "hydro.coefficients.hydrostatic.Khs" + bodyIndexString, bodyDoF, bodyDoF) "Hydrostatic stiffness";
end hydrostaticData;
