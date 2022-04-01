 function [w_syms] = calc_w_syms()

syms fi_RTz fi_RTx fi_RTy fi_RS fi_RFy fi_RFx real;
syms fi_LTz fi_LTx fi_LTy fi_LS fi_LFy fi_LFx real;

syms dfi_RTz dfi_RTx dfi_RTy dfi_RS dfi_RFy dfi_RFx real;
syms dfi_LTz dfi_LTx dfi_LTy dfi_LS dfi_LFy dfi_LFx real;


% wektor w_red ma postaæ: 
% w_red = [ w_RF_LF ];

% RobotParameters.LoadModelParameters;
% RbtMdlPar = RobotModelParameters;

rot_RF_RS = RotX(-fi_RFx) * RotY(-fi_RFx);
rot_RF_RT = rot_RF_RS * RotY(-fi_RS);
rot_RF_W  = rot_RF_RT * RotY(-fi_RTy) * RotX(-fi_RTx) * RotZ(-fi_RTz);
rot_RF_LT = rot_RF_W * RotZ(fi_LTz) * RotX(fi_LTx) * RotY(fi_LTy);
rot_RF_LS = rot_RF_LT * RotY(fi_LS);
rot_RF_LF = rot_RF_LS * RotY(fi_LFy) * RotX(fi_LFx);

Vx = [1 0 0]';
Vy = [0 1 0]';
Vz = [0 0 1]';


% w_RF_LF = - dRFx * Vx ...
%           - RotX(-RFx) * dRFy * Vy ...
%           - RotX(-RFx) * RotY(-RFx) * dRS * Vy ...
%           - RotX(-RFx) * RotY(-RFx) * RotY(-RS) * dRTy * Vy ...
%           - RotX(-RFx) * RotY(-RFx) * RotY(-RS) * RotY(-RTy) * dRTx * Vx ...
%           - RotX(-RFx) * RotY(-RFx) * RotY(-RS) * RotY(-RTy) * RotX(-RTx) * dRTz * Vz ...
%           + rot_RF_W * dLTz * Vz ...
%           + rot_RF_W * RotZ(LTz) * dLTx * Vx ...
%           + rot_RF_W * RotZ(LTz) * RotX(LTx) * dLTy * Vy ...
%           + rot_RF_W * RotZ(LTz) * RotX(LTx) * RotY(LTy) * dLS * Vy ...
%           + rot_RF_W * RotZ(LTz) * RotX(LTx) * RotY(LTy) * RotY(LS) * dLFy * Vy ...
%           + rot_RF_W * RotZ(LTz) * RotX(LTx) * RotY(LTy) * RotY(LS) * RotY(LFy) * dLFx * Vx;

%% iteracyjnie

w_RF_LF = dfi_LFx * Vx;
w_RF_LF = dfi_LFy * Vy + RotY(fi_LFy) * w_RF_LF;
w_RF_LF = dfi_LS  * Vy + RotY(fi_LS)  * w_RF_LF;
w_RF_LF = dfi_LTy * Vy + RotY(fi_LTy) * w_RF_LF;
w_RF_LF = dfi_LTx * Vx + RotX(fi_LTx) * w_RF_LF;
w_RF_LF = dfi_LTz * Vz + RotZ(fi_LTz) * w_RF_LF;
w_RF_LF = - dfi_RTz * Vz + RotZ(-fi_RTz) * w_RF_LF;
w_RF_LF = - dfi_RTx * Vx + RotX(-fi_RTx) * w_RF_LF;
w_RF_LF = - dfi_RTy * Vy + RotY(-fi_RTy) * w_RF_LF;
w_RF_LF = - dfi_RS  * Vy + RotY(-fi_RS) * w_RF_LF;
w_RF_LF = - dfi_RFy * Vy + RotY(-fi_RFy) * w_RF_LF;
w_RF_LF = - dfi_RFx * Vx + RotX(-fi_RFx) * w_RF_LF;


w_syms = w_RF_LF;

% matlabFunction(w_syms,'file','+Kin\function_w_syms.m');
      
end