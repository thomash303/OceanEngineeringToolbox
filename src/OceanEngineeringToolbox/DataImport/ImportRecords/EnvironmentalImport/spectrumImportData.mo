within OceanEngineeringToolbox.DataImport.ImportRecords.EnvironmentalImport;

partial class spectrumImportData
  "Partial class importing the wave spectrum import data"
  import Modelica.Units.SI;
  import Modelica.Utilities.Streams.{readMatrixSize, readRealMatrix};  

  extends InputRecords.FilePath;

  parameter Integer SDim[2] = readMatrixSize(file, "hydro.wave.spectrumImport.w") "Dimensions of the frequency vector";
  parameter Integer n_omega = SDim[2] "Number of frequency components";
  parameter Integer phiDim[2] = readMatrixSize(file, "hydro.wave.spectrumImport.phi") "Number of discrete headings centered around the mean heading to consider in the spectrum spread";
  parameter Integer waveHeadingSpreadBins = phiDim[2] "Number of discrete headings centered around the mean heading to consider in the spectrum spread";  
  parameter SI.AngularFrequency omega[n_omega] = vector(readRealMatrix(file, "hydro.wave.spectrumImport.w", 1, n_omega)) "Angular frequency vector";
  parameter Environmental.Wave.WaveUnits.spectrumEnergyDensity S[n_omega] = vector(readRealMatrix(file, "hydro.wave.spectrumImport.S", 1, n_omega)) "Spectral Density";
  parameter SI.Angle phi[waveHeadingSpreadBins, n_omega] = readRealMatrix(file, "hydro.wave.spectrumImport.phase", waveHeadingSpreadBins, n_omega) "Phase vector";
end spectrumImportData;
