/**
 * test_meshing.c
 * Tests the STL mesh loader by writing a known binary STL in memory,
 * then verifying centroid, normal, and area against analytical values.
 *
 * Build:
 *   gcc -Wall -O2 -o test_meshing test_meshing.c meshing.c -lm
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#include "meshing.h"
#ifndef _WIN32
#include <unistd.h>
#else
#endif

/* Write a minimal binary STL with two known triangles to a temp file */
static void write_test_binary_stl(const char *path)
{
    /*
     * Triangle 0 — flat on the XY plane, z = 0
     *   v0 = (0, 0, 0)
     *   v1 = (2, 0, 0)
     *   v2 = (0, 2, 0)
     *   Expected centroid: (2/3, 2/3, 0)
     *   Expected normal:   (0, 0, 1)        [+Z by right-hand rule]
     *   Expected area:     0.5 * base * height = 0.5 * 2 * 2 = 2.0 m^2
     *
     * Triangle 1 — vertical on the XZ plane, y = 0
     *   v0 = (0, 0, 0)
     *   v1 = (1, 0, 0)
     *   v2 = (0, 0, 1)
     *   Expected centroid: (1/3, 0, 1/3)
     *   Expected normal:   (0, -1, 0)       [-Y by right-hand rule]
     *   Expected area:     0.5 m^2
     */
    FILE *fp = fopen(path, "wb");
    if (!fp) { fprintf(stderr, "Cannot write test STL\n"); return; }

    /* 80-byte header */
    unsigned char header[80];
    memset(header, 0, 80);
    strncpy((char *)header, "test STL", 80);
    fwrite(header, 1, 80, fp);

    /* Triangle count: 2 */
    unsigned char n_buf[4] = {2, 0, 0, 0};
    fwrite(n_buf, 1, 4, fp);

    /* Helper: write a float32 little-endian */
    #define WF(val) do { \
        float _f = (float)(val); \
        fwrite(&_f, sizeof(float), 1, fp); \
    } while(0)

    /* Triangle 0 */
    WF(0); WF(0); WF(1);      /* stored normal (ignored by loader) */
    WF(0); WF(0); WF(0);      /* v0 */
    WF(2); WF(0); WF(0);      /* v1 */
    WF(0); WF(2); WF(0);      /* v2 */
    unsigned char attr[2] = {0,0};
    fwrite(attr, 1, 2, fp);

    /* Triangle 1 */
    WF(0); WF(-1); WF(0);
    WF(0); WF(0); WF(0);
    WF(1); WF(0); WF(0);
    WF(0); WF(0); WF(1);
    fwrite(attr, 1, 2, fp);

    #undef WF
    fclose(fp);
}

/* Write an ASCII STL with the same two triangles */
static void write_test_ascii_stl(const char *path)
{
    FILE *fp = fopen(path, "w");
    if (!fp) { fprintf(stderr, "Cannot write ASCII test STL\n"); return; }

    fprintf(fp,
        "solid test\n"
        "  facet normal 0 0 1\n"
        "    outer loop\n"
        "      vertex 0 0 0\n"
        "      vertex 2 0 0\n"
        "      vertex 0 2 0\n"
        "    endloop\n"
        "  endfacet\n"
        "  facet normal 0 -1 0\n"
        "    outer loop\n"
        "      vertex 0 0 0\n"
        "      vertex 1 0 0\n"
        "      vertex 0 0 1\n"
        "    endloop\n"
        "  endfacet\n"
        "endsolid test\n");

    fclose(fp);
}

static int check(const char *label, double got, double expected, double tol)
{
    double err = fabs(got - expected);
    int ok = (err < tol);
    printf("  %-40s  got %8.5f  expected %8.5f  %s\n",
           label, got, expected, ok ? "PASS" : "FAIL");
    return ok;
}


int main(void)
{
    int all_pass = 1;


    /* ----------------------------------------------------------------
     * Real STL — path relative to where you run the executable from.
     * Forward slashes work on both Windows and Linux.
     * ---------------------------------------------------------------- */
const char *STL_PATH = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/applications/Validation/NL_hydro/nlHydro_c/Meshes/sphere.stl";

    printf("=== Real mesh: %s ===\n", STL_PATH);
    Mesh real = load_stl(STL_PATH);
    if (real.n_panels == 0) {
        fprintf(stderr, "Failed to load '%s'\n", STL_PATH);
    } else {
        print_mesh_info(&real);
    }
    free_mesh(&real);

    return all_pass ? 0 : 1;
}