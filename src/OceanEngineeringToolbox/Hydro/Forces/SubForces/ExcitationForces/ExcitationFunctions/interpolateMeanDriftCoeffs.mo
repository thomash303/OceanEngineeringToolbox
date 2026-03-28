within OceanEngineeringToolbox.Hydro.Forces.SubForces.ExcitationForces.ExcitationFunctions;

function interpolateMeanDriftCoeffs
 "Function to interpolate the excitation force coefficients using the simulation frequency steps. However, the current formulation using the vector interpolation function in the MSL is limited to LINEAR interpolation only. This is also unecessarily complex because only 1D interpolation is available."
 // Importing from the MSL
  import Modelica.Units.{SI,Conversions};
  import Modelica.Constants.pi;
  import Modelica.Math.wrapAngle;
  import Modelica.Math.Vectors.{interpolate,sort,find};
  // Inputs
  input SI.AngularFrequency w[nF] "Excitation force angular frequency vector (from BEM)";
  input Real F_excMd2D[bodyDoF, nF*nH] "Mean drift coefficients (2D)";
  input Integer nH "Number of wave headings";
  input Integer nF "Dimensions of the frequency vector (from BEM)";
  input SI.AngularFrequency omega[n_omega] "Frequency components selected for simulation";
  input Integer bodyDoF "Degrees-of-Freedom per body";
  input Integer n_omega "Number of frequency components";
  input Integer waveHeadingSpreadBins = 1 "Number of discrete headings centered around the mean heading to consider in the spectrum spread";
  input SI.Angle spreadBinCentres[waveHeadingSpreadBins] "Wave heading bin centres";
  input SI.Angle theta[nH] "Vector of wave headings present in the hydrodynamic coefficients";
  input SI.Angle angularThres = Conversions.from_deg(2) "Tolerance to directly use BEM hydrodynamic coefficients (default = +/-2 deg)";
  // Outputs
  output Real ExcCoeffMd[waveHeadingSpreadBins, bodyDoF, n_omega];
protected
  Real F_excMd3D[nH, bodyDoF, nF] "Mean drift coefficients (3D)";
  SI.Angle thetaSorted[nH] "Vector of wave headings present in the hydrodynamic coefficients";
  Integer sortIdx[nH] "Vector of indices for the sorted wave headings in the BEM coefficfients (-pi,pi] -> [0,2pi)";
  Integer exactIdx "Heading index in the BEM coefficients if the desired heading is within a specified tolerance";
  Integer lowerIdx = 1 "Lower heading index in the BEM coefficients if the desired heading is outside a specified tolerance";
  Integer upperIdx = 1 "Upper heading index in the BEM coefficients if the desired heading is outside a specified tolerance";
  Real lowerCoeffMd "Lower bound of the mean drift coefficients";
  Real upperCoeffMd "Upper bound of the mean drift coefficients";
algorithm
// Slice 2D arrays into 3D arrays
  for i in 1:nH loop
    for j in 1:bodyDoF loop
      F_excMd3D[i, j, :] := F_excMd2D[j, (i - 1)*nF + 1:i*nF];
    end for;
  end for;
// Sort vector of wave headings to [0,2pi)
  (thetaSorted, sortIdx) := sort(wrapAngle(theta, true), true);
  F_excMd3D := F_excMd3D[sortIdx, :, :];
// Body degree-of-freedom loop
  for i in 1:bodyDoF loop
// Wave heading loop
    for j in 1:waveHeadingSpreadBins loop
      exactIdx := find(spreadBinCentres[j], thetaSorted, angularThres);
// If desired heading can be found directly (or within a specified tolerance) in the BEM data
      if exactIdx > 0 then
        for k in 1:n_omega loop
          ExcCoeffMd[j, i, k] := interpolate(w, F_excMd3D[exactIdx, i, :], omega[k]);
        end for;
// If desired heading can be found directly in the BEM data
      else
        for h in 1:(nH - 1) loop
          if (thetaSorted[h] <= spreadBinCentres[j] and spreadBinCentres[j] <= thetaSorted[h + 1]) then
            lowerIdx := h;
            upperIdx := h + 1;
            break;
          end if;
        end for;
// Frequency loop
        for k in 1:n_omega loop
          lowerCoeffMd := interpolate(w, F_excMd3D[lowerIdx, i, :], omega[k]);
          upperCoeffMd := interpolate(w, F_excMd3D[upperIdx, i, :], omega[k]);
          ExcCoeffMd[j, i, k] := interpolate({thetaSorted[lowerIdx], thetaSorted[upperIdx]}, {lowerCoeffMd, upperCoeffMd}, spreadBinCentres[j]);
        end for;
      end if;
    end for;
  end for;
  
/*
  // Interpolate to simulation frequencies
  for i in 1:bodyDoF loop
    for j in 1:n_omega loop
      ExcCoeffMd[i,j] := interpolate(w, F_excMd3D[waveHeadingIndex,i,:], omega[j]);
      ExcCoeffMd[i,j] := interpolate(w, F_excMd3D[waveHeadingIndex,i,:], omega[j]);
    end for;
  end for;
  
  */
end interpolateMeanDriftCoeffs;
