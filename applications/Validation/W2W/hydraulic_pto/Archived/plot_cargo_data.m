

figure('Name','Test Plot')
plot(time, s - s_offset, 'DisplayName','OET')
hold on
plot(dispSimTime, dispSim, 's', 'DisplayName','CC')
plot(dispExpTime, dispExp, 'o', 'Color','b',  'DisplayName','exp')
ylim([-0.2 0.15])
xlim([160 170])
yticks(-0.2:0.05:0.15)
hold off
grid on
ylabel('Displacement (m)')
xlabel('Time (s)')
legend('Location','best')
title('Displacement')