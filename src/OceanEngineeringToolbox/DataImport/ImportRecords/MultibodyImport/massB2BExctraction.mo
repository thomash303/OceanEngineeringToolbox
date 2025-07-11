within OceanEngineeringToolbox.DataImport.ImportRecords.MultibodyImport;

function massB2BExctraction
  "Function to extract the infinite frequency added mass in a form compatible with the formulation of the Newton-Euler equations"

  // Importing and inheriting from the MSL
  import Modelica.Units.SI;
  
  input Integer quadrant "Quadrant in the added mass matrix (1, 2, 3, 4)";
  input Integer nbodies "Number of hydrodynamic bodies";
  input SI.Mass Ainf_full[nDoF,nDoF*nbodies] "Full infinite frequency added mass //matrix";
  
  output SI.Mass Ainf_mod[3, 3*nbodies] "Modified infinite frequency added mass matrix";

protected
  Integer nDoF = 6 "Degrees-of-freedom";
  Integer col "Column index";
  Integer row "Row index";
algorithm
  if quadrant == 1 then
    col := 1;
    row := 1;
  elseif quadrant == 2 then
    col := 1;
    row := 2;
  elseif quadrant == 3 then
    col := 2;
    row := 1;
  elseif quadrant == 4 then
    col := 2;
    row := 2;
  end if;
  for i in 1:nbodies loop
    Ainf_mod[1:3,3*(i-1)+1:3*(i-1)+3] := Ainf_full[3*(col-1)+1:3*(col-1)+3,nDoF*(i-1) + 3*(row-1) + 1:nDoF*(i-1) + 3*(row-1) + 3];
  end for;
end massB2BExctraction;
