function [ q ] = IKS_Global(RbtMdlPar, r_W, rot_W, r_LF, rot_LF, r_RF, rot_RF, r_LH, r_RH, fi_CH)

q_UpperLeftLimb = Kinematics.OZK_korpus_rekaL(RbtMdlPar, rot_W' * (r_LH - r_W), fi_CH );
q_UpperRightLimb = Kinematics.OZK_korpus_rekaP(RbtMdlPar, rot_W' * (r_RH - r_W), fi_CH );
q_LowerLeftLimb = Kinematics.OZK_korpus_stopaL(RbtMdlPar, rot_W' * ( r_LF - r_W + rot_W' * rot_LF * RbtMdlPar.r_LF_center), rot_W' * rot_LF);
q_LowerRightLimb = Kinematics.OZK_korpus_stopaP(RbtMdlPar, rot_W' * ( r_RF - r_W + rot_W' * rot_RF * RbtMdlPar.r_RF_center), rot_W' * rot_RF);

q = [q_LowerRightLimb, q_LowerLeftLimb, q_UpperRightLimb, q_UpperLeftLimb, fi_CH];

end

