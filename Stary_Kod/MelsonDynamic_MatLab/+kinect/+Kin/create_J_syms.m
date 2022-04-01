function [J] = eval_J(RbtPar,Chain)
%EVAL_J
% Funkcja zwracaj¹ca jakobian 

% dr = [ dr_RF_LF;
%        dr_RF_RH;
%        dr_RF_LH;
%        dr_RF_CoM;       
%        w_RF_LF];
% dr = J * dq
% RTz = q(1); RTx = q(2); RTy = q(3);
% RSy = q(4); RFy = q(5); RFx = q(6);
% LTz = q(7); LTx = q(8); LTy = q(9);
% LSy = q(10); LFy = q(11); LFx = q(12);
% RAy  = q(13); RAx  = q(14); RFAy = q(15);
% LAy  = q(16); LAx  = q(17); LFAy = q(18);
% CHz  = q(19);

syms RTz RTx RTy RSy RFy RFx LTz LTx LTy LSy LFy LFx RAy RAx RFAy LAy LAx LFAy CHz real;


% 
% syms JointRot        = zeros(3,3,19);
% syms JointRotInGlobal  = zeros(3,3,19);

JointRot(:,:,1)     = RotZ( -RTz ); 
JointRot(:,:,2)     = RotX( -RTx );
JointRot(:,:,3)     = RotY( -RTy );
JointRot(:,:,4)     = RotY( -RSy );
JointRot(:,:,5)     = RotY( -RFy );
JointRot(:,:,6)     = RotX( -RFx );
JointRot(:,:,7)     = RotZ( LTz );
JointRot(:,:,8)     = RotX( LTx );
JointRot(:,:,9)     = RotY( LTy );
JointRot(:,:,10)    = RotY( LSy );
JointRot(:,:,11)    = RotY( LFy );
JointRot(:,:,12)    = RotX( LFx );
JointRot(:,:,13)    = RotY( RAy );
JointRot(:,:,14)    = RotX( RAx );
JointRot(:,:,15)    = RotY( RFAy );
JointRot(:,:,16)    = RotY( LAy );
JointRot(:,:,17)    = RotX( LAx );
JointRot(:,:,18)    = RotY( LFAy );
JointRot(:,:,19)    = RotZ( CHz );

for Iter=1:RbtPar.DoF
    if RbtPar.JointRotOrderPrev(Iter,1)
        JointRotInGlobal(:,:,RbtPar.JointRotOrderPrev(Iter,2)) = JointRotInGlobal(:,:,RbtPar.JointRotOrderPrev(Iter,1)) * JointRot(:,:,RbtPar.JointRotOrderPrev(Iter,2));
    else
        JointRotInGlobal(:,:,RbtPar.JointRotOrderPrev(Iter,2)) = JointRot(:,:,RbtPar.JointRotOrderPrev(Iter,2));
    end
end


% Wyznaczanie i-tej kolumny jakobianu
% J = zeros(15,19);
% Jmass = zeros(3,19);
syms tmp real;
Jmass = ones(3,19)*tmp;
Jmass = Jmass - tmp;

