GaitEndPointsTrajectory = struct;

Time = 0.5*[1 1 1 1 1 1];
dt = 0.01;

RobotParameters.LoadModelParameters;
RbtMdlPar = RobotModelParameters;

r_W = [0; 50;10] * ones(1,7);
r_LF = RbtMdlPar.r_W_LT + RbtMdlPar.r_LT_LS + RbtMdlPar.r_LS_LF + RbtMdlPar.r_LF_center + [0; 0; 50];
r_LF = r_LF * ones(1,7);
r_RF = RbtMdlPar.r_W_RT + RbtMdlPar.r_RT_RS + RbtMdlPar.r_RS_RF + [-57; 0; -35] + [40; -20; 55];
r_RF = r_RF * ones(1,7);

rpy_W =  pi/180*[  0,   0,   0,   0,   0,   0,   0;
                   0,   0,   0,   0,   0,   0,   0;
                 -10, -10, -10, -10, -10, -10, -10];

rpy_LF = pi/180*[0   0   0   0   0   0   0;
                 0   0   0   0   0   0   0;
                10  10  10  10  10  10  10];
rpy_LF = zeros(3,7);            
rpy_RF = pi/180*[0   0   0   0   0   0   0;
                 0 -25   0 -25   0 -25   0;
               -10 -10 -10 -10 -10 -10 -10];
           
q_head = []

r_W_ext = [];
r_LF_ext = [];
r_RF_ext = [];

rpy_W_ext = [];
rpy_LF_ext = [];
rpy_RF_ext = [];
      
for i=1:length(Time);
    r_W_ext = [ r_W_ext VectLinspace(r_W(:,i),r_W(:,i+1),Time(i)/dt)];
    r_LF_ext = [ r_LF_ext VectLinspace(r_LF(:,i),r_LF(:,i+1),Time(i)/dt)];
    r_RF_ext = [ r_RF_ext VectLinspace(r_RF(:,i),r_RF(:,i+1),Time(i)/dt)];
    
    rpy_W_ext = [ rpy_W_ext VectLinspace(rpy_W(:,i),rpy_W(:,i+1),Time(i)/dt)];
    rpy_LF_ext = [ rpy_LF_ext VectLinspace(rpy_LF(:,i),rpy_LF(:,i+1),Time(i)/dt)];
    rpy_RF_ext = [ rpy_RF_ext VectLinspace(rpy_RF(:,i),rpy_RF(:,i+1),Time(i)/dt)];
end

N = length(rpy_W_ext);

GaitEndPointsTrajectory.r_W = r_W_ext;
GaitEndPointsTrajectory.r_RF = r_RF_ext;
GaitEndPointsTrajectory.r_LF = r_LF_ext;
GaitEndPointsTrajectory.rot_W = RPY(rpy_W_ext);
GaitEndPointsTrajectory.rot_RF = RPY(rpy_RF_ext);
GaitEndPointsTrajectory.rot_LF = RPY(rpy_LF_ext);
GaitEndPointsTrajectory.r_LH = zeros(3,N);
GaitEndPointsTrajectory.r_RH = zeros(3,N);

for TimeIter = 1:1:N
    GaitEndPointsTrajectory.r_LH(:,TimeIter) = Kinematics.DKS_LeftHand(RbtMdlPar, GaitEndPointsTrajectory.r_W(:,TimeIter), GaitEndPointsTrajectory.rot_W(:,:,TimeIter), [0, 15, -45].*pi/180 , 0 );
    GaitEndPointsTrajectory.r_RH(:,TimeIter) = Kinematics.DKS_RightHand(RbtMdlPar, GaitEndPointsTrajectory.r_W(:,TimeIter), GaitEndPointsTrajectory.rot_W(:,:,TimeIter), [0, -15, -45].*pi/180 , 0 );
end




GaitJointAngles = zeros(19, N);
for TimeIter = 1:1:N
    GaitJointAngles(1:6,TimeIter) = Kinematics.OZK_korpus_stopaP(RbtMdlPar, GaitEndPointsTrajectory.rot_W(:,:,TimeIter)' * ( GaitEndPointsTrajectory.r_RF(:,TimeIter) - GaitEndPointsTrajectory.r_W(:,TimeIter)), GaitEndPointsTrajectory.rot_W(:,:,TimeIter)' * GaitEndPointsTrajectory.rot_RF(:,:,TimeIter), [-57; 0; -35]);
    GaitJointAngles(7:12,TimeIter) = Kinematics.OZK_korpus_stopaL(RbtMdlPar, GaitEndPointsTrajectory.rot_W(:,:,TimeIter)' * ( GaitEndPointsTrajectory.r_LF(:,TimeIter) - GaitEndPointsTrajectory.r_W(:,TimeIter)), GaitEndPointsTrajectory.rot_W(:,:,TimeIter)' * GaitEndPointsTrajectory.rot_LF(:,:,TimeIter));

    fi_CH = 0;
    GaitJointAngles(13:15,TimeIter) = Kinematics.OZK_korpus_rekaP(RbtMdlPar, GaitEndPointsTrajectory.rot_W(:,:,TimeIter)' * (GaitEndPointsTrajectory.r_RH(:,TimeIter) - GaitEndPointsTrajectory.r_W(:,TimeIter)), fi_CH );
    GaitJointAngles(16:18,TimeIter) = Kinematics.OZK_korpus_rekaL(RbtMdlPar, GaitEndPointsTrajectory.rot_W(:,:,TimeIter)' * (GaitEndPointsTrajectory.r_LH(:,TimeIter) - GaitEndPointsTrajectory.r_W(:,TimeIter)), fi_CH );
    GaitJointAngles(19,TimeIter) = fi_CH;

    
end

Robot_JointAngles =  zeros(19,N);
for TimeIter = 1:1:N
    Robot_JointAngles(:,TimeIter) = radModel2Dnmx(GaitJointAngles(:,TimeIter));    
end

Robot_JointSlopes = [2*ones(1,6) 16*ones(1,6) 32*ones(1,7)]' * ones(1,N);


% for TimeIter = 1:1:N
%     clf;
%     HelpfulPlots.stick_robot(RbtMdlPar, GaitJointAngles(:,TimeIter), GaitEndPointsTrajectory.r_W(:,TimeIter), GaitEndPointsTrajectory.rot_W(:,:,TimeIter));
%     pause(0.01);
% %      F(MovieIter) = getframe(gcf);
% %     MovieIter = MovieIter + 1;
% end
