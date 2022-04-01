% Description:
%     Main frame for offline gait generation:
% Gait is produced in few steps:
% 0. Load model parameters.
% 1. Define type of movement and check parameters: 
%       - walk, (TODO)kick ball, (TODO)hit opponent by hand
%       - define parameters: initial and terminal
% 2. Plan steps feet trajectory and feet characteristic points
% 3. Generate reference ZMP trajectory
% 4. Generate CoM trajectory
% 5. Generate Waist Trajectory
% 6. Generate Hands Trajectory
% 7. Solve IKP
% 8. Convert joint angles in model space to robot (dynamixel) space

clear;

%% 0-1. Load parameters.
disp('Gait Parameters Check ...');tic;
RobotParameters.LoadParameters;
toc

%% 2. Plan steps and feet trajectory
disp('Gait Step Planer ...');tic;
[GaitSupportPolygon, GaitEndPointsTrajectory, GaitPhases, CharPointsContactOnOff] = GaitStepPlaner(GaitParameters, RobotModelParameters, GaitPhases, GaitSupportPolygon, GaitEndPointsTrajectory, CharPointsContactOnOff);
toc

%% 3. Generate reference ZMP trajectory
disp('Gait Generate ZMP Ref ...');tic;
[GaitZMPReferenceTrajectory] = GaitGenerateZMPRef(GaitSupportPolygon, CharPointsContactOnOff, GaitPhases);
toc

