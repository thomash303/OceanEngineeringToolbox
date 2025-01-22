model DoF6Rad
  extends DoF6Radread;
extends Hydrodynamic.Connector.forceTorque_con;
extends Hydrodynamic.Connector.absoluteVelocity_con;


  Real x[n_states[2]] "State vector for 1D radiation force model";
  Real F_rad[6] "Calculated 1D radiation force [N]";
  Real v_omega[6];
  parameter Boolean enableRadiationForce = true "Switch to enable/disable 1D radiation force calculation";
  
initial equation
  x = zeros(n_states[2]) "Initialize state vector to zero";
equation
v_omega = cat(1, v_abs, omega_abs);
// 1D Radiation force state-space model
// Note: Only the third element of the velocity vector (vertical motion) is used
  der(x) = A*x + B*v_omega;
  F_rad = C*x + D*v_omega;
// Output: 1D radiation force only in the third element (vertical direction), with enable/disable switch
  if enableRadiationForce then
    F = -F_rad;
  else
    F = {0,0,0,0, 0, 0};
  end if;
  

end DoF6Rad;
