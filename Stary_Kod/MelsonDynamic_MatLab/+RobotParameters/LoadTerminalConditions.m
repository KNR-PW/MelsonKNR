% Need in workspace: 
%   - NumberOfTimeinstances
%   - RobotModelParameters
%   - q_final
%   - r_W_final
%   - rot_W_final
%   - r_CoM_final
%   - GaitSupportPolygon
%   - CharPointsContactOnOff
%   - GaitCoMPosition
%   - GaitEndPointsTrajectory
% To be defined(last):
%   - GaitSupportPolygon
%   - CharPointsContactOnOff
%   - GaitCoMPosition
%   - GaitEndPointsTrajectory

%% End Points Position (and orientation)
GaitEndPointsTrajectory.r_W(:,GaitParameters.NumberOfTimeInstances) = r_W_final;
GaitEndPointsTrajectory.rot_W(:,:,GaitParameters.NumberOfTimeInstances) = rot_W_final;
GaitEndPointsTrajectory.r_RF(:,GaitParameters.NumberOfTimeInstances) = r_W_final + rot_W_final * ( RobotModelParameters.r_W_RT +  rotZ(q_final(1)) * rotX(q_final(2)) * rotY(q_final(3)) * ( RobotModelParameters.r_RT_RS + rotY(q_final(4)) * (RobotModelParameters.r_RS_RF) ) );
GaitEndPointsTrajectory.rot_RF(:,:,GaitParameters.NumberOfTimeInstances) = rot_W_final * rotZ(q_final(1)) * rotX(q_final(2)) * rotY(q_final(3)) * rotY(q_final(4)) * rotY(q_final(5)) * rotX(q_final(6));
GaitEndPointsTrajectory.r_LF(:,GaitParameters.NumberOfTimeInstances) = r_W_final + rot_W_final * ( RobotModelParameters.r_W_LT +  rotZ(q_final(7)) * rotX(q_final(8)) * rotY(q_final(9)) * ( RobotModelParameters.r_LT_LS + rotY(q_final(10)) * (RobotModelParameters.r_LS_LF) ) );
GaitEndPointsTrajectory.rot_LF(:,:,GaitParameters.NumberOfTimeInstances) = rot_W_final * rotZ(q_final(7)) * rotX(q_final(8)) * rotY(q_final(9)) * rotY(q_final(10)) * rotY(q_final(11)) * rotX(q_final(12));
GaitEndPointsTrajectory.r_LH(:,GaitParameters.NumberOfTimeInstances) = r_W_final + rot_W_final * (RobotModelParameters.r_W_CH + rotZ(q_final(19)) * (RobotModelParameters.r_CH_LA + rotY(q_final(16)) * rotX(q_final(17)) * (RobotModelParameters.r_LA_LFA + rotY(q_final(18)) * RobotModelParameters.r_LFA_LH)));
%GaitEndPointsTrajectory.rot_LH(:,:,0) = ;
GaitEndPointsTrajectory.r_RH(:,GaitParameters.NumberOfTimeInstances) = r_W_final + rot_W_final * (RobotModelParameters.r_W_CH + rotZ(q_final(19)) * (RobotModelParameters.r_CH_RA + rotY(q_final(13)) * rotX(q_final(14)) * (RobotModelParameters.r_RA_RFA + rotY(q_final(15)) * RobotModelParameters.r_RFA_RH)));
%GaitEndPointsTrajectory.rot_RH(:,:,0) = ;