%% 4. Generate CoM trajectory
disp('Gait Generate Com Trajectory ...');tic;
[GaitCoMTrajectory(1,:), GaitZMPPlannedTrajectory(1,:)] = GaitGenerateComTrajectory(GaitZMPReferenceTrajectory(1,:), GaitParameters, RobotModelParameters, [GaitZMPReferenceTrajectory(1,1) 0 0]');
[GaitCoMTrajectory(2,:), GaitZMPPlannedTrajectory(2,:)] = GaitGenerateComTrajectory(GaitZMPReferenceTrajectory(2,:), GaitParameters, RobotModelParameters, [GaitZMPReferenceTrajectory(2,1) 0 0]');
GaitCoMTrajectory(3,:) = ones(1,GaitParameters.NumberOfTimeInstances) .* GaitParameters.StepPelvisHeight;
toc
% HelpfulPlots.PlotAllZMPandCoM 

%% 5. Generate waist trajectory
disp('Generate Waist Trajectory ...');tic;
[GaitEndPointsTrajectory] = GenerateWaistTrajectory(GaitEndPointsTrajectory, GaitCoMTrajectory, GaitParameters);
toc

%% 6. Generate hands trajectory
disp('Generate Hand Trajectory ...'); tic;
[GaitEndPointsTrajectory] = GenerateHandsTrajectory(GaitEndPointsTrajectory, GaitCoMTrajectory, GaitParameters, RobotModelParameters);
toc

%% 7. Solve IKP
disp('Gait Compute IKP ...'); tic;
GaitJointAngles = zeros(19, GaitParameters.NumberOfTimeInstances);
for TimeIter = 1:1:GaitParameters.NumberOfTimeInstances
    GaitJointAngles(:,TimeIter) = Kinematics.IKS_Global(RobotModelParameters, GaitEndPointsTrajectory.r_W(:,TimeIter), GaitEndPointsTrajectory.rot_W(:,:,TimeIter), GaitEndPointsTrajectory.r_LF(:,TimeIter), GaitEndPointsTrajectory.rot_LF(:,:,TimeIter), GaitEndPointsTrajectory.r_RF(:,TimeIter), GaitEndPointsTrajectory.rot_RF(:,:,TimeIter), GaitEndPointsTrajectory.r_LH(:,TimeIter), GaitEndPointsTrajectory.r_RH(:,TimeIter), 0)';
end
% save('GaitJointAngles.mat','GaitJointAngles');
% load('GaitJointAngles');
toc

%% 8. Convert joint angles in model space to robot (dynamixel) space
disp('Convert Joint Angles ...');tic;
Robot_JointAngles =  zeros(GaitParameters.NumberOfTimeInstances, 19)';
for TimeIter = 1:1:GaitParameters.NumberOfTimeInstances
    Robot_JointAngles(:,TimeIter) = radModel2Dnmx(GaitJointAngles(:,TimeIter));    
end
save('RJA_Walk10cm.mat','Robot_JointAngles');
toc

%% Additional, useful computations
% for TimeIter = 1:1:GaitParameters.NumberOfTimeInstances
%     GaitEndPtsTraj.anglesCB_RF(TimeIter) = atan2(GaitEndPointsTrajectory.rot_RF(2,1,TimeIter),GaitEndPointsTrajectory.rot_RF(2,2,TimeIter));
%     GaitEndPtsTraj.anglesCB_LF(TimeIter) = atan2(GaitEndPointsTrajectory.rot_LF(2,1,TimeIter),GaitEndPointsTrajectory.rot_LF(2,2,TimeIter));
%     GaitEndPtsTraj.anglesCB_W(TimeIter) = (GaitEndPtsTraj.anglesCB_LF(TimeIter) + GaitEndPtsTraj.anglesCB_RF(TimeIter) )/2;
% end
CalculateSlopes;


%% Plot Stick Man
% loops = size(1:20:GaitParameters.NumberOfTimeInstances,2);
% F(loops) = struct('cdata',[],'colormap',[]);
% MovieIter = 1;
for TimeIter = 1:20:GaitParameters.NumberOfTimeInstances
    clf;
    HelpfulPlots.stick_robot(RobotModelParameters, GaitJointAngles(:,TimeIter), GaitEndPointsTrajectory.r_W(:,TimeIter), GaitEndPointsTrajectory.rot_W(:,:,TimeIter));
    pause(0.01);
%      F(MovieIter) = getframe(gcf);
%     MovieIter = MovieIter + 1;
end
% % 
% % save movie   
% writerObj = VideoWriter('Movie.avi'); % create the video writer with 1 fps
% writerObj.FrameRate = 50; % set the seconds per image
% % open the video writer
% open(writerObj);
% % write the frames to the video
% for i=1:length(F)
%     % convert the image to a frame
%     frame = F(i) ;    
%     writeVideo(writerObj, frame);
% end
% % close the writer object
% close(writerObj);


%% Plot heel and ankle path
% plot(GaitEndPointsTrajectory.LeftFootHeel(1,:),GaitEndPointsTrajectory.LeftFootHeel(2,:));
% hold on;
% plot(GaitEndPointsTrajectory.LeftFootAnkle(1,:),GaitEndPointsTrajectory.LeftFootAnkle(2,:));


%% Plot Left Leg Joint Angles
% p1 = plot(GaitJointAngles.LeftAnkle*180/pi,'DisplayName','Left Ankle');
% hold on;
% grid on;
% p2 = plot(GaitJointAngles.LeftHip*180/pi,'DisplayName','Left Hip');
% p3 = plot(GaitJointAngles.LeftKnee*180/pi,'DisplayName','Left Knee');
% legend([p1 p2 p3])

%% Plot Left Leg Joint Angles
% p1 = plot(GaitJointAngles.RightAnkle*180/pi,'DisplayName','Right Ankle');
% hold on;
% grid on;
% p2 = plot(GaitJointAngles.RightHip*180/pi,'DisplayName','Right Hip');
% p3 = plot(GaitJointAngles.RightKnee*180/pi,'DisplayName','Right Knee');
% legend([p1 p2 p3])

%% Plot Floor
% plot(GaitSupportPolygon.back,'DisplayName','Support Polygon Back');
% hold on
% plot(GaitSupportPolygon.front,'DisplayName','Support Polygon Front');
% plot(GaitZMPReferenceTrajectory,'--','DisplayName','ZMP Ref Trajectory');
% plot(GaitCoMTrajectory(1,:),'DisplayName','CoM Trajectory');
% plot(GaitZMPPlannedTrajectory,'-','DisplayName','ZMP Obtained Trajectory');
% hold off
% grid on;