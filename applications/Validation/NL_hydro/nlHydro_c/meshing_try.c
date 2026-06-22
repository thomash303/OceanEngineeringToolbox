/**
 * meshing.c
 * Binary and ASCII STL loader.
 *
 * Per-triangle geometry computed from vertices:
 *   centroid = (v0 + v1 + v2) / 3
 *   normal   = unit(e1 x e2),  e1 = v1-v0,  e2 = v2-v0
 *   area     = |e1 x e2| / 2
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <ctype.h>

#include "meshing.h"

/* ------------------------------------------------------------------ */
/* Helpers                                                              */
/* ------------------------------------------------------------------ */

static float read_float32_le(const unsigned char *buf)
{
    float f;
    memcpy(&f, buf, 4);
    return f;
}

static unsigned int read_uint32_le(const unsigned char *buf)
{
    return (unsigned int)buf[0]
         | ((unsigned int)buf[1] << 8)
         | ((unsigned int)buf[2] << 16)
         | ((unsigned int)buf[3] << 24);
}

static void cross3(const double a[3], const double b[3], double out[3])
{
    out[0] = a[1]*b[2] - a[2]*b[1];
    out[1] = a[2]*b[0] - a[0]*b[2];
    out[2] = a[0]*b[1] - a[1]*b[0];
}

static void triangle_geometry(
    const double v0[3], const double v1[3], const double v2[3],
    double centroid[3], double normal[3], double *area)
{
    centroid[0] = (v0[0] + v1[0] + v2[0]) / 3.0;
    centroid[1] = (v0[1] + v1[1] + v2[1]) / 3.0;
    centroid[2] = (v0[2] + v1[2] + v2[2]) / 3.0;

    double e1[3], e2[3], cr[3];
    e1[0] = v1[0]-v0[0];  e1[1] = v1[1]-v0[1];  e1[2] = v1[2]-v0[2];
    e2[0] = v2[0]-v0[0];  e2[1] = v2[1]-v0[1];  e2[2] = v2[2]-v0[2];
    cross3(e1, e2, cr);

    double mag = sqrt(cr[0]*cr[0] + cr[1]*cr[1] + cr[2]*cr[2]);
    *area = 0.5 * mag;

    if (mag > 1e-14) {
        normal[0] = cr[0] / mag;
        normal[1] = cr[1] / mag;
        normal[2] = cr[2] / mag;
    } else {
        normal[0] = normal[1] = normal[2] = 0.0;
    }
}

static int alloc_mesh(Mesh *m, int n)
{
    m->n_panels  = n;
    m->centroids = (double *) malloc((size_t)n * 3 * sizeof(double));
    m->normals   = (double *) malloc((size_t)n * 3 * sizeof(double));
    m->areas     = (double *) malloc((size_t)n     * sizeof(double));

    if (!m->centroids || !m->normals || !m->areas) {
        free_mesh(m);
        return 0;
    }
    return 1;
}

/* ------------------------------------------------------------------ */
/* Binary STL                                                           */
/* ------------------------------------------------------------------ */

static int is_binary_stl(FILE *fp, long file_size)
{
    unsigned char header[84];
    rewind(fp);
    if (fread(header, 1, 84, fp) < 84) { rewind(fp); return 0; }

    unsigned int n = read_uint32_le(header + 80);
    rewind(fp);

    if (84L + (long)n * 50L == file_size && n > 0) return 1;

    char prefix[6] = {0};
    size_t nr = fread(prefix, 1, 5, fp);
    rewind(fp);
    if (nr < 5) return 0;
    return (strncmp(prefix, "solid", 5) != 0);
}

static Mesh load_binary_stl(FILE *fp)
{
    Mesh m = {0, NULL, NULL, NULL};
    unsigned char buf[84];

    if (fread(buf, 1, 84, fp) < 84) {
        fprintf(stderr, "meshing: failed to read binary header\n");
        return m;
    }

    unsigned int n_tri = read_uint32_le(buf + 80);
    if (n_tri == 0 || !alloc_mesh(&m, (int)n_tri)) return m;

    unsigned char tb[50];
    for (unsigned int i = 0; i < n_tri; i++) {
        if (fread(tb, 1, 50, fp) < 50) {
            fprintf(stderr, "meshing: unexpected EOF at triangle %u\n", i);
            free_mesh(&m);
            return m;
        }
        double v0[3], v1[3], v2[3];
        v0[0] = read_float32_le(tb+12); v0[1] = read_float32_le(tb+16); v0[2] = read_float32_le(tb+20);
        v1[0] = read_float32_le(tb+24); v1[1] = read_float32_le(tb+28); v1[2] = read_float32_le(tb+32);
        v2[0] = read_float32_le(tb+36); v2[1] = read_float32_le(tb+40); v2[2] = read_float32_le(tb+44);
        triangle_geometry(v0, v1, v2, &m.centroids[i*3], &m.normals[i*3], &m.areas[i]);
    }
    return m;
}

