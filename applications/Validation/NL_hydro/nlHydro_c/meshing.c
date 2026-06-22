/**
 * meshing.c
 * Binary and ASCII STL mesh loader — no external libraries required.
 *
 * STL file formats
 * ----------------
 * Binary STL layout (little-endian):
 *   80 bytes  — header (ignored)
 *    4 bytes  — uint32  number of triangles
 *   Per triangle (50 bytes):
 *    12 bytes — float32[3]  stored normal   (we recompute from vertices)
 *    12 bytes — float32[3]  vertex 0
 *    12 bytes — float32[3]  vertex 1
 *    12 bytes — float32[3]  vertex 2
 *     2 bytes — uint16      attribute byte count (ignored)
 *
 * ASCII STL layout:
 *   solid <name>
 *     facet normal nx ny nz
 *       outer loop
 *         vertex x y z
 *         vertex x y z
 *         vertex x y z
 *       endloop
 *     endfacet
 *     ...
 *   endsolid
 *
 * Per-triangle geometry
 * ---------------------
 * Given vertices v0, v1, v2:
 *
 *   centroid = (v0 + v1 + v2) / 3
 *
 *   edge1    = v1 - v0
 *   edge2    = v2 - v0
 *   cross    = edge1 × edge2          (right-hand rule)
 *   area     = |cross| / 2
 *   normal   = cross / |cross|        (unit vector)
 *
 * The cross product direction follows the winding order in the STL file.
 * STL convention is outward normals with counter-clockwise winding when
 * viewed from outside — so the computed normal points outward provided
 * the mesh was exported with correct winding.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <ctype.h>

#include "meshing.h"

/* ------------------------------------------------------------------ */
/* Internal helpers                                                     */
/* ------------------------------------------------------------------ */

/* Read a little-endian float32 from 4 raw bytes */
static float read_float32_le(const unsigned char *buf)
{
    float f;
    memcpy(&f, buf, 4);   /* safe type-pun via memcpy */
    return f;
}

/* Read a little-endian uint32 from 4 raw bytes */
static unsigned int read_uint32_le(const unsigned char *buf)
{
    return (unsigned int)buf[0]
         | ((unsigned int)buf[1] << 8)
         | ((unsigned int)buf[2] << 16)
         | ((unsigned int)buf[3] << 24);
}

/* 3-vector cross product: out = a x b */
static void cross3(const double a[3], const double b[3], double out[3])
{
    out[0] = a[1] * b[2] - a[2] * b[1];
    out[1] = a[2] * b[0] - a[0] * b[2];
    out[2] = a[0] * b[1] - a[1] * b[0];
}

/* Compute centroid, unit normal, and area from three vertices */
static void triangle_geometry(
    const double v0[3], const double v1[3], const double v2[3],
    double centroid[3], double normal[3], double *area)
{
    /* Centroid: mean of the three vertices */
    centroid[0] = (v0[0] + v1[0] + v2[0]) / 3.0;
    centroid[1] = (v0[1] + v1[1] + v2[1]) / 3.0;
    centroid[2] = (v0[2] + v1[2] + v2[2]) / 3.0;

    /* Edge vectors from v0 */
    double e1[3], e2[3];
    e1[0] = v1[0] - v0[0];  e1[1] = v1[1] - v0[1];  e1[2] = v1[2] - v0[2];
    e2[0] = v2[0] - v0[0];  e2[1] = v2[1] - v0[1];  e2[2] = v2[2] - v0[2];

    /* Cross product gives a vector perpendicular to the triangle,
     * with magnitude equal to twice the triangle area */
    double cr[3];
    cross3(e1, e2, cr);

    double mag = sqrt(cr[0]*cr[0] + cr[1]*cr[1] + cr[2]*cr[2]);

    *area = 0.5 * mag;

    /* Unit normal — guard against degenerate (zero-area) triangles */
    if (mag > 1e-14) {
        normal[0] = cr[0] / mag;
        normal[1] = cr[1] / mag;
        normal[2] = cr[2] / mag;
    } else {
        normal[0] = 0.0;
        normal[1] = 0.0;
        normal[2] = 0.0;
    }
}

