 function [w] = calc_w()

syms RTz RTx RTy RSy RFy RFx real;
syms LTz LTx LTy LSy LFy LFx real;

syms dRTz dRTx dRTy dRSy dRFy dRFx real;
syms dLTz dLTx dLTy dLSy dLFy dLFx real;


% wektor w ma postaæ: 
% w = [ w_RF_LF ];

% rot_RF_RS = Mat.RotX(-RFx) * Mat.RotY(-RFx);
% rot_RF_RT = rot_RF_RS * Mat.RotY(-RSy);
% rot_RF_W  = rot_RF_RT * Mat.RotY(-RTy) * Mat.RotX(-RTx) * Mat.RotZ(-RTz);
% rot_RF_LT = rot_RF_W * Mat.RotZ(LTz) * Mat.RotX(LTx) * Mat.RotY(LTy);
% rot_RF_LS = rot_RF_LT * Mat.RotY(LSy);
% rot_RF_LF = rot_RF_LS * Mat.RotY(LFy) * Mat.RotX(LFx);

Vx = [1 0 0]';
Vy = [0 1 0]';
Vz = [0 0 1]';

%% iteracyjnie
w_LF_LR = dRFx * Vx;
w_LF_LR = dRFy * Vy + Mat.RotY(RFy) * w_LF_LR;
w_LF_LR = dRSy * Vy + Mat.RotY(RSy)  * w_LF_LR;
w_LF_LR = dRTy * Vy + Mat.RotY(RTy) * w_LF_LR;
w_LF_LR = dRTx * Vx + Mat.RotX(RTx) * w_LF_LR;
w_LF_LR = dRTz * Vz + Mat.RotZ(RTz) * w_LF_LR;
w_LF_LR = - dLTz * Vz + Mat.RotZ(-LTz) * w_LF_LR;
w_LF_LR = - dLTx * Vx + Mat.RotX(-LTx) * w_LF_LR;
w_LF_LR = - dLTy * Vy + Mat.RotY(-LTy) * w_LF_LR;
w_LF_LR = - dLSy * Vy + Mat.RotY(-LSy) * w_LF_LR;
w_LF_LR = - dLFy * Vy + Mat.RotY(-LFy) * w_LF_LR;
w_LF_LR = - dLFx * Vx + Mat.RotX(-LFx) * w_LF_LR;

w = w_LF_LR;

matlabFunction(w,'file','+KinFastLF\function_w.m');
      
end