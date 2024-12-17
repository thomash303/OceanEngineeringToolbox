 figure('Name','OET')
plot(TestResults2.time,TestResults2.floatexcitationexcitationRegularWaveF3)
hold on
plot(TestResults2.time,TestResults2.floatradiationradiationForceF3)
plot(TestResults2.time,TestResults2.floathydrostatichydrostaticForceF3)
totalForce = -TestResults2.floatexcitationexcitationRegularWaveF3...
    + TestResults2.floatradiationradiationForceF3...
    + TestResults2.floathydrostatichydrostaticForceF3;
plot(TestResults2.time,totalForce)
legend('Excitation', 'Radiation','Hydrostatic','total','location','best');
ylabel ('Force (N)')
xlabel('Time (s)')
title('OET - Heave Forces on a float')
hold off

%% WS
figure('Name','WS')
plot(output.bodies.time, (output.bodies.forceExcitation(:,3))); 
hold on
plot(output.bodies.time, (output.bodies.forceRadiationDamping(:,3))); 
plot(output.bodies.time, (output.bodies.forceRestoring(:,3))); 
totalForce = output.bodies.forceExcitation(:,3) - output.bodies.forceRadiationDamping(:,3)...
    - output.bodies.forceRestoring(:,3);
plot(output.bodies.time,totalForce);
legend('Excitation', 'Radiation','Hydrostatic','total','location','best');
ylabel ('Force (N)')
xlabel('Time (s)')
title('WEC-Sim - Heave Forces on a float')

%% Surge
figure('Name','WS')
plot(output.bodies.time, (output.bodies.forceExcitation(:,1))); 
hold on
plot(output.bodies.time, (output.bodies.forceRadiationDamping(:,1))); 
plot(output.bodies.time, (output.bodies.forceAddedMass(:,1)));
plot(output.bodies.time, (output.bodies.forceRestoring(:,1))); 
totalForce = output.bodies.forceExcitation(:,1) - output.bodies.forceRadiationDamping(:,1)...
    - output.bodies.forceRestoring(:,1) - output.bodies.forceAddedMass(:,1);
plot(output.bodies.time,totalForce);
plot(output.bodies.time,output.bodies.forceTotal(:,1));
legend('Excitation', 'Radiation','Hydrostatic','added mass','total','total WS','location','best');
ylabel ('Force (N)')
xlabel('Time (s)')
title('WEC-Sim - Surge Forces on a float')

