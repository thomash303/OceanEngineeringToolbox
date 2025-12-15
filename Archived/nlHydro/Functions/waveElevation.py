"""Wave elevation functions."""

import numpy as np


def main(elevationType, nF, nDir, waveDirections, time, centres, ramp, phase, omega, k, zeta):
	

    if elevationType == "mean":
        eta = np.zeros(len(centres[0, :]))
    elif elevationType == "instantaneous":
        eta = np.zeros(len(centres[0, :]))
        for i in range(nDir):
            for j in range(nF):
                X = k[j] * (centres[0, :] * np.cos(waveDirections[i]) + centres[1, :] * np.sin(waveDirections[i]))
                eta += ramp * zeta[i, j] * np.cos(omega[j] * time - X + phase[i, j])
                
    return {"status": "ok", "eta": eta}

if __name__ == "__main__":
	main()
