function [r] = eval_r(RbtPar,q)
%EVAL_R S
% Funkcja zwracaj¹ca pozycje i orientacje koñcówek a tak¿e œrodek masy
% robota w uk³adzie prawej stopy (RF)
% r = [ r_RF_LF;
%       r_RF_RH;
%       r_RF_LH;
%       r_RF_CoM;       
%       u_RF_LF];

RTz = q(1);
RTx = q(2);
RTy = q(3);
RSy = q(4);
RFy = q(5);
RFx = q(6);
LTz = q(7);
LTx = q(8);
LTy = q(9);
LSy = q(10);
LFy = q(11);
LFx = q(12);
RAy  = q(13);
RAx  = q(14);
RFAy = q(15);
LAy  = q(16);
LAx  = q(17);
LFAy = q(18);
CHz  = q(19);

% Orientacje kolejnych cz³onów wzglêdem uk³adu prawej stopy (RF):
rot_RF_RS = RotX(-RFx) * RotY(-RFy);
rot_RF_RT = rot_RF_RS * RotY(-RSy);
rot_RF_W  = rot_RF_RT * RotY(-RTy) * RotX(-RTx) * RotZ(-RTz);

rot_RF_LT = rot_RF_W * RotZ(LTz) * RotX(LTx) * RotY(LTy);
rot_RF_LS = rot_RF_LT * RotY(LSy);
rot_RF_LF = rot_RF_LS * RotY(LFy) * RotX(LFx);

rot_RF_CH = rot_RF_W * RotZ(CHz);

rot_RF_RA = rot_RF_CH * RotY(RAy) * RotX(RAx);
rot_RF_RFA = rot_RF_RA * RotY(RFAy);

rot_RF_LA = rot_RF_CH * RotY(LAy) * RotX(LAx);
rot_RF_LFA = rot_RF_LA * RotY(LFAy);

% Wyznaczenie pozycji kolejnych uk³adów i endpointów w uk³adzie stopy:
r_RF_RS = rot_RF_RS * (-RbtPar.r_RS_RF);            
r_RF_RT = r_RF_RS + rot_RF_RT * (-RbtPar.r_RT_RS);
r_RF_W  = r_RF_RT + rot_RF_W  * (-RbtPar.r_W_RT);

r_RF_LT = r_RF_W  + rot_RF_W  * RbtPar.r_W_LT;
r_RF_LS = r_RF_LT + rot_RF_LT * RbtPar.r_LT_LS;
r_RF_LF = r_RF_LS + rot_RF_LS * RbtPar.r_LS_LF;

r_RF_CH = r_RF_W + rot_RF_W * RbtPar.r_W_CH;

r_RF_RA  = r_RF_CH  + rot_RF_CH  * RbtPar.r_CH_RA;
r_RF_RFA = r_RF_RA  + rot_RF_RA  * RbtPar.r_RA_RFA;
r_RF_RH  = r_RF_RFA + rot_RF_RFA * RbtPar.r_RFA_RH;

r_RF_LA  = r_RF_CH  + rot_RF_CH  * RbtPar.r_CH_LA;
r_RF_LFA = r_RF_LA  + rot_RF_LA  * RbtPar.r_LA_LFA;
r_RF_LH  = r_RF_LFA + rot_RF_LFA * RbtPar.r_LFA_LH;

% Wyznaczenie orientacji lewej stopy w postaci parametrów Eulera 
% Dana jest macierz rot_RF_LF

e_RF_LF = rot2euler(rot_RF_LF);

%% Obliczenie k¹ta pochylenia korpusu
% wyznaczamy macierz rotacji miêdzy otoczeniem a korpusem (W)
% rot_W = rot_RF * rot_RF_W
% jednak zak³adamy, ¿e rot_RF = I3x3
% wiêc

rot_W = rot_RF_W;

% zak³adamy, ¿e orientacja korpusu dana jest k¹tami Eulera XYZ wokó³ osi
% korpusu kolejno o k¹ty alfa, beta, gamma:
% rot_W =
% [                                  cos(beta)*cos(gamma),                                 -cos(beta)*sin(gamma),            sin(beta)]
% [ cos(alfa)*sin(gamma) + cos(gamma)*sin(alfa)*sin(beta), cos(alfa)*cos(gamma) - sin(alfa)*sin(beta)*sin(gamma), -cos(beta)*sin(alfa)]
% [ sin(alfa)*sin(gamma) - cos(alfa)*cos(gamma)*sin(beta), cos(gamma)*sin(alfa) + cos(alfa)*sin(beta)*sin(gamma),  cos(alfa)*cos(beta)]
% wyznaczamy beta:

Pitch_W = asin(rot_RF_W(1,3));



r_RF_CoM = ( RbtPar.mRF * RbtPar.r_com_RF + ...
             RbtPar.mRS * ( r_RF_RS + rot_RF_RS * RbtPar.r_com_RS ) + ...
             RbtPar.mRT * ( r_RF_RT + rot_RF_RT * RbtPar.r_com_RT ) + ...
             RbtPar.mW  * ( r_RF_W  + rot_RF_W  * RbtPar.r_com_W  ) + ...
             RbtPar.mLT * ( r_RF_LT + rot_RF_LT * RbtPar.r_com_LT ) + ...
             RbtPar.mLS * ( r_RF_LS + rot_RF_LS * RbtPar.r_com_LS ) + ...
             RbtPar.mLF * ( r_RF_LF + rot_RF_LF * RbtPar.r_com_LF ) + ...
             RbtPar.mCH * ( r_RF_CH + rot_RF_CH * RbtPar.r_com_CH ) + ...
             RbtPar.mRA * ( r_RF_RA + rot_RF_RA * RbtPar.r_com_RA ) + ...
             RbtPar.mRFA* ( r_RF_RFA+ rot_RF_RFA* RbtPar.r_com_RFA) + ...
             RbtPar.mLA * ( r_RF_LA + rot_RF_LA * RbtPar.r_com_LA ) + ...
             RbtPar.mLFA* ( r_RF_LFA+ rot_RF_LFA* RbtPar.r_com_LFA) ) / RbtPar.TotalMass; 
% Zapis wektora r:
r = [ r_RF_LF;
      r_RF_RH;
      r_RF_LH;
      r_RF_CoM;
      e_RF_LF;
      Pitch_W];      
end

