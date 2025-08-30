%%  Project: QUB - TTT3
%   Author: Carwyn Frost
%   Work address: LG.303, School of Planning, Architecture and Civil
%   Engineering, David Keir Building, Stranmillis Road, Belfast
%   Email: c.frost@qub.ac.uk
%   Website: http://www.qub.ac.uk/schools/SchoolofPlanningArchitectureandCivilEngineering/Staff/ResearchStaff/CarwynFrost/

%   Purpose: - Inputting Data from DAQ Files and saving in usable matlab
%               'TTT3_Data.mat' file
%   Detail: - Exercise to Input data from Turbine DAQ, calculate performance
%   characteristics and Output results for presentation.
%   Date Started: Aug 2015
%   Last revision: 16-Aug-2015

%------------- BEGIN CODE --------------
%% Input Data from Turbine

addpath(pathTURB)
cd(pathTURB)

    
    %%  Data Input from Setup File
    Inputs = readtable('Exp_Setup.txt','delimiter','\t','ReadVariableNames',true);
    ThrustPin=Inputs{1,2};
    INSEANCarriage=Inputs{2,2};
    RotorType=Inputs{3,2};
    CarriageVelocity=Inputs{4,2};
    
    
    for i=1:size(fileTURB,2)
        %%  Import Data for Single File
        data=importdata(fileTURB{i}, '\t', 1);
        
        %%  Organise data structure
        %Raw Data
        RawData.Ini_Array= data.data(:,1:end);
        
        %%  Unit conversion
        % Encoder - RPM to Rad/s
        for j=[14,24];
            if mean(RawData.Ini_Array(:,j))>0
                RawData.Ini_Array(:,j)=RawData.Ini_Array(:,j)*0.104719755;
            elseif mean(RawData.Ini_Array(:,j))<0
                RawData.Ini_Array(:,j)=RawData.Ini_Array(:,j)*-0.104719755;
            else
                RawData.Ini_Array(:,j)=RawData.Ini_Array(:,j)*1;
            end
        end
       
        
        %% Calibration Eq - Thrust Pin T2
        if ThrustPin==1
            if RotorType==1
                % Upstream, Eppler Rotor (L1)
                RawData.Ini_Array(:,12)=(RawData.Ini_Array(:,12)-1.3801)/0.002238;
            elseif RotorType==2
                % Upstream, Schottel Rotor (L3)
                RawData.Ini_Array(:,12)=(RawData.Ini_Array(:,12)-1.9566)/0.0023;
            else
                display('Error - unrecognised rotor type input');
            end
        elseif ThrustPin==0
            if RotorType==1
                % Downstream, Eppler Rotor (L1)
                RawData.Ini_Array(:,12)=(RawData.Ini_Array(:,12)-1.4986)/0.002373;
            elseif RotorType==2
                % Downstream, Schottel Rotor (L3)
                RawData.Ini_Array(:,12)=(RawData.Ini_Array(:,12)-0.91575)/0.00235;
            else
                display('Error - unrecognised rotor type input');
            end
        else
            display('Error - unrecognised orientation input');
        end
        
        %% Calibration Eq - Carriage Velocity inc reality check
        INSEANCarriage=Inputs{2,2};
        Turbine.Carriage.Set_Velocity(i)=Inputs{4,2};
        if INSEANCarriage==0
            FieldNumber=8; % This then becomes the Flow Meter Data
            Turbine.Carriage.StartRow(i)=1;
            Turbine.Carriage.EndRow(i)=length(RawData.Ini_Array);
        else
            if INSEANCarriage==2
                % INSEAN Wave Tank (Carriage 2) Velocity Calibration
                FieldNumber=16;
                RawData.Ini_Array(:,FieldNumber)=(RawData.Ini_Array(:,FieldNumber)-0.0051)/2.4977;
                
                [Turbine.Carriage.StartRow(i)]=find(RawData.Ini_Array(:,14)>0.2 & abs(RawData.Ini_Array(:,FieldNumber))>(Turbine.Carriage.Set_Velocity(i)-0.01) & abs(RawData.Ini_Array(:,FieldNumber))<(Turbine.Carriage.Set_Velocity(i)+0.01),1,'first')+32;       %first steady test (Row 19 for basin 1)
                [Turbine.Carriage.EndRow(i)]=find(abs(RawData.Ini_Array(:,FieldNumber))>(Turbine.Carriage.Set_Velocity(i)-0.01) & abs(RawData.Ini_Array(:,FieldNumber))<(Turbine.Carriage.Set_Velocity(i)+0.01),1,'last')-32;                                   %last steady test ~140s long
                
            elseif INSEANCarriage==1
                % INSEAN Calm Water Tank (Carriage 1) Velocity Calibration
                FieldNumber=19;
                RawData.Ini_Array(:,FieldNumber)=abs(RawData.Ini_Array(:,FieldNumber))*2;
                
                [Turbine.Carriage.StartRow(i)]=find(RawData.Ini_Array(:,14)>0.2 & abs(RawData.Ini_Array(:,FieldNumber))>(Turbine.Carriage.Set_Velocity(i)-0.01) & abs(RawData.Ini_Array(:,FieldNumber))<(Turbine.Carriage.Set_Velocity(i)+0.01),1,'first')+32;        %first steady test (Row 19 for basin 1)
                [Turbine.Carriage.EndRow(i)]=find(abs(RawData.Ini_Array(:,FieldNumber))>(Turbine.Carriage.Set_Velocity(i)-0.01) & abs(RawData.Ini_Array(:,FieldNumber))<(Turbine.Carriage.Set_Velocity(i)+0.01),1,'last')-32;           %last steady test ~140s long
            else
                display('Error- unrecognised carriage velocity');
            end
        end
        
        %%  Setting the Time Step
        RawData.Time=datenum(data.data(:,1),data.data(:,2),data.data(:,3),data.data(:,4),data.data(:,5),(data.data(:,6)+data.data(:,7)));        % Units in days
        RawData.AnalogueTime=(RawData.Time*24*60*60) - min(RawData.Time*24*60*60); %Units in seconds
        
        %%  Identifying CaseData by cut in AnalogueTime
        RawData.Diff_AnalogueTime=diff(RawData.AnalogueTime,1,1);
        RawData.Diff_AnalogueTimeSize=numel(RawData.AnalogueTime);               %Makes Vector same dimension
        RawData.Diff_AnalogueTime(RawData.Diff_AnalogueTimeSize) = 0;           %Makes Vector same dimension
        
        %%  Identifying Acceleration and Deceleration regions to remove from time averaged data cut by an RPM moving sample
        Results.Carriage.Set_Velocity(i)=CarriageVelocity;
        [Results.Carriage.StartRow(i)]=Turbine.Carriage.StartRow(i);
        [Results.Carriage.EndRow(i)]=Turbine.Carriage.EndRow(i);
        TURB_file_size(i)=length(RawData.Ini_Array);
        
        %%  Creating & Saving an Array to be cut into CaseData Sets
        RawData.Complete_Array_Headings={'Analogue Time','TimeStep','Year','Month','Day','Hour','Minute','Second','Fractional_Second','Flow Meter','Current01','Voltage01','Pelec01','LoadCell01','Temp01','RPM01enc','Position01','Current02','Voltage02','Pelec02','LoadCell02','Temp02','RPM02enc','Position02','Torque01','Speed01','Pmech01','Torque02','Speed02','Pmech02'};
        RawData.Complete_Array=horzcat(RawData.AnalogueTime, RawData.Diff_AnalogueTime, RawData.Ini_Array);
        
        %%  Raw Data
        % Rot_Velocity
        Results.Turbine.Mean.Rot_Speed_Enc(i+1)=mean(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),16)); %*(60/(2*pi)); this ext is for results in RPM
        Results.Turbine.SD.Rot_Speed_Enc(i+1)=std(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),16));
        Results.Turbine.Max.Rot_Speed_Enc(i+1)=max(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),16));
        Results.Turbine.Min.Rot_Speed_Enc(i+1)=min(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),16));
        
        Results.Turbine.Mean.Rot_Speed_TorqSense(i+1)=mean(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),26)); %*(60/(2*pi)); this ext is for results in RPM
        Results.Turbine.SD.Rot_Speed_TorqSense(i+1)=std(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),26));
        Results.Turbine.Max.Rot_Speed_TorqSense(i+1)=max(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),26));
        Results.Turbine.Min.Rot_Speed_TorqSense(i+1)=min(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),26));
        % Mech_Torque
        Results.Turbine.Mean.Mech_Torque(i+1)=mean(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),25));
        Results.Turbine.SD.Mech_Torque(i+1)=std(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),25));
        Results.Turbine.Max.Mech_Torque(i+1)=max(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),25));
        Results.Turbine.Min.Mech_Torque(i+1)=min(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),25));        
        % Mech_Power>>>This is the wrong Power, issue with DAQ in all likelyhood<<<