/* ------------------------------------------------------------------ */
/* ASCII STL                                                            */
/* ------------------------------------------------------------------ */

static int expect_keyword(FILE *fp, const char *keyword)
{
    char word[64];
    if (fscanf(fp, "%63s", word) != 1) return 0;
    return (strncmp(word, keyword, strlen(keyword)) == 0);
}

static Mesh load_ascii_stl(FILE *fp)
{
    Mesh m = {0, NULL, NULL, NULL};
    char line[256];

    /* First pass: count facets */
    rewind(fp);
    int n_tri = 0;
    while (fgets(line, sizeof(line), fp)) {
        const char *p = line;
        while (isspace((unsigned char)*p)) p++;
        if (strncmp(p, "facet", 5) == 0) n_tri++;
    }
    if (n_tri == 0 || !alloc_mesh(&m, n_tri)) return m;

    /* Second pass: read vertices */
    rewind(fp);
    char *_hdr = fgets(line, sizeof(line), fp); (void)_hdr;

    for (int i = 0; i < n_tri; i++) {
        double v0[3], v1[3], v2[3], nx, ny, nz;
        if (!expect_keyword(fp, "facet"))   goto parse_error;
        if (!expect_keyword(fp, "normal"))  goto parse_error;
        if (fscanf(fp, "%lf %lf %lf", &nx, &ny, &nz) != 3) goto parse_error;
        if (!expect_keyword(fp, "outer"))   goto parse_error;
        if (!expect_keyword(fp, "loop"))    goto parse_error;
        if (!expect_keyword(fp, "vertex"))  goto parse_error;
        if (fscanf(fp, "%lf %lf %lf", &v0[0], &v0[1], &v0[2]) != 3) goto parse_error;
        if (!expect_keyword(fp, "vertex"))  goto parse_error;
        if (fscanf(fp, "%lf %lf %lf", &v1[0], &v1[1], &v1[2]) != 3) goto parse_error;
        if (!expect_keyword(fp, "vertex"))  goto parse_error;
        if (fscanf(fp, "%lf %lf %lf", &v2[0], &v2[1], &v2[2]) != 3) goto parse_error;
        if (!expect_keyword(fp, "endloop")) goto parse_error;
        if (!expect_keyword(fp, "endfacet"))goto parse_error;
        triangle_geometry(v0, v1, v2, &m.centroids[i*3], &m.normals[i*3], &m.areas[i]);
    }
    return m;

parse_error:
    fprintf(stderr, "meshing: parse error in ASCII STL\n");
    free_mesh(&m);
    return m;
}

/* ------------------------------------------------------------------ */
/* Public API                                                           */
/* ------------------------------------------------------------------ */

Mesh load_stl(const char *file_path)
{
    Mesh m = {0, NULL, NULL, NULL};

    FILE *fp = fopen(file_path, "rb");
    if (!fp) {
        fprintf(stderr, "meshing: cannot open '%s'\n", file_path);
        return m;
    }

    fseek(fp, 0, SEEK_END);
    long file_size = ftell(fp);
    rewind(fp);

    if (is_binary_stl(fp, file_size))
        m = load_binary_stl(fp);
    else
        m = load_ascii_stl(fp);

    fclose(fp);

    if (m.n_panels > 0)
        printf("meshing: loaded %d panels from '%s'\n", m.n_panels, file_path);

    return m;
}

void free_mesh(Mesh *m)
{
    if (!m) return;
    free(m->centroids); m->centroids = NULL;
    free(m->normals);   m->normals   = NULL;
    free(m->areas);     m->areas     = NULL;
    m->n_panels = 0;
}

void print_mesh_info(const Mesh *m)
{
    if (!m || m->n_panels == 0) { printf("mesh: empty\n"); return; }

    double xmin=1e30, xmax=-1e30, ymin=1e30, ymax=-1e30, zmin=1e30, zmax=-1e30;
    double total_area = 0.0;
    for (int i = 0; i < m->n_panels; i++) {
        double x = m->centroids[i*3+0];
        double y = m->centroids[i*3+1];
        double z = m->centroids[i*3+2];
        if (x < xmin) xmin = x;
        if (x > xmax) xmax = x;
        if (y < ymin) ymin = y;
        if (y > ymax) ymax = y;
        if (z < zmin) zmin = z;
        if (z > zmax) zmax = z;
        total_area += m->areas[i];
    }

    printf("Mesh: %d panels\n", m->n_panels);
    printf("  Bounding box: x[%.4f, %.4f]  y[%.4f, %.4f]  z[%.4f, %.4f]\n",
           xmin, xmax, ymin, ymax, zmin, zmax);
    printf("  Total area: %.4f m^2\n", total_area);
}