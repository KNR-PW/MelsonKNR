function [RotMat] = RPY(angles)
%RPY Summary of this function goes here
%   Detailed explanation goes here
    
    RotMat = zeros(3,3,size(angles,2));

    for i=1:size(angles,2)
        RotMat(:,:,i) = Mat.RotZ(angles(3,i)) * Mat.RotY(angles(2,i)) * Mat.RotX(angles(1,i));
    end       
end

