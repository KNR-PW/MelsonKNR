%% Animacja uzyskanych wyników
% Wymaga wczeœniejszego uruchomienia GenerateTrajectory.m
% lub TestChodu.m

N = size(X_Planned,2);

tic;
while toc/0.01<N
    TimeIter = round(toc/0.01)+1;
    
    clf;
    if TimeIter <N
    HelpfulPlots.robot_RF(RobotModelParameters, GaitJointAngles(:,TimeIter), X_Planned(:,TimeIter));
    end
%      F(MovieIter) = getframe(gcf);
%     MovieIter = MovieIter + 1;
end
    pause(0.05)
    TimeIter = N;
    HelpfulPlots.robot_RF(RobotModelParameters, GaitJointAngles(:,TimeIter), X_Planned(:,TimeIter));