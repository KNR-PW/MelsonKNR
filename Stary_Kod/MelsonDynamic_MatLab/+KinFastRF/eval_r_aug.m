function [r_aug] = eval_r_aug(q,rot_RF)

    RTz = q(1);
    RTx = q(2);
    RTy = q(3);
    RSy = q(4);
    RFy = q(5);
    RFx = q(6);
    
    rot_W = rot_RF * Mat.RotX(-RFx) * Mat.RotY( -RFy -RSy -RTy) * Mat.RotX(-RTx) * Mat.RotZ(RTz);
    
    %% Rotacje korpusu opisujemy k¹tami Eulera ZYX
    PitchW = asin(-rot_W(3,1));
    
    r_aug = PitchW;
    
end