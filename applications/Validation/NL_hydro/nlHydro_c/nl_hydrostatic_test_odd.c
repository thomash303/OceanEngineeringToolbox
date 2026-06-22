/**
 * test_nl_hydrostatic.c
 *
 * Analytical test cases for nl_hydrostatic():
 *
 *  Case 1 — eta above sphere top, fully submerged, flat waterplane:
 *    Fz = rho*g*V - m*g   (buoyancy minus weight)
 *    Fx = Fy = 0          (symmetry)
 *    Mx = My = Mz = 0     (sphere centred at CG)
 *
 *  Case 2 — eta raised by +2m, still fully submerged:
 *    Fz = same as Case 1  (Archimedes: buoyancy independent of surface
 *                          height when using p = -rho*g*z, NOT the case
 *                          when using p = -rho*g*(z-eta))
 *    NOTE: with p = -rho*g*z, raising eta changes which panels are
 *    included but not the pressure on each — so Fz will increase
 *    slightly if previously-excluded near-surface panels are now included.
 *    This test verifies the result is consistent with the formula used.
 *
 *  Case 3 — waterplane at sphere equator (eta = z_centre):
 *    Fz ≈ rho*g*V/2 - m*g  (half submerged)
 *    Fx = Fy = 0
 *
 * Build:
 *   gcc -std=c99 -Wall -O2 -o test_nl_hydrostatic \
 *       test_nl_hydrostatic.c nl_hydrostatic.c meshing.c transformation.c -lm
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#include "nl_hydrostatic.h"
#include "meshing.h"
#include "transformation.h"

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

/* ------------------------------------------------------------------ */
/* Helpers                                                              */
/* ------------------------------------------------------------------ */

static int check(const char *label, double got, double expected, double tol)
{
    double err = fabs(got - expected);
    int ok = (err < tol);
    printf("  %-48s  got %12.2f  expected %12.2f  %s\n",
           label, got, expected, ok ? "PASS" : "FAIL");
    return ok;
}

static int check_zero(const char *label, double got, double tol)
{
    return check(label, got, 0.0, tol);
}

static void fill_eta(double *eta, int n, double val)
{
    for (int i = 0; i < n; i++) eta[i] = val;
}

