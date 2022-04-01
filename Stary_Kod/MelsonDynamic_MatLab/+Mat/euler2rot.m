function [rot] = euler2rot(e)
    
    a = e(1);
    b = e(2);
    c = e(3);
    
    rot = Mat.RotZ(a) * Mat.RotY(b) * Mat.RotX(c); 
end

