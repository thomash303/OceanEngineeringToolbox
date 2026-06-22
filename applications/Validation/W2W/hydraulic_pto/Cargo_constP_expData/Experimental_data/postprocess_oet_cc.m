% Plot general CC and OET data for the hydraulic PTO

% Pressure conversion
paBar = 1e5;

%% Loading data
load('cargo_data.mat');
load('oet_cargo_data_final.mat');

%% Figure 1
figure('Name','Flow and Displacement')
subplot(2,1,1)
plot(oet_cargo_data.time, oet_cargo_data.f1, 'DisplayName','F1 sim')
hold on
plot(oet_cargo_data.time, oet_cargo_data.f2, 'DisplayName','F2 sim')

plot(cargo_data.flow(1).t, cargo_data.flow(1).q, 'DisplayName','F1 exp')
plot(cargo_data.flow(2).t, cargo_data.flow(2).q, 'DisplayName','F2 exp')

ylim([-2 10])
xlim([160 170])
yticks(-2:2:10)
grid on
ylabel('Flow [lpm]')
xlabel('Time [s]')
disp(numel(findobj(gca,'Type','line')))
legend('Location','best')
title('Volumetric Flow Rate')


s_offset = 0.15;

subplot(2,1,2)
plot(oet_cargo_data.time, oet_cargo_data.s - s_offset, 'DisplayName','s sim')
hold on
plot(cargo_data.disp.t, cargo_data.disp.s, 'DisplayName','s exp')
ylim([-0.2 0.15])
xlim([160 170])
yticks(-0.2:0.05:0.15)
grid on
ylabel('Displacement (m)')
xlabel('Time (s)')
legend('Location','best')
title('Displacement')
hold off

%% Figure 2 (erroneous fpto formulation)
% figure('Name','Piston Cylinder Pressure and Force')
% subplot(2,1,1)
% plot(oet_cargo_data.time+1.6, oet_cargo_data.p1, 'DisplayName','p1')
% hold on
% plot(oet_cargo_data.time+1.6, oet_cargo_data.p2, 'DisplayName','p2')
% 
% plot(cargo_data.pressure(1).t, cargo_data.pressure(1).p, 'DisplayName','exp p1')
% plot(cargo_data.pressure(2).t, cargo_data.pressure(2).p, 'DisplayName','exp p2')
% 
% ylim([-5 35])
% xlim([160 170])
% yticks(-5:5:35)
% grid on
% ylabel('Pressure (bar)')
% xlabel('Time (s)')
% legend('Location','best')
% title('Pressure')
% hold off
% 
% subplot(2,1,2)
% plot(oet_cargo_data.time, oet_cargo_data.fpto, 'DisplayName','Fpto')
% hold on
% plot(cargo_data.pto.t, cargo_data.pto.F, 'DisplayName','exp Fpto')
% % plot(t1, Fpto_exp, 'DisplayName','exp Fpto manual')
% plot(t1, Fpto_exp+1800, 'DisplayName','exp Fpto manual shift')
% plot(oet_cargo_data.time+1.6, 2000+Ap*1e5*(oet_cargo_data.p1-oet_cargo_data.p2), 'DisplayName','Cust pto')
% 
% 
% ylim([-3000 3000])
% xlim([160 170])
% yticks(-3000:1000:3000)
% grid on
% ylabel('Force (N)')
% xlabel('Time (s)')
% legend('Location','best')
% title('PTO Force')
% hold off

%% Figure 2a
figure('Name','Piston Cylinder Pressure and Force')
subplot(2,1,1)
plot(oet_cargo_data.time+1.5, oet_cargo_data.p1, 'DisplayName','P1 sim')
hold on
plot(oet_cargo_data.time+1.5, oet_cargo_data.p2, 'DisplayName','P2 sim')

plot(cargo_data.pressure(1).t, cargo_data.pressure(1).p, 'DisplayName','P1 exp')
plot(cargo_data.pressure(2).t, cargo_data.pressure(2).p, 'DisplayName','P2 exp')

ylim([-5 35])
xlim([160 170])
yticks(-5:5:35)
grid on
ylabel('Pressure (bar)')
xlabel('Time (s)')
legend('Location','best')
title('Pressure')
hold off

subplot(2,1,2)
plot(oet_cargo_data.time+1.5, oet_cargo_data.fpto, 'DisplayName','Fpto sim')
hold on
plot(cargo_data.pto.Tp, cargo_data.pto.Fp, 'DisplayName','Fpto exp (manual)')
plot(cargo_data.pto.t, cargo_data.pto.F-1800, 'DisplayName','exp Fpto (shifted)')
 
ylim([-5000 1000])
xlim([160 170])
yticks(-5000:1000:1000)
grid on
ylabel('Force (N)')
xlabel('Time (s)')
legend('Location','best')
title('PTO Force')
hold off


