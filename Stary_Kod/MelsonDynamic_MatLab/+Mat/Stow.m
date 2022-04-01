function [out] = Stow(vect)
x = vect(1);
y = vect(2);
z = vect(3);

out = [0 -z y;
       z 0 -x;
       -y x 0];
end

