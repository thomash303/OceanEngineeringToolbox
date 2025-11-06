within OceanEngineeringToolbox.Hydro.Forces.SubForces.ExcitationForces.ExcitationFunctions;

function computeExcitationForce
  "Function to compute the irregular excitation force"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  
  // Inputs
  input Real ExcCoeffRe[waveHeadingSpreadBins, bodyDoF, n_omega] "Real component of excitation coefficient for frequency components";
  input Real ExcCoeffIm[waveHeadingSpreadBins, bodyDoF, n_omega] "Imaginary component of excitation coefficient for frequency components";
  input SI.Height A = 0 "Wave amplitude";
  input SI.Height zeta[waveHeadingSpreadBins, n_omega] = fill(0, waveHeadingSpreadBins, n_omega) "Wave amplitude component";
  input SI.Angle phi[waveHeadingSpreadBins, n_omega] = fill(0, waveHeadingSpreadBins, n_omega) "Wave components phase shift";
  input SI.Angle omegaTime[n_omega] "Frequency components selected for simulation multiplied by the current time";
  input Real ramp "Ramping function";
  input Integer bodyDoF "Degrees-of-Freedom per body";
  input Integer n_omega "Number of frequency components";
  input Integer waveHeadingSpreadBins "Number of discrete headings centered around the mean heading to consider in the spectrum spread";
  
  // Output
  output Real F[bodyDoF] "Combined force and torque vector";
algorithm

  // Regular or irregular
  if false then
    F := (ramp.*(ExcCoeffRe[waveHeadingSpreadBins,:,n_omega] .*A*cos(omegaTime[n_omega])) - (ExcCoeffIm[waveHeadingSpreadBins,:,n_omega] .*A*sin(omegaTime[n_omega])).*ramp);
  else

    for i in 1:bodyDoF loop
      F[i] := 0;
      for j in 1:waveHeadingSpreadBins loop
        F[i] := F[i] + ramp * sum(ExcCoeffRe[j,i,:] .* zeta[j,:] .* cos(omegaTime + phi[j,:]) - ExcCoeffIm[j,i,:] .* zeta[j,:] .* sin(omegaTime + phi[j,:])).*ramp;
      end for;
    end for;
    
    
  end if;

end computeExcitationForce;
