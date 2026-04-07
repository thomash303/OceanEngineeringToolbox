#include "nl_fk.h"

#define _USE_MATH_DEFINES
#include <math.h>
#include <string.h>

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

/* --------------------------------------------------------------------------
 * Helper: 3-D cross product  out = a × b
 * ---------------------------------------------------------------------- */
static void cross3(const double a[3], const double b[3], double out[3])
{
    out[0] = a[1]*b[2] - a[2]*b[1];
    out[1] = a[2]*b[0] - a[0]*b[2];
    out[2] = a[0]*b[1] - a[1]*b[0];
}

/* --------------------------------------------------------------------------
 * nl_fk
 * ---------------------------------------------------------------------- */
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
    const double *phase,
    const double *omega,
    const double *k,
    const double *zeta,
    double fn[6]
)
{
    memset(fn, 0, 6 * sizeof(double));

    for (int i = 0; i < N; i++)
    {
        double zi_base = centres[i][2];

        for (int j = 0; j < nDir; j++)
        {
            for (int idx = 0; idx < nF; idx++)
            {
                double zi = zi_base;
                double decay;

                if (k[idx] * d > M_PI)
                {
                    zi    = zi - eta[i];
                    decay = exp(k[idx] * zi);
                }
                else
                {
                    zi    = d * (d + zi) / (d + eta[i]) - d;
                    decay = cosh(k[idx] * (d + zi)) / cosh(k[idx] * d);
                }

                if (zi - eta[i] >= 0.0)
                    continue;

                double X = k[idx] * (  centres[i][0] * cos(waveDirections[j])
                                      + centres[i][1] * sin(waveDirections[j]) );

                double ph  = phase[j * nF + idx];
                double amp = zeta [j * nF + idx];

                double p = ramp * rho * g * amp
                           * cos(omega[idx] * t - X + ph)
                           * decay;

                double ftmp[3];
                double area_i = areas[i];
                for (int d3 = 0; d3 < 3; d3++)
                    ftmp[d3] = p * area_i * norms[i][d3];

                fn[0] += ftmp[0];
                fn[1] += ftmp[1];
                fn[2] += ftmp[2];

                double r[3] = {
                    centres[i][0] - cg[0],
                    centres[i][1] - cg[1],
                    centres[i][2] - cg[2]
                };

                double mom[3];
                cross3(r, ftmp, mom);

                fn[3] += mom[0];
                fn[4] += mom[1];
                fn[5] += mom[2];
            }
        }
    }
}