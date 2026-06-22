load('Experimental_data\experimental_data.mat');  % loads exp_data

D_list = {'D25','D50','D75','D100'};
P_list = {'P50','P100'};

markers = {'o','s'};  % circle for P50, square for P100

ylims_torque = struct( ...
    'D25', [0 150], ...
    'D50', [0 250], ...
    'D75', [0 375], ...
    'D100',[0 500]);

ylims_flow = struct( ...
    'D25', [0 165], ...
    'D50', [0 310], ...
    'D75', [0 450], ...
    'D100',[0 600]);

ylims_eta = [0 100];

for i = 1:numel(D_list)
    
    D = D_list{i};
    
    figure('Name', D);
    
    % =========================
    % Subplot 1: Torque
    % =========================
    subplot(3,1,1); hold on; grid on;
    title(['Torque vs Speed - ', D]);
    xlabel('Speed (rpm)');
    ylabel('Torque (Nm)');
    ylim(ylims_torque.(D));
    
    for j = 1:numel(P_list)
        P = P_list{j};
        
        if isfield(exp_data.torque.(D), P)
            N = exp_data.torque.(D).(P).N;
            T = exp_data.torque.(D).(P).T;
            
            plot(N, T, markers{j}, 'DisplayName', P);  % markers only
        end
    end
    
    legend show;
    
    
    % =========================
    % Subplot 2: Flow
    % =========================
    subplot(3,1,2); hold on; grid on;
    title(['Flow vs Speed - ', D]);
    xlabel('Speed (rpm)');
    ylabel('Flow (L/min)');
    ylim(ylims_flow.(D));

    for j = 1:numel(P_list)
        P = P_list{j};
        
        if isfield(exp_data.flow.(D), P)
            N = exp_data.flow.(D).(P).N;
            q = exp_data.flow.(D).(P).q;
            
            plot(N, q, markers{j}, 'DisplayName', P);  % markers only
        end
    end
    
    legend show;
    
    
    % =========================
    % Subplot 3: Efficiency
    % =========================
    subplot(3,1,3); hold on; grid on;
    title(['Efficiency vs Speed - ', D]);
    xlabel('Speed (rpm)');
    ylabel('Efficiency (%)');
    ylim(ylims_eta);

    for j = 1:numel(P_list)
        P = P_list{j};
        
        if isfield(exp_data.efficiency.(D), P)
            N = exp_data.efficiency.(D).(P).N;
            eta = exp_data.efficiency.(D).(P).ef;
            
            plot(N, eta, markers{j}, 'DisplayName', P);  % markers only
        end
    end
    
    legend show;
    
end