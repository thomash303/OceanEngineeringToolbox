within OceanEngineeringToolbox.DataImport.ImportRecords.MultibodyImport;

partial class bodyData
  "Partial class importing the body data"
  import Modelica.Units.SI;
  import Modelica.Utilities.Streams.readRealMatrix;
  
  extends InputRecords.FilePath;
  extends InputRecords.BodyIndex;
protected
    parameter SI.Volume vol[1, 1] = readRealMatrix(fileDir, "hydro.bodies.vol" + bodyIndexString, 1, 1) "Body volume";
    parameter SI.Height cg[3, 1] = readRealMatrix(fileDir, "hydro.bodies.cg" + bodyIndexString, 3, 1) "Center of gravity"; 
    parameter SI.Height cb[3, 1] = readRealMatrix(fileDir, "hydro.bodies.cb" + bodyIndexString, 3, 1) "Center of buoyancy"; 
end bodyData;
