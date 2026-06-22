#ifndef TRANSFORMATION_H
#define TRANSFORMATION_H

/**
 * transformation.h
 * Coordinate transformation between body and global frames.
 */

/**
 * Apply a homogeneous transformation to body-frame coordinates.
 *
 * Arrays are [N][3] — each row is one panel's (x, y, z).
 * This layout is identical in memory to a column-major [3 x N] matrix,
 * so bodyCoords[panel][0/1/2] gives x, y, z for that panel directly.
 *
 * @param bodyCoords   Input  [N][3]: bodyCoords[panel][xyz]
 * @param globalCoords Output [N][3]: globalCoords[panel][xyz]
 * @param cg           3-vector: origin of body frame in global frame (translation)
 * @param R            3x3 rotation matrix (body -> global), accessed as R[row][col]
 * @param N            Number of panels/points
 * @param isPoints     1 for points (translation applied), 0 for directions (rotation only)
 */
void transform(
    const double  bodyCoords[][3],
    double        globalCoords[][3],
    const double  cg[3],
    const double  R[3][3],
    int           N,
    int           isPoints
);

#endif /* TRANSFORMATION_H */