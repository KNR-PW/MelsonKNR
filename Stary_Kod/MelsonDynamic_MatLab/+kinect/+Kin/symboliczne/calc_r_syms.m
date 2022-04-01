function [r_syms] = calc_r_syms()

syms fi_RTz fi_RTx fi_RTy fi_RS fi_RFy fi_RFx real;
syms fi_LTz fi_LTx fi_LTy fi_LS fi_LFy fi_LFx real;
syms fi_RAy fi_RAx fi_RFA real; 
syms fi_LAy fi_LAx fi_LFA real;
syms fi_CH real;

% wektor r_syms ma postaæ: 
% r_syms = [ r_RF_LF;
%           r_RF_RH;
%           r_RF_LH;
%           r_RF_CoM ];

LoadModelParameters;
RbtMdlPar = RobotModelParameters;

%% Wyliczenie pozycji i rotacji kolejnych uk³adów wzglêdem bioder
%% Rotacje
rot_W_RT = RotZ(fi_RTz) * RotX(fi_RTx) * RotY(fi_RTy);
rot_W_RS = rot_W_RT * RotY(fi_RS);
rot_W_RF = rot_W_RS * RotY(fi_RFy) * RotX(fi_RFx);

rot_W_LT = RotZ(fi_LTz) * RotX(fi_LTx) * RotY(fi_LTy);
rot_W_LS = rot_W_LT * RotY(fi_LS);
rot_W_LF = rot_W_LS * RotY(fi_LFy) * RotX(fi_LFx);

rot_W_CH = RotZ(fi_CH);

rot_W_RA = rot_W_CH * RotY(fi_RAy) * RotX(fi_RAx);
rot_W_RFA= rot_W_RA * RotY(fi_RFA);

rot_W_LA = rot_W_CH * RotY(fi_LAy) * RotX(fi_LAx);
rot_W_LFA= rot_W_LA * RotY(fi_LFA);

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


rot_RF_W = RotX(-fi_RFx) * RotY(-fi_RFy-fi_RS-fi_RTy) * RotX(-fi_RTx) * RotZ(-fi_RTz); 


%% Zapisanie wektora r_syms (wspó³rzêdne kolejnych punktów w uk³adzie RF)

      
r_syms = [ rot_W_RF' * (r_W_LF - r_W_RF);
          rot_W_RF' * (r_W_RH - r_W_RF);
          rot_W_RF' * (r_W_LH - r_W_RF);
          rot_W_RF' * (r_W_CoM - r_W_RF)];
matlabFunction(r_syms,'file','+Kin\function_r_syms.m','Vars',[fi_RTz fi_RTx fi_RTy fi_RS fi_RFy fi_RFx fi_LTz fi_LTx fi_LTy fi_LS fi_LFy fi_LFx fi_RAy fi_RAx fi_RFA fi_LAy fi_LAx fi_LFA fi_CH]);

end