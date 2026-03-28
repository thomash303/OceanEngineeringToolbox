/**
 * test_transformation.c
 *
 * Build:
 *   gcc -Wall -O2 -o test_transform test_transformation.c transformation.c -lm
 */
 
#include <stdio.h>
#include "transformation.h"
 
#define N_PTS 3
 
void print_matrix(const char *label, double mat[][3], int n)
{
    printf("%s:\n", label);
    for (int i = 0; i < n; i++) {
        printf("  panel %d:  x=%7.3f  y=%7.3f  z=%7.3f\n",
               i, mat[i][0], mat[i][1], mat[i][2]);
    }
    printf("\n");
}
 
int main(void)
{
    /*
     * Each row is one panel's (x, y, z) in the body frame.
     *   panel 0: (0, 0, 0)
     *   panel 1: (1, 1, 1)
     *   panel 2: (2, 2, 2)
     */
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
 
    const double cg[3]   = { 0.0, 0.0, -0.5 };
    const double R[3][3] = { {1,0,0}, {0,1,0}, {0,0,1} };
 
    double globalCentres[N_PTS][3];
    double globalNorm   [N_PTS][3];
 
    transform(bodyCentres, globalCentres, cg, R, N_PTS, 1); /* points */
    transform(bodyNorm,    globalNorm,    cg, R, N_PTS, 0); /* directions */
 
    print_matrix("Global Centres", globalCentres, N_PTS);
    print_matrix("Global Normals", globalNorm,    N_PTS);
 
    /*
     * Expected (identity R, cg = (0, 0, -0.5)):
     *   Centres: global = body + cg
     *     panel 0: ( 0.000,  0.000, -0.500)
     *     panel 1: ( 1.000,  1.000,  0.500)
     *     panel 2: ( 2.000,  2.000,  1.500)
     *   Normals: no translation applied
     *     panel 0: (1, 0, 0)
     *     panel 1: (0, 1, 0)
     *     panel 2: (0, 0, 1)
     */
 
    return 0;
}