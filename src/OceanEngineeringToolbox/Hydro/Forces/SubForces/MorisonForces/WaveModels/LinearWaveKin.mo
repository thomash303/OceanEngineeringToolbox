within OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.WaveModels;

model LinearWaveKin
  "Partial model representing the base wave kinematics model"
  
  // Extending from the OET
  extends BaseWaveKin;
  extends DataImport.ImportRecords.EnvironmentalImport.physicalConstantData;
  
  // Importing from the MSL
  import Modelica.Constants.pi;
  
equation

  // Deepwater when tanh(kd) = 1. tanh(kd) > 0.99, when kd = pi.
  for i in 1:n_omega loop
  
    // Deepwater approximation
    if k[i]*d > pi then
      vHorz[i,:] = omega[i] * zeta[i] * exp(k * d);
      vVert[i,:] = vHorz[i,:];

    // Shallow and intermediate
    else
      vHorz[i,:] = omega[i] * zeta[i] * cosh(k[i] * (d .+ positionME[3,:])) ./ sinh(k * d);
      vVert[i,:] = omega[i] * zeta[i] * sinh(k[i] * (d .+ positionME[3,:])) ./ sinh(k * d);
    end if;
    
  end for;
  

end LinearWaveKin;
