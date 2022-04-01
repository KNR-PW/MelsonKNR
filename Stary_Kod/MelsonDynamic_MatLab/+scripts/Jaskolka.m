clear;
GaitEndPointsTrajectory = struct;


EndProbes = 80;
StartProbes = 80;

Time = 1.7*[1 1 1 1.7 1 1 1 1];
dt = 0.01;

RobotParameters.LoadModelParameters;
RbtMdlPar = RobotModelParameters;

Motion = struct;

Motion(1).r_RF = [0 -42.8 0]'; %start
Motion(1).r_LF = [0 42.8 0]';
Motion(1).r_RH = [80 -140  140]';
Motion(1).r_LH = [80 140  140]';
Motion(1).r_CoM = [0 0 150]';
Motion(1).rpy_RF =  pi/180*[0 0 0]';
Motion(1).rpy_LF =  pi/180*[0 0 0]';

Motion(2).r_RF = [0 -42.8 0]'; %przychy³
Motion(2).r_LF = [0 42.8 0]';
Motion(2).r_RH = [80 -95  140]';
Motion(2).r_LH = [80 185  140]';
Motion(2).r_CoM = [0 45 150]';
Motion(2).rpy_RF =  pi/180*[0 0 0]';
Motion(2).rpy_LF =  pi/180*[0 0 0]';

Motion(3).r_RF = [0 -42.8 50]'; %podnieisenie stopy
Motion(3).r_LF = [0 42.8 0]';
Motion(3).r_RH = [80 -95  140]';
Motion(3).r_LH = [80 185  140]';
Motion(3).r_CoM = [0 45 150]';
Motion(3).rpy_RF =  pi/180*[0 0 0]';
Motion(3).rpy_LF =  pi/180*[0 0 0]';

Motion(4).r_RF = [-190 -42.8 180]'; %wysuniecie do ty³u
Motion(4).r_LF = [0 42.8 0]';
Motion(4).r_RH = [125 -200  170]';
Motion(4).r_LH = [125 320  170]';
Motion(4).r_CoM = [0 45 160]';
Motion(4).rpy_RF =  pi/180*[0 60 0]';
Motion(4).rpy_LF =  pi/180*[0 0 0]';

Motion(5) = Motion(4);

% % % % Motion(5) = Motion(4);    %machanie do dory
% % % % Motion(5).r_RH = [125 -190  240]';
% % % % Motion(5).r_LH = [125 330  240]';
% % % % 
% % % % Motion(6) = Motion(5);
% % % % Motion(6).r_RH = [125 -200  170]';  % machanie w dó³
% % % % Motion(6).r_LH = [125 320  170]';
% % % % 
% % % % Motion(7) = Motion(5); % do góry
% % % % Motion(8) = Motion(6); %w dó³

Motion(6) = Motion(4); % powrót do jaskó³ki

% Motion(6).r_RF = [-180 -42.8 180]';
% Motion(6).r_LF = [0 42.8 0]';
% Motion(6).r_RH = [100 -200  170]';
% Motion(6).r_LH = [100 320  170]';
% Motion(6).r_CoM = [0 45 160]';
% Motion(6).rpy_RF =  pi/180*[0 60 0]';
% Motion(6).rpy_LF =  pi/180*[0 0 0]';

Motion(7) = Motion(3);
Motion(8) = Motion(2);



Motion(9) = Motion(1);






r_LF_ext = [];
r_RF_ext = [];
r_LH_ext = [];
r_RH_ext = [];
r_CoM_ext = [];

rpy_LF_ext = [];
rpy_RF_ext = [];
      
