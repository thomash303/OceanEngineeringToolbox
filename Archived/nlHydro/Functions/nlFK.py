"""Nonlinear Froude-Krylov (nlfk) functions."""

from cmath import phase
import numpy as np


def main(cg, g, rho, eta, d, nF, nDir, waveDirections, time, centres, norms, areas, ramp, phase, omega, k, zeta):

    z = centres[2, :]
    ffkdy = np.zeros((6, 1))
	
    for i in range(len(z)):
        # Deepwater


        for j in range(nDir):
            for idx in range(nF):

                if k[idx]*d > np.pi:
                    z[i] = z[i] - eta[i]
                    decay = np.exp(k[idx] * z[i])
                # Shallow and intermediate water
                else:
                    z[i] = d * (d + z[i]) / (d + eta[i]) - d
                    decay = np.cosh(k[idx] * (d + z[i])) / np.cosh(k[idx] * d)


                if z[i] - eta[i] >= 0:
                    z[i] = 0

                X = k[idx] * (centres[0, i] * np.cos(waveDirections[j]) + centres[1, i] * np.sin(waveDirections[j]))
                p = rho * g * zeta[j,idx] * np.cos(omega[idx] * time - X + phase[j, idx]) * decay

                ftmp = p *  areas[i] * norms[:, i].reshape(3, 1)
                ffkdy[:3] += ftmp

                r_centre_cg = centres[:, i].reshape(3, 1) - cg.reshape(3, 1)
                ffkdy[3:] += np.cross(r_centre_cg[:,0], ftmp[:,0]).reshape(3, 1)

    fnlfk = ffkdy

    return {"status": "ok", "fnlfk": fnlfk}


if __name__ == "__main__":
	main()
