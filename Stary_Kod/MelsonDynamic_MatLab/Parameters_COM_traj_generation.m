% Parameters for gait generation (trajectory of CoM) using ZMP preview
% control
deltaT = 1; % in ms
SimulationTime = 10000 % in ms
NumberOfSimulationTimeInstances = SimulationTime / deltaT;

z_c = 0.8700; % height of CoM plane in m
g = 9.81; % gravity acc in m/s^2

A = [ 1 (deltaT*(10^(-3))) (deltaT*(10^(-3)))^2/2;  % n x n
      0 1 (deltaT*(10^(-3)));
      0 0 1];
B = [ (deltaT*(10^(-3)))^3/6 (deltaT*(10^(-3)))^2/2 (deltaT*(10^(-3)))]';   % n x r
C = [1 0 (-z_c/g)*1];       % p x r

x_0 = [0 0 0]'; % State-space variables  n x 1 while dim(u) = r x 1 and dim(y) = p x 1
  

% For controler
N_l = 2000 / deltaT; % seconds / time interval
Q_e = 1;
Q_x =  diag([20 10 10])*0.11;
R = 1 * 10^(-6);