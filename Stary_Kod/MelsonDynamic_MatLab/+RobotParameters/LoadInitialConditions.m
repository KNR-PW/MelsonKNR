% Need in workspace: 
%   - NumberOfTimeinstances
%   - RobotModelParameters
%   - q_start
%   - r_W_start
%   - rot_W_start
%   - r_CoM_start
% To be created and defined(1):
%   - GaitSupportPolygon
%   - CharPointsContactOnOff
%   - GaitCoMPosition
%   - GaitEndPointsTrajectory
%   - GaitPhases

%% End Points Position (and orientation)
GaitEndPointsTrajectory.r_W = zeros(3,GaitParameters.NumberOfTimeInstances);
GaitEndPointsTrajectory.rot_W = zeros(3,3,GaitParameters.NumberOfTimeInstances);
GaitEndPointsTrajectory.r_RF = zeros(3,GaitParameters.NumberOfTimeInstances);
GaitEndPointsTrajectory.rot_RF = zeros(3,3,GaitParameters.NumberOfTimeInstances);
GaitEndPointsTrajectory.r_LF = zeros(3,GaitParameters.NumberOfTimeInstances);
GaitEndPointsTrajectory.rot_LF = zeros(3,3,GaitParameters.NumberOfTimeInstances);
GaitEndPointsTrajectory.r_LH = zeros(3,GaitParameters.NumberOfTimeInstances);
GaitEndPointsTrajectory.r_RH = zeros(3,GaitParameters.NumberOfTimeInstances);

GaitEndPointsTrajectory.r_W(:,1) = r_W_start;
GaitEndPointsTrajectory.rot_W(:,:,1) = rot_W_start;
GaitEndPointsTrajectory.r_RF(:,1) = r_W_start + rot_W_start * ( RobotModelParameters.r_W_RT +  rotZ(q_start(1)) * rotX(q_start(2)) * rotY(q_start(3)) * ( RobotModelParameters.r_RT_RS + rotY(q_start(4)) * (RobotModelParameters.r_RS_RF) ) );
GaitEndPointsTrajectory.rot_RF(:,:,1) = rot_W_start * rotZ(q_start(1)) * rotX(q_start(2)) * rotY(q_start(3)) * rotY(q_start(4)) * rotY(q_start(5)) * rotX(q_start(6));
GaitEndPointsTrajectory.r_LF(:,1) = r_W_start + rot_W_start * ( RobotModelParameters.r_W_LT +  rotZ(q_start(7)) * rotX(q_start(8)) * rotY(q_start(9)) * ( RobotModelParameters.r_LT_LS + rotY(q_start(10)) * (RobotModelParameters.r_LS_LF) ) );
GaitEndPointsTrajectory.rot_LF(:,:,1) = rot_W_start * rotZ(q_start(7)) * rotX(q_start(8)) * rotY(q_start(9)) * rotY(q_start(10)) * rotY(q_start(11)) * rotX(q_start(12));
GaitEndPointsTrajectory.r_LH(:,1) = r_W_start + rot_W_start * (RobotModelParameters.r_W_CH + rotZ(q_start(19)) * (RobotModelParameters.r_CH_LA + rotY(q_start(16)) * rotX(q_start(17)) * (RobotModelParameters.r_LA_LFA + rotY(q_start(18)) * RobotModelParameters.r_LFA_LH)));
GaitEndPointsTrajectory.r_RH(:,1) = r_W_start + rot_W_start * (RobotModelParameters.r_W_CH + rotZ(q_start(19)) * (RobotModelParameters.r_CH_RA + rotY(q_start(13)) * rotX(q_start(14)) * (RobotModelParameters.r_RA_RFA + rotY(q_start(15)) * RobotModelParameters.r_RFA_RH)));

%% Support Polygon
% Define variable
GaitSupportPolygon.LeftFootLeftToes = zeros(3,GaitParameters.NumberOfTimeInstances);
GaitSupportPolygon.LeftFootRightToes = zeros(3,GaitParameters.NumberOfTimeInstances);
GaitSupportPolygon.LeftFootLeftHeel = zeros(3,GaitParameters.NumberOfTimeInstances);
GaitSupportPolygon.LeftFootRightHeel = zeros(3,GaitParameters.NumberOfTimeInstances);
GaitSupportPolygon.LeftFootCenter = zeros(3,GaitParameters.NumberOfTimeInstances);
GaitSupportPolygon.RightFootLeftToes = zeros(3,GaitParameters.NumberOfTimeInstances);
GaitSupportPolygon.RightFootRightToes = zeros(3,GaitParameters.NumberOfTimeInstances);
GaitSupportPolygon.RightFootLeftHeel = zeros(3,GaitParameters.NumberOfTimeInstances);
GaitSupportPolygon.RightFootRightHeel = zeros(3,GaitParameters.NumberOfTimeInstances);
GaitSupportPolygon.RightFootCenter = zeros(3,GaitParameters.NumberOfTimeInstances);

