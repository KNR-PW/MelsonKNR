function [r] = calc_r()

syms RTz RTx RTy RSy RFy RFx real;
syms LTz LTx LTy LSy LFy LFx real;
syms RAy RAx RFAy real; 
syms LAy LAx LFAy real;
syms CHz real;

% wektor r_red ma postaæ: 
% r_red = [ r_RF_LF;
%           r_RF_RH;
%           r_RF_LH;
%           r_RF_CoM ];

LoadModelParameters;
RbtMdlPar = RobotModelParameters;

%% Wyliczenie pozycji i rotacji kolejnych uk³adów wzglêdem bioder
%% Rotacje
rot_W_RT = Mat.RotZ(RTz) * Mat.RotX(RTx) * Mat.RotY(RTy);
rot_W_RS = rot_W_RT * Mat.RotY(RSy);
rot_W_RF = rot_W_RS * Mat.RotY(RFy) * Mat.RotX(RFx);

rot_W_LT = Mat.RotZ(LTz) * Mat.RotX(LTx) * Mat.RotY(LTy);
rot_W_LS = rot_W_LT * Mat.RotY(LSy);
rot_W_LF = rot_W_LS * Mat.RotY(LFy) * Mat.RotX(LFx);

rot_W_CH = Mat.RotZ(CHz);

rot_W_RA = rot_W_CH * Mat.RotY(RAy) * Mat.RotX(RAx);
rot_W_RFA= rot_W_RA * Mat.RotY(RFAy);

rot_W_LA = rot_W_CH * Mat.RotY(LAy) * Mat.RotX(LAx);
rot_W_LFA= rot_W_LA * Mat.RotY(LFAy);

%% Pozycje
r_W_RT = RbtMdlPar.r_W_RT;
r_W_RS = r_W_RT + rot_W_RT * RbtMdlPar.r_RT_RS;
r_W_RF = r_W_RS + rot_W_RS * RbtMdlPar.r_RS_RF;

r_W_LT = RbtMdlPar.r_W_LT;
r_W_LS = r_W_LT + rot_W_LT * RbtMdlPar.r_LT_LS;
r_W_LF = r_W_LS + rot_W_LS * RbtMdlPar.r_LS_LF;

r_W_CH = RbtMdlPar.r_W_CH;

r_W_RA = r_W_CH + rot_W_CH * RbtMdlPar.r_CH_RA;
r_W_RFA= r_W_RA + rot_W_RA * RbtMdlPar.r_RA_RFA;
r_W_RH = r_W_RFA+ rot_W_RFA* RbtMdlPar.r_RFA_RH;

r_W_LA = r_W_CH + rot_W_CH * RbtMdlPar.r_CH_LA;
r_W_LFA= r_W_LA + rot_W_LA * RbtMdlPar.r_LA_LFA;
r_W_LH = r_W_LFA+ rot_W_LFA* RbtMdlPar.r_LFA_LH;

%% Srodek masy
r_W_CoM = ( RbtMdlPar.r_com_W ) * RbtMdlPar.mW...
            + ( r_W_CH + rot_W_CH * RbtMdlPar.r_com_CH ) * RbtMdlPar.mCH ...;
            + ( r_W_RT + rot_W_RT * RbtMdlPar.r_com_RT ) * RbtMdlPar.mRT ...
            + ( r_W_RS + rot_W_RS * RbtMdlPar.r_com_RS ) * RbtMdlPar.mRS ...
            + ( r_W_RF + rot_W_RF * RbtMdlPar.r_com_RF ) * RbtMdlPar.mRF ...
            + ( r_W_LT + rot_W_LT * RbtMdlPar.r_com_LT ) * RbtMdlPar.mLT ...
            + ( r_W_LS + rot_W_LS * RbtMdlPar.r_com_LS ) * RbtMdlPar.mLS ...
            + ( r_W_LF + rot_W_LF * RbtMdlPar.r_com_LF ) * RbtMdlPar.mLF ...
            + ( r_W_RA + rot_W_RA * RbtMdlPar.r_com_RA ) * RbtMdlPar.mRA ...
            + ( r_W_RFA + rot_W_RFA * RbtMdlPar.r_com_RFA ) * RbtMdlPar.mRFA ...
            + ( r_W_LA + rot_W_LA * RbtMdlPar.r_com_LA ) * RbtMdlPar.mLA ...
            + ( r_W_LFA + rot_W_LFA * RbtMdlPar.r_com_LFA ) * RbtMdlPar.mLFA ;
r_W_CoM = r_W_CoM / RbtMdlPar.TotalMass;


%% Rotacja Bioder


rot_LF_W = Mat.RotX(-LFx) * Mat.RotY(-LFy-LSy-LTy) * Mat.RotX(-LTx) * Mat.RotZ(-LTz); 



%% Zapisanie wektora r_red (wspó³rzêdne kolejnych punktów w uk³adzie RF)

      
% r = [ rot_W_RF' * (r_W_LF - r_W_RF);
%           rot_W_RF' * (r_W_RH - r_W_RF);
%           rot_W_RF' * (r_W_LH - r_W_RF);
%           rot_W_RF' * (r_W_CoM - r_W_RF)];

r = [ rot_LF_W * (r_W_RF - r_W_LF);
          rot_LF_W * (r_W_RH - r_W_LF);
          rot_LF_W * (r_W_LH - r_W_LF);
          rot_LF_W * (r_W_CoM - r_W_LF)];



matlabFunction(r,'file','+KinFastLF\function_r.m','Vars',[RTz RTx RTy RSy RFy RFx LTz LTx LTy LSy LFy LFx RAy RAx RFAy LAy LAx LFAy CHz]);

end