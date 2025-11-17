from dataclasses import dataclass, field
from typing import Any, List, Dict
from scipy.io import savemat

# ------------------------------
# Define the HydroP dataclass
# ------------------------------
@dataclass
class HydroP:
    header: str = ""
    parameters: Dict[str, Any] = field(default_factory=dict)
    bodies: List[Any] = field(default_factory=list)
    coefficients: Dict[str, Any] = field(default_factory=dict)

# ------------------------------
# Create an instance
# ------------------------------
hydro = HydroP(
    header="WAMED simulation data",
    parameters={"rho": 1025, "g": 9.81},
    bodies=["body1", "body2"],
    coefficients={
        "added_mass": [1.0, 2.0],
        "radiation_damping": [0.1, 0.2]
    }
)

# ------------------------------
# Convert to MATLAB-friendly dictionary
# ------------------------------
hydro_dict = {
    'header': hydro.header,
    'parameters': hydro.parameters,
    'bodies': hydro.bodies,
    'coefficients': hydro.coefficients
}

# ------------------------------
# Save as .mat file
# ------------------------------
savemat('hydroP.mat', {'hydroP': hydro_dict})

print("hydroP.mat file has been created!")
