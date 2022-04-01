function [] = calc_e()

syms RTz RTx RTy RSy RFy RFx real;
syms LTz LTx LTy LSy LFy LFx real;
syms RAy RAx RFAy real; 
syms LAy LAx LFAy real;
syms CHz real;


%% Wyliczenie pozycji i rotacji kolejnych uk³adów wzglêdem bioder
%% Rotacje
rot_W_RT = Mat.RotZ(RTz) * Mat.RotX(RTx) * Mat.RotY(RTy);
rot_W_RS = rot_W_RT * Mat.RotY(RSy);
rot_W_RF = rot_W_RS * Mat.RotY(RFy) * Mat.RotX(RFx);

rot_W_LT = Mat.RotZ(LTz) * Mat.RotX(LTx) * Mat.RotY(LTy);
rot_W_LS = rot_W_LT * Mat.RotY(LSy);
rot_W_LF = rot_W_LS * Mat.RotY(LFy) * Mat.RotX(LFx);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               

rot_RF_LF = rot_W_RF' * rot_W_LF;
rot_LF_RF = rot_RF_LF';
e = Mat.rot2euler(rot_LF_RF);

matlabFunction(e,'file','+KinFastLF\function_e.m','Vars',[RTz RTx RTy RSy RFy RFx LTz LTx LTy LSy LFy LFx RAy RAx RFAy LAy LAx LFAy CHz]);

end