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
    for j in 1:waveHeadingSpreadBins loop
  
      // Deepwater approximation
      if k[i]*d > pi then
        vHorz[j,i,:] = omega[i] * zeta[1,i] * exp(k * d);
        vVert[j,i,:] = vHorz[i,:];
  
      // Shallow and intermediate
      else
        vHorz[j,i,:] = omega[i] * zeta[j,i] * cosh(k[i] * (d .+ positionME[3,:])) ./ sinh(k * d);
        vVert[j,i,:] = omega[i] * zeta[j,i] * sinh(k[i] * (d .+ positionME[3,:])) ./ sinh(k * d);
      end if;
    end for;
    
  end for;
  

end LinearWaveKin;
