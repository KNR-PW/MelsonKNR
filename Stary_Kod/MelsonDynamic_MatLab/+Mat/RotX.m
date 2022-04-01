function [out] = RotX(q)
%ROTZ Summary of this function goes here
%   Detailed explanation goes here
    out = [1 0 0;
           0 cos(q) -sin(q);
           0 sin(q) cos(q)];
end

