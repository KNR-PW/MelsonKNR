%% Odtwarzanie ruchów na robocie
% Wymaga wczeœniejszego uruchomienia GenerateTrajectory.m
Dynamixel.Init;
Slopes = [9*ones(1,12) 32*ones(1,7)]' * ones(1,N);

Robot_JointAngles =  zeros(19,N);
for TimeIter = 1:N
    Robot_JointAngles(:,TimeIter) = radModel2Dnmx_new(Motion.JointPos(:,TimeIter));    
end

CalculateSlopes;


Dynamixel.Play(Robot_JointAngles,Robot_JointSlopes)
Dynamixel.ClosePort;
