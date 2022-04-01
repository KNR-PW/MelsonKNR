% Generate trajectory desired trajectory of CoM

function [GaitCoMTrajectory, GaitZMPPlannedTrajectory] = GaitGenerateComTrajectory(GaitZMPReferenceTrajectory, GaitParameters, RobotModelParameters, Initial_CoM)

% Parameters for gait generation (trajectory of CoM) using ZMP preview
% control
deltaT = GaitParameters.TimeInterval; %  [ms] time discretization
%SimulationTime = 10000; % in ms
NumberOfSimulationTimeInstances = GaitParameters.NumberOfTimeInstances; %SimulationTime / deltaT;
GaitZMPReferenceTrajectory = GaitZMPReferenceTrajectory ./ 1000;
Initial_CoM = Initial_CoM ./ 1000;

z_c = 0.25; % height of CoM plane in m
g = 9.81; % gravity acc in m/s^2

A = [ 1 (deltaT*(10^(-3))) (deltaT*(10^(-3)))^2/2;  % n x n
      0 1 (deltaT*(10^(-3)));
      0 0 1];
B = [ (deltaT*(10^(-3)))^3/6 (deltaT*(10^(-3)))^2/2 (deltaT*(10^(-3)))]';   % n x r
C = [1 0 (-z_c/g)*1];       % p x r

x_0 = Initial_CoM; % State-space variables  n x 1 while dim(u) = r x 1 and dim(y) = p x 1
  

% For controler
N_l = 500 / deltaT; % seconds / time interval
Q_e = 0.1 / deltaT;
Q_x =  diag([10 1 1])*0.01 * deltaT;
R = 1 * 10^(-6) / deltaT;

%% Input/generate zmp reference trajectory
ZMP_Ref_trajectory = GaitZMPReferenceTrajectory; %Generation_ZMP_Trajectory(NumberOfSimulationTimeInstances+N_l, deltaT, 0.3);
ZMP_Ref_trajectory(size(GaitZMPReferenceTrajectory,2):size(GaitZMPReferenceTrajectory,2)+N_l) = ZMP_Ref_trajectory(size(GaitZMPReferenceTrajectory,2) - 1);
%% Compute "servo problem" to obtain CoM trajectory

x = zeros(3,NumberOfSimulationTimeInstances);
x(:,1) = x_0;
y = zeros(1,NumberOfSimulationTimeInstances);
error = zeros(1,NumberOfSimulationTimeInstances);
u = zeros(1,NumberOfSimulationTimeInstances);

[ G_i, G_x, G_p ] = OptimalPreviewableControl_Parameters( A, B, C, Q_e, Q_x, R , N_l);

for i = 1:1:(NumberOfSimulationTimeInstances)
    y(i) = C * x(:,i);
    error(i) = y(i) - ZMP_Ref_trajectory(i);
   
    u(i) = - G_i * sum(error(1:i)) - (G_x * x(:,i)) - G_p * ZMP_Ref_trajectory(i+1:i+N_l)';
    
    x(:,i+1) = A * x(:,i) + B * u(i);
    
end

GaitCoMTrajectory = x(1,1:NumberOfSimulationTimeInstances) .* 1000; %;ones(1,NumberOfSimulationTimeInstances)*GaitParameters.StepPelvisHeight];
GaitZMPPlannedTrajectory = y .* 1000;
% GaitCoMTrajectory_Velocity = x(2,1:NumberOfSimulationTimeInstances);
% GaitCoMTrajectory_Acceleration = x(3,1:NumberOfSimulationTimeInstances);

end

function [ G_i, G_x, G_d ] = OptimalPreviewableControl_Parameters( A, B, C, Q_e, Q_x, R , N_l)
%OPTIMALPREVIEWABLECONTROL_PARAMETERS Summary of this function goes here
%   Detailed explanation goes here

B_tilda = [C * B; B];
I_tilda = [ eye(size(C,1)) ; zeros(size(A,1), size(C,1)) ];
F_tilda = [ C * A; A ];
Q_tilda = [ Q_x zeros(size(Q_x,1), size(Q_e,2)); zeros(size(Q_e,1), size(Q_x,2)) Q_e];
A_tilda = [I_tilda F_tilda];
X_tilda = zeros(size(C,1) + size(B,1) ,size(C,1) , N_l); %(P+n) x p x N_l
G_d = zeros(1, N_l);

% Solve Algebraic Riccccccati

[K_tilda,L_dare,G_dare] = dare(A_tilda,B_tilda,Q_tilda,R); % (p + n) x (p + n)

G_i = [R + B_tilda' * K_tilda * B_tilda]^(-1) * B_tilda' * K_tilda * I_tilda;
G_x = [R + B_tilda' * K_tilda * B_tilda]^(-1) * B_tilda' * K_tilda * F_tilda;

A_c_tilda = A_tilda - B_tilda * [R + B_tilda'*K_tilda*B_tilda]^(-1) * B_tilda' * K_tilda * A_tilda;

G_d(1) = -G_i;
X_tilda(:,:,1) = - A_c_tilda' * K_tilda * I_tilda;
for iter = 2:1:N_l
    X_tilda(:,:,iter) = A_c_tilda' * X_tilda(:,:,iter-1);
    G_d(iter) = [R + B_tilda' * K_tilda * B_tilda]^(-1) * B_tilda' * X_tilda(:,:,iter-1);
end

end