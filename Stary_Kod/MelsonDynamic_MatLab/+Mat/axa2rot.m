function rot = axa2rot(w)
   fi = norm(w);
   w = w/fi;
   
   c = cos(fi);
   s = sin(fi);
   
   v = 1 - cos(fi);
   
   x = w(1);
   y = w(2);
   z = w(3);
   
   rot = w * w' * v + eye(3)*c + [0 -z y; z 0 -x; -y x 0]*s; 
   if fi==0
       rot = eye(3);
   end
end

