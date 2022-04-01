function [ res ] = PZK_klatka_rekaL( q, r_CH_LH)


if( nargin<2 )
   r_CH_LH = [0 0 0]'; 
end

% Wczytanie wymiarów)
wymiary;

fi_LAy = q(1);
fi_LAx = q(2);
fi_LFA = q(3);



res = humanoid.r_CH_LA + Ry(fi_LAy) * Rx(fi_LAx) * humanoid.r_LA_LFA + Ry(fi_LAy) * Rx(fi_LAx) * Ry(fi_LFA) * humanoid.r_LFA_LH - r_CH_LH;

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