%% Figure 3
figure('Name','HP Pressures')
subplot(2,1,1)
plot(oet_cargo_data.time, oet_cargo_data.p3, 'DisplayName','P3 sim')
hold on
plot(oet_cargo_data.time, oet_cargo_data.p4, 'DisplayName','P4 sim')

plot(cargo_data.pressure(3).t, cargo_data.pressure(3).p, 'DisplayName','P3 exp')
plot(cargo_data.pressure(4).t, cargo_data.pressure(4).p, 'DisplayName','P4 exp')

ylim([27 33])
% ylim([27 30])
xlim([160 170])
yticks(27:1:33)
grid on
ylabel('Pressure (bar)')
xlabel('Time (s)')
legend('Location','best')
title('HP and LP Pressures')
hold off

subplot(2,1,2)
plot(oet_cargo_data.time, oet_cargo_data.p5, 'DisplayName','P5 sim')
hold on
plot(oet_cargo_data.time, oet_cargo_data.p6, 'DisplayName','P6 sim')

plot(cargo_data.pressure(5).t, cargo_data.pressure(5).p, 'DisplayName','P5 exp')
plot(cargo_data.pressure(6).t, cargo_data.pressure(6).p, 'DisplayName','P6 exp')

ylim([0 35])
% ylim([0 30])
xlim([160 170])
yticks(0:5:35)
grid on
ylabel('Pressure (bar)')
xlabel('Time (s)')
legend('Location','best')
title('HP Pressures')
hold off


% %% Figure 4 (testing PTO force)
% figure('Name','Piston Cylinder Pressure and Force')
% subplot(2,1,1)
% plot(oet_cargo_data.time+1.6, oet_cargo_data.p1, 'DisplayName','p1')
% hold on
% plot(oet_cargo_data.time+1.6, oet_cargo_data.p2, 'DisplayName','p2')
% 
% plot(cargo_data.pressure(1).t, cargo_data.pressure(1).p, 'DisplayName','exp p1')
% plot(cargo_data.pressure(2).t, cargo_data.pressure(2).p, 'DisplayName','exp p2')
% 
% ylim([-5 35])
% xlim([160 170])
% yticks(-5:5:35)
% grid on
% ylabel('Pressure (bar)')
% xlabel('Time (s)')
% legend('Location','best')
% title('Pressure')
% hold off
% 
% subplot(2,1,2)
% plot(t1, Fpto_exp, 'DisplayName','exp Fpto manual shift')
% hold on
% plot(oet_cargo_data.time+1.6, Ap*1e5*(oet_cargo_data.p1-oet_cargo_data.p2), 'DisplayName','Cust pto')
% 
% 
% ylim([-5000 500])
% xlim([160 170])
% yticks(-3000:1000:3000)
% grid on
% ylabel('Force (N)')
% xlabel('Time (s)')
% legend('Location','best')
% title('PTO Force')
% hold off

%% Combined plots (for thesis)
figure('Name','Combined Results');

t = tiledlayout(3,2,'TileSpacing','compact','Padding','compact');

% Figure defaults
Fsize = 12;
AxisLineWidth = 2;
LineWidth = 2;

% =========================
% 1. Displacement
% =========================
nexttile;
s_offset = 0.15;

plot(oet_cargo_data.time, oet_cargo_data.s - s_offset, 'DisplayName','$x$ sim', 'LineWidth', LineWidth) 
hold on
plot(cargo_data.disp.t, cargo_data.disp.s, '--', 'DisplayName','$x$ exp', 'LineWidth', LineWidth)

ylim([-0.15 0.15]) 
xlim([160 170]) 
yticks(-0.15:0.05:0.15)

ylabel('$x\;[m]$','Interpreter','latex')
title('Displacement','Interpreter','latex')
legend('Location','best','Interpreter','latex')

grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'LineWidth',AxisLineWidth);
set(get(gca,'XLabel'),'FontSize',Fsize,'Interpreter','latex');
set(get(gca,'YLabel'),'FontSize',Fsize,'Interpreter','latex');
legend box off;

% =========================
% 4. PTO Force
% =========================
nexttile;

plot(oet_cargo_data.time+1.5, oet_cargo_data.fpto, 'DisplayName','$F_{pto}$ sim', 'LineWidth', LineWidth)
hold on
plot(cargo_data.pto.Tp, cargo_data.pto.Fp, '--', 'DisplayName','$F_{pto}$ exp', 'LineWidth', LineWidth)
%plot(cargo_data.pto.t, cargo_data.pto.F-1800, 'DisplayName','exp shifted', 'LineWidth', LineWidth)

ylim([-5000 1000]) 
xlim([160 170]) 
yticks(-5000:1000:1000)

ylabel('$F\;[N]$','Interpreter','latex')
title('PTO Force','Interpreter','latex')
legend('Location','best','Interpreter','latex')

grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'LineWidth',AxisLineWidth);
set(get(gca,'XLabel'),'FontSize',Fsize,'Interpreter','latex');
set(get(gca,'YLabel'),'FontSize',Fsize,'Interpreter','latex');
legend box off;