CharPointsContactOnOff.LeftFootLeftToes = zeros(1,GaitParameters.NumberOfTimeInstances);
CharPointsContactOnOff.LeftFootRightToes = zeros(1,GaitParameters.NumberOfTimeInstances);
CharPointsContactOnOff.LeftFootLeftHeel = zeros(1,GaitParameters.NumberOfTimeInstances);
CharPointsContactOnOff.LeftFootRightHeel = zeros(1,GaitParameters.NumberOfTimeInstances);
CharPointsContactOnOff.LeftFootCenter = zeros(1,GaitParameters.NumberOfTimeInstances);
CharPointsContactOnOff.RightFootLeftToes = zeros(1,GaitParameters.NumberOfTimeInstances);
CharPointsContactOnOff.RightFootRightToes = zeros(1,GaitParameters.NumberOfTimeInstances);
CharPointsContactOnOff.RightFootLeftHeel = zeros(1,GaitParameters.NumberOfTimeInstances);
CharPointsContactOnOff.RightFootRightHeel = zeros(1,GaitParameters.NumberOfTimeInstances);
CharPointsContactOnOff.RightFootCenter = zeros(1,GaitParameters.NumberOfTimeInstances);

% Generate Initial condition
GaitSupportPolygon.LeftFootLeftToes(:,1) = GaitEndPointsTrajectory.r_LF(:,1) + GaitEndPointsTrajectory.rot_LF(:,:,1) * RobotModelParameters.r_LF_left_toe;
GaitSupportPolygon.LeftFootRightToes(:,1) = GaitEndPointsTrajectory.r_LF(:,1) + GaitEndPointsTrajectory.rot_LF(:,:,1) * RobotModelParameters.r_LF_right_toe;
GaitSupportPolygon.LeftFootLeftHeel(:,1) = GaitEndPointsTrajectory.r_LF(:,1) + GaitEndPointsTrajectory.rot_LF(:,:,1) * RobotModelParameters.r_LF_left_heel;
GaitSupportPolygon.LeftFootRightHeel(:,1) = GaitEndPointsTrajectory.r_LF(:,1) + GaitEndPointsTrajectory.rot_LF(:,:,1) * RobotModelParameters.r_LF_right_heel;
GaitSupportPolygon.LeftFootCenter(:,1) = GaitEndPointsTrajectory.r_LF(:,1) + GaitEndPointsTrajectory.rot_LF(:,:,1) * RobotModelParameters.r_LF_center;
GaitSupportPolygon.RightFootLeftToes(:,1) = GaitEndPointsTrajectory.r_RF(:,1) + GaitEndPointsTrajectory.rot_RF(:,:,1) * RobotModelParameters.r_RF_left_toe;
GaitSupportPolygon.RightFootRightToes(:,1) = GaitEndPointsTrajectory.r_RF(:,1) + GaitEndPointsTrajectory.rot_RF(:,:,1) * RobotModelParameters.r_RF_right_toe;
GaitSupportPolygon.RightFootLeftHeel(:,1) = GaitEndPointsTrajectory.r_RF(:,1) + GaitEndPointsTrajectory.rot_RF(:,:,1) * RobotModelParameters.r_RF_left_heel;
GaitSupportPolygon.RightFootRightHeel(:,1) = GaitEndPointsTrajectory.r_RF(:,1) + GaitEndPointsTrajectory.rot_RF(:,:,1) * RobotModelParameters.r_RF_right_heel;
GaitSupportPolygon.RightFootCenter(:,1) = GaitEndPointsTrajectory.r_RF(:,1) + GaitEndPointsTrajectory.rot_RF(:,:,1) * RobotModelParameters.r_RF_center;

CharPointsContactOnOff.LeftFootLeftToes(1) = true;
CharPointsContactOnOff.LeftFootRightToes(1) = true;
CharPointsContactOnOff.LeftFootLeftHeel(1) = true;
CharPointsContactOnOff.LeftFootRightHeel(1) = true;
CharPointsContactOnOff.LeftFootCenter(1) = true;
CharPointsContactOnOff.RightFootLeftToes(1) = true;
CharPointsContactOnOff.RightFootRightToes(1) = true;
CharPointsContactOnOff.RightFootLeftHeel(1) = true;
CharPointsContactOnOff.RightFootRightHeel(1) = true;
CharPointsContactOnOff.RightFootCenter(1) = true;

%% Center of Mass Position
%GaitCoMPosition = zeros(3,NumberOfTimeInstances);
%GaitCoMPosition(:,1) = r_CoM_start;

%% ZMP Trajectory
GaitCoMTrajectory = zeros(3,GaitParameters.NumberOfTimeInstances);
GaitZMPReferenceTrajectory = zeros(2,GaitParameters.NumberOfTimeInstances);
GaitZMPPlannedTrajectory = zeros(2,GaitParameters.NumberOfTimeInstances);

%% Gait phases
GaitPhases.LeftLeg = string(zeros(1,GaitParameters.NumberOfTimeInstances));
GaitPhases.RightLeg = string(zeros(1,GaitParameters.NumberOfTimeInstances));

GaitPhases.LeftLeg(1) = 'support';
GaitPhases.RightLeg(1) = 'support';

function [rot] = rotZ(alpha)
rot = [ cos(alpha), -sin(alpha), 0;
    sin(alpha), cos(alpha), 0;
    0, 0, 1];
end

function [rot] = rotY(alpha)
rot = [ cos(alpha), 0 , sin(alpha);
    0, 1, 0;
    -sin(alpha), 0, cos(alpha)];
end

function [rot] = rotX(alpha)
rot = [ 1, 0, 0;
    0, cos(alpha), -sin(alpha);
    0, sin(alpha), cos(alpha)];
end
