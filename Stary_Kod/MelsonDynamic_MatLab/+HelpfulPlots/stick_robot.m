function [  ] = stick_robot(RbtMdlPar, q , r_W, rot_W)
% Wizualizacja robota na podstawie wymiarów (RbtMdlPar) i wspó³rzêdnych
% z³¹czowych
% q - wektor k¹tów
% r_W - po³o¿enie bioder na wykresie (opcjonalne)
% rot_W - obrót bioder na wykresie 
if nargin < 1
    RobotParameters.LoadModelParameters;
    RbtMdlPar = RobotModelParameters;
    q = zeros(1,19);
    r_W = [0 0 0]';
    rot_W = eye(3);
elseif nargin < 2
    q = zeros(1,19);
    r_W = [0 0 0]';
    rot_W = eye(3);
elseif nargin<3
    r_W = [0 0 0]';
    rot_W = eye(3);
elseif nargin < 4
    rot_W = eye(3);
end

% HelpfulPlots.wymiary;  %odczyt wymiarów

% odczyt k¹tów z parametru q
% prawa noga
fi_RTz = q(1);               % k¹t biodra - udo (obrót Z)
fi_RTx = q(2);            % k¹t obrotu uda wokó³ osi X uk³adu lokalnego
fi_RTy = q(3);             % k¹t obrotu uda wokó³ osi Y uk³adu lokalnego
fi_RS = q(4);                % k¹t udo - lwe podudzie
fi_RFy = q(5);               % k¹t podudzie - stopa (obrót Y)
fi_RFx = q(6);              % k¹t obrotu stopy wokó³ osi X uk³adu lokalnego
% lewa noga
fi_LTz = q(7);                % k¹t biodra - udo (obrót Z)
fi_LTx = q(8);             % k¹t obrotu uda wokó³ osi X uk³adu lokalnego
fi_LTy = q(9);              % k¹t obrotu uda wokó³ osi Y uk³adu lokalnego
fi_LS = q(10);                % k¹t udo - lwe podudzie
fi_LFy = q(11);               % k¹t podudzie - stopa (obrót Y)
fi_LFx = q(12);              % k¹t obrotu stopy wokó³ osi X uk³adu lokalnego

%prawa rêka
fi_RAy = q(13);
fi_RAx = q(14);
fi_RFA = q(15);

% lewa rêka
fi_LAy = q(16);
fi_LAx = q(17);
fi_LFA = q(18);

% klatka piersiowa
fi_CH = q(19);                % k¹t biodra - klatka (obrót Z)



% macierze rotacji poszczególnych cz³onów wzglêdem bioder (W)
% lewa noga
rot_W_LT = Rz(fi_LTz) * Rx(fi_LTx) * Ry(fi_LTy);
rot_W_LS = rot_W_LT * Ry(fi_LS);
rot_W_LF = rot_W_LS * Ry(fi_LFy) * Rx(fi_LFx);

% prawa noga
rot_W_RT = Rz(fi_RTz) * Rx(fi_RTx) * Ry(fi_RTy);
rot_W_RS = rot_W_RT * Ry(fi_RS);
rot_W_RF = rot_W_RS * Ry(fi_RFy) * Rx(fi_RFx);

% klatka piersiowa
rot_W_CH = Rz(fi_CH);

% lewa rêka
rot_W_LA = rot_W_CH * Ry(fi_LAy) * Rx(fi_LAx);
rot_W_LFA = rot_W_LA * Ry(fi_LFA);

% prawa rêka
rot_W_RA = rot_W_CH * Ry(fi_RAy) * Rx(fi_RAx);
rot_W_RFA = rot_W_RA * Ry(fi_RFA);


% obliczenie pozycji poszczególnych stawów wzglêdem korpusu

r_W_RT = RbtMdlPar.r_W_RT;
r_W_RS = r_W_RT + rot_W_RT * RbtMdlPar.r_RT_RS;
r_W_RF = r_W_RS + rot_W_RS * RbtMdlPar.r_RS_RF;

r_W_RF_center = r_W_RF + rot_W_RF * RbtMdlPar.r_RF_center;
r_W_RF_right_toe = r_W_RF + rot_W_RF * RbtMdlPar.r_RF_right_toe; 
r_W_RF_left_toe = r_W_RF + rot_W_RF * RbtMdlPar.r_RF_left_toe; 
r_W_RF_right_heel = r_W_RF + rot_W_RF * RbtMdlPar.r_RF_right_heel; 
r_W_RF_left_heel = r_W_RF + rot_W_RF * RbtMdlPar.r_RF_left_heel; 

r_W_LT = RbtMdlPar.r_W_LT;
r_W_LS = r_W_LT + rot_W_LT * RbtMdlPar.r_LT_LS;
r_W_LF = r_W_LS + rot_W_LS * RbtMdlPar.r_LS_LF;

r_W_LF_center = r_W_LF + rot_W_LF * RbtMdlPar.r_LF_center;
r_W_LF_right_toe = r_W_LF + rot_W_LF * RbtMdlPar.r_LF_right_toe; 
r_W_LF_left_toe = r_W_LF + rot_W_LF * RbtMdlPar.r_LF_left_toe; 
r_W_LF_right_heel = r_W_LF + rot_W_LF * RbtMdlPar.r_LF_right_heel; 
r_W_LF_left_heel = r_W_LF + rot_W_LF * RbtMdlPar.r_LF_left_heel; 


