function [q]=OZK_korpus_stopaP(RbtMdlPar, r_W_RF_char_point,R_W_RF, r_RF_char_point )
% Zadanie odwrotne kinematyki dla koñczyny dolnej prawej
% Wejœcie:
% r_W_RF_center - po³o¿enie koñcówki (œrodka stopy) w uk³adzie bioder
% rot_W_RF - rotacja stopy wzglêdem bioder
% r_RF_char_point - wspó³rzêdne charakterystycznego punktu w uk³adzie stopy
% Wyjœcie
% q - wektor wsp. z³¹czowych
% q = [fi_RTz fi_RTx fi_RTy fi_RS fi_RFy fi_RFx];

if nargin<4
    r_RF_char_point = RbtMdlPar.r_RF_center;
end

if nargin<3
    rot_W_RF = eye(3);
end

%% zwi¹zki geometryczne

l_RT = RbtMdlPar.r_RT_RS(3);
l_RS = RbtMdlPar.r_RS_RF(3);

%% Obliczenia

r = (R_W_RF)' * r_W_RF_char_point - r_RF_char_point - (R_W_RF)' * RbtMdlPar.r_W_RT;

fi_RS = acos((r'*r - l_RS^2 - l_RT^2) / (2*l_RS*l_RT));

A = -l_RS - l_RT * cos(fi_RS);
B = -l_RT * sin(fi_RS);
Psi = atan(B/A);

fi_RFy = asin( r(1) / sqrt(A^2+B^2)) - Psi;

if ( fi_RFy>degtorad(-90) && fi_RFy<degtorad(90))
    
else
    fi_RFy = pi - asin( r(1) / sqrt(A^2+B^2)) - Psi;
end

fi_RFx = asin( r(2)/( l_RT*cos(fi_RS+fi_RFy) + l_RS*cos(fi_RFy)));


R_RT_RF = Ry(fi_RS) * Ry(fi_RFy) * Rx(fi_RFx);
R_W_RT = R_W_RF * (R_RT_RF)';

r_zy = R_W_RT(3,2);
r_zx = R_W_RT(3,1);
r_xy = R_W_RT(1,2);

fi_RTx = asin(r_zy);
fi_RTy = asin( -r_zx/cos(fi_RTx) );
fi_RTz = asin( -r_xy/cos(fi_RTx) );

q = [fi_RTz fi_RTx fi_RTy fi_RS fi_RFy fi_RFx];


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
