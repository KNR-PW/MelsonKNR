function [ r_LH ] = DKS_LeftHand(RobModPar, r_W, rot_W, q_ULL, fi_CH )

r_LH = r_W + rot_W * (RobModPar.r_W_CH + rotZ(fi_CH) * (RobModPar.r_CH_LA + rotY(q_ULL(1)) * rotX(q_ULL(2)) * (RobModPar.r_LA_LFA + rotY(q_ULL(3)) * RobModPar.r_LFA_LH)));

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

