function [out] = rot2rpy(Rot)
    % 
    % [ cos(P)*cos(Y), cos(Y)*sin(P)*sin(R) - cos(R)*sin(Y), sin(R)*sin(Y) + cos(R)*cos(Y)*sin(P)]
    % [ cos(P)*sin(Y), cos(R)*cos(Y) + sin(P)*sin(R)*sin(Y), cos(R)*sin(P)*sin(Y) - cos(Y)*sin(R)]
    % [       -sin(P),                        cos(P)*sin(R),                        cos(P)*cos(R)]

    out = zeros(3,1);

    Pitch = asin( -Rot(3,1) );

    cosRoll = Rot(3,3) / cos(Pitch);
    sinRoll = Rot(3,2) / cos(Pitch);
    Roll = atan2(sinRoll, cosRoll);

    cosYaw = Rot(1,1) / cos(Pitch);
    sinYaw = Rot(2,1) / cos(Pitch);

    Yaw = atan2(sinYaw, cosYaw);

    out = [Roll; Pitch; Yaw];
end

