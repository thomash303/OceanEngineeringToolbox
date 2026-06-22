import numpy as np
import matplotlib.pyplot as plt
from Functions import transform, waveElevation, nlhs, load_stl, nlfk

dt = 0.1
time = np.arange(0, 30, dt)
etaT = np.zeros(time.shape[0])
fnlfk = np.zeros((6, time.shape[0]))


bodyCentres = np.array([[0.0, 1.0, 2.0],
[0.0, 1.0, 2.0],
[0.0, 1.0, 2.0]])

bodyNorm = np.array([[1.0, 0.0, 0.0],
[0.0, 1.0, 0.0],
[0.0, 0.0, 1.0]])

cg = np.array([0, 0, -0.5])
R = np.array([[1, 0, 0], [0, 1, 0], [0, 0, 1]])

m = 5000
rho = 1025
g = 9.81
d = 1000


# Wave
elevationType = "instantaneous"
nF = 1
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
zeta = np.ones((nDir, nF))


mesh = load_stl("Meshes/sphere_9024p.stl")


bodyCentres = mesh.centroids.T / 1000
bodyNorm = mesh.get_unit_normals().T
areas = mesh.areas /1000**2

# mesh = load_stl("Meshes/sphere.stl")


# bodyCentres = mesh.centroids.T
# bodyNorm = mesh.get_unit_normals().T
# areas = mesh.areas

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


    result = nlfk(cg=cg, g=g, rho=rho, eta=eta, d=d, nF=nF, nDir=nDir, waveDirections=waveDirections, time=t, centres=globalCentres, norms=globalNorm, areas=areas, ramp=ramp, phase=phase, omega=omega, k=k, zeta=zeta)
    fnlfk[:, int(t*10)] = result["fnlfk"][:,0]
        #print({"fnlfk": fnlfk})


fig, axes = plt.subplots(2, 3, figsize=(10, 6), sharex=True)
axes = axes.ravel()
for i in range(6):
    ax = axes[i]
    ax.plot(time, fnlfk[i, :], label="NLFK")
    ax.set_title(f"Force/Moment Component {i+1}")
    ax.set_xlabel("Time (s)")
    ax.set_ylabel("Force (N) / Moment (Nm)")
    ax.legend()
fig.tight_layout()
plt.show()

plt.plot(time, etaT)
plt.xlabel("Time (s)")  
plt.ylabel("Wave Elevation (m)")
plt.title("Wave Elevation vs Time")
plt.show()

print("body z max:", bodyCentres[2,:].max())

print("global z max:", globalCentres[2,:].max())
print("global z min:", globalCentres[2,:].min())
print("globalCentres shape:", globalCentres.shape)
print("globalCentres first col:", globalCentres[:,0])
print("areas shape:", areas.shape)
print("areas max:", areas.max())