/* ------------------------------------------------------------------ */
/* Allocate mesh arrays for n triangles                                 */
/* ------------------------------------------------------------------ */
static int alloc_mesh(Mesh *m, int n)
{
    m->n_panels  = n;

    /* Each array holds n triples of doubles.
     * Cast to double(*)[3] so m->centroids[i][0/1/2] works correctly. */
    m->centroids = (double (*)[3]) malloc((size_t)n * 3 * sizeof(double));
    m->normals   = (double (*)[3]) malloc((size_t)n * 3 * sizeof(double));
    m->areas     = (double *)      malloc((size_t)n     * sizeof(double));

    if (!m->centroids || !m->normals || !m->areas) {
        free(m->centroids);
        free(m->normals);
        free(m->areas);
        m->n_panels  = 0;
        m->centroids = NULL;
        m->normals   = NULL;
        m->areas     = NULL;
        return 0;
    }
    return 1;
}

/* ------------------------------------------------------------------ */
/* Detect whether an STL file is binary or ASCII                        */
/* ------------------------------------------------------------------ */
static int is_binary_stl(FILE *fp, long file_size)
{
    /*
     * Heuristic: ASCII STL always starts with "solid".
     * Binary STL sometimes also starts with "solid" in the header,
     * so we use a second check: if the triangle count from the binary
     * header is consistent with the file size, it is binary.
     *
     * Binary file size = 80 (header) + 4 (count) + count * 50
     */
    unsigned char header[84];
    rewind(fp);
    if (fread(header, 1, 84, fp) < 84) {
        rewind(fp);
        return 0;   /* too small — treat as ASCII */
    }

    unsigned int n = read_uint32_le(header + 80);
    long expected  = 84L + (long)n * 50L;

    rewind(fp);

    if (expected == file_size && n > 0) {
        return 1;   /* binary */
    }

    /* Check for "solid" prefix as ASCII indicator */
    char prefix[6] = {0};
    size_t n_read = fread(prefix, 1, 5, fp);
    rewind(fp);
    if (n_read < 5) return 0;  /* too short to be valid binary */

    return (strncmp(prefix, "solid", 5) != 0);  /* not "solid" -> binary */
}

/* ------------------------------------------------------------------ */
/* Binary STL reader                                                    */
/* ------------------------------------------------------------------ */
static Mesh load_binary_stl(FILE *fp)
{
    Mesh m = {0, NULL, NULL, NULL};

    unsigned char buf[84];
    if (fread(buf, 1, 84, fp) < 84) {
        fprintf(stderr, "meshing: failed to read binary STL header\n");
        return m;
    }

    unsigned int n_tri = read_uint32_le(buf + 80);
    if (n_tri == 0) {
        fprintf(stderr, "meshing: binary STL reports 0 triangles\n");
        return m;
    }

    if (!alloc_mesh(&m, (int)n_tri)) {
        fprintf(stderr, "meshing: out of memory allocating %u triangles\n", n_tri);
        return m;
    }

    unsigned char tri_buf[50];
    for (unsigned int i = 0; i < n_tri; i++) {
        if (fread(tri_buf, 1, 50, fp) < 50) {
            fprintf(stderr, "meshing: unexpected EOF at triangle %u\n", i);
            free_mesh(&m);
            return m;
        }

        /* Bytes 0-11: stored normal (skipped — we recompute)
         * Bytes 12-23: vertex 0
         * Bytes 24-35: vertex 1
         * Bytes 36-47: vertex 2
         * Bytes 48-49: attribute (skipped)                          */
        double v0[3], v1[3], v2[3];
        v0[0] = read_float32_le(tri_buf + 12);
        v0[1] = read_float32_le(tri_buf + 16);
        v0[2] = read_float32_le(tri_buf + 20);
        v1[0] = read_float32_le(tri_buf + 24);
        v1[1] = read_float32_le(tri_buf + 28);
        v1[2] = read_float32_le(tri_buf + 32);
        v2[0] = read_float32_le(tri_buf + 36);
        v2[1] = read_float32_le(tri_buf + 40);
        v2[2] = read_float32_le(tri_buf + 44);

        triangle_geometry(v0, v1, v2,
                          m.centroids[i], m.normals[i], &m.areas[i]);
    }

    return m;
}

/* ------------------------------------------------------------------ */
/* ASCII STL reader                                                     */
/* ------------------------------------------------------------------ */

/* Skip whitespace and read past a required keyword.
 * Returns 1 on success, 0 if the keyword was not found. */
static int expect_keyword(FILE *fp, const char *keyword)
{
    char word[64];
    if (fscanf(fp, "%63s", word) != 1) return 0;
    return (strncmp(word, keyword, strlen(keyword)) == 0);
}

