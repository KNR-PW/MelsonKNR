function [ r_RH ] = DKS_RightHand(RobModPar, r_W, rot_W, q_URL, fi_CH )
% Kinematics.wymiary;
r_RH = r_W + rot_W * (RobModPar.r_W_CH + rotZ(fi_CH) * (RobModPar.r_CH_RA + rotY(q_URL(1)) * rotX(q_URL(2)) * (RobModPar.r_RA_RFA + rotY(q_URL(3)) * RobModPar.r_RFA_RH)));

end

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