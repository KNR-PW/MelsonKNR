 function [w] = calc_w()

syms RTz RTx RTy RSy RFy RFx real;
syms LTz LTx LTy LSy LFy LFx real;

syms dRTz dRTx dRTy dRSy dRFy dRFx real;
syms dLTz dLTx dLTy dLSy dLFy dLFx real;


% wektor w ma postaæ: 
% w = [ w_RF_LF ];

rot_RF_RS = Mat.RotX(-RFx) * Mat.RotY(-RFx);
rot_RF_RT = rot_RF_RS * Mat.RotY(-RSy);
rot_RF_W  = rot_RF_RT * Mat.RotY(-RTy) * Mat.RotX(-RTx) * Mat.RotZ(-RTz);
rot_RF_LT = rot_RF_W * Mat.RotZ(LTz) * Mat.RotX(LTx) * Mat.RotY(LTy);
rot_RF_LS = rot_RF_LT * Mat.RotY(LSy);
rot_RF_LF = rot_RF_LS * Mat.RotY(LFy) * Mat.RotX(LFx);

Vx = [1 0 0]';
Vy = [0 1 0]';
Vz = [0 0 1]';

%% iteracyjnie
w_RF_LF = dLFx * Vx;
w_RF_LF = dLFy * Vy + Mat.RotY(LFy) * w_RF_LF;
w_RF_LF = dLSy * Vy + Mat.RotY(LSy)  * w_RF_LF;
w_RF_LF = dLTy * Vy + Mat.RotY(LTy) * w_RF_LF;
w_RF_LF = dLTx * Vx + Mat.RotX(LTx) * w_RF_LF;
w_RF_LF = dLTz * Vz + Mat.RotZ(LTz) * w_RF_LF;
w_RF_LF = - dRTz * Vz + Mat.RotZ(-RTz) * w_RF_LF;
w_RF_LF = - dRTx * Vx + Mat.RotX(-RTx) * w_RF_LF;
w_RF_LF = - dRTy * Vy + Mat.RotY(-RTy) * w_RF_LF;
w_RF_LF = - dRSy * Vy + Mat.RotY(-RSy) * w_RF_LF;
w_RF_LF = - dRFy * Vy + Mat.RotY(-RFy) * w_RF_LF;
w_RF_LF = - dRFx * Vx + Mat.RotX(-RFx) * w_RF_LF;

w = w_RF_LF;

matlabFunction(w,'file','+KinFastRF\function_w.m');
      
end