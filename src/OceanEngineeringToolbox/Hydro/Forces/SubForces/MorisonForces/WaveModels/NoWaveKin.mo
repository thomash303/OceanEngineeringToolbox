within OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.WaveModels;

model NoWaveKin

  // Extending from the OET
  extends BaseWaveKin;
  
  
equation

    vHorz = zeros(waveHeadingSpreadBins, n_omega, nME);
    vVert = vHorz;

end NoWaveKin;