%         Results.Turbine.Mean.Mech_Power(i+1)=mean(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),27));
%         Results.Turbine.SD.Mech_Power(i+1)=std(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),27));
%         Results.Turbine.Max.Mech_Power(i+1)=max(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),27));
%         Results.Turbine.Min.Mech_Power(i+1)=min(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),27));
        %Mech_Power_Q*Omega
        Results.Turbine.Mean.Mech_Power(i+1)=mean(abs(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),25)).*RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),16));
        Results.Turbine.SD.Mech_Power(i+1)=std(abs(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),25)).*RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),16));
        Results.Turbine.Max.Mech_Power(i+1)=max(abs(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),25)).*RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),16));
        Results.Turbine.Min.Mech_Power(i+1)=min(abs(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),25)).*RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),16));        
        % Elec_Power
        Results.Turbine.Mean.Elec_Power(i+1)=mean(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),13));
        Results.Turbine.SD.Elec_Power(i+1)=std(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),13));
        Results.Turbine.Max.Elec_Power(i+1)=max(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),13));
        Results.Turbine.Min.Elec_Power(i+1)=min(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),13));
        % Thrust
        Results.Turbine.Mean.Thrust(i+1)=mean(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),14));
        Results.Turbine.SD.Thrust(i+1)=std(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),14));
        Results.Turbine.Max.Thrust(i+1)=max(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),14));
        Results.Turbine.Min.Thrust(i+1)=min(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),14));
        % Flowmeter Velocity Data
        Results.Turbine.Mean.FM_Velocity(i+1)=mean(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),10));
        Results.Turbine.SD.FM_Velocity(i+1)=std(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),10));
        Results.Turbine.Max.FM_Velocity(i+1)=max(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),10));
        Results.Turbine.Min.FM_Velocity(i+1)=min(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),10));
        
        %%  Carriage Velocity Data
        % Raw Data
        Results.Turbine.Mean.Carriage_Velocity(i+1)=abs(mean(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),FieldNumber+2)));
        if Results.Turbine.Mean.Carriage_Velocity(i+1)>3
                   Results.Turbine.Mean.Carriage_Velocity(i+1)=Turbine.Carriage.Set_Velocity(i);
                else
                end
        Results.Turbine.SD.Carriage_Velocity(i+1)=std(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),FieldNumber+2));
        Results.Turbine.Max.Carriage_Velocity(i+1)=max(abs(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),FieldNumber+2)));
        Results.Turbine.Min.Carriage_Velocity(i+1)=min(abs(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),FieldNumber+2)));
        
        % Carriage Direction
        if mean(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),FieldNumber+2))>0
            Results.Carriage.Direction(i+1)=1;
        elseif mean(RawData.Complete_Array(Results.Carriage.StartRow(i):Results.Carriage.EndRow(i),FieldNumber+2))<0
            Results.Carriage.Direction(i+1)=0;
        else
            display('Error- carriage direction not recognised');
        end
    end
    
    Results.Turbine.Mean.Rot_Speed_Enc=transpose(Results.Turbine.Mean.Rot_Speed_Enc);
    Results.Turbine.Mean.Rot_Speed_TorqSense=transpose(Results.Turbine.Mean.Rot_Speed_TorqSense);
    Results.Turbine.Mean.Mech_Torque=transpose(Results.Turbine.Mean.Mech_Torque);
    Results.Turbine.Mean.Mech_Power=transpose(Results.Turbine.Mean.Mech_Power);
    Results.Turbine.Mean.Elec_Power=transpose(Results.Turbine.Mean.Elec_Power);
    Results.Turbine.Mean.Thrust=transpose(Results.Turbine.Mean.Thrust);
    Results.Turbine.Mean.FM_Velocity=transpose(Results.Turbine.Mean.FM_Velocity);
    Results.Turbine.Mean.Carriage_Velocity=transpose(Results.Turbine.Mean.Carriage_Velocity);
    
    Results.Turbine.SD.Rot_Speed_Enc=transpose(Results.Turbine.SD.Rot_Speed_Enc);
    Results.Turbine.SD.Rot_Speed_TorqSense=transpose(Results.Turbine.SD.Rot_Speed_TorqSense);
    Results.Turbine.SD.Mech_Torque=transpose(Results.Turbine.SD.Mech_Torque);
    Results.Turbine.SD.Mech_Power=transpose(Results.Turbine.SD.Mech_Power);
    Results.Turbine.SD.Elec_Power=transpose(Results.Turbine.SD.Elec_Power);
    Results.Turbine.SD.Thrust=transpose(Results.Turbine.SD.Thrust);
    Results.Turbine.SD.FM_Velocity=transpose(Results.Turbine.SD.FM_Velocity);
    
    %% Save Data
    
    ResultsFile=strsplit(fileTURB{1:1},'_');
    TurbineFileName=strjoin(ResultsFile(1,1:3),'_');
    
    pathname2=strjoin({pathTURB,'Results\'},'');
    
    save([pathname2,TurbineFileName,'_All_Results','.mat'],'Results')

% else
%     disp('Error: Different Number of Turbine, ADCP and ADV files')
% end

    %% Export Start and End times to .txt file for ADCP use
    
    

    %------------- END OF CODE --------------