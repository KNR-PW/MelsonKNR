function [J_aug] = eval_J_aug(q,rot_LF)

    %EVAL_J_RED Summary of this function goes here
%   Detailed explanation goes here

%     RTz = q(1);
%     RTx = q(2);
%     RTy = q(3);
%     RSy  = q(4);
%     RFy = q(5);
%     RFx = q(6);
    LTz = q(7);
    LTx = q(8);
    LTy = q(9);
    LSy  = q(10);
    LFy = q(11);
    LFx = q(12);
%     RAy = q(13);
%     RAx = q(14);
%     RFAy = q(15);
%     LAy = q(16);
%     LAx = q(17);
%     LFAy = q(18);
%     CHz = q(19);
    
    rot_LF3_1 = rot_LF(3,1);
    rot_LF3_2 = rot_LF(3,2);
    rot_LF3_3 = rot_LF(3,3);

    J_aug = KinFastLF.function_J_aug(rot_LF3_1,rot_LF3_2,rot_LF3_3,LTz, LTx, LTy, LSy, LFy, LFx);

    
end

