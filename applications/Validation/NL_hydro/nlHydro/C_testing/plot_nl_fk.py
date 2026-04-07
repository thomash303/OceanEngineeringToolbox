import numpy as np
import matplotlib.pyplot as plt

# Load CSV (skip header)
data = np.loadtxt("C_testing/Data/nl_fk_out.csv", delimiter=",", skiprows=1)

# Extract columns
time = data[:, 0]
etaT = data[:, 1]

# Forces/moments: shape (6, Nt)
fnlfk = data[:, 2:8].T

# -------------------------------
# Force / Moment plots (2x3 grid)
# -------------------------------
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

# -------------------------------
# Wave elevation plot
# -------------------------------
plt.plot(time, etaT)
plt.xlabel("Time (s)")
plt.ylabel("Wave Elevation (m)")
plt.title("Wave Elevation vs Time")
plt.show()