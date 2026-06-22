"""Meshing functions."""

import numpy as np
from stl import mesh
from mpl_toolkits import mplot3d
from matplotlib import pyplot

def visualize_stl(file_path):
    """Visualize an STL mesh file.

    Args:
        file_path (str): Path to the STL file.
    """
    # Create figure and 3D axes
    figure = pyplot.figure(figsize=(10, 7))
    axes = figure.add_subplot(111, projection='3d')

    # Load the STL file
    your_mesh = load_stl(file_path)

    # Create the 3D polygon collection
    collection = mplot3d.art3d.Poly3DCollection(your_mesh.vectors, 
                                                alpha=0.7,
                                                edgecolor='black',
                                                facecolor='cyan')
    axes.add_collection3d(collection)

    # Set axis limits properly
    x_min, x_max = your_mesh.x.min(), your_mesh.x.max()
    y_min, y_max = your_mesh.y.min(), your_mesh.y.max()
    z_min, z_max = your_mesh.z.min(), your_mesh.z.max()

    axes.set_xlim(x_min, x_max)
    axes.set_ylim(y_min, y_max)
    axes.set_zlim(z_min, z_max)

    # Add labels
    axes.set_xlabel('X')
    axes.set_ylabel('Y')
    axes.set_zlabel('Z')
    axes.set_title('STL Mesh Visualization')

    # Equal aspect ratio
    max_range = max(x_max - x_min, y_max - y_min, z_max - z_min) / 2.0
    mid_x = (x_max + x_min) / 2.0
    mid_y = (y_max + y_min) / 2.0
    mid_z = (z_max + z_min) / 2.0

    axes.set_xlim(mid_x - max_range, mid_x + max_range)
    axes.set_ylim(mid_y - max_range, mid_y + max_range)
    axes.set_zlim(mid_z - max_range, mid_z + max_range)

    pyplot.show()


def load_stl(file_path):
    """Load an STL mesh file and extract centres, normals, and areas.
    Args:
        file_path (str): Path to the STL file.

    Returns:
        mesh:
    """
    meshes = mesh.Mesh.from_file(file_path)
    return meshes
