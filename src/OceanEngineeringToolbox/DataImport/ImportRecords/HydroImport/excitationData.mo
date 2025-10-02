within OceanEngineeringToolbox.DataImport.ImportRecords.HydroImport;

partial class excitationData
"Partial class importing the excitation force data"
  import Modelica.Utilities.Streams.readRealMatrix;
  import Modelica.Units.SI;
  
  extends InputRecords.FilePath;
  extends InputRecords.BodyIndex;
  extends MultibodyImport.multibodyData;
  extends EnvironmentalImport.frequencyData;

protected
    parameter Real nH_read = scalar(readRealMatrix(file, "hydro.parameters.Nh", 1, 1)) "Number of headings";
  parameter Integer nH = integer(nH_read) "Number of headings";
  parameter Real theta[nH](each quantity="Angle", each unit="deg") = vector(readRealMatrix(file, "hydro.parameters.theta", 1, nH)) "Vector of wave headings present in the hydrodynamic coefficients"; 

  parameter Real F_excRe2D[bodyDoF, nF[1]*nH] = readRealMatrix(file, "hydro.coefficients.excitation.spectralDecomp.re" + bodyIndexString, bodyDoF, nF[1]*nH) "Real part of excitation force coefficients (2D)";
  parameter Real F_excIm2D[bodyDoF, nF[1]*nH] = readRealMatrix(file, "hydro.coefficients.excitation.spectralDecomp.im" + bodyIndexString, bodyDoF, nF[1]*nH) "Imaginary part of excitation force coefficients (2D)";  
  
  parameter Real F_excRe[nH, bodyDoF, nF[1]] = 
  {F_excRe2D[:, (i - 1)*nF[1] + 1:i*nF[1]] for i in 1:nH} "Real part of excitation force coefficients (3D)";
 parameter Real F_excIm[nH, bodyDoF, nF[1]] = 
  {F_excIm2D[:, (i - 1)*nF[1] + 1:i*nF[1]] for i in 1:nH}  "Imaginary part of excitation force coefficients (3D)";
end excitationData;
