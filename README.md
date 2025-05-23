## Ocean Engineering Toolbox (OET) - Modelica Library
The Modelica™ Ocean Engineering Toolbox (OET) is an open-source toolbox developed by Sys-MoDEL™ at the University of New Brunswick, designed specifically for the time-domain modelling and simulation of wave-to-wire marine renewable energy systems.  

Latest release version: [OET v0.3 (2025)](src/OceanEngineeringToolbox/package.mo).

#### Overview

Modelica is a symbolic programming language used to represent Cyber-physical Systems (CPS) in the time-domain. Although it has widespread applications in the automobile and aerospace industries, there is no dedicated Modelica Standard Library (MSL) for the ocean engineering community. A reason for this is the difficulty with representing frequency-dependent variables, since Modelica operates solely in the time-domain. Furthermore, the solution to convolution intergals is a significant challenge since a time history of variables cannot be accessed.

Literature demonstrates the requirement for fequency-dependent models, and the Cummins equation is selected for the OET as an appropriate formulation. The radiation and excitation forces are represented by convolution integrals and have been succesfully implemented in v0.1 and v0.2 respectively using a State-Space approach. All results are validated against the WEC-Sim time-domain solver developed in SimScape (read about WEC-Sim [here](https://github.com/WEC-Sim/WEC-Sim)).

Repository directory:

- `OET.mo` - OET library source code (Modelica)
- `Processor.m` - Pre- and post-processing script (Matlab)
- `DOCUMENTATION.md` - User guide (Markdown)
- `\tutorial` - Sub-directory containing example files
- `\Previous Versions` - Sub-directory with previous OET versions (not maintained)

#### Development Team
The OET is a research product from the Sys-MoDEL research group at the University of New Brunswick (Fredericton), Canada. 

Current members of the development team include:

- Thomas Hogan
- Kush Bubbar

Former members of the development team include:
- Ajay Menon
- Alix Shahbaz Haider

#### Citing This Work
Publications conttibuting to the development of the OET include:

1. T. Hogan and K. Bubbar, "Augmenting the Modelica Ocean Engineering Toolbox to support multibody dynamic simulations," in *Proceedings of the 16th European Wave and Tidal Energy Conference*, Madeira, Portugal, 2025, accepted.
2. A. Menon, A. S. Haider, and K. Bubbar. "[Advancing the Modelica Ocean Engineering Toolbox with the Capability to Generate Accurate Wave Excitation Forces.](https://www.researchgate.net/publication/383006516_Advancing_the_Modelica_Ocean_Engineering_Toolbox_With_the_Capability_to_Generate_Accurate_Wave_Excitation_Forces)" in *Proceedings of the 43rd International Conference on Offshore Mechanics and Arctic Engineering*, OMAE 2024, Singapore, 2024.
3. A. Menon, A. S. Haider, and K. Bubbar. "[On Implementing Cummins Equation to Represent Accurate Wave Radiation Forces in Modelica.](https://www.researchgate.net/publication/374140539_On_Implementing_Cummins_Equation_to_Represent_Accurate_Wave_Radiation_Forces_in_Modelica)" in *Proceedings of the 42nd International Conference on Offshore Mechanics and Arctic Engineering*, OMAE 2023, Melbourne, Australia, 2023.

Publications citing the OET include:
1. T. Hogan and K. Bubbar, "Ocean Wave Energy Converter Mid-Fidelity Numerical Simulation Tools: A Review," in *Proceedings of the 16th European Wave and Tidal Energy Conference*, Madeira, Portugal, 2025, accepted.