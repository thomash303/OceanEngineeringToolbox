#ifndef NL_HYDROSTATIC_H
#define NL_HYDROSTATIC_H

/**
 * nl_hydrostatic.h
 *
 * Arrays are [N][3] — each row is one panel.
 *   centres[i][0/1/2] = x/y/z of panel i
 *   norms  [i][0/1/2] = nx/ny/nz of panel i
 *   eta    [i]         = free surface elevation at panel i
 */
void nl_hydrostatic(
    const double  cg[3],
    double        rho,
    double        g,
    double        m,
    double *eta,
    double  centres[][3],
    double  norms[][3],
    double *areas,
    int           N,
    double        fnlhs[6]
);

#endif /* NL_HYDROSTATIC_H */