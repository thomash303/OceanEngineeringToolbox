import numpy as np
import matplotlib.pyplot as plt
from Functions import transform, waveElevation


time = np.arange(0, 10, 0.1)
etaT = np.zeros(time.shape[0])


bodyCentres = np.array([[0.0, 1.0, 2.0],
[0.0, 1.0, 2.0],
[0.0, 1.0, 2.0]])

bodyNorm = np.array([[1.0, 0.0, 0.0],
[0.0, 1.0, 0.0],
[0.0, 0.0, 1.0]])

cg = np.array([0, 0, -0.5])
R = np.array([[1, 0, 0], [0, 1, 0], [0, 0, 1]])

rho = 1025
g = 9.81
d = 1000


# Wave
elevationType = "instantaneous"
nF = 15
nDir = 1
waveDirections = np.array([0])
#time = 5
rampTime = 3



phase = np.zeros((nDir, nF))
omega = np.linspace(0.5, 3, nF)
k = omega**2 / (g*100)
num_random = 8 
rows = np.random.randint(0, nDir, num_random)
cols = np.random.randint(0, nF, num_random)
zeta = np.ones((nDir, nF)) * 2

for t in time:
            
    if t < rampTime:
        ramp = t / rampTime
    else:
        ramp = 1

    globalCentres = transform(bodyCentres, cg, R, vectorType="points")
    globalNorm = transform(bodyNorm, cg, R, vectorType="directions")


    #print("Global Centres:\n", globalCentres)
    #print("Global Normals:\n", globalNorm)


    result = waveElevation(elevationType=elevationType, nF=nF, nDir=nDir, waveDirections=waveDirections, time=t, centres=globalCentres, ramp=ramp, phase=phase, omega=omega, k=k, zeta=zeta)
    eta = result["eta"]
    etaT[int(t*10)] = eta[0]

plt.plot(time, etaT)
plt.xlabel("Time (s)")  
plt.ylabel("Wave Elevation (m)")
plt.title("Wave Elevation vs Time")
plt.show()