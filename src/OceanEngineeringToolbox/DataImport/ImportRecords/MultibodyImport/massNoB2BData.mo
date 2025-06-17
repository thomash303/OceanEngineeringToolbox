within OceanEngineeringToolbox.DataImport.ImportRecords.MultibodyImport;

partial class massNoB2BData
  "Partial class importing the mass data (without B2B interactions)"
  import Modelica.Units.SI;
  import Modelica.Utilities.Streams.readRealMatrix;
  
  extends InputRecords.FilePath;
  extends InputRecords.BodyIndex;
  extends multibodyData;
  
  parameter SI.Mass M[1, 1] = readRealMatrix(fileDir, "hydro.bodies.m" + bodyIndexString, 1, 1) "Total mass of the body";
protected
  parameter SI.Mass Ainf[bodyDoF, bodyDoF] = readRealMatrix(fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + bodyIndexString, bodyDoF, bodyDoF) "Added mass at maximum (cut-off) frequency";
  parameter SI.Mass m[3, 3] = diagonal({M[1, 1], M[1, 1], M[1, 1]}) "Mass matrix of the body (including ballast)";
  parameter SI.Mass Ainf11[3, 3] = Ainf[1:3, 1:3] "Upper left block";
  parameter SI.Mass Ainf12[3, 3] = Ainf[1:3, 4:6] "Upper right block";
  parameter SI.Mass Ainf21[3, 3] = Ainf[4:6, 1:3] "Lower left block";
  parameter SI.Mass Ainf22[3, 3] = Ainf[4:6, 4:6] "Lower right block";
end massNoB2BData;
