% inds = find(output.wave.time >= simu.rampTime + waves.period*5);
% %%
% surgeMeanDriftTH = body.hydroForce.hf1.fExt.md(1)*waves.amplitude^2;
% surgeMeanDriftWS = mean(output.bodies.forceExcitation(inds,1));
% %%
% %close all
% figure()
% plot(output.bodies.time/waves.period,output.bodies.forceExcitation(:,1)/(simu.rho*simu.gravity*waves.amplitude),...
%      output.bodies.time/waves.period,ones(size(output.bodies.time)).*mean(output.bodies.forceExcitation(inds,1)/(simu.rho*simu.gravity*waves.amplitude)),'--',...
%      output.bodies.time/waves.period,ones(size(output.bodies.time)).*surgeMeanDriftTH/(simu.rho*simu.gravity*waves.amplitude),'-.');grid on
% xlabel('Time, t/T, [-]');ylabel('Surge Wave Excitation Force, f_{ext,1}/\rhogA, [N/(N/m^{2})]');
% legend('Surge Excitation Force','Surge Mean Drift Force WEC-Sim','Surge Mean Drift Force Theory')
% figure()
% plot(output.bodies.time/waves.period,output.bodies.position(:,1));grid on
% xlabel('Time, t/T, [-]');ylabel('Surge Displacement, \zeta_{1}, [m]');

% Mean drift table
md1 = body.hydroForce.hf1.fExt.md(1)*waves.amplitude^2;
md2 = body.hydroForce.hf1.fExt.md(2)*waves.amplitude^2;
md3 = body.hydroForce.hf1.fExt.md(3)*waves.amplitude^2;
md4 = body.hydroForce.hf1.fExt.md(4)*waves.amplitude^2;
md5 = body.hydroForce.hf1.fExt.md(5)*waves.amplitude^2;
md6 = body.hydroForce.hf1.fExt.md(6)*waves.amplitude^2;

EfficiencyTable = table( ...
    md1, md2, md3, md4, md5, md6, ...
    'VariableNames', {'F1','F2','F3','F4','F5', 'F6'} );

disp(EfficiencyTable)

figure('Name','Excitation Forces')

for i = 1:6
    subplot(2,3,i)
    plot(output.bodies.time, output.bodies.forceExcitation(:,i))
    title(['F' num2str(i)])
    xlabel('Time (s)')
    ylabel('Force (N)')
    grid on
end