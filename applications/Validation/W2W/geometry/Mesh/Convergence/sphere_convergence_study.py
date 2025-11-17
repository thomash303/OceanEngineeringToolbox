## Convergence Study for a Sphere using Capytaine
import numpy as np
import capytaine as cpt
import matplotlib.pyplot as plt

full_mesh = cpt.load_mesh("sphere.dat")
full_mesh.show()