/* ------------------------------------------------------------------ */
int main(void)
{
    const char *STL_PATH = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/applications/Validation/NL_hydro/nlHydro_c/Meshes/sphere.stl";

    printf("Loading: %s\n", STL_PATH);
    Mesh mesh = load_stl(STL_PATH);
    if (mesh.n_panels == 0) {
        fprintf(stderr, "Failed to load mesh\n");
        return 1;
    }

    int N = mesh.n_panels;
    printf("Loaded %d panels\n\n", N);

    /* Physical parameters */
    const double rho     = 1025.0;
    const double g       = 9.81;
    const double m       = 5000.0;
    const double cg[3]   = { 0.0, 0.0, -0.5 };
    const double R[3][3] = { {1,0,0}, {0,1,0}, {0,0,1} };

    /* Allocate [N][3] arrays for global centres and normals */
    double (*globalCentres)[3] = (double (*)[3]) malloc(N * 3 * sizeof(double));
    double (*globalNorms)  [3] = (double (*)[3]) malloc(N * 3 * sizeof(double));
    double *eta                = (double *)       malloc(N     * sizeof(double));

    if (!globalCentres || !globalNorms || !eta) {
        fprintf(stderr, "Allocation failed\n");
        return 1;
    }

    /* Transform mesh centroids and normals into global frame.
     * mesh.centroids and mesh.normals are flat double* with layout [i*3+0/1/2].
     * Casting to double(*)[3] is valid — the memory layout is identical. */
    transform((const double (*)[3]) mesh.centroids,
              globalCentres, cg, R, N, 1);
    transform((const double (*)[3]) mesh.normals,
              globalNorms,   cg, R, N, 0);

    /* Bounding box of transformed centroids */
    double zmax = -1e30, zmin = 1e30;
    for (int i = 0; i < N; i++) {
        if (globalCentres[i][2] > zmax) zmax = globalCentres[i][2];
        if (globalCentres[i][2] < zmin) zmin = globalCentres[i][2];
    }

    double radius   = (zmax - zmin) / 2.0;
    double volume   = (4.0/3.0) * M_PI * radius * radius * radius;
    double buoyancy = rho * g * volume;
    double weight   = m * g;

    /* 1% of buoyancy — accounts for sphere mesh discretisation error */
    double tol_f = 0.01 * buoyancy;
    double tol_m = tol_f * radius;

    printf("Sphere radius:   %.4f m\n",   radius);
    printf("Volume:          %.4f m^3\n", volume);
    printf("Buoyancy:        %.2f N\n",   buoyancy);
    printf("Weight:          %.2f N\n",   weight);
    printf("Force tolerance: %.2f N\n\n", tol_f);

    double fnlhs[6];
    int all_pass = 1;

    /* ----------------------------------------------------------------
     * Case 1: eta above sphere top — fully submerged, flat waterplane
     * ---------------------------------------------------------------- */
    printf("=== Case 1: fully submerged (eta = zmax + 1) ===\n");
    fill_eta(eta, N, zmax + 1.0);
    nl_hydrostatic(cg, rho, g, m, eta, globalCentres, globalNorms, mesh.areas, N, fnlhs);

    all_pass &= check     ("Fz = buoyancy - weight", fnlhs[2], buoyancy - weight, tol_f);
    all_pass &= check_zero("Fx = 0",                 fnlhs[0], tol_f);
    all_pass &= check_zero("Fy = 0",                 fnlhs[1], tol_f);
    all_pass &= check_zero("Mx = 0",                 fnlhs[3], tol_m);
    all_pass &= check_zero("My = 0",                 fnlhs[4], tol_m);
    all_pass &= check_zero("Mz = 0",                 fnlhs[5], tol_m);

    /* ----------------------------------------------------------------
     * Case 2: eta raised by +2m, sphere still fully submerged.
     * With p = -rho*g*z the pressure on each panel is unchanged by
     * raising eta — only the wetted panel set changes.  Since the sphere
     * is already fully submerged in Case 1, Fz must be identical.
     * ---------------------------------------------------------------- */
    printf("\n=== Case 2: raised waterplane (eta = zmax + 3), fully submerged ===\n");
    double fz_case1 = fnlhs[2];
    fill_eta(eta, N, zmax + 3.0);
    nl_hydrostatic(cg, rho, g, m, eta, globalCentres, globalNorms, mesh.areas, N, fnlhs);

    all_pass &= check     ("Fz = same as Case 1", fnlhs[2], fz_case1, tol_f);
    all_pass &= check_zero("Fx = 0",              fnlhs[0], tol_f);
    all_pass &= check_zero("Fy = 0",              fnlhs[1], tol_f);

    /* ----------------------------------------------------------------
     * Case 3: waterplane at sphere equator — half submerged.
     * Tolerance is looser (5%) due to binary panel cutoff at waterplane.
     * ---------------------------------------------------------------- */
    printf("\n=== Case 3: waterplane at equator (eta = z_centre), half submerged ===\n");
    double z_centre = (zmax + zmin) / 2.0;
    fill_eta(eta, N, z_centre);
    nl_hydrostatic(cg, rho, g, m, eta, globalCentres, globalNorms, mesh.areas, N, fnlhs);

    double tol_half = 0.05 * buoyancy;
    all_pass &= check     ("Fz ≈ buoyancy/2 - weight", fnlhs[2], buoyancy/2.0 - weight, tol_half);
    all_pass &= check_zero("Fx = 0",                    fnlhs[0], tol_f);
    all_pass &= check_zero("Fy = 0",                    fnlhs[1], tol_f);

    printf("\n%s\n", all_pass ? "ALL TESTS PASSED" : "SOME TESTS FAILED");

    free(globalCentres);
    free(globalNorms);
    free(eta);
    free_mesh(&mesh);

    return all_pass ? 0 : 1;
}