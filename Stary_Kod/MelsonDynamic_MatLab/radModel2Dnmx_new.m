function [ DNMX ] = radModel2Dnmx_new( q )
%RAD2DNMX Summary of this function goes here
%   Detailed explanation goes here



DNMX(6) = 512 + int16( q(6) * 1024 / deg2rad(300));
DNMX(5) = 512 - int16( q(5) * 1024 / deg2rad(300));
DNMX(4) = 512 + int16( q(4) * 1024 / deg2rad(300));
DNMX(3) = 512 + int16( q(3) * 1024 / deg2rad(300));


DNMX(2) = 512 - int16( q(2) * 1024 / deg2rad(300));
DNMX(1) = 2048 - int16( q(1) * 4096 / deg2rad(360));


DNMX(12) = 512 + int16( q(12) * 1024 / deg2rad(300));
DNMX(11) = 512 + int16( q(11) * 1024 / deg2rad(300));
DNMX(10) = 512 - int16( q(10) * 1024 / deg2rad(300));
DNMX(9) = 512 - int16( q(9) * 1024 / deg2rad(300));


DNMX(8) = 512 - int16( q(8) * 1024 / deg2rad(300));
DNMX(7) = 2048 - int16( q(7) * 4096 / deg2rad(360));





DNMX(13) = 512 - int16( q(13) * 1024 / deg2rad(300));
DNMX(14) = 512 - int16( q(14) * 1024 / deg2rad(300));
DNMX(15) = 512 + int16( q(15) * 1024 / deg2rad(300));
DNMX(16) = 512 + int16( q(16) * 1024 / deg2rad(300));
DNMX(17) = 512 - int16( q(17) * 1024 / deg2rad(300));
DNMX(18) = 512 - int16( q(18) * 1024 / degtorad(300));
DNMX(19) = 477 + int16( (q(19)) * 1024 / deg2rad(300));


% DNMX(20) = 512 - int16( q(20) * 1024 / deg2rad(300));
% DNMX(21) = 512 - int16( q(21) * 1024 / degtorad(300));



for i=13:19
    if (DNMX(i)>1023)
        DNMX(i)=int16(1023);
    end
    if (DNMX(i)<0)
        DNMX(i)=int16(0);
    end
end


end