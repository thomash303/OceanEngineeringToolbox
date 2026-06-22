"""Coordinate transformation functions."""

import numpy as np

def homogeneous_transformation(bodyCoordinates, cg, R, vectorType):
    """Apply a homogeneous transformation to the given coordinates.

    Args:
        bodyCoordinates (ndarray): 3xN array of body-frame coordinates.
        cg (array-like): 3-vector translation (origin of body in global).
        R (ndarray): 3x3 rotation matrix from body to global frame.
        vectorType (str): Either "points" (w=1) or "directions" (w=0).

    Returns:
        ndarray: 3xN array of global-frame coordinates/vectors.
    """

    n = bodyCoordinates.shape[1]

    if vectorType == "points":
        w = np.ones((1, n))
    elif vectorType == "directions":
        w = np.zeros((1, n))

    bodyCoordinates = np.vstack((bodyCoordinates, w))

    T = np.eye(4)
    T[:3, :3] = R
    T[:3, 3]  = cg

    globalCoordinates = T @ bodyCoordinates

    return globalCoordinates[:3, :]