#ifndef NL_FK_H
#define NL_FK_H

#include "wave_elevation.h"   /* reuse ElevationType */

/**
 * nl_fk  –  Nonlinear Froude-Krylov force and moment.
 *
 * Mirrors the Python nlfk() function exactly.
 *
 * Parameters
 * ----------
 * cg            : [3]          Centre of gravity in global frame (m)
 * g             : gravity (m/s²)
 * rho           : water density (kg/m³)
 * eta           : [N]          Instantaneous free-surface elevation at each panel centre (m)
 * d             : water depth (m)
 * nF            : number of frequency components
 * nDir          : number of wave directions
 * waveDirections: [nDir]       Wave heading angles (rad)
 * t             : current time (s)
 * centres       : [N][3]       Panel centroid positions in global frame (m)
 * norms         : [N][3]       Panel unit-normal vectors in global frame (–)
 * areas         : [N]          Panel areas (m²)
 * N             : total number of panels
 * ramp          : ramp factor  [0, 1]
 * phase         : [nDir][nF]   Phase angles (rad)
 * omega         : [nF]         Angular frequencies (rad/s)
 * k             : [nF]         Wave numbers (rad/m)
 * zeta          : [nDir][nF]   Wave amplitudes (m)
 * fn            : [6] OUTPUT   Forces (N) then moments (N·m) in global frame
 */
void nl_fk(
    const double cg[3],
    double g,
    double rho,
    const double *eta,
    double d,
    int nF,
    int nDir,
    const double *waveDirections,
    double t,
    const double centres[][3],
    const double norms[][3],
    const double *areas,
    int N,
    double ramp,
    const double *phase,       /* row-major [nDir][nF] */
    const double *omega,
    const double *k,
    const double *zeta,        /* row-major [nDir][nF] */
    double fn[6]
);

#endif /* NL_FK_H */