function [q]=OZK_korpus_stopaL(RbtMdlPar, r_W_LF_char_point,rot_W_LF, r_LF_char_point)
% Zadanie odwrotne kinematyki dla koñczyny dolnej lewej
% Wejœcie:
% r_W_LF_char_point - po³o¿enie punktu charakterystycznego (domyœlni œrodka stopy) w uk³adzie bioder
% rot_W_LF - rotacja stopy wzglêdem bioder
% r_LF_char_point - wspó³rzêdne charakterystycznego punktu w uk³adzie stopy
% Wyjœcie
% q - wektor wsp. z³¹czowych
% q = [fi_LTz fi_LTx fi_LTy fi_LS fi_LFy fi_LFx];




if nargin<4
    r_LF_char_point = RbtMdlPar.r_LF_center;
end

if nargin<3
    rot_W_LF = eye(3);
end

%% zwi¹zki geometryczne

l_LT = RbtMdlPar.r_LT_LS(3);
l_LS = RbtMdlPar.r_LS_LF(3);

%% Obliczenia

r = (rot_W_LF)' * r_W_LF_char_point - r_LF_char_point - (rot_W_LF)' * RbtMdlPar.r_W_LT;

fi_LS = acos((r'*r - l_LS^2 - l_LT^2) / (2*l_LS*l_LT));

A = -l_LS - l_LT * cos(fi_LS);
B = -l_LT * sin(fi_LS);
Psi = atan(B/A);

fi_LFy = asin( r(1) / sqrt(A^2+B^2)) - Psi;

if ( fi_LFy>degtorad(-90) && fi_LFy<degtorad(90))
else
    fi_LFy = pi - asin( r(1) / sqrt(A^2+B^2)) - Psi;
end

fi_LFx = asin( r(2)/( l_LT*cos(fi_LS+fi_LFy) + l_LS*cos(fi_LFy)));


rot_LT_LF = Ry(fi_LS) * Ry(fi_LFy) * Rx(fi_LFx);
rot_W_LT = rot_W_LF * (rot_LT_LF)';

r_zy = rot_W_LT(3,2);
r_zx = rot_W_LT(3,1);
r_xy = rot_W_LT(1,2);

fi_LTx = asin(r_zy);
fi_LTy = asin( -r_zx/cos(fi_LTx) );
fi_LTz = asin( -r_xy/cos(fi_LTx) );

q = [fi_LTz fi_LTx fi_LTy fi_LS fi_LFy fi_LFx];


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
