within OceanEngineeringToolbox.DataImport.ImportRecords.EnvironmentalImport;

partial class spectrumImportData
  "Partial class importing the wave spectrum import data"
  import Modelica.Units.SI;
  import Modelica.Utilities.Streams.{readMatrixSize, readRealMatrix};  

  extends InputRecords.FilePath;

  parameter Integer SDim[2] = readMatrixSize(fileDir, "hydro.wave.spectrumImport.w") "Dimensions of the frequency vector";
  parameter Integer n_omega = SDim[2];
  parameter SI.AngularFrequency omega[n_omega] = vector(readRealMatrix(fileDir, "hydro.wave.spectrumImport.w", 1, n_omega)) "Angular frequency vector";
  parameter Environmental.Wave.WaveUnits.spectrumEnergyDensity S[n_omega] = vector(readRealMatrix(fileDir, "hydro.wave.spectrumImport.S", 1, n_omega)) "Spectral Density";
  parameter SI.Angle phi[n_omega] = vector(readRealMatrix(fileDir, "hydro.wave.spectrumImport.phase", 1, n_omega)) "Phase vector";
end spectrumImportData;
