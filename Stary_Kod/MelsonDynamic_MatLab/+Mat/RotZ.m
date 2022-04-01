function [out] = RotZ(q)
%ROTZ Summary of this function goes here
%   Detailed explanation goes here
    out = [cos(q) -sin(q) 0;
           sin(q) cos(q) 0;
           0 0 1];
end

