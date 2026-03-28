#ifndef MESHING_H
#define MESHING_H

#include <stddef.h>

typedef struct {
    int     n_panels;   /* number of triangles                          */
    double *centroids;  /* flat [n_panels * 3]: x0,y0,z0, x1,y1,z1 ... */
    double *normals;    /* flat [n_panels * 3]: nx0,ny0,nz0, ...        */
    double *areas;      /* flat [n_panels]:     area0, area1, ...       */
} Mesh;

/* Accessor macros */
#define CENTROID_X(m, i)  ((m)->centroids[(i)*3 + 0])
#define CENTROID_Y(m, i)  ((m)->centroids[(i)*3 + 1])
#define CENTROID_Z(m, i)  ((m)->centroids[(i)*3 + 2])
#define NORMAL_X(m, i)    ((m)->normals  [(i)*3 + 0])
#define NORMAL_Y(m, i)    ((m)->normals  [(i)*3 + 1])
#define NORMAL_Z(m, i)    ((m)->normals  [(i)*3 + 2])

Mesh load_stl(const char *file_path);
void free_mesh(Mesh *m);
void print_mesh_info(const Mesh *m);

#endif /* MESHING_H */