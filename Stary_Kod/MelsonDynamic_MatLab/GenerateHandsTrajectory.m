function [GaitEndPtsTraj] = GenerateHandsTrajectory(GaitEndPtsTraj, GaitCoMTraj, GaitPar, RobModPar)

% q_now = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]';

% for TimeIter = 1:1:GaitPar.NumberOfTimeInstances
%     GaitEndPtsTraj.r_LH(:,TimeIter) = Kinematics.DKS_LeftHand(RobModPar, GaitEndPtsTraj.r_W(:,TimeIter), GaitEndPtsTraj.rot_W(:,:,TimeIter), [0, 15, -45].*pi/180 , 0 );
%     GaitEndPtsTraj.r_RH(:,TimeIter) = Kinematics.DKS_RightHand(RobModPar, GaitEndPtsTraj.r_W(:,TimeIter), GaitEndPtsTraj.rot_W(:,:,TimeIter), [0, -15, -45].*pi/180 , 0 );
% end
    
for TimeIter = 1:1:GaitPar.NumberOfTimeInstances
    
%     rot_RF = GaitEndPointsTrajectory.rot_RF(:,:,TimeIter);
%     rot_LF = GaitEndPointsTrajectory.rot_LF(:,:,TimeIter);
%     
%     r_CoM_in_RF = rot_RF' * (GaitCoMTrajectory(TimeIter) - GaitEndPointsTrajectory.r_RF(:,TimeIter));
%     r_CoM_in_LF = rot_LF' * (GaitCoMTrajectory(TimeIter) - GaitEndPointsTrajectory.r_LF(:,TimeIter));
%     
%     
    r_center = (GaitEndPtsTraj.r_RF(:,TimeIter) + GaitEndPtsTraj.r_LF(:,TimeIter))/2;
    r_center(3) = 0;
    
    rot_RF = GaitEndPtsTraj.rot_RF(:,:,TimeIter);
    rot_LF = GaitEndPtsTraj.rot_LF(:,:,TimeIter);
    
    e_RF = Mat.rot2euler(rot_RF);
    e_LF = Mat.rot2euler(rot_LF);
    
    angleZ = (e_RF(1) + e_LF(1)) / 2;
    
    rot = Mat.RotZ(angleZ);
    
    r_CoM_2d = GaitCoMTraj(:,TimeIter);
    r_CoM_2d(3) = 0;
    
    r_center_CoM = (r_CoM_2d -  r_center);
    
    r_hands = zeros(3,1);
    r_hands(1) = r_center_CoM(1);
    r_hands(2) = 2.5*r_center_CoM(2);
    
%     r_hands(2) = min(r_hands(2), 40);
%     r_hands(2) = max(r_hands(2), -40);
    
    r_hands(3) = GaitPar.StepPelvisHeight+30;
    
    r_RH = zeros(3,1);
    r_LH = zeros(3,1);
    
    r_RH = r_center + r_hands + rot * ( [80; -140; 0]);
    r_LH = r_center + r_hands + rot * ( [80; 140; 0]);
    
%     r_RH = r_center + max(r_hands, -[Inf 25 Inf]') + rot * ( [80; -140; 0]);
%     r_LH = r_center + min(r_hands, [Inf 25 Inf]') + rot * ( [80; 140; 0]);
    
    GaitEndPtsTraj.r_RH(:,TimeIter) = r_RH;
    GaitEndPtsTraj.r_LH(:,TimeIter) = r_LH;
    

end

end
