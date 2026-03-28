#ifndef MESHING_H
#define MESHING_H

/**
 * meshing.h
 * Binary and ASCII STL mesh loader.
 *
 * Produces per-triangle:
 *   centroids  [N][3]  — triangle centroid (mean of 3 vertices)
 *   normals    [N][3]  — outward unit normal (computed from vertices,
 *                        not the stored normal, for accuracy)
 *   areas      [N]     — triangle area (m^2)
 *
 * Memory is heap-allocated inside load_stl() and must be freed by the
 * caller using free_mesh().
 */

#include <stddef.h>   /* size_t */

/* ------------------------------------------------------------------ */
/* Mesh data structure                                                  */
/* ------------------------------------------------------------------ */
typedef struct {
    int      n_panels;    /* number of triangles                       */
    double (*centroids)[3]; /* [n_panels][3] centroid x,y,z            */
    double (*normals)[3];   /* [n_panels][3] unit outward normal        */
    double  *areas;         /* [n_panels]    triangle area (m^2)        */
} Mesh;

/* ------------------------------------------------------------------ */
/* Public API                                                           */
/* ------------------------------------------------------------------ */

/**
 * Load a binary or ASCII STL file.
 *
 * Computes centroids, normals, and areas from the vertex data.
 * Returns a heap-allocated Mesh.  Returns a zeroed Mesh (n_panels=0,
 * all pointers NULL) on failure — check mesh.n_panels before use.
 *
 * @param file_path   Path to the .stl file
 * @return            Populated Mesh struct
 */
Mesh load_stl(const char *file_path);

/**
 * Free all heap memory owned by a Mesh returned from load_stl().
 * Safe to call on a zeroed / failed Mesh.
 */
void free_mesh(Mesh *m);

/**
 * Print a short summary of the mesh to stdout.
 */
void print_mesh_info(const Mesh *m);

#endif /* MESHING_H */