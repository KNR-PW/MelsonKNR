function [GaitEndPtsTraj] = GaitHandsPlaner(GaitPar, RobModPar, GaitEndPtsTraj)

% by KM
% Generating hands trajectory in waist frame (zero vectors and eye matrixes in DKS)

    for TimeIter = 1:1:GaitPar.NumberOfTimeInstances
        GaitEndPtsTraj.r_W_LH(:,TimeIter) = Kinematics.DKS_LeftHand(RobModPar, [0 0 0]', eye(3), [0, 15, -45].*pi/180 , 0 );
        GaitEndPtsTraj.r_W_RH(:,TimeIter) = Kinematics.DKS_RightHand(RobModPar, [0 0 0]', eye(3), [0, -15, -45].*pi/180 , 0 );
    end
    GaitEndPtsTraj.fi_CH = zeros(1,TimeIter);
end