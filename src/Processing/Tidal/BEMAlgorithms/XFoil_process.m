%% XFoil_process
% Extract polar data from the XFoil output file

polarData = struct();


% Airfoil data
airfoilFile = 'NACA_63215.txt';     % File storing airfoil coefficient data

% Load airfoil data from text file
try
    polarData = parseXFoilPolar(airfoilFile);
catch ME
    error('Failed to load airfoil data from %s: %s', airfoilFile, ME.message);
end

save('polarData.mat', 'polarData')