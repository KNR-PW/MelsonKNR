function [r_aug] = eval_r_aug(q,rot_LF)

    LTz = q(7);
    LTx = q(8);
    LTy = q(9);
    LSy = q(10);
    LFy = q(11);
    LFx = q(12);
    
    rot_W = rot_LF * Mat.RotX(-LFx) * Mat.RotY( -LFy -LSy -LTy) * Mat.RotX(-LTx) * Mat.RotZ(LTz);
    
    %% Rotacje korpusu opisujemy k¹tami Eulera ZYX
    PitchW = asin(-rot_W(3,1));
    
    r_aug = PitchW;
    
end