%%  Project: QUB - TTT3
%   Author: Carwyn Frost
%   Work address: LG.303, School of Planning, Architecture and Civil
%   Engineering, David Keir Building, Stranmillis Road, Belfast
%   Email: c.frost@qub.ac.uk
%   Website: http://www.qub.ac.uk/schools/SchoolofPlanningArchitectureandCivilEngineering/Staff/ResearchStaff/CarwynFrost/

%   Purpose: - 
%   Detail: - 
%   Date Started: 

%------------- BEGIN CODE --------------
clear all
addpath 'C:\Users\thogan1'\Documents\GitHub\OceanEngineeringToolbox\applications\Validation\Tidal\
%% Load Constants file
Constants

%% Select Turbine Results File
[fileTURB, pathTURB, filterindex1] = uigetfile('*.*', 'Select Turbine Results file:', 'MultiSelect', 'on');

Turbine_Data_Processing

% %Select ADCP .mat data file
% [fileADCP,pathADCP]=uigetfile('.mat','MultiSelect','on','Select ADCP .mat file (one or multiple)');
% 
% Aquadopp_Data_Processing
% 
% % Calculate NonDims
% 
% All_Results_Output
% 
% Uncertianty_Analysis
% 
% Figures
