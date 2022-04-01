function [ res ] = PZK_klatka_rekaP( q, r_CH_RH)


if( nargin<2 )
   r_CH_RH = [0 0 0]'; 
end

% Wczytanie wymiarów)
wymiary;

fi_RAy = q(1);
fi_RAx = q(2);
fi_RFA = q(3);



res = humanoid.r_CH_RA + Ry(fi_RAy) * Rx(fi_RAx) * humanoid.r_RA_RFA + Ry(fi_RAy) * Rx(fi_RAx) * Ry(fi_RFA) * humanoid.r_RFA_RH - r_CH_RH;

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
