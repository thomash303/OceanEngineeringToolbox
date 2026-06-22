#include <stdio.h>
#include <math.h>
#include <string.h>

#include "nl_hydrostatic.h"
#include "wave_elevation.h"
#include "transformation.h"
#include "meshing.h"

#define N_MAX 5000
#define NT 300

int main(void)
{
    /* --- Simulation setup --- */
    double dt = 0.1;
    double time[NT];

    for (int i = 0; i < NT; i++)
        time[i] = i * dt;

    double fnlhs[6][NT] = {{0}};
    double etaT[NT] = {0};

    /* --- Physical params --- */
    const double cg[3] = {0, 0, -0.5};
    const double R[3][3] = {
        {1,0,0},
        {0,1,0},
        {0,0,1}
    };

    double m = 5000.0;
    double rho = 1025.0;
    double g = 9.81;

    /* --- Wave params --- */
    ElevationType elevationType = ELEVATION_INSTANTANEOUS;

    int nF = 1;
    int nDir = 1;

    double waveDirections[1] = {0.0};
    double phase[1][1] = {{0.0}};
    double omega[1] = {1.0};
    double k[1] = {omega[0]*omega[0] / (g * 100.0)};
    double zeta[1][1] = {{1.0}};

    /* --- Load mesh --- */
    Mesh mesh = load_stl("Meshes/sphere_9024p.stl");

    if (mesh.n_panels == 0) {
        printf("Mesh failed\n");
        return 1;
    }

    const int N = mesh.n_panels;

    /* --- Allocate working arrays --- */
    double globalCentres[N][3];
    double globalNorms[N][3];
    double eta[N];

    /* --- Time marching --- */
    double rampTime = 3.0;

    for (int ti = 0; ti < NT; ti++)
    {
        double t = time[ti];

        double ramp = (t < rampTime) ? t / rampTime : 1.0;

        double centroids_m[N][3];

    for (int i = 0; i < N; i++) {
        centroids_m[i][0] = mesh.centroids[i][0] / 1000.0;
        centroids_m[i][1] = mesh.centroids[i][1] / 1000.0;
        centroids_m[i][2] = mesh.centroids[i][2] / 1000.0;
        }

        /* Transform */
        transform((const double (*)[3])  centroids_m, globalCentres, cg, R, N, 1);
        transform((const double (*)[3])  mesh.normals,  globalNorms,   cg, R, N, 0);

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

        /* Hydrostatics */
        double fn[6];
        double areas[N];
        for (int i = 0; i < N; i++)
            areas[i] = mesh.areas[i] / 1000000.0; // cm^2 to m^2

        nl_hydrostatic(
            cg,
            rho,
            g,
            m,
            eta,
            globalCentres,
            globalNorms,
            areas,
            N,
            fn
        );

        for (int j = 0; j < 6; j++)
            fnlhs[j][ti] = fn[j];
    }

    /* --- Output (simple) --- */
    printf("\nTime series (first 10 steps):\n");
    for (int i = 0; i < 10; i++) {
        printf("t=%.2f  Fz=%.3f  eta=%.3f\n",
               time[i],
               fnlhs[2][i],
               etaT[i]);
    }


    FILE *fp = fopen("nl_hydrostatic_out.csv", "w");
if (!fp) {
    printf("Failed to open nl_hydrostatic_out.csv\n");
    return 1;
}

/* Header */
fprintf(fp, "time,eta,Fx,Fy,Fz,Mx,My,Mz\n");

/* Data */
for (int i = 0; i < NT; i++) {
    fprintf(fp, "%.6f,%.6f,%.6f,%.6f,%.6f,%.6f,%.6f,%.6f\n",
            time[i],
            etaT[i],
            fnlhs[0][i],
            fnlhs[1][i],
            fnlhs[2][i],
            fnlhs[3][i],
            fnlhs[4][i],
            fnlhs[5][i]);
}

fclose(fp);

printf("Saved results to output.csv\n");
    /* --- Cleanup --- */
    free_mesh(&mesh);

    return 0;
}