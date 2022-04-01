function [out] = RotY(q)
%ROTZ Summary of this function goes here
%   Detailed explanation goes here
    out = [cos(q) 0 sin(q);
           0 1 0;
           -sin(q) 0 cos(q)];
end

