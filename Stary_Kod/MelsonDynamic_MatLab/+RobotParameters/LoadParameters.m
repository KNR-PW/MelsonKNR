% Joint angles order:
% q = [ q(1) , q(2),  q(3),  q(4),   q(5),    q(6),    q(7),  q(8),  q(9),  q(10),  q(11),   q(12),   q(13), q(14), q(15),  q(16), q(17), q(18),  q(19) ]
% q = [ RHipZ, RHipX, RHipY, RKneeY, RAnkleY, RAnkleX, LHipZ, LHipX, LHipY, LKneeY, LAnkleY, LAnkleX, RArmX, RArmY, RFarmX, RArmX, RArmY, RFarmX, Waist ]
%z
% Warunki pocz¹tkowe
%
%
%

%% Create "RobotModelParameters" structure
RobotParameters.LoadModelParameters;

%% Create "GaitParameters" structure
RobotParameters.LoadGaitParameters;
% NumberOfTimeInstances = GaitParameters.NumberOfTimeInstances; % temporary for init and terminal conditions

offset = 0;

%% Start and End of motion
% Where robot starts:
rot_RF_start = eye(3); r_RF_start = [0, -42.8-offset, 0]' - rot_RF_start*RobotModelParameters.r_RF_center;
rot_LF_start = eye(3); r_LF_start = [0,  42.8+offset, 0]' - rot_LF_start*RobotModelParameters.r_LF_center;
r_W_start = [0 0 GaitParameters.StepPelvisHeight]'; rot_W_start = eye(3);
r_LH_start = Kinematics.DKS_LeftHand(RobotModelParameters, r_W_start, rot_W_start, [0, 15 ,-45].*pi/180 , 0 );
r_RH_start = Kinematics.DKS_RightHand(RobotModelParameters, r_W_start, rot_W_start, [0, -15,-45].*pi/180 , 0 );

r_CoM_start = r_W_start + [0, 0, RobotModelParameters.r_W_RT(3)]';     % FROM r_w_o and constant vector
q_start = Kinematics.IKS_Global(RobotModelParameters, r_W_start, rot_W_start, r_LF_start, rot_LF_start, r_RF_start, rot_RF_start, r_LH_start, r_RH_start, 0); % IKS for xxx_0

% Where robot ends:
r_where_to_go = [210, 0, 0]'; ang_fin = 0*pi/180; rot_where_to_go = [cos(ang_fin), -sin(ang_fin), 0; sin(ang_fin), cos(ang_fin), 0; 0, 0, 1];
rot_RF_final = rot_where_to_go * eye(3); r_RF_final = r_where_to_go + rot_where_to_go * ([0, -42.8-offset, 0]' - RobotModelParameters.r_RF_center); 
rot_LF_final = rot_where_to_go * eye(3); r_LF_final = r_where_to_go + rot_where_to_go * ( [0,  42.8+offset, 0]' - RobotModelParameters.r_LF_center); 
r_W_final = r_where_to_go + [0 0 GaitParameters.StepPelvisHeight]'; rot_W_final = rot_where_to_go * eye(3);
r_LH_final = Kinematics.DKS_LeftHand(RobotModelParameters, r_W_final, rot_W_final, [0, 15,-45].*pi/180 , 0 );
r_RH_final = Kinematics.DKS_RightHand(RobotModelParameters, r_W_final, rot_W_final, [0, -15,-45].*pi/180 , 0 );

r_CoM_final = r_W_final + [0, 0, RobotModelParameters.r_W_RT(3)]';  % FROM r_w_final and constant vector
q_final = Kinematics.IKS_Global(RobotModelParameters, r_W_final, rot_W_final, r_LF_final, rot_LF_final, r_RF_final, rot_RF_final, r_LH_final, r_RH_final, 0);

%% Create structures and load initial and terminal conditions 
RobotParameters.LoadInitialConditions;
RobotParameters.LoadTerminalConditions;

clear q_start rot_RF_start r_RF_start rot_LF_start r_LF_start r_W_start rot_W_start r_LH_start r_RH_start r_CoM_start;
clear q_final rot_RF_final r_RF_final rot_LF_final r_LF_final r_W_final rot_W_final r_LH_final r_RH_final r_CoM_final rot_where_to_go r_where_to_go ang_fin;


% TOOD: Check gait parameters
%[GaitParameters] = RobotParameters.GaitParametersCheck(GaitParameters);