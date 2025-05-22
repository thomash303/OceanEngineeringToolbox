within OceanEngineeringToolbox.DataImport.ImportRecords.HydroImport;

partial class excitationData
  "Partial class importing the excitation force data"
  import Modelica.Utilities.Streams.readRealMatrix;
  
  extends InputRecords.FilePath;
  extends InputRecords.BodyIndex;
  extends MultibodyImport.multibodyData;
  extends EnvironmentalImport.frequencyData;
protected
  parameter Real F_excRe[bodyDoF, wDim[1]] = readRealMatrix(fileDir, "hydro.coefficients.excitation.spectralDecomp.re" + bodyIndexString, bodyDoF, wDim[1]) "Real part of excitation force coefficients";
  parameter Real F_excIm[bodyDoF, wDim[1]] = readRealMatrix(fileDir, "hydro.coefficients.excitation.spectralDecomp.im" + bodyIndexString, bodyDoF, wDim[1]) "Imaginary part of excitation force coefficients";  
end excitationData;
