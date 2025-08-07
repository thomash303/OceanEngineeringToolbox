 % Define your grid points
alpha = [100, 200, 300, 400, 500, 600, 700, 800]';  % 1D array
Re = [1e6];  % You can make this more than one value for full 2D

% Format your output matrix
% Dimensions: length(Re) x length(alpha)
CL = [1,2,3,4,5,6,7,8; 
    9,10,11,12,13,14,15,16]';
% CL = [-0.5693, -0.7142, -0.7137, -0.7642, -0.7681, -0.7702, -0.7678, -0.7586];
% CL_table = reshape(CL, [1, length(CL)]);  % For one Re row

% Create a structure required by Modelica
polarData = struct();
polarData.name = 'CL_mat';  % Used by Modelica to reference the table
polarData.table = [alpha CL];
polarData.u1 = alpha;
polarData.u2 = Re;
polarData.columns = 2;  % 1-based indexing
polarData.smoothness = int32(1);  % 1 = linear segments

save('sampleParsing.mat', '-struct', 'polarData');