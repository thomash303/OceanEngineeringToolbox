"""Main file for nonlinear hydrostatics and Froude-Krylov."""

# Requires numpy, matplotlib, and numpy-stl packages to be installed.

from Functions import nlfk, nlhs, waveElevation, transform, load_stl

import numpy as np
import matplotlib.pyplot as plt

# This does not consider the unit normals! only the normal

def main():

    mesh = load_stl("Meshes/sphere.stl")

    time = np.arange(0, 10, 0.1)

    etaT = np.zeros(time.shape[0])
    fnlhs = np.zeros((6, time.shape[0]))
    fnlfk = np.zeros((6, time.shape[0]))

    bodyCentres = mesh.centroids.T
    bodyNorm = mesh.get_unit_normals()

    for t in time:



        m = 5000
        rho = 1025
        g = 9.81
        #eta = 0
        d = 1000
        cg = np.array([0, 0, -0.5])
        R = np.array([[1, 0, 0], [0, 1, 0], [0, 0, 1]])

        # Wave
        elevationType = "mean"
        nF = 15
        nDir = 1
        waveDirections = np.array([0])
        #time = 5
        rampTime = 3
        if t < rampTime:
            ramp = t / rampTime
        else:
            ramp = 1
        phase = np.zeros((nDir, nF))
        omega = np.linspace(0.5, 3, nF)
        k = omega**2 / (g*100)
        num_random = 8 
        rows = np.random.randint(0, nDir, num_random)
        cols = np.random.randint(0, nF, num_random)
        zeta = np.ones((nDir, nF)) * 2
        

        globalCentres = transform(bodyCentres, cg, R, vectorType="points")
        globalNorm = transform(bodyNorm, cg, R, vectorType="directions")
        areas = mesh.areas

        result = waveElevation(elevationType=elevationType, nF=nF, nDir=nDir, waveDirections=waveDirections, time=t, centres=globalCentres, ramp=ramp, phase=phase, omega=omega, k=k, zeta=zeta)
        eta = result["eta"]
        etaT[int(t*10)] = eta[0]
        #print({"eta": eta})

        result = nlhs(cg=cg, rho=rho, g=g, m=m, eta=eta, d=d, centres=globalCentres, norms=globalNorm, areas=areas)
        fnlhs[:, int(t*10)] = result["fnlhs"][:,0]
        #print({"fnlhs": fnlhs})

        result = nlfk(cg=cg, g=g, rho=rho, eta=eta, d=d, nF=nF, nDir=nDir, waveDirections=waveDirections, time=t, centres=globalCentres, norms=globalNorm, areas=areas, ramp=ramp, phase=phase, omega=omega, k=k, zeta=zeta)
        fnlfk[:, int(t*10)] = result["fnlfk"][:,0]
        #print({"fnlfk": fnlfk})

    fig, axes = plt.subplots(2, 3, figsize=(10, 6), sharex=True)
    axes = axes.ravel()
    for i in range(6):
        ax = axes[i]
        ax.plot(time, fnlhs[i, :], label="NLHS")
        ax.plot(time, fnlfk[i, :], label="NLFK")
        ax.set_title(f"Force/Moment Component {i+1}")
        ax.set_xlabel("Time (s)")
        ax.set_ylabel("Force (N) / Moment (Nm)")
        ax.legend()
    fig.tight_layout()
    

    plt.figure(figsize=(8, 3))
    plt.plot(time, etaT, label="eta")
    plt.xlabel("Time (s)")
    plt.ylabel("Surface elevation (m)")
    plt.title("Free Surface Elevation")
    plt.legend()
    plt.tight_layout()
    plt.show()

    
if __name__ == "__main__":
    main()