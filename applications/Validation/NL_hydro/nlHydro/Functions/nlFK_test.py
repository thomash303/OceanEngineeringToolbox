"""Nonlinear Froude-Krylov (nlfk) functions."""

from cmath import phase
import numpy as np



def main(cg, g, rho, eta, d, nF, nDir, waveDirections, time, centres, norms, areas, ramp, phase, omega, k, zeta):

    ffkdy = np.zeros((6, 1))

    for i in range(centres.shape[1]):
        # Original depth — never overwrite this
        z0 = centres[2, i]

        # Skip panel if centre is above free surface
        if z0 >= eta[i]:
            continue

        for j in range(nDir):
            for idx in range(nF):

                # Fresh zi per frequency — never accumulate
                if k[idx] * d > np.pi:
                    zi    = z0 - eta[i]
                    decay = np.exp(k[idx] * zi)
                else:
                    zi    = d * (d + z0) / (d + eta[i]) - d
                    decay = np.cosh(k[idx] * (d + zi)) / np.cosh(k[idx] * d)

                X = k[idx] * (centres[0, i] * np.cos(waveDirections[j])
                            + centres[1, i] * np.sin(waveDirections[j]))
                p = ramp * rho * g * zeta[j, idx] * np.cos(omega[idx] * time - X + phase[j, idx]) * decay

                ftmp = p * areas[i] * norms[:, i].reshape(3, 1)
                ffkdy[:3] += ftmp

                r_centre_cg = centres[:, i].reshape(3, 1) - cg.reshape(3, 1)
                ffkdy[3:] += np.cross(r_centre_cg[:, 0], ftmp[:, 0]).reshape(3, 1)

    return {"status": "ok", "fnlfk": ffkdy}



if __name__ == "__main__":
	main()
