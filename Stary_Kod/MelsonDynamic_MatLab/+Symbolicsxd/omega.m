function [omega] = omega(R01, R02, dt)
% wyznaczenie macierzy rotacji miêdzy uk³adem pocz¹tkowym (1) a koñcowym
% (2)

    R12 = R01' * R02;

    e0 = sqrt( (trace(R12) + 1) / 4 );
    
    fi = 2 * acos( e0 );
    
    e = [ R12(3,2) - R12(2,3);
          R12(1,3) - R12(3,1);
          R12(2,1) - R12(1,2)] / (4*e0);
    u = e / sin(fi/2);
    
    w1 = u * fi / dt;
    omega = R01 * w1;
    
    if isnan(omega)
        omega = [0 0 0]'
    end
    
end

