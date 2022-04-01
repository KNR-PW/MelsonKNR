function [] = calc_J_syms()


syms fi_RTz fi_RTx fi_RTy fi_RS fi_RFy fi_RFx;
syms fi_LTz fi_LTx fi_LTy fi_LS fi_LFy fi_LFx;
syms fi_RAy fi_RAx fi_RFA; 
syms fi_LAy fi_LAx fi_LFA
syms fi_CH;

syms dfi_RTz dfi_RTx dfi_RTy dfi_RS dfi_RFy dfi_RFx;
syms dfi_LTz dfi_LTx dfi_LTy dfi_LS dfi_LFy dfi_LFx;
syms dfi_RAy dfi_RAx dfi_RFA; 
syms dfi_LAy dfi_LAx dfi_LFA
syms dfi_CH;

q = [ fi_RTz; fi_RTx; fi_RTy; fi_RS; fi_RFy; fi_RFx;
      fi_LTz; fi_LTx; fi_LTy; fi_LS; fi_LFy; fi_LFx;
      fi_RAy; fi_RAx; fi_RFA;
      fi_LAy; fi_LAx; fi_LFA;
      fi_CH];

dq= [ dfi_RTz; dfi_RTx; dfi_RTy; dfi_RS; dfi_RFy; dfi_RFx;
      dfi_LTz; dfi_LTx; dfi_LTy; dfi_LS; dfi_LFy; dfi_LFx;
      dfi_RAy; dfi_RAx; dfi_RFA;
      dfi_LAy; dfi_LAx; dfi_LFA;
      dfi_CH];
disp('Wyznaczanie wektora prawych stron')
tic
r_syms = Kin.calc_r_syms;
w_syms = Kin.calc_w_syms;
toc

disp('Wyznaczanie jakobianu')
tic
J_syms = [ diff_jacobian(r_syms,q);
           diff_jacobian(w_syms,dq)];
toc

disp('Generowanie funkcji')
tic
matlabFunction(J_syms,'file','+Kin\function_J_syms.m','Vars',[fi_RTz fi_RTx fi_RTy fi_RS fi_RFy fi_RFx fi_LTz fi_LTx fi_LTy fi_LS fi_LFy fi_LFx fi_RAy fi_RAx fi_RFA fi_LAy fi_LAx fi_LFA fi_CH]);
toc

load handel
sound(y,Fs)
end


function [ Jacobian ] = diff_jacobian( r, q )
    for i=1:length(r)
        for j=1:length(q)
            Jacobian(i,j) = diff( r(i), q(j) );
        end
    end        
end

