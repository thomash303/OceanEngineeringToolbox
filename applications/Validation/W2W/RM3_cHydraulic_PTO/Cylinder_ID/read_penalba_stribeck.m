%% Loading Penalba's normalized Stribeck data
data = readmatrix('Penalba_data\stribeck_coeff.xlsx');

penalba_stribeck_raw = struct();
penalba_stribeck_raw.v_fric  = data(:,1);  
penalba_stribeck_raw.F_fric  = data(:,2);
penalba_stribeck_raw.v_coul  = data(:,3);  
penalba_stribeck_raw.F_coul  = data(:,4);
penalba_stribeck_raw.v_strib = data(:,5);  
penalba_stribeck_raw.F_strib = data(:,6);
penalba_stribeck_raw.v_visc  = data(:,7);  
penalba_stribeck_raw.F_visc  = data(:,8);

save('penalba_stribeck.mat','penalba_stribeck_raw')