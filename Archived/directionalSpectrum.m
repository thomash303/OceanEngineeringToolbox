clear spreadBinsEdge spreadBinCentre D

%% Defining parameters
spreadingFunctionConstant = 5; % n
waveHeading = 0; % mean wave heading
waveHeadingSpread = 30; % +/- range for wave heading
waveHeadingSpreadBins = 5; % bins about mean heading to consider

spreadWidth = 2*waveHeadingSpread / waveHeadingSpreadBins; % width of energy bin

for i = 1:waveHeadingSpreadBins+1
    spreadBinsEdge(i) = (-waveHeadingSpread + waveHeading) + spreadWidth*(i-1);
end

k = gamma(spreadingFunctionConstant/2 + 1) / (sqrt(pi)*gamma(spreadingFunctionConstant/2 + 1/2)); 

for i = 1:waveHeadingSpreadBins
    spreadBinCentre(i) = (spreadBinsEdge(i) + spreadBinsEdge(i+1)) / 2;
    D(i) = k * cos(deg2rad(spreadBinCentre(i)) - deg2rad(waveHeading))^spreadingFunctionConstant;
end

disp(['Bin edges (deg): ', num2str(spreadBinsEdge)])
disp(['Bin centres in 360 (deg): ', num2str(wrapTo360(spreadBinCentre))])
disp(['Sorted bin centres in 360 (rad): ', num2str(sort(deg2rad(wrapTo360(spreadBinCentre))))])
disp(['Spreading weights: ', num2str(D)])
% plot(spreadBinCentre,D)
% hold on
disp(['Energy conserved: ', num2str(sum(D*deg2rad(spreadWidth)))])
Dnorm = D / sum(D * deg2rad(spreadWidth));
disp(['Normalized spreading weights: ', num2str(Dnorm)])
disp(sum(Dnorm*deg2rad(spreadWidth)))
% plot(spreadBinCentre,D)
% legend(['Original','Normalized'])


%% Functions
% Need to add an assert for the range
function D = spreadingFunction(n, theta_m, theta)
    D = gamma(1+0.5*n) / (sqrt(pi)*gamma(0.5*0.5*n)) * cos(theta-theta_m)^n;
end