% czesc na reke
r_W_LA = RbtMdlPar.r_W_CH + rot_W_CH * RbtMdlPar.r_CH_LA;
r_W_LFA = r_W_LA + rot_W_LA * RbtMdlPar.r_LA_LFA;
r_W_LH = r_W_LFA + rot_W_LFA * RbtMdlPar.r_LFA_LH;

r_W_RA = RbtMdlPar.r_W_CH + rot_W_CH * RbtMdlPar.r_CH_RA;
r_W_RFA = r_W_RA + rot_W_RA * RbtMdlPar.r_RA_RFA;
r_W_RH = r_W_RFA + rot_W_RFA * RbtMdlPar.r_RFA_RH;

% obliczenie pozycji poszczególnych elementów w uk³adzie globalnym
% przesuniêcie i rotacja korpusu

        r_RT = r_W + rot_W * r_W_RT;
        r_RS = r_W + rot_W * r_W_RS;
        r_RF = r_W + rot_W * r_W_RF;

        r_RF_center = r_W + rot_W * r_W_RF_center;
        r_RF_right_toe = r_W + rot_W * r_W_RF_right_toe;
        r_RF_left_toe = r_W + rot_W * r_W_RF_left_toe;
        r_RF_right_heel = r_W + rot_W * r_W_RF_right_heel;
        r_RF_left_heel =  r_W + rot_W * r_W_RF_left_heel;

        r_LT = r_W + rot_W * r_W_LT;
        r_LS = r_W + rot_W * r_W_LS;
        r_LF = r_W + rot_W * r_W_LF;

        r_LF_center = r_W + rot_W * r_W_LF_center;
        r_LF_right_toe = r_W + rot_W * r_W_LF_right_toe;
        r_LF_left_toe = r_W + rot_W * r_W_LF_left_toe;
        r_LF_right_heel = r_W + rot_W * r_W_LF_right_heel;
        r_LF_left_heel = r_W + rot_W * r_W_LF_left_heel;

        r_LA = r_W + rot_W * r_W_LA;
        r_LFA = r_W + rot_W * r_W_LFA;
        r_LH = r_W + rot_W * r_W_LH;

        r_RA = r_W + rot_W * r_W_RA;
        r_RFA = r_W + rot_W * r_W_RFA;
        r_RH = r_W + rot_W * r_W_RH;

%% Uruchomienie wykresu
% 
% plot3(0,0,0,'-');
hold on;
az = 125; %135
el = 22;    %22
view(az, el);



grid on;
axis equal;
% axis([-150 400 -200 200 0 500]);
%  xlim([-100, 250]);
%  ylim([-200 200]);
%  zlim([-35, 400]);

%  xlim([-100, 250]);
 ylim([-300 300]);
 zlim([-35, 400]);


%% prawa stopa
stick(r_RF_right_toe,r_RF_left_toe);
stick(r_RF_left_toe,r_RF_left_heel);
stick(r_RF_left_heel,r_RF_right_heel);
stick(r_RF_right_heel,r_RF_right_toe);

stick(r_RF_right_toe,r_RF);
stick(r_RF_left_toe,r_RF);
stick(r_RF_right_heel,r_RF);
stick(r_RF_left_heel,r_RF);


stick(r_RF,r_RS);
stick(r_RS,r_RT);
stick(r_RT,r_W);
stick(r_RT,r_LT);
stick(r_LT,r_W);

%lewa
stick(r_LF_right_toe,r_LF_left_toe);
stick(r_LF_left_toe,r_LF_left_heel);
stick(r_LF_left_heel,r_LF_right_heel);
stick(r_LF_right_heel,r_LF_right_toe);

stick(r_LF_right_toe,r_LF);
stick(r_LF_left_toe,r_LF);
stick(r_LF_right_heel,r_LF);
stick(r_LF_left_heel,r_LF);

stick(r_LF,r_LS);
stick(r_LS,r_LT);

% klatka
stick(r_W,r_LA);
stick(r_W,r_RA);
stick(r_RA,r_LA);

% lewa rêka
stick(r_LA,r_LFA);
stick(r_LFA,r_LH);

% prawa rêka
stick(r_RA,r_RFA);
stick(r_RFA,r_RH);


point(r_W);
point(r_RT);
point(r_RS);
point(r_RF);
% point(r_RF_center);
point(r_LT);
point(r_LS);
point(r_LF);
% point(r_LF_center);

point(r_LA);
point(r_LFA);
point(r_LH);

point(r_RA);
point(r_RFA);
point(r_RH);

hold off;
end

function [] = point(r)
    rx=r(1);
    ry=r(2);
    rz=r(3);
    
    plot3(rx,ry,rz,'-ro');
end

function [] = stick(r1, r2)
    X=[r1(1) r2(1)];
    Y=[r1(2) r2(2)];
    Z=[r1(3) r2(3)];
    line(X,Y,Z);
end
function [R] = Rx(fi)
    R = [1  0          0
         0  cos(fi)    -sin(fi);
         0  sin(fi)    cos(fi)];
end

function [R] = Ry(fi)
    R = [cos(fi)    0   sin(fi);
         0          1   0;
         -sin(fi)   0   cos(fi)];
end

function [R] = Rz(fi)
    R = [cos(fi)    -sin(fi)    0;
         sin(fi)    cos(fi)     0;
         0          0           1];
end
