import os
import h5py
import numpy as np
from scipy.io import savemat
from scipy.linalg import block_diag


def _read_scalar(ds):
    v = ds[()]
    if isinstance(v, bytes):
        return v.decode()
    return v

def preprocess(current_path, file_path, device_name):
    """
    Ocean Engineering Toolbox - Pre-Processing Function
    Pre-process BEM-generated hydrodynamic data and save in the current directory. 
    Functionality based on WEC-Sim's BEMIO and library classes, but written in Python.

    Inputs:
        current_path : str (description: current working directory)
        file_path : str (description: path to the input HDF5 file)
        device_name : str (description: name of the device to save data under)

    The default filenames are:
        Output file:           '___.h5'
        Output structure:      'deviceNamehydroCoeff.mat'

    """

    # Build full file path
    filepath = os.path.join(current_path, file_path)
    hydro = {}

    ## === HEADER ==================================================
    try:
        with h5py.File(filepath, 'r') as f:
            hydro.setdefault('header', {})
            hydro['header']['code'] = _read_scalar(f['/bem_data/code'])
            hydro['header']['file'] = os.path.splitext(os.path.basename(filepath))[0]
    except Exception:
        print('BEM data not found at specified path')
        return 

    ## === Parameters ====================================
    try:
        with h5py.File(filepath, 'r') as f:
            hydro.setdefault('parameters', {})
            hydro['parameters']['rho'] = _read_scalar(f['/simulation_parameters/rho'])
            hydro['parameters']['theta'] = np.array(f['/simulation_parameters/wave_dir'])[()]
            hydro['parameters']['Nh'] = hydro['parameters']['theta'].size
            depth_v = _read_scalar(f['/simulation_parameters/water_depth'])
            if isinstance(depth_v, str) and depth_v.lower() == 'infinite':
                hydro['parameters']['depth'] = 100000.0
            else:
                hydro['parameters']['depth'] = depth_v
            hydro['parameters']['w'] = np.array(f['/simulation_parameters/w'])
            hydro['parameters']['T'] = np.array(f['/simulation_parameters/T'])
            hydro['parameters']['g'] = _read_scalar(f['/simulation_parameters/g'])
            hydro['parameters']['Nf'] = hydro['parameters']['w'].size
    except Exception:
        print('Parameter data was not loaded, missing entry in the BEM data.')
        hydro['parameters'] = {}
        return
    
    ## === BODIES ========================================
    hydro.setdefault('bodies', {}).setdefault('body', [])
    hydro['bodies'].setdefault('nDoF', 6)

   
    i = 1
    with h5py.File(filepath, 'r') as f:
        while True:
            h5BodyName = f'/body{i}'
            try:
                # Attempt to read body name
                name = _read_scalar(f[f'{h5BodyName}/properties/name'])
                hydro['bodies']['body'].append(name)
                i += 1
            except KeyError:
                # No body at this index, end loop
                hydro['bodies']['Nb'] = i - 1
                print(f'Number of bodies in h5 file = {hydro["bodies"]["Nb"]}')
                break

        # Set default nDoF
        hydro['bodies']['nDoF'] = 6

        # Handle case of no bodies
        if hydro['bodies']['Nb'] == 0:
            print('No bodies found in the BEM data')
            return
        
        hydro['coefficients'] = {'radiation': {'stateSpace': {'bodyOrderTotal': 0, 'noB2B': {}, 'B2B': {}}},
                             'hydrostatic': {},
                             'excitation': {'spectralDecomp': {}}}
        hydro['bodies']['dof'], hydro['bodies']['dofStart'], hydro['bodies']['dofEnd'] = \
    np.zeros(hydro['bodies']['Nb'], dtype=int), np.zeros(hydro['bodies']['Nb'], dtype=int), np.zeros(hydro['bodies']['Nb'], dtype=int)

        # Loop over each body
        for idx in range(1, hydro['bodies']['Nb'] + 1):
            h5BodyName = f'/body{idx}'
            
            # Dynamic field names
            cgName       = f'cg{idx}'
            volName      = f'vol{idx}'
            cbName       = f'cb{idx}'

            mName        = f'm{idx}'
            AinfName     = f'Ainf{idx}'
            AinfExName   = f'AinfEx{idx}'

            KhsName      = f'Khs{idx}'

            excReName    = f're{idx}'
            excImName    = f'im{idx}'

            radSSAName   = f'A{idx}'
            radSSBName   = f'B{idx}'
            radSSCName   = f'C{idx}'
            radSSDName   = f'D{idx}'

            # Body properties
            try:
                hydro['bodies'][cgName] = np.array(f[f'{h5BodyName}/properties/cg']).T
                hydro['bodies'][volName] = float(_read_scalar(f[f'{h5BodyName}/properties/disp_vol']))
                hydro['bodies'][cbName] = np.array(f[f'{h5BodyName}/properties/cb']).T

                # Zero-out small numeric noise
                hydro['bodies'][cgName][np.abs(hydro['bodies'][cgName]) < 1e-3] = 0
                hydro['bodies'][cbName][np.abs(hydro['bodies'][cbName]) < 1e-3] = 0

                # Mass
                hydro['bodies'][mName] = hydro['parameters']['rho'] * hydro['bodies'][volName]

            except KeyError:
                print(f'Body property data was not loaded for body {idx} ({hydro["bodies"]["body"][idx-1]}), missing entry in the BEM data')
                return


            ## === Coefficients ====================================
            try:
                Khs = np.array(f[f'{h5BodyName}/hydro_coeffs/linear_restoring_stiffness'])[()]
                hydro['coefficients']['hydrostatic'][KhsName] = Khs * hydro['parameters']['rho'] * hydro['parameters']['g']
            except KeyError:
                print(f'Hydrostatic data was not loaded for body {idx} ({hydro["bodies"]["body"][i-1]})')

            hydro['bodies']['dof'][idx-1] = int(_read_scalar(f[f'{h5BodyName}/properties/dof']))
            hydro['bodies']['dofStart'][idx-1] = int(_read_scalar(f[f'{h5BodyName}/properties/dof_start'])) - 1
            hydro['bodies']['dofEnd'][idx-1] = int(_read_scalar(f[f'{h5BodyName}/properties/dof_end']))

            # Infinite-frequency added mass
            try:
                Ainf = np.array(f[f'{h5BodyName}/hydro_coeffs/added_mass/inf_freq'])[()] * hydro['parameters']['rho']
    
                nDoF = hydro['bodies']['nDoF']
                start_dof = hydro['bodies']['dofStart'][idx-1]
                end_dof   = hydro['bodies']['dofEnd'][idx-1]

                hydro['coefficients']['radiation']['stateSpace']['B2B'][AinfName] = Ainf
                hydro['coefficients']['radiation']['stateSpace']['noB2B'][AinfName] = Ainf[:, start_dof:end_dof]
                cols = list(range(0, start_dof)) + list(range(end_dof, Ainf.shape[1]))
                hydro['coefficients']['radiation']['stateSpace']['B2B'][AinfExName] = Ainf[:, cols]

            except KeyError:
                print(f'Infinite frequency added mass data was not loaded for body {idx} ({hydro["bodies"]["body"][idx-1]})')


            # Excitation spectral decomposition
            try:
                re3D = np.transpose(np.array(f[f'{h5BodyName}/hydro_coeffs/excitation/re'])[()], (2,0,1))
                im3D = np.transpose(np.array(f[f'{h5BodyName}/hydro_coeffs/excitation/im'])[()], (2,0,1))

                re3D = re3D * hydro['parameters']['rho'] * hydro['parameters']['g']
                im3D = im3D * hydro['parameters']['rho'] * hydro['parameters']['g']

                hydro['coefficients']['excitation']['spectralDecomp'].setdefault('D3', {})
                hydro['coefficients']['excitation']['spectralDecomp']['D3'][excReName] = re3D
                hydro['coefficients']['excitation']['spectralDecomp']['D3'][excImName] = im3D

                nDoF = hydro['bodies']['nDoF']
                Nh = hydro['parameters']['Nh']
                Nf = hydro['parameters']['Nf']
                re2D = np.zeros((nDoF, Nf * Nh))
                im2D = np.zeros((nDoF, Nf * Nh))

                # Flatten 3D → 2D
                for j in range(Nh):
                    cols = slice(j*Nf, (j+1)*Nf)
                    re2D[:, cols] = re3D[j,:,:]
                    im2D[:, cols] = im3D[j,:,:]

                # Store 2D version
                hydro['coefficients']['excitation']['spectralDecomp'][excReName] = re2D
                hydro['coefficients']['excitation']['spectralDecomp'][excImName] = im2D

            except KeyError:
                print(f'Excitation spectral decomposition data was not loaded for body {idx} ({hydro["bodies"]["body"][idx-1]})')

            # Radiation state-space
            try:
                ss_A = np.array(f[f'{h5BodyName}/hydro_coeffs/radiation_damping/state_space/A/all'])[()]
                ss_B = np.array(f[f'{h5BodyName}/hydro_coeffs/radiation_damping/state_space/B/all'])[()]
                ss_C = np.array(f[f'{h5BodyName}/hydro_coeffs/radiation_damping/state_space/C/all'])[()]
                ss_D = np.array(f[f'{h5BodyName}/hydro_coeffs/radiation_damping/state_space/D/all'])[()]

                order = np.array(f[f'{h5BodyName}/hydro_coeffs/radiation_damping/state_space/it'])[()]
                hydro['coefficients']['radiation']['stateSpace']['order'] = order

                nDoF = hydro['bodies']['nDoF']
                LDoF = hydro['bodies']['Nb'] * hydro['bodies']['dof'][0]  # total DoF over all bodies

                # B2B radiation matrices
                nDoF = hydro['bodies']['nDoF']
                LDoF = hydro['bodies']['Nb'] * hydro['bodies']['dof'][0]

                # Precompute total state size from order
                totalState = int(np.sum(order))
                Af = np.zeros((totalState, totalState))
                Bf = np.zeros((totalState, LDoF))
                Cf = np.zeros((nDoF, totalState))

                stateStart = 0  # cumulative row/col index for Af/Cf

                for ii in range(nDoF):
                    for jj in range(LDoF):
                        arraySize = int(order[ii, jj])
                        stateEnd = stateStart + arraySize

                        # Assign blocks directly from ss_A, ss_B, ss_C
                        Af[stateStart:stateEnd, stateStart:stateEnd] = ss_A[ii,jj,:arraySize,:arraySize]
                        Bf[stateStart:stateEnd, jj:jj+1] = ss_B[ii,jj,:arraySize,0:1]
                        Cf[ii:ii+1, stateStart:stateEnd] = ss_C[ii,jj,0,:arraySize].reshape(1,-1)

                        stateStart = stateEnd  # increment cumulative index

                hydro['coefficients']['radiation']['stateSpace']['B2B'][radSSAName] = Af
                hydro['coefficients']['radiation']['stateSpace']['B2B'][radSSBName] = Bf
                hydro['coefficients']['radiation']['stateSpace']['B2B'][radSSCName] = Cf * hydro['parameters']['rho']
                hydro['coefficients']['radiation']['stateSpace']['B2B'][radSSDName] = np.zeros((nDoF, LDoF))

                # No B2B radiation matrices
                LDoF_noB2B = hydro['bodies']['dof'][0]
                totalState_noB2B = int(np.sum(order[:, hydro['bodies']['dofStart'][idx-1] : hydro['bodies']['dofEnd'][idx-1]]))

                Af = np.zeros((totalState_noB2B, totalState_noB2B))
                Bf = np.zeros((totalState_noB2B, LDoF_noB2B))
                Cf = np.zeros((nDoF, totalState_noB2B))

                stateStart = 0

                for ii in range(nDoF):
                    for jj in range(hydro['bodies']['dofStart'][idx-1], hydro['bodies']['dofEnd'][idx-1]):
                        jInd = jj - (hydro['bodies']['dofStart'][idx-1])
                        arraySize = int(order[ii, jj])
                        stateEnd = stateStart + arraySize

                        # Assign directly
                        Af[stateStart:stateEnd, stateStart:stateEnd] = ss_A[ii,jj,:arraySize,:arraySize]
                        Bf[stateStart:stateEnd, jInd:jInd+1] = ss_B[ii,jj,:arraySize,0:1]
                        Cf[ii:ii+1, stateStart:stateEnd] = ss_C[ii,jj,0,:arraySize].reshape(1,-1)

                        stateStart = stateEnd

                hydro['coefficients']['radiation']['stateSpace']['noB2B'][radSSAName] = Af
                hydro['coefficients']['radiation']['stateSpace']['noB2B'][radSSBName] = Bf
                hydro['coefficients']['radiation']['stateSpace']['noB2B'][radSSCName] = Cf * hydro['parameters']['rho']
                hydro['coefficients']['radiation']['stateSpace']['noB2B'][radSSDName] = np.zeros((nDoF, LDoF_noB2B))
            
            except KeyError:
                print(f'Radiation state-space data was not loaded for body {idx} ({hydro["bodies"]["body"][idx-1]})')

    # Save .mat file
    full_file_path = os.path.join(current_path, f"{device_name}hydroCoeff_bigTest.mat")
    savemat(full_file_path, {'hydroBigtest': hydro}, oned_as='row')
    print(f"'hydro' has been successfully saved to file: {full_file_path}")

    return hydro
