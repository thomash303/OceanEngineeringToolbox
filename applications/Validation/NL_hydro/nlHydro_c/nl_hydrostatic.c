/**
 * nl_hydrostatic.c
 * Nonlinear hydrostatic pressure integration over the wetted hull surface.
 *
 * Hydrostatic pressure at a submerged panel centroid:
 *   p = -rho * g * z
 *
 * Panels above the instantaneous free surface (z >= eta) are skipped.
 *
 * Arrays are [N][3] — each row is one panel:
 *   centres[i][0/1/2] = x/y/z of panel i
 *   norms  [i][0/1/2] = nx/ny/nz of panel i
 */

#include <string.h>
#include "nl_hydrostatic.h"

static void cross3(const double a[3], const double b[3], double out[3])
{
    out[0] = a[1]*b[2] - a[2]*b[1];
    out[1] = a[2]*b[0] - a[0]*b[2];
    out[2] = a[0]*b[1] - a[1]*b[0];
}

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
    double        fnlhs[6])
{
    double ffkst[6] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};

    for (int i = 0; i < N; i++) {
        double z = centres[i][2];

        /* Skip panels above the instantaneous free surface */
        if (z - eta[i] >= 0.0) continue;

        double p = -rho * g * z;

        double ftmp[3];
        ftmp[0] = p * areas[i] * norms[i][0];
        ftmp[1] = p * areas[i] * norms[i][1];
        ftmp[2] = p * areas[i] * norms[i][2];

        ffkst[0] += ftmp[0];
        ffkst[1] += ftmp[1];
        ffkst[2] += ftmp[2];

        double r[3];
        r[0] = centres[i][0] - cg[0];
        r[1] = centres[i][1] - cg[1];
        r[2] = centres[i][2] - cg[2];

        double mom[3];
        cross3(r, ftmp, mom);
        ffkst[3] += mom[0];
        ffkst[4] += mom[1];
        ffkst[5] += mom[2];
    }

    fnlhs[0] = ffkst[0];
    fnlhs[1] = ffkst[1];
    fnlhs[2] = ffkst[2] - m * g;
    fnlhs[3] = ffkst[3];
    fnlhs[4] = ffkst[4];
    fnlhs[5] = ffkst[5];
}