function [ ZMP_ref_trajectory ] = Generation_ZMP_Trajectory( SamplesNumber, TimePeriod, StepLength )
%GENERATION_ZMP_TRAJECTORY Summary of this function goes here
%   Detailed explanation goes here
ZMP_ref_trajectory = zeros(1,SamplesNumber);
StepTime = [2000 4000 6000 SamplesNumber*TimePeriod] / TimePeriod;
StepPosition = [0 StepLength StepLength*2 StepLength*3];
j = 1;


for i = 1:1:(SamplesNumber)
    if i > StepTime(j) && j < size(StepTime,2)
        j = j+1;
      %  j = mod(j + 1, size(StepTime,2));
    end
    
    ZMP_ref_trajectory(i) = StepPosition(j);
   
end

%plot(ZMP_ref_trajectory);
end