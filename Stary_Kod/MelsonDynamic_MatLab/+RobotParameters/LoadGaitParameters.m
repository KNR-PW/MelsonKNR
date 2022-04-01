% % step Parameters
% GaitParameters.NumberOfTimeInstances = 1200; 
% GaitParameters.TimeInterval = 10;       %[ms] time interval in between simulation time intervals
% GaitParameters.StepPelvisHeight = 145+35;     %[mm] default 0.237
% GaitParameters.NumOfStepsLeftLeg = 1;
% GaitParameters.NumOfStepsRightLeg = 1;
% GaitParameters.StepHeight = 35+40; % [mm]
% 
% % Gait cycle percentage particiation, sum must equal 1
% GaitParameters.PARAM_DS = 0.3;    %Double Support phase - times two for whole cycle (2 steps)
% GaitParameters.PARAM_SS = 0.5 - GaitParameters.PARAM_DS; %Single Support phase - times two for whole cycle (2 steps)

% step Parameters
GaitParameters.NumberOfTimeInstances = 1200; 
GaitParameters.TimeInterval = 10;       %[ms] time interval in between simulation time intervals
GaitParameters.StepPelvisHeight = 155+35;     %[mm] default 0.237
GaitParameters.NumOfStepsLeftLeg = 3;
GaitParameters.NumOfStepsRightLeg = 4;
GaitParameters.StepHeight = 35+40; % [mm]

% Gait cycle percentage particiation, sum must equal 1
GaitParameters.PARAM_DS = 0.25;    %Double Support phase - times two for whole cycle (2 steps)
GaitParameters.PARAM_SS = 0.5 - GaitParameters.PARAM_DS; %Single Support phase - times two for whole cycle (2 steps)