"""
Ocean Engineering Toolbox - Calling the Pre-Processing Function (Python)
"""
import os
from preprocess import preprocess

def main():
    current_path = os.getcwd()          # equivalent to MATLAB pwd
    file_path = 'rm3.h5'                # .h5 filename in the same folder
    device_name = 'rm3'                 # prefix for saved mat file

    hydro = preprocess(current_path, file_path, device_name)

if __name__ == "__main__":
    main()