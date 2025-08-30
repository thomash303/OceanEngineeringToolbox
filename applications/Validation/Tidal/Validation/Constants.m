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

Const.Water.Rho = 1025;                         %kg.m^-1
Const.Water.KinematicViscosity=1.0038e-6;       %m^2/s @ T=20c

Const.Turb.Dia=1.5;                         %m
Const.Turb.Rad=Const.Turb.Dia/2;            %m
Const.Turb.Blade_Chord_07=0.128;            %m
Uncert.Turb.Rot_Speed_Enc=5.236E-5;
Uncert.Carriage.Velocity=0.0018;


Const.ADCP.Green.m=1.00889;              %Calibration for Green Aquadopp where m is in equation 'Carriage Velocity = m(data) + C'
Const.ADCP.Green.C=2.496E-3;                %Calibration for Green Aquadopp where C is in equation 'Carriage Velocity = m(data) + C'
Const.ADCP.Green.SEE=0.127;                  %ms^-1
Const.ADCP.Green.IEC_Uncert=0.0073;          %ms^-1
Const.ADCP.Green.DopplerNoise=8E-3; %ms^-1

Uncert.Const.W_Rho=0.5;                         %kg.m^-1
Uncert.Const.Turb_Rad=0.0005;                   %m
Uncert.Const.Turb_Area=1e-3;                    %m^2
Uncert.Const.Turb_Torque=1.9;                   %Nm




