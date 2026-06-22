import numpy as np
import matplotlib.pyplot as plt

# Load CSV
data = np.loadtxt("C_testing\Data\wave_elevation_out.csv", delimiter=",", skiprows=1)

# Handle shape
if data.ndim == 1:
    # Only elevation provided → create artificial time
    eta = data
    time = np.arange(len(eta))
else:
    # Assume [time, eta]
    time = data[:, 0]
    eta = data[:, 1]

# Plot
plt.figure()
plt.plot(time, eta)
plt.xlabel("Time (s)")
plt.ylabel("Wave Elevation (m)")
plt.title("Wave Elevation at Panel 1")
plt.grid(True)

plt.show()