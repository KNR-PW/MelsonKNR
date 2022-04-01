function [T] = StaticForces_RF(RbtPar,Chain, q, grav_RF, LeftFootContact)
%% TODO: uwzglêdnienie kontaktu lewej stopy
% Oblicza Jakobian masowy

if nargin<5
    LeftFootContact = false;
end
if nargin<4
    grav_RF = [0 0 9.81]';
end

JointRot        = zeros(3,3,RbtPar.DoF);
JointRotInGlobal  = zeros(3,3,RbtPar.DoF);
JointUInGlobal = zeros(3,RbtPar.DoF);

JointRot(:,:,1)     = RotZ( -q(1) ); 
JointRot(:,:,2)     = RotX( -q(2) );
JointRot(:,:,3)     = RotY( -q(3) );
JointRot(:,:,4)     = RotY( -q(4) );
JointRot(:,:,5)     = RotY( -q(5) );
JointRot(:,:,6)     = RotX( -q(6) );
JointRot(:,:,7)     = RotZ( q(7) );
JointRot(:,:,8)     = RotX( q(8) );
JointRot(:,:,9)     = RotY( q(9) );
JointRot(:,:,10)    = RotY( q(10) );
JointRot(:,:,11)    = RotY( q(11) );
JointRot(:,:,12)    = RotX( q(12) );
JointRot(:,:,13)    = RotY( q(13) );
JointRot(:,:,14)    = RotX( q(14) );
JointRot(:,:,15)    = RotY( q(15) );
JointRot(:,:,16)    = RotY( q(16) );
JointRot(:,:,17)    = RotX( q(17) );
JointRot(:,:,18)    = RotY( q(18) );
JointRot(:,:,19)    = RotZ( q(19) );

for Iter=1:RbtPar.DoF
    if RbtPar.JointRotOrderPrev(Iter,1)
        JointRotInGlobal(:,:,RbtPar.JointRotOrderPrev(Iter,2)) = JointRotInGlobal(:,:,RbtPar.JointRotOrderPrev(Iter,1)) * JointRot(:,:,RbtPar.JointRotOrderPrev(Iter,2));
    else
        JointRotInGlobal(:,:,RbtPar.JointRotOrderPrev(Iter,2)) = JointRot(:,:,RbtPar.JointRotOrderPrev(Iter,2));
    end
end

for Iter=1:RbtPar.DoF
    if RbtPar.JointRotOrderPrev(Iter,1)
        JointUInGlobal(:,RbtPar.JointRotOrderPrev(Iter,2)) = JointRotInGlobal(:,:,RbtPar.JointRotOrderPrev(Iter,1)) * RbtPar.JointU(:,RbtPar.JointRotOrderPrev(Iter,2));
    else
        JointUInGlobal(:,RbtPar.JointRotOrderPrev(Iter,2)) = RbtPar.JointU(:,RbtPar.JointRotOrderPrev(Iter,2));
    end
end

% Wyznaczanie Jakobianu masowego
% Kolejne wiersze:
% 1:3   - masa RS
% 4:6   - masa RT
% 7:9   - masa W
% 10:12 - masa Lt
% 13:15 - masa LS
% 16:18 - masa LF
% 19:21 - masa CH
% 22:24 - masa RA
% 25:27 - masa RFA
% 28:30 - masa LA
% 31:33 - masa LFA

Jmass = zeros(33,19);

for Joint=1:19
     
    Jmass(1:3,Joint)   = J_column(Joint,JointRotInGlobal, JointUInGlobal, Chain(4).R, Chain(4).JointOrder );
    Jmass(4:6,Joint)   = J_column(Joint,JointRotInGlobal, JointUInGlobal, Chain(5).R, Chain(5).JointOrder );
    Jmass(7:9,Joint)   = J_column(Joint,JointRotInGlobal, JointUInGlobal, Chain(6).R, Chain(6).JointOrder );
    Jmass(10:12,Joint) = J_column(Joint,JointRotInGlobal, JointUInGlobal, Chain(7).R, Chain(7).JointOrder );
    Jmass(13:15,Joint) = J_column(Joint,JointRotInGlobal, JointUInGlobal, Chain(8).R, Chain(8).JointOrder );
    Jmass(16:18,Joint) = J_column(Joint,JointRotInGlobal, JointUInGlobal, Chain(9).R, Chain(9).JointOrder );
    Jmass(19:21,Joint) = J_column(Joint,JointRotInGlobal, JointUInGlobal, Chain(10).R, Chain(10).JointOrder );
    Jmass(22:24,Joint) = J_column(Joint,JointRotInGlobal, JointUInGlobal, Chain(11).R, Chain(11).JointOrder );
    Jmass(25:27,Joint) = J_column(Joint,JointRotInGlobal, JointUInGlobal, Chain(12).R, Chain(12).JointOrder );
    Jmass(28:30,Joint) = J_column(Joint,JointRotInGlobal, JointUInGlobal, Chain(13).R, Chain(13).JointOrder );
    Jmass(31:33,Joint) = J_column(Joint,JointRotInGlobal, JointUInGlobal, Chain(14).R, Chain(14).JointOrder );    
end
    
F = zeros(33,1);
F(1:3)      = RbtPar.mRS * grav_RF;
F(4:6)      = RbtPar.mRT * grav_RF;
F(7:9)      = RbtPar.mW * grav_RF;
F(10:12)    = RbtPar.mLT * grav_RF;
F(13:15)    = RbtPar.mLS * grav_RF;
F(16:18)    = RbtPar.mLF * grav_RF;
F(19:21)    = RbtPar.mCH * grav_RF;
F(22:24)    = RbtPar.mRA * grav_RF;
F(25:27)    = RbtPar.mRFA * grav_RF;
F(28:30)    = RbtPar.mLA * grav_RF;
F(31:33)    = RbtPar.mLFA * grav_RF;
    

T = - Jmass' * F / 10^6;

end

function [dr dfi] = J_column(Joint, Rot, U, R, JointOrder)
    NumberOfJoints = length(JointOrder);
    dr = zeros(3,1);
    dfi= zeros(3,1);
    
    if ismember(Joint,JointOrder)
        % Okreœlenie wersora kierunkowowego "u" i-tego napêdu robota
        % zapisanego we wspó³rzêdnych uk³adu RF

        
        Iter=1;
        while JointOrder(Iter) ~= Joint
            Iter = Iter+1;
        end
        u_joint = U(:,Joint);

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







