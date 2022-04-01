function [Rzyx] = rot2euler(rot)



b = atan2( -rot(3,1),  sqrt( rot(1,1)^2 + rot(2,1)^2  ) );
a = atan2(rot(2,1) , rot(1,1));
c = atan2(rot(3,2) , rot(3,3));

Rzyx = [a; b; c];
end

