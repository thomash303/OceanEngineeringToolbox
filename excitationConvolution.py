import numpy as np
import scipy.io as io
import pandas as pd


fileName = "hydroCoeff_6DoF_multibody.mat"
data = io.loadmat(fileName)

hydro = data['hydro']
coefficients = hydro['coefficients']
excitation = coefficients.flatten()[0]['excitation']
convolution = excitation.flatten()[0]['convolution']
K = convolution.flatten()[0]['K'].flatten()[0]
t = convolution.flatten()[0]['ex_t'].flatten()[0]

print(K[1,:])

testdata = {
     "py": {  # Structure name
            "my_vector": [1, 2, 3],  # First list
                     "second": [4, 5, 6]  # Second list
                         }
                         }
io.savemat("python.mat",testdata)