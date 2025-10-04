within OceanEngineeringToolbox.Hydro.Forces.SubForces.ExcitationForces.ExcitationFunctions;

function computeExcitationForce
  "Function to compute the irregular excitation force"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  
  // Inputs
  input Real ExcCoeffRe[bodyDoF, n_omega] "Real component of excitation coefficient for frequency components";
  input Real ExcCoeffIm[bodyDoF, n_omega] "Imaginary component of excitation coefficient for frequency components";
  input SI.Height A = 0 "Wave amplitude";
  input SI.Height zeta[n_omega] = fill(0, n_omega) "Wave amplitude component";
  input SI.Angle phi[n_omega] = fill(0, n_omega) "Wave components phase shift";
  input SI.Angle omegaTime[n_omega] "Frequency components selected for simulation multiplied by the current time";
  input Real ramp "Ramping function";
  input Integer bodyDoF "Degrees-of-Freedom per body";
  input Integer n_omega "Number of frequency components";
  
  // Output
  output Real F[bodyDoF] "Combined force and torque vector";
algorithm

  // Regular or irregular
  if n_omega == 1 then
    F := (ramp.*(ExcCoeffRe[:,1].*A*cos(omegaTime[1])) - (ExcCoeffIm[:,1].*A*sin(omegaTime[1])).*ramp);
  else
    for i in 1:bodyDoF loop
      F[i] := ramp * sum(ExcCoeffRe[i,:] .* zeta .* cos(omegaTime + phi) - ExcCoeffIm[i,:] .* zeta .* sin(omegaTime + phi)) * ramp;
    end for;
  end if;

end computeExcitationForce;
