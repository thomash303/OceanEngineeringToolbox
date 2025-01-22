model DoF6Radread
parameter String fileName = "C:/Users/Thomas/Documents/GitHub/OET_Sys-MoDEL_TH/tutorial/hydroCoeff_6DoFRad.mat";

parameter Real  nDoF_real[1,1] = Modelica.Utilities.Streams.readRealMatrix(fileName, "hydroCoeff.body.ndof",1,1) "Degrees-of-Freedom reading";
parameter Integer  nDoF = integer(nDoF_real[1,1]) "Degrees-of-Freedom";
parameter Real n_stateSpace[nDoF, nDoF] = Modelica.Utilities.Streams.readRealMatrix(fileName, "hydroCoeff.ss_rad.it", nDoF, nDoF) "State-space approximation for each mode";

parameter Integer n_states[2] = Modelica.Utilities.Streams.readMatrixSize(fileName, "hydroCoeff.ss_rad.final.A") "Number of states";
 
parameter Real A[n_states[1], n_states[1]] = Modelica.Utilities.Streams.readRealMatrix(fileName, "hydroCoeff.ss_rad.final.A", n_states[1], n_states[1]) "State matrix";
parameter Real B[n_states[1], nDoF] = Modelica.Utilities.Streams.readRealMatrix(fileName, "hydroCoeff.ss_rad.final.B", n_states[1], nDoF) "Input matrix";
parameter Real C[nDoF, n_states[1]] = Modelica.Utilities.Streams.readRealMatrix(fileName, "hydroCoeff.ss_rad.final.C", nDoF, n_states[1]) "Output matrix";
parameter Real D[nDoF,nDoF] = Modelica.Utilities.Streams.readRealMatrix(fileName, "hydroCoeff.ss_rad.final.D", nDoF, nDoF) "Feedforward matrix";

parameter Modelica.Units.SI.Mass M = scalar(Modelica.Utilities.Streams.readRealMatrix(fileName, "hydroCoeff.m33", 1, 1)) "Total mass of the body (including ballast)";
parameter Modelica.Units.SI.Mass Ainf[nDoF, nDoF] = Modelica.Utilities.Streams.readRealMatrix(fileName, "hydroCoeff.Ainf", nDoF, nDoF) "Added mass at maximum (cut-off) frequency";
parameter Modelica.Units.SI.TranslationalSpringConstant Khs[nDoF,nDoF] = Modelica.Utilities.Streams.readRealMatrix(fileName, "hydroCoeff.Khs", nDoF, nDoF) "Hydrostatic stiffness";

equation
end DoF6Radread;
