
import numpy as np
from Functions import transform


bodyCentres = np.array([[0.0, 1.0, 2.0],
[0.0, 1.0, 2.0],
[0.0, 1.0, 2.0]])

bodyNorm = np.array([[1.0, 0.0, 0.0],
[0.0, 1.0, 0.0],
[0.0, 0.0, 1.0]])

cg = np.array([0, 0, -0.5])
R = np.array([[1, 0, 0], [0, 1, 0], [0, 0, 1]])

        

globalCentres = transform(bodyCentres, cg, R, vectorType="points")
globalNorm = transform(bodyNorm, cg, R, vectorType="directions")


print("Global Centres:\n", globalCentres)
print("Global Normals:\n", globalNorm)