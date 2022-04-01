function [] = calc_jacobian_RF()

syms RTz RTx RTy RSy RFy RFx;
syms LTz LTx LTy LSy LFy LFx;
syms RAy RAx RFAy; 
syms LAy LAx LFAy;
syms CHz;

syms dRTz dRTx dRTy dRSy dRFy dRFx;
syms dLTz dLTx dLTy dLSy dLFy dLFx;
syms dRAy dRAx dRFAy; 
syms dLAy dLAx dLFAy;
syms dCHz;

q = [ RTz; RTx; RTy; RSy; RFy; RFx;
      LTz; LTx; LTy; LSy; LFy; LFx;
      RAy; RAx; RFAy;
      LAy; LAx; LFAy;
      CHz];

dq= [ dRTz; dRTx; dRTy; dRSy; dRFy; dRFx;
      dLTz; dLTx; dLTy; dLSy; dLFy; dLFx;
      dRAy; dRAx; dRFAy;
      dLAy; dLAx; dLFAy;
      dCHz];
disp('Wyznaczanie wektora prawych stron')
tic
r = KinFastRF.calc_r;
w = KinFastRF.calc_w;
toc

disp('Wyznaczanie jakobianu')
tic
J = [ KinFastRF.diff_jacobian(r,q);
      KinFastRF.diff_jacobian(w,dq)];
toc

disp('Generowanie funkcji')
tic
matlabFunction(J,'file','+KinFastRF\function_J.m','Vars',[RTz RTx RTy RSy RFy RFx LTz LTx LTy LSy LFy LFx RAy RAx RFAy LAy LAx LFAy CHz]);
toc

disp('Alleluja!')
load handel
sound(y,Fs)
end