static Mesh load_ascii_stl(FILE *fp)
{
    Mesh m = {0, NULL, NULL, NULL};

    /* --- First pass: count triangles --- */
    rewind(fp);
    int n_tri = 0;
    char line[256];
    while (fgets(line, sizeof(line), fp)) {
        /* Trim leading whitespace */
        const char *p = line;
        while (isspace((unsigned char)*p)) p++;
        if (strncmp(p, "facet", 5) == 0) n_tri++;
    }

    if (n_tri == 0) {
        fprintf(stderr, "meshing: no facets found in ASCII STL\n");
        return m;
    }

    if (!alloc_mesh(&m, n_tri)) {
        fprintf(stderr, "meshing: out of memory for %d triangles\n", n_tri);
        return m;
    }

    /* --- Second pass: read vertices --- */
    rewind(fp);

    /* Skip "solid <name>" line */
    char *_hdr = fgets(line, sizeof(line), fp); (void)_hdr;

    for (int i = 0; i < n_tri; i++) {
        double v0[3], v1[3], v2[3];

        /* "facet normal nx ny nz" — we skip the stored normal */
        if (!expect_keyword(fp, "facet")) goto parse_error;
        if (!expect_keyword(fp, "normal")) goto parse_error;
        double nx, ny, nz;
        if (fscanf(fp, "%lf %lf %lf", &nx, &ny, &nz) != 3) goto parse_error;

        /* "outer loop" */
        if (!expect_keyword(fp, "outer")) goto parse_error;
        if (!expect_keyword(fp, "loop"))  goto parse_error;

        /* Three vertices */
        if (!expect_keyword(fp, "vertex")) goto parse_error;
        if (fscanf(fp, "%lf %lf %lf", &v0[0], &v0[1], &v0[2]) != 3) goto parse_error;
        if (!expect_keyword(fp, "vertex")) goto parse_error;
        if (fscanf(fp, "%lf %lf %lf", &v1[0], &v1[1], &v1[2]) != 3) goto parse_error;
        if (!expect_keyword(fp, "vertex")) goto parse_error;
        if (fscanf(fp, "%lf %lf %lf", &v2[0], &v2[1], &v2[2]) != 3) goto parse_error;

        /* "endloop" */
        if (!expect_keyword(fp, "endloop"))  goto parse_error;
        /* "endfacet" */
        if (!expect_keyword(fp, "endfacet")) goto parse_error;

        triangle_geometry(v0, v1, v2,
                          m.centroids[i], m.normals[i], &m.areas[i]);
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

    /* Get file size */
    fseek(fp, 0, SEEK_END);
    long file_size = ftell(fp);
    rewind(fp);

    if (is_binary_stl(fp, file_size)) {
        m = load_binary_stl(fp);
    } else {
        m = load_ascii_stl(fp);
    }

    fclose(fp);

    if (m.n_panels > 0) {
        printf("meshing: loaded %d triangles from '%s'\n", m.n_panels, file_path);
    }

    return m;
}

void free_mesh(Mesh *m)
{
    if (!m) return;
    free(m->centroids);
    free(m->normals);
    free(m->areas);
    m->centroids = NULL;
    m->normals   = NULL;
    m->areas     = NULL;
    m->n_panels  = 0;
}

void print_mesh_info(const Mesh *m)
{
    if (!m || m->n_panels == 0) {
        printf("mesh: empty or failed\n");
        return;
    }

    printf("Mesh: %d panels\n", m->n_panels);

    /* Bounding box */
    double xmin =  1e30, xmax = -1e30;
    double ymin =  1e30, ymax = -1e30;
    double zmin =  1e30, zmax = -1e30;
    double total_area = 0.0;

    for (int i = 0; i < m->n_panels; i++) {
        double x = m->centroids[i][0];
        double y = m->centroids[i][1];
        double z = m->centroids[i][2];
        if (x < xmin) xmin = x;
        if (x > xmax) xmax = x;
        if (y < ymin) ymin = y;
        if (y > ymax) ymax = y;
        if (z < zmin) zmin = z;
        if (z > zmax) zmax = z;
        total_area += m->areas[i];
    }

    printf("  Bounding box:  x [%.4f, %.4f]  y [%.4f, %.4f]  z [%.4f, %.4f]\n",
           xmin, xmax, ymin, ymax, zmin, zmax);
    printf("  Total surface area: %.4f m^2\n", total_area);

    /* All panels */
    printf("  Panels (centroid | normal | area):\n");
    for (int i = 0; i < m->n_panels; i++) {
        printf("    [%4d]  c(%8.4f %8.4f %8.4f)  n(%7.4f %7.4f %7.4f)  a=%.6f\n",
               i,
               m->centroids[i][0], m->centroids[i][1], m->centroids[i][2],
               m->normals  [i][0], m->normals  [i][1], m->normals  [i][2],
               m->areas    [i]);
    }
}