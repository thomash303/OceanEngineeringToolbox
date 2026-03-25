

table = readtable('Experimental_data\Master_ExpData.xlsx');
headers = table.Properties.VariableNames;

exp_data.flow = struct();
exp_data.torque = struct();
for i = 1:numel(headers)
    
    h = headers{i};
    col = table.(h);
    
    % Parse header
    tokens = regexp(h, '([qTf])D(\d+)P(\d+)([A-Za-z]+)', 'tokens');
    tokens = tokens{1};
    
    type   = tokens{1};              
    D_val  = str2double(tokens{2}); 
    P_val  = str2double(tokens{3}); 
    suffix = tokens{4};             
    
    % Field names
    D_field = sprintf('D%d', D_val);
    P_field = sprintf('P%d', P_val);
    
    % Assign
    if type == 'q'
        exp_data.flow.(D_field).(P_field).(suffix) = col;
    elseif type == 'T'
        exp_data.torque.(D_field).(P_field).(suffix) = col;
    else
       exp_data.efficiency.(D_field).(P_field).(suffix) = col;
    end
    
end

save('Experimental_data\experimental_data.mat', 'exp_data');