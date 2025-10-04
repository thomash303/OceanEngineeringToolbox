within OceanEngineeringToolbox.Hydro.Forces.SubForces.ExcitationForces.ExcitationFunctions;

function interpolateExcitationCoeffs
 "Function to interpolate the excitation force coefficients using the simulation frequency steps"
 
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Math.Vectors.interpolate;
 
  // Inputs
  input SI.AngularFrequency w[nF] "Excitation force angular frequency vector (from BEM)";
  input Real F_excRe2D[bodyDoF, nF*nH] "Real part of excitation force coefficients (2D)"; 
  input Real F_excIm2D[bodyDoF, nF*nH] "Imaginary part of excitation force coefficients (2D)";
  input Integer waveHeadingIndex "Index in the excitation coefficients for the desired wave heading";
  input Integer nH "Number of wave headings";
  input Integer nF "Dimensions of the frequency vector (from BEM)";            
  input SI.AngularFrequency omega[n_omega] "Frequency components selected for simulation";  
  input Integer bodyDoF "Degrees-of-Freedom per body";
  input Integer n_omega "Number of frequency components";
  
  // Outputs    
  output Real ExcCoeffRe[bodyDoF, n_omega];
  output Real ExcCoeffIm[bodyDoF, n_omega];
protected
  Real F_excRe3D[nH, bodyDoF, nF] "Real part of excitation force coefficients (3D)";
  Real F_excIm3D[nH, bodyDoF, nF] "Imaginary part of excitation force coefficients (3D)";
algorithm
  // Slice 2D arrays into 3D arrays
 for h in 1:nH loop
    for i in 1:bodyDoF loop
      F_excRe3D[h,i,:] := F_excRe2D[i, (h-1)*nF + 1 : h*nF];
      F_excIm3D[h,i,:] := F_excIm2D[i, (h-1)*nF + 1 : h*nF];
    end for;
  end for; 
  
  // Interpolate to simulation frequencies
  for i in 1:bodyDoF loop
    for j in 1:n_omega loop
      ExcCoeffRe[i,j] := interpolate(w, F_excRe3D[waveHeadingIndex,i,:], omega[j]);
      ExcCoeffIm[i,j] := interpolate(w, F_excIm3D[waveHeadingIndex,i,:], omega[j]);
    end for;
  end for;
end interpolateExcitationCoeffs;
