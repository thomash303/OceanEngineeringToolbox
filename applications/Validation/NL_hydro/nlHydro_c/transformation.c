/**
 * transformation.c
 * Coordinate transformation between body and global frames.
 *
 * Arrays are stored column-major to match numpy's default layout for
 * transposed arrays: element [row r, col c] of an MxN matrix lives at
 * index [r + M*c].
 *
 * For a 3xN matrix:  element(row, col) = array[row + 3*col]
 */

#include "transformation.h"

void transform(
    const double  bodyCoords[][3],
    double        globalCoords[][3],
    const double  cg[3],
    const double  R[3][3],
    int           N,
    int           isPoints)
{
    /*
     * bodyCoords[i][c]  = component c of panel i in body frame
     * globalCoords[i][r] = component r of panel i in global frame
     *
     * globalCoords[i][r] = sum_c( R[r][c] * bodyCoords[i][c] ) + w * cg[r]
     */
    double w = isPoints ? 1.0 : 0.0;

    for (int i = 0; i < N; i++) {
        for (int r = 0; r < 3; r++) {
            double val = w * cg[r];
            for (int c = 0; c < 3; c++) {
                val += R[r][c] * bodyCoords[i][c];
            }
            globalCoords[i][r] = val;
        }
    }
}