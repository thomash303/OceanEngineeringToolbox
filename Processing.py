import OMPython

from OMPython import OMCSessionZMQ
from OMPython import ModelicaSystem

omc = OMCSessionZMQ()
model_path = '/usr/lib/omlibrary/Modelica 3.2.3/package.mo'
mod = ModelicaSystem(model_path, 'Modelica.Electrical.Machines.Examples.AsynchronousInductionMachines.AIMC_Inverter')