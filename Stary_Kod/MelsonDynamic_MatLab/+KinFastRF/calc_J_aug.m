function [] = calc_J_aug()

    rot_RF = sym('rot_RF',[3 3]);
    syms RTz RTx RTy RSy RFy RFx;
    syms LTz LTx LTy LSy LFy LFx;
    syms RAy RAx RFAy; 
    syms LAy LAx LFAy;
    syms CHz;

    syms rot_RF3_1 rot_RF3_2 rot_RF3_3;
    q = [ RTz; RTx; RTy; RSy; RFy; RFx;
          LTz; LTx; LTy; LSy; LFy; LFx;
          RAy; RAx; RFAy;
          LAy; LAx; LFAy;
          CHz];
    
    r_aug = KinFastRF.eval_r_aug(q,rot_RF);
    
    J_aug = KinFastRF.diff_jacobian(r_aug,q);
    
    disp('Generowanie funkcji')
    tic
    matlabFunction(J_aug,'file','+KinFastRF\function_J_aug.m','Vars',[rot_RF3_1,rot_RF3_2,rot_RF3_3,RTz RTx RTy RSy RFy RFx]);
    toc

end

