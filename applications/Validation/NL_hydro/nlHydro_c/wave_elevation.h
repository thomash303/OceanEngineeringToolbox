#ifndef WAVE_ELEVATION_H
#define WAVE_ELEVATION_H

/**
 * wave_elevation.h
 * Free-surface wave elevation calculation.
 */

/** Elevation type selector */
typedef enum {
    ELEVATION_MEAN = 0,        /**< eta = 0 everywhere (mean waterplane) */
    ELEVATION_INSTANTANEOUS    /**< Full linear wave superposition          */
} ElevationType;

/**
 * Compute wave surface elevation at every panel centre.
 *
 * @param type            ELEVATION_MEAN or ELEVATION_INSTANTANEOUS
 * @param nF              Number of frequency components
 * @param nDir            Number of wave directions
 * @param waveDirections  [nDir] wave heading angles (radians)
 * @param time            Current simulation time (s)
 * @param centres         [3 x N] global panel centres (column-major)
 * @param N               Number of panels
 * @param ramp            Ramp factor in [0,1]
 * @param phase           [nDir x nF] phase angles (rad), column-major
 * @param omega           [nF] angular frequencies (rad/s)
 * @param k               [nF] wave numbers (rad/m)
 * @param zeta            [nDir x nF] wave amplitudes (m), column-major
 * @param eta_out         [N]  OUTPUT: surface elevation at each panel centre
 */
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
    double         eta_out[]
);

#endif /* WAVE_ELEVATION_H */