%% Support Polygon
GaitSupportPolygon.LeftFootLeftToes(:,GaitParameters.NumberOfTimeInstances) = GaitEndPointsTrajectory.r_LF(:,GaitParameters.NumberOfTimeInstances) + GaitEndPointsTrajectory.rot_LF(:,:,GaitParameters.NumberOfTimeInstances) * RobotModelParameters.r_LF_left_toe;
GaitSupportPolygon.LeftFootRightToes(:,GaitParameters.NumberOfTimeInstances) = GaitEndPointsTrajectory.r_LF(:,GaitParameters.NumberOfTimeInstances) + GaitEndPointsTrajectory.rot_LF(:,:,GaitParameters.NumberOfTimeInstances) * RobotModelParameters.r_LF_right_toe;
GaitSupportPolygon.LeftFootLeftHeel(:,GaitParameters.NumberOfTimeInstances) = GaitEndPointsTrajectory.r_LF(:,GaitParameters.NumberOfTimeInstances) + GaitEndPointsTrajectory.rot_LF(:,:,GaitParameters.NumberOfTimeInstances) * RobotModelParameters.r_LF_left_heel;
GaitSupportPolygon.LeftFootRightHeel(:,GaitParameters.NumberOfTimeInstances) = GaitEndPointsTrajectory.r_LF(:,GaitParameters.NumberOfTimeInstances) + GaitEndPointsTrajectory.rot_LF(:,:,GaitParameters.NumberOfTimeInstances) * RobotModelParameters.r_LF_right_heel;
GaitSupportPolygon.LeftFootCenter(:,GaitParameters.NumberOfTimeInstances) = GaitEndPointsTrajectory.r_LF(:,GaitParameters.NumberOfTimeInstances) + GaitEndPointsTrajectory.rot_LF(:,:,GaitParameters.NumberOfTimeInstances) * RobotModelParameters.r_LF_center;
GaitSupportPolygon.RightFootLeftToes(:,GaitParameters.NumberOfTimeInstances) = GaitEndPointsTrajectory.r_RF(:,GaitParameters.NumberOfTimeInstances) + GaitEndPointsTrajectory.rot_RF(:,:,GaitParameters.NumberOfTimeInstances) * RobotModelParameters.r_RF_left_toe;
GaitSupportPolygon.RightFootRightToes(:,GaitParameters.NumberOfTimeInstances) = GaitEndPointsTrajectory.r_RF(:,GaitParameters.NumberOfTimeInstances) + GaitEndPointsTrajectory.rot_RF(:,:,GaitParameters.NumberOfTimeInstances) * RobotModelParameters.r_RF_right_toe;
GaitSupportPolygon.RightFootLeftHeel(:,GaitParameters.NumberOfTimeInstances) = GaitEndPointsTrajectory.r_RF(:,GaitParameters.NumberOfTimeInstances) + GaitEndPointsTrajectory.rot_RF(:,:,GaitParameters.NumberOfTimeInstances) * RobotModelParameters.r_RF_left_heel;
GaitSupportPolygon.RightFootRightHeel(:,GaitParameters.NumberOfTimeInstances) = GaitEndPointsTrajectory.r_RF(:,GaitParameters.NumberOfTimeInstances) + GaitEndPointsTrajectory.rot_RF(:,:,GaitParameters.NumberOfTimeInstances) * RobotModelParameters.r_RF_right_heel;
GaitSupportPolygon.RightFootCenter(:,GaitParameters.NumberOfTimeInstances) = GaitEndPointsTrajectory.r_RF(:,GaitParameters.NumberOfTimeInstances) + GaitEndPointsTrajectory.rot_RF(:,:,GaitParameters.NumberOfTimeInstances) * RobotModelParameters.r_RF_center;


CharPointsContactOnOff.LeftFootLeftToes(GaitParameters.NumberOfTimeInstances) = true;
CharPointsContactOnOff.LeftFootRightToes(GaitParameters.NumberOfTimeInstances) = true;
CharPointsContactOnOff.LeftFootLeftHeel(GaitParameters.NumberOfTimeInstances) = true;
CharPointsContactOnOff.LeftFootRightHeel(GaitParameters.NumberOfTimeInstances) = true;
CharPointsContactOnOff.LeftFootCenter(GaitParameters.NumberOfTimeInstances) = true;
CharPointsContactOnOff.RightFootLeftToes(GaitParameters.NumberOfTimeInstances) = true;
CharPointsContactOnOff.RightFootRightToes(GaitParameters.NumberOfTimeInstances) = true;
CharPointsContactOnOff.RightFootLeftHeel(GaitParameters.NumberOfTimeInstances) = true;
CharPointsContactOnOff.RightFootRightHeel(GaitParameters.NumberOfTimeInstances) = true;
CharPointsContactOnOff.RightFootCenter(GaitParameters.NumberOfTimeInstances) = true;

%% Center of Mass Position
GaitCoMTrajectory(:,GaitParameters.NumberOfTimeInstances) = r_CoM_final;

%% Gait phases
GaitPhases.LeftLeg(GaitParameters.NumberOfTimeInstances) = 'support';
GaitPhases.RightLeg(GaitParameters.NumberOfTimeInstances) = 'support';

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