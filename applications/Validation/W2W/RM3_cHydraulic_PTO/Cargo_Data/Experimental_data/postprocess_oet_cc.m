% Plot general CC and OET data for the hydraulic PTO

% Pressure conversion
paBar = 1e5;

%% Loading data
load('cargo_data.mat');
load('oet_cargo_datav3.mat');

%% Figure 1
figure('Name','Flow and Displacement')
subplot(2,1,1)
plot(oet_cargo_data.time, oet_cargo_data.f1, 'DisplayName','f1')
hold on
plot(oet_cargo_data.time, oet_cargo_data.f2, 'DisplayName','f2')

plot(cargo_data.flow(1).t, cargo_data.flow(1).q, 'DisplayName','exp f1')
plot(cargo_data.flow(2).t, cargo_data.flow(2).q, 'DisplayName','exp f2')

ylim([-2 10])
xlim([160 170])
yticks(-2:2:10)
grid on
ylabel('Flow (lpm)')
xlabel('Time (s)')
legend('Location','best')
title('Volumetric Flow Rate')
hold off

s_offset = 0.15;

subplot(2,1,2)
plot(oet_cargo_data.time, oet_cargo_data.s - s_offset, 'DisplayName','s')
hold on
plot(cargo_data.disp.t, cargo_data.disp.s, 'DisplayName','exp s')
ylim([-0.2 0.15])
xlim([160 170])
yticks(-0.2:0.05:0.15)
grid on
ylabel('Displacement (m)')
xlabel('Time (s)')
legend('Location','best')
title('Displacement')
hold off

%% Figure 2
figure('Name','Piston Cylinder Pressure and Force')
subplot(2,1,1)
plot(oet_cargo_data.time+1.6, oet_cargo_data.p1, 'DisplayName','p1')
hold on
plot(oet_cargo_data.time+1.6, oet_cargo_data.p2, 'DisplayName','p2')

plot(cargo_data.pressure(1).t, cargo_data.pressure(1).p, 'DisplayName','exp p1')
plot(cargo_data.pressure(2).t, cargo_data.pressure(2).p, 'DisplayName','exp p2')

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
plot(oet_cargo_data.time, oet_cargo_data.fpto, 'DisplayName','Fpto')
hold on
plot(cargo_data.pto.t, cargo_data.pto.F, 'DisplayName','exp Fpto')
% plot(t1, Fpto_exp, 'DisplayName','exp Fpto manual')
plot(t1, Fpto_exp+1800, 'DisplayName','exp Fpto manual shift')
plot(oet_cargo_data.time+1.6, 2000+Ap*1e5*(oet_cargo_data.p1-oet_cargo_data.p2), 'DisplayName','Cust pto')


ylim([-3000 3000])
xlim([160 170])
yticks(-3000:1000:3000)
grid on
ylabel('Force (N)')
xlabel('Time (s)')
legend('Location','best')
title('PTO Force')
hold off

%% Figure 3
figure('Name','HP Pressures')
subplot(2,1,1)
plot(oet_cargo_data.time, oet_cargo_data.p3, 'DisplayName','p3')
hold on
plot(oet_cargo_data.time, oet_cargo_data.p4, 'DisplayName','p4')

plot(cargo_data.pressure(3).t, cargo_data.pressure(3).p, 'DisplayName','exp p3')
plot(cargo_data.pressure(4).t, cargo_data.pressure(4).p, 'DisplayName','exp p4')

ylim([27 33])
% ylim([27 30])
xlim([160 170])
yticks(27:0.5:30)
grid on
ylabel('Pressure (bar)')
xlabel('Time (s)')
legend('Location','best')
title('HP and LP Pressures')
hold off

subplot(2,1,2)
plot(oet_cargo_data.time, oet_cargo_data.p5, 'DisplayName','p5')
hold on
plot(oet_cargo_data.time, oet_cargo_data.p6, 'DisplayName','p6')

plot(cargo_data.pressure(5).t, cargo_data.pressure(5).p, 'DisplayName','exp p5')
plot(cargo_data.pressure(6).t, cargo_data.pressure(6).p, 'DisplayName','exp p6')

ylim([0 33])
% ylim([0 30])
xlim([160 170])
yticks(0:5:30)
grid on
ylabel('Pressure (bar)')
xlabel('Time (s)')
legend('Location','best')
title('HP Pressures')
hold off