for Joint=1:19
    [J(1:3,Joint) J(13:15,Joint)]   = J_column(Joint,JointRotInGlobal, RbtPar.JointU, Chain(1).R, Chain(1).JointOrder );
    J(4:6,Joint) = J_column(Joint,JointRotInGlobal, RbtPar.JointU, Chain(2).R, Chain(2).JointOrder );
    J(7:9,Joint) = J_column(Joint,JointRotInGlobal, RbtPar.JointU, Chain(3).R, Chain(3).JointOrder );
    
    Jmass(:,Joint) = Jmass(:,Joint) + RbtPar.mRS * J_column(Joint,JointRotInGlobal, RbtPar.JointU, Chain(4).R, Chain(4).JointOrder );
    Jmass(:,Joint) = Jmass(:,Joint) + RbtPar.mRT * J_column(Joint,JointRotInGlobal, RbtPar.JointU, Chain(5).R, Chain(5).JointOrder );
    Jmass(:,Joint) = Jmass(:,Joint) + RbtPar.mW  * J_column(Joint,JointRotInGlobal, RbtPar.JointU, Chain(6).R, Chain(6).JointOrder );
    Jmass(:,Joint) = Jmass(:,Joint) + RbtPar.mLT * J_column(Joint,JointRotInGlobal, RbtPar.JointU, Chain(7).R, Chain(7).JointOrder );
    Jmass(:,Joint) = Jmass(:,Joint) + RbtPar.mLS * J_column(Joint,JointRotInGlobal, RbtPar.JointU, Chain(8).R, Chain(8).JointOrder );
    Jmass(:,Joint) = Jmass(:,Joint) + RbtPar.mLF * J_column(Joint,JointRotInGlobal, RbtPar.JointU, Chain(9).R, Chain(9).JointOrder );
    Jmass(:,Joint) = Jmass(:,Joint) + RbtPar.mCH * J_column(Joint,JointRotInGlobal, RbtPar.JointU, Chain(10).R, Chain(10).JointOrder );
    Jmass(:,Joint) = Jmass(:,Joint) + RbtPar.mRA * J_column(Joint,JointRotInGlobal, RbtPar.JointU, Chain(11).R, Chain(11).JointOrder );
    Jmass(:,Joint) = Jmass(:,Joint) + RbtPar.mRFA* J_column(Joint,JointRotInGlobal, RbtPar.JointU, Chain(12).R, Chain(12).JointOrder );
    Jmass(:,Joint) = Jmass(:,Joint) + RbtPar.mLA * J_column(Joint,JointRotInGlobal, RbtPar.JointU, Chain(13).R, Chain(13).JointOrder );
    Jmass(:,Joint) = Jmass(:,Joint) + RbtPar.mLFA* J_column(Joint,JointRotInGlobal, RbtPar.JointU, Chain(14).R, Chain(14).JointOrder );    
end
    J(10:12,:) = Jmass / RbtPar.TotalMass;
end

function [dr dfi] = J_column(Joint, Rot, U, R, JointOrder)
    NumberOfJoints = length(JointOrder);
    dr = zeros(3,1);
    dfi= zeros(3,1);
    
    if ismember(Joint,JointOrder)
        % Okreœlenie wersora kierunkowowego "u" i-tego napêdu robota
        % zapisanego we wspó³rzêdnych uk³adu RF
%         rot_RF_i = eye(3);
        rot_RF_i = Rot(:,:,Joint);
        
        Iter=1;
        while JointOrder(Iter) ~= Joint
%             rot_RF_i = rot_RF_i * Rot(:,:,JointOrder(Iter));
            Iter = Iter+1;
        end
        u_joint = rot_RF_i * U(:,Joint);

        % Okreœlenie ramienia "d" i-tego napêdu robota
        % zapisanego we wspó³rzêdnych uk³adu RF
        
        d_joint = zeros(3,1);
        
        for Iter=Iter:length(JointOrder)
        	rot_RF_i = Rot(:,:,JointOrder(Iter));
            d_joint = d_joint + rot_RF_i * R(:,Iter);
        end
        
        dr = Mat(u_joint) * d_joint;
        dfi = u_joint;
    end
end

function [A] = Mat(r)
%macierz stowarzyszona
    A = [0 -r(3) r(2);
         r(3) 0 -r(1);
         -r(2) r(1) 0];
end

function [out] = RotX(q)
%ROTZ Summary of this function goes here
%   Detailed explanation goes here
    out = [1 0 0;
           0 cos(q) -sin(q);
           0 sin(q) cos(q)];
end

function [out] = RotY(q)
%ROTZ Summary of this function goes here
%   Detailed explanation goes here
    out = [cos(q) 0 sin(q);
           0 1 0;
           -sin(q) 0 cos(q)];
end

function [out] = RotZ(q)
%ROTZ Summary of this function goes here
%   Detailed explanation goes here
    out = [cos(q) -sin(q) 0;
           sin(q) cos(q) 0;
           0 0 1];
end




