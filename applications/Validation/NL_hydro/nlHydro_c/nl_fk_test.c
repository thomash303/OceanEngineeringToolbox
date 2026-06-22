#include <stdio.h>
#include <math.h>
#include <string.h>
#include <stdlib.h>

#include "nl_fk.h"
#include "wave_elevation.h"
#include "transformation.h"
#include "meshing.h"

#define NT 300

int main(void)
{
    /* --- Simulation setup --- */
    double dt = 0.1;
    double time[NT];
    for (int i = 0; i < NT; i++)
        time[i] = i * dt;

    double fnlfk[6][NT] = {{0}};
    double etaT[NT]     = {0};

    /* --- Physical params --- */
    const double cg[3]   = {0, 0, -0.5};
    const double R[3][3] = {{1,0,0},{0,1,0},{0,0,1}};

    double rho = 1025.0;
    double g   =    9.81;
    double d   = 1000.0;

    /* --- Wave params --- */
    ElevationType elevationType = ELEVATION_INSTANTANEOUS;


    int nF = 1;
    int nDir = 1;

    double waveDirections[1] = {0.0};
    double phase[1][1] = {{0.0}};
    double omega[1] = {1.0};
    double k[1] = {omega[0]*omega[0] / (g * 100.0)};
    double zeta[1][1] = {{1.0}};


    memset(phase, 0, sizeof phase);
    for (int i = 0; i < nF; i++) zeta[0][i] = 1.0;

    /* --- Load mesh --- */
    Mesh mesh = load_stl("Meshes/sphere_9024p.stl");
    if (mesh.n_panels == 0) { printf("Mesh failed\n"); return 1; }

    const int N = mesh.n_panels;

    /* --- Working arrays (VLAs, same pattern as hydrostatic test) --- */
    double globalCentres[N][3];
    double globalNorms  [N][3];
    double eta          [N];
    double areas        [N];

    /* --- Time marching --- */
    double rampTime = 3.0;

    for (int ti = 0; ti < NT; ti++)
    {
        double t    = time[ti];
        double ramp = (t < rampTime) ? t / rampTime : 1.0;

        /* Unit-convert centroids mm → m */
        double centroids_m[N][3];
        for (int i = 0; i < N; i++) {
            centroids_m[i][0] = mesh.centroids[i][0] / 1000.0;
            centroids_m[i][1] = mesh.centroids[i][1] / 1000.0;
            centroids_m[i][2] = mesh.centroids[i][2] / 1000.0;
        }

        /* Transform */
        transform((const double (*)[3])centroids_m,  globalCentres, cg, R, N, 1);
        transform((const double (*)[3])mesh.normals,  globalNorms,  cg, R, N, 0);

        /* Areas cm² → m² */
        for (int i = 0; i < N; i++)
            areas[i] = mesh.areas[i] / 1000000.0;

        /* Wave elevation */
        wave_elevation(
            elevationType,
            nF,
            nDir,
            waveDirections,
            t,
            globalCentres,
            N,
            ramp,
            phase,
            omega,
            k,
            zeta,
            eta
        );

        etaT[ti] = eta[0];

        /* Froude-Krylov */
        double fn[6];
        nl_fk(
            cg,
            g,
            rho,
            eta,
            d,
            nF,
            nDir,
            waveDirections,
            t,
            (const double (*)[3])globalCentres,
            (const double (*)[3])globalNorms,
            areas,
            N,
            ramp,
            (const double *)phase,
            omega,
            k,
            (const double *)zeta,
            fn
        );

        for (int j = 0; j < 6; j++)
            fnlfk[j][ti] = fn[j];
    }

    /* --- Console preview --- */
    printf("\nTime series (first 10 steps):\n");
    for (int i = 0; i < 10; i++) {
        printf("t=%.2f  Fz_fk=%.3f  eta=%.3f\n",
               time[i], fnlfk[2][i], etaT[i]);
    }

    /* --- CSV output --- */
    FILE *fp = fopen("nl_fk_out.csv", "w");
    if (!fp) { printf("Failed to open nl_fk_out.csv\n"); return 1; }

    fprintf(fp, "time,eta,Fx,Fy,Fz,Mx,My,Mz\n");
    for (int i = 0; i < NT; i++) {
        fprintf(fp, "%.6f,%.6f,%.6f,%.6f,%.6f,%.6f,%.6f,%.6f\n",
                time[i], etaT[i],
                fnlfk[0][i], fnlfk[1][i], fnlfk[2][i],
                fnlfk[3][i], fnlfk[4][i], fnlfk[5][i]);
    }
    fclose(fp);
    printf("Saved results to nl_fk_out.csv\n");

    /* --- Cleanup --- */
    free_mesh(&mesh);
    return 0;
}