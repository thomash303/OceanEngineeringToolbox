within OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces;

model MorisonForce 
  "Model representing the Morison force"

// currently only considering 1D excitation, could probably extend to 2D relatively easily

  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Constants.pi;
  
  // Importing from the OET
  import OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.CurrentModels.*;

  replaceable NoCurrent currentModel constrainedby BaseCurrent  "Current profile" annotation(choices(choice(redeclare currentModel NoCurrent "No current"), choice(redeclare currentModel ConstantCurrent "Constant current profile"), choice(redeclare currentModel LinearCurrent "Linear current profile"), choice(redeclare currentModel PowerLawCurrent "Power law current profile")),
    Placement(transformation(origin = {0, 44}, extent = {{-10, -10}, {10, 10}})));

end MorisonForce;
