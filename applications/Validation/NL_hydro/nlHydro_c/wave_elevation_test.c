#include <stdio.h>
#include <math.h>
#include <string.h>
#include "transformation.h"
#include "wave_elevation.h"

#define N_PTS 3
#define N_F 15
#define N_DIR 1
#define DT 0.1
#define T_MAX 10.0

int main(void) {
    // Time array
    int nTime = (int)(T_MAX / DT) + 1;
    double time[nTime];
    double etaT[nTime];
    for (int i = 0; i < nTime; ++i) {
        time[i] = i * DT;
        etaT[i] = 0.0;
    }

    const double bodyCentres[N_PTS][3] = {
        { 0.0, 0.0, 0.0 },
        { 1.0, 1.0, 1.0 },
        { 2.0, 2.0, 2.0 }
    };
 
    /*
     * Each row is one panel's outward normal in the body frame.
     *   panel 0 faces +x, panel 1 faces +y, panel 2 faces +z.
     */
    const double bodyNorm[N_PTS][3] = {
        { 1.0, 0.0, 0.0 },
        { 0.0, 1.0, 0.0 },
        { 0.0, 0.0, 1.0 }
    };

    const double cg[3] = {0, 0, -0.5};
    const double R[3][3] = { {1,0,0}, {0,1,0}, {0,0,1} };

    // Wave parameters
    ElevationType elevationType = ELEVATION_INSTANTANEOUS;
    int nF = N_F;
    int nDir = N_DIR;
    const double waveDirections[N_DIR] = {0.0};
    double rampTime = 3.0;

    double phase[N_DIR][N_F];
    double omega[N_F];
    double k[N_F];
    double zeta[N_DIR][N_F];
    for (int i = 0; i < N_DIR; ++i) {
        for (int j = 0; j < N_F; ++j) {
            phase[i][j] = 0.0;
            zeta[i][j] = 2.0;
        }
    }
    for (int j = 0; j < N_F; ++j) {
        omega[j] = 0.5 + (2.5 * j) / (N_F - 1); // linspace(0.5, 3, nF)
        k[j] = omega[j] * omega[j] / (9.81 * 100);
    }

    double globalCentres[N_PTS][3];
    double globalNorm   [N_PTS][3];
    double eta[N_PTS];

    for (int ti = 0; ti < nTime; ++ti) {
        double t = time[ti];
        double ramp = (t < rampTime) ? (t / rampTime) : 1.0;

        // Transform panel centres and normals
        transform(bodyCentres, globalCentres, cg, R, N_PTS, 1);
        transform(bodyNorm, globalNorm, cg, R, N_PTS, 0);

        // Compute wave elevation at each panel
        wave_elevation(elevationType, nF, nDir, waveDirections, t, globalCentres, N_PTS, ramp, phase, omega, k, zeta, eta);
        etaT[ti] = eta[0]; // Store first panel's elevation for plotting
    }

    // Output results to CSV for plotting
    FILE *fp = fopen("wave_elevation_out.csv", "w");
    if (fp) {
        fprintf(fp, "time,etaT\n");
        for (int i = 0; i < nTime; ++i) {
            fprintf(fp, "%f,%f\n", time[i], etaT[i]);
        }
        fclose(fp);
        printf("Results written to wave_elevation_out.csv\n");
    } else {
        printf("Failed to write output file.\n");
    }

    return 0;
}