% =========================
% 2. Flow
% =========================
nexttile;

plot(oet_cargo_data.time, oet_cargo_data.f1, 'DisplayName','$F1$ sim', 'LineWidth', LineWidth) 
hold on
plot(cargo_data.flow(1).t, cargo_data.flow(1).q, '--', 'DisplayName','$F1$ exp', 'LineWidth', LineWidth)
plot(oet_cargo_data.time, oet_cargo_data.f2, 'DisplayName','$F2$ sim', 'LineWidth', LineWidth)
plot(cargo_data.flow(2).t, cargo_data.flow(2).q, '--', 'DisplayName','$F2$ exp', 'LineWidth', LineWidth)

ylim([-2 12]) 
xlim([160 170])
yticks(-2:2:12)

ylabel('$Q\;[L/min]$','Interpreter','latex')
title('Flow','Interpreter','latex')
legend('Location','best','Interpreter','latex')

grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'LineWidth',AxisLineWidth);
set(get(gca,'XLabel'),'FontSize',Fsize,'Interpreter','latex');
set(get(gca,'YLabel'),'FontSize',Fsize,'Interpreter','latex');
legend box off;

% =========================
% 5. HP/LP Pressure
% =========================
nexttile;

plot(oet_cargo_data.time, oet_cargo_data.p3, 'DisplayName','$P3$ sim', 'LineWidth', LineWidth) 
hold on
plot(cargo_data.pressure(3).t, cargo_data.pressure(3).p, '--', 'DisplayName','$P3$ exp', 'LineWidth', LineWidth)
plot(oet_cargo_data.time, oet_cargo_data.p4, 'DisplayName','$P4$ sim', 'LineWidth', LineWidth)
plot(cargo_data.pressure(4).t, cargo_data.pressure(4).p, '--', 'DisplayName','$P4$ exp', 'LineWidth', LineWidth)

ylim([27 32])
xlim([160 170])
yticks(27:1:32)

ylabel('$p\;[bar]$','Interpreter','latex')
title('HP/LP Pressure','Interpreter','latex')
legend('Location','best','Interpreter','latex')

grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'LineWidth',AxisLineWidth);
set(get(gca,'XLabel'),'FontSize',Fsize,'Interpreter','latex');
set(get(gca,'YLabel'),'FontSize',Fsize,'Interpreter','latex');
legend box off;

% =========================
% 3. Cylinder Pressure
% =========================
nexttile;

plot(oet_cargo_data.time+1.5, oet_cargo_data.p1, 'DisplayName','$P1$ sim', 'LineWidth', LineWidth) 
hold on
plot(cargo_data.pressure(1).t, cargo_data.pressure(1).p, '--', 'DisplayName','$P1$ exp', 'LineWidth', LineWidth)
plot(oet_cargo_data.time+1.5, oet_cargo_data.p2, 'DisplayName','$P2$ sim', 'LineWidth', LineWidth)
plot(cargo_data.pressure(2).t, cargo_data.pressure(2).p, '--', 'DisplayName','$P2$ exp', 'LineWidth', LineWidth)

ylim([-5 35])
xlim([160 170])
yticks(-5:5:35)

ylabel('$p\;[bar]$','Interpreter','latex')
title('Cylinder Pressure','Interpreter','latex')
legend('Location','best','Interpreter','latex')

grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'LineWidth',AxisLineWidth);
set(get(gca,'XLabel'),'FontSize',Fsize,'Interpreter','latex');
set(get(gca,'YLabel'),'FontSize',Fsize,'Interpreter','latex');
legend box off;

% =========================
% 6. Downstream Pressure
% =========================
nexttile;

plot(oet_cargo_data.time, oet_cargo_data.p5, 'DisplayName','$P5$ sim', 'LineWidth', LineWidth) 
hold on
plot(cargo_data.pressure(5).t, cargo_data.pressure(5).p, '--', 'DisplayName','$P5$ exp', 'LineWidth', LineWidth)
plot(oet_cargo_data.time, oet_cargo_data.p6, 'DisplayName','$P6$ sim', 'LineWidth', LineWidth)
plot(cargo_data.pressure(6).t, cargo_data.pressure(6).p, '--', 'DisplayName','$P6$ exp', 'LineWidth', LineWidth)

ylim([0 35])
xlim([160 170])
yticks(0:5:35)

ylabel('$p\;[bar]$','Interpreter','latex')
title('Downstream Pressure','Interpreter','latex')
legend('Location','best','Interpreter','latex')

grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'LineWidth',AxisLineWidth);
set(get(gca,'XLabel'),'FontSize',Fsize,'Interpreter','latex');
set(get(gca,'YLabel'),'FontSize',Fsize,'Interpreter','latex');
legend box off;

% =========================
% shared x-label
% =========================
xlabel(t,'$t\;[s]$','Interpreter','latex');