for i=1:length(Time);
    r_LF_ext = [ r_LF_ext VectLinspace(Motion(i).r_LF, Motion(i+1).r_LF, round(Time(i)/dt))];
    r_RF_ext = [ r_RF_ext VectLinspace(Motion(i).r_RF, Motion(i+1).r_RF, round(Time(i)/dt))];
    r_LH_ext = [ r_LH_ext VectLinspace(Motion(i).r_LH, Motion(i+1).r_LH, round(Time(i)/dt))];
    r_RH_ext = [ r_RH_ext VectLinspace(Motion(i).r_RH, Motion(i+1).r_RH, round(Time(i)/dt))];
    r_CoM_ext = [ r_CoM_ext VectLinspace(Motion(i).r_CoM, Motion(i+1).r_CoM, round(Time(i)/dt))];
    
    
    
    rpy_LF_ext = [ rpy_LF_ext VectLinspace(Motion(i).rpy_LF ,Motion(i+1).rpy_LF ,round(Time(i)/dt))];
    rpy_RF_ext = [ rpy_RF_ext VectLinspace(Motion(i).rpy_RF ,Motion(i+1).rpy_RF ,round(Time(i)/dt))];
end




N = length(r_RF_ext);

GaitEndPointsTrajectory.r_RF = r_RF_ext;
GaitEndPointsTrajectory.r_LF = r_LF_ext;
GaitEndPointsTrajectory.rot_RF = RPY(rpy_RF_ext);
GaitEndPointsTrajectory.rot_LF = RPY(rpy_LF_ext);
GaitEndPointsTrajectory.r_LH = r_LH_ext;
GaitEndPointsTrajectory.r_RH = r_RH_ext;
GaitCoMTrajectory = r_CoM_ext;


GaitJointAngles = zeros(19, N);


Robot_JointSlopes = [2*ones(1,6) 2*ones(1,6) 32*ones(1,7)]' * ones(1,N);



GaitParameters.NumberOfTimeInstances = N;




[GaitJointAngles]  = GenerateJointAngles(RobotModelParameters, GaitEndPointsTrajectory, GaitCoMTrajectory, GaitParameters);


AnglesStart = VectLinspace(RobotModelParameters.q0,GaitJointAngles(:,1),StartProbes);
AnglesEnd = VectLinspace(GaitJointAngles(:,GaitParameters.NumberOfTimeInstances),RobotModelParameters.q0,EndProbes);

% GaitExt = [AnglesStart GaitJointAngles AnglesEnd];
GaitExt = [ AnglesStart GaitJointAngles AnglesEnd];

Robot_JointSlopes = [7*ones(1,6) 7*ones(1,6) 64*ones(1,7)]' * ones(1,N);

SlopesStart = Robot_JointSlopes(:,1) * ones(1,StartProbes);
SlopesEnd = Robot_JointSlopes(:,GaitParameters.NumberOfTimeInstances) * ones(1,EndProbes);

% Robot_JointSlopes = [SlopesStart Robot_JointSlopes SlopesEnd];
Robot_JointSlopes = [SlopesStart Robot_JointSlopes SlopesEnd];

GaitPhases.LeftLeg = string(zeros(1,length(GaitExt)));
GaitPhases.RightLeg = string(zeros(1,length(GaitExt)));

%% 8. Convert joint angles in model space to robot (dynamixel) space
disp('Convert Joint Angles ...');tic;
Robot_JointAngles =  zeros(length(GaitExt), 19)';
for TimeIter = 1:1:length(GaitExt)
    Robot_JointAngles(:,TimeIter) = radModel2Dnmx(GaitExt(:,TimeIter));    
    GaitPhases.RightLeg(TimeIter) = 'support';
    GaitPhases.LeftLeg(TimeIter) = 'support';
    

end
toc








for TimeIter = 1:5:length(GaitExt)
    tic;
    clf;
    HelpfulPlots.robot_LF(RbtMdlPar, GaitExt(:,TimeIter));
    while(toc<0.05)
    end
%      F(MovieIter) = getframe(gcf);
%     MovieIter = MovieIter + 1;
end
    pause(0.05)

    HelpfulPlots.robot_RF(RbtMdlPar, GaitExt(:,length(GaitExt)));

