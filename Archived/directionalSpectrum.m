clear spreadBinsEdge spreadBinCentre D

%% Defining parameters
spreadingFunctionConstant = 7; % n
waveHeading = 10; % mean wave heading
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

disp(spreadBinsEdge)
disp(wrapTo360(spreadBinCentre))
disp(sort(deg2rad(wrapTo360(spreadBinCentre))))
disp(D)
% plot(spreadBinCentre,D)
% hold on
disp(sum(D*deg2rad(spreadWidth)))
D = D / sum(D * deg2rad(spreadWidth));
disp(D)
disp(sum(D*deg2rad(spreadWidth)))
% plot(spreadBinCentre,D)
% legend(['Original','Normalized'])

% Compute centers of each bin

% A = sqrt(2*S.*domega*D);
% 
% 
% spreadingFunction(1,0,45)

%% Functions
% Need to add an assert for the range
function D = spreadingFunction(n, theta_m, theta)
    D = gamma(1+0.5*n) / (sqrt(pi)*gamma(0.5*0.5*n)) * cos(theta-theta_m)^n;
end