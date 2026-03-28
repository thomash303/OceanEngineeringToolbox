/**
 * wave_elevation.c
 * Free-surface wave elevation calculation.
 *
 * Mirrors waveElevation.py:
 *   eta[i] = sum_{dir,freq} ramp * zeta[dir,freq]
 *            * cos( omega[freq]*t - k[freq]*(x*cos(dir)+y*sin(dir)) + phase[dir,freq] )
 *
 * Array layouts (column-major, matching transposed numpy arrays):
 *   centres[3 x N]:       centres[row + 3*col]
 *   phase  [nDir x nF]:   phase [dir + nDir*freq]
 *   zeta   [nDir x nF]:   zeta  [dir + nDir*freq]
 */

#include <math.h>
#include <string.h>

#include "wave_elevation.h"

void wave_elevation(
    ElevationType  type,
    int            nF,
    int            nDir,
    const double   waveDirections[],
    double         time,
    double   centres[][3],
    int            N,
    double         ramp,
    double   phase[][nF],
    double   omega[],
    double   k[],
    double   zeta[][nF],
    double         eta_out[])
{
    /* Initialise output to zero */
    memset(eta_out, 0, N * sizeof(double));

    if (type == ELEVATION_MEAN) {
        /* eta remains zero everywhere */
        return;
    }

    /* ELEVATION_INSTANTANEOUS */
    for (int i = 0; i < nDir; i++) {
        double cos_dir = cos(waveDirections[i]);
        double sin_dir = sin(waveDirections[i]);

        for (int j = 0; j < nF; j++) {
            double amp = ramp * zeta[i][j];
            double ph  = phase[i][j];
            double kj  = k[j];
            double wj  = omega[j];

            for (int p = 0; p < N; p++) {
                double x = centres[p][0];
                double y = centres[p][1];
                double X = kj * (x * cos_dir + y * sin_dir);
                eta_out[p] += amp * cos(wj * time - X + ph);
            }
        }
    }
}
