function [e] = eval_e(q)
%EVAL_J_RED Summary of this function goes here
%   Detailed explanation goes here

RTz = q(1);
RTx = q(2);
RTy = q(3);
RSy  = q(4);
RFy = q(5);
RFx = q(6);
LTz = q(7);
LTx = q(8);
LTy = q(9);
LSy  = q(10);
LFy = q(11);
LFx = q(12);
RAy = q(13);
RAx = q(14);
RFAy = q(15);
LAy = q(16);
LAx = q(17);
LFAy = q(18);
CHz = q(19);

e = KinFastRF.function_e(RTz, RTx, RTy, RSy, RFy, RFx, LTz, LTx, LTy, LSy,LFy,LFx,RAy,RAx,RFAy,LAy,LAx,LFAy,CHz);

end
