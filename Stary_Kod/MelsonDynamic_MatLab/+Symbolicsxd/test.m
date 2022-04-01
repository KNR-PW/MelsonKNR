syms q1 q2;

r = [ cos(q1) + cos(q1 + q2);
      sin(q1) + sin(q1 + q2)];
  
q = [q1; q2];

Jacobian = diff_jacobian(r, q);

Jacobian

