"""Nonlinear hydrostatic (nlhs) functions."""

import numpy as np


def main(cg, rho, g, m, eta, d, centres, norms, areas):
    z = centres[2, :].copy()    # copy — never modify the original centres
    # z = centres[2, :]    # copy — never modify the original centres
    ffkst = np.zeros((6, 1))
    fg = np.array([[0], [0], [-m * g], [0], [0], [0]])

    for i in range(len(z)):
        if z[i] - eta[i] >= 0:
            z[i] = 0     
            continue                          # above surface, skip entirely
        
        p = -rho * g * z[i]            # pressure relative to instantaneous surface
        
        ftmp = p * areas[i] * norms[:, i].reshape(3, 1)
        ffkst[:3] += ftmp
        r_centre_cg = centres[:, i].reshape(3, 1) - cg.reshape(3, 1)
        ffkst[3:] += np.cross(r_centre_cg[:,0], ftmp[:,0]).reshape(3, 1)

    fnlhs = ffkst + fg
    return {"status": "ok", "fnlhs": fnlhs}


if __name__ == "__main__":
	main()

