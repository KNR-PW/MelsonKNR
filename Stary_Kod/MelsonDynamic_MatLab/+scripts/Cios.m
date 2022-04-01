clear;
GaitEndPointsTrajectory = struct;


EndProbes = 80;
StartProbes = 80;

Time = 0.3*[0.8  1 2 1 0.8];
dt = 0.01;

RobotParameters.LoadModelParameters;
RbtMdlPar = RobotModelParameters;

Motion = struct;




Motion(1).r_RF = [0 -42.8 0]';
Motion(1).r_LF = [0 42.8 0]';
Motion(1).r_RH = [80 -140  140]';
Motion(1).r_LH = [80 140  140]';
Motion(1).r_CoM = [0 0 110]';
Motion(1).rpy_RF =  pi/180*[0 0 0]';
Motion(1).rpy_LF =  pi/180*[0 0 0]';


Motion(2).r_RF = [0 -42.8 0]';
Motion(2).r_LF = [0 42.8 0]';
Motion(2).r_RH = [100 -100  160]';
Motion(2).r_LH = [100 100  160]';
Motion(2).r_CoM = [0 0 110]';
Motion(2).rpy_RF =  pi/180*[0 0 0]';
Motion(2).rpy_LF =  pi/180*[0 0 0]';

Motion(3).r_RF = [0 -42.8 0]';
Motion(3).r_LF = [0 42.8 0]';
Motion(3).r_RH = [240 0  210]';
Motion(3).r_LH = [0 120  160]';
Motion(3).r_CoM = [0 0 110]';
Motion(3).rpy_RF =  pi/180*[0 0 0]';
Motion(3).rpy_LF =  pi/180*[0 0 0]';




Motion(4).r_RF = [0 -42.8 0]';
Motion(4).r_LF = [0 42.8 0]';
Motion(4).r_LH = [240 0  210]';
Motion(4).r_RH = [0 -120  160]';
Motion(4).r_CoM = [0 0 110]';
Motion(4).rpy_RF =  pi/180*[0 0 0]';
Motion(4).rpy_LF =  pi/180*[0 0 0]';


Motion(5) = Motion(2);
Motion(6) = Motion(1);

r_LF_ext = [];
r_RF_ext = [];
r_LH_ext = [];
r_RH_ext = [];
r_CoM_ext = [];

rpy_LF_ext = [];
rpy_RF_ext = [];
      
for i=1:length(Time);
    r_LF_ext = [ r_LF_ext VectLinspace(Motion(i).r_LF, Motion(i+1).r_LF, Time(i)/dt)];
    r_RF_ext = [ r_RF_ext VectLinspace(Motion(i).r_RF, Motion(i+1).r_RF, Time(i)/dt)];
    r_LH_ext = [ r_LH_ext VectLinspace(Motion(i).r_LH, Motion(i+1).r_LH, Time(i)/dt)];
    r_RH_ext = [ r_RH_ext VectLinspace(Motion(i).r_RH, Motion(i+1).r_RH, Time(i)/dt)];
    r_CoM_ext = [ r_CoM_ext VectLinspace(Motion(i).r_CoM, Motion(i+1).r_CoM, Time(i)/dt)];
    
    
    
    rpy_LF_ext = [ rpy_LF_ext VectLinspace(Motion(i).rpy_LF ,Motion(i+1).rpy_LF ,Time(i)/dt)];
    rpy_RF_ext = [ rpy_RF_ext VectLinspace(Motion(i).rpy_RF ,Motion(i+1).rpy_RF ,Time(i)/dt)];
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
    HelpfulPlots.robot_RF(RbtMdlPar, GaitExt(:,TimeIter));
    while(toc<0.05)
    end
%      F(MovieIter) = getframe(gcf);
%     MovieIter = MovieIter + 1;
end
    pause(0.05)

    HelpfulPlots.robot_RF(RbtMdlPar, GaitExt(:,length(GaitExt)));

