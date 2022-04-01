function [out] = VectLinspace(v1,v2,n)
%VECTLINSPACE Summary of this function goes here
%   Detailed explanation goes here
    out = zeros(length(v1),n);
    
    for i=1:length(v1)
        out(i,:) = linspace(v1(i),v2(i),n);
    end

end

