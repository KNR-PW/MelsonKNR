% INPUT: desired parameters of gait
% OUTPUT: corrected (if needed) parameters of gait 
% Description:
%     Check gait parameters:
%   - If Step_period is out of possible to perform range, change its value to
%   nearest possible
%   - Using Step_pelvis_height and model.MaxLegLength compute step length
%   and compare it to Step_length. If exceeded use three solutions:
%       - increase number of steps and reduce Step_length acordingly
%       - lower pelvis height

function [GaitParameters] = GaitParametersCheck(Step_length, Step_period, Step_pelvis_height, Step_num_of_steps)

GaitParameters.StepLength = Step_length;
GaitParameters.StepPeriod = Step_period;
GaitParameters.StepPelvisHeight = Step_pelvis_height;
GaitParameters.StepNumofSteps = Step_num_of_steps;

end