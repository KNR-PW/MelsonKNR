function [q_goal Q] = SolveInverseKinematics(q0,r_goalIn0, N)
% Funkcja rozwi¹zuje zadanie odwrotne kinematyki
% q0 - przybli¿enie startowe
% r_goal - zadana pozycja robota (kolejnych enpointów i CoM w uk³adzie RF)
% N - liczba kroków ca³kowania

% q_goal - otrzymany wektor wspó³rzêdnych z³¹czowych
% Q - rozwi¹zania poœrednie, w kolejnych chwilach dt
    
    r_goal = KinFast.ConvertToRF(r_goalIn0);
    rot_RF = Mat.euler2rot(r_goalIn0(16:18));

    if nargin<3
        N = 1;
    end
    
        % inicjalizacja pêtli
    K = 0.0;            % wzmocnienie sprzê¿enia zwrotnego od b³êdu
    e = [];    % aktualny b³¹d
    k = -0.9;             % sprzê¿enie od gradH
    
    enable_J_aug= true; % rozszerzenie jakobianu o zadanie pochylenia korpusu
    disable_hand = false;% wy³¹czenie odwzorowania trajektorii r¹k
 
    
    if enable_J_aug
        r_goal = [r_goal; degtorad(23)];
        r_start = [KinFast.eval_r(q0);
                   KinFast.eval_r_aug(q0, rot_RF)];
        e = zeros(16,1);
    else
        r_start = [KinFast.eval_r(q0)];
        e = zeros(15,1);
    end
    
    r_realwithhands = r_start;
    
    if disable_hand 
        r_start(4:9,:) = [];
        e(4:9,:) = [];
        r_goal(4:9,:) = [];
    end
    
    
    % wyznaczenie aktualnej pozycji
  
    r_real = r_start;   % aktualna pozycja w wsp. zewnêtrznych
    
    
    
    % prêdkoœæ (1/step)
    v = (r_goal - r_start) / N;
    
    % przygotowanie macierzy na kolejne rozwi¹zania
    Q = zeros(19,N+1);
    Q(:,1) = q0; 
    

    
    for Iter=1:N
        J = KinFast.eval_J(Q(:,Iter));                          % Geometric Jacobian
        
        if enable_J_aug
            J_aug = KinFast.eval_J_aug(Q(:,Iter), rot_RF);          % Augmented Jacobian part
        else
            J_aug = [];
        end

        
        
        Jt = [TaskTransform(r_realwithhands) * J; J_aug];                % Task Jacobian
        if disable_hand 
            Jt(4:9,:) = [];
        end
        
        
        
        dq_n = k * gradH(Q(:,Iter));                            % prêdkoœæ w nullspace 
        Q(:,Iter+1) = Q(:,Iter) + pinv(Jt) * (v + K*e) + ( eye(19) - pinv( Jt ) * Jt ) * dq_n;
        
        if enable_J_aug
            r_real = [KinFast.eval_r(Q(:,Iter));
                      KinFast.eval_r_aug(Q(:,Iter),rot_RF)];        % Aktualna pozycja rzeczywista
        else
            r_real = [KinFast.eval_r(Q(:,Iter))];
        end
        if disable_hand 
            r_real(4:9,:) = [];
        end
        
        
        e = r_start + v * Iter - r_real;                        % aktualny b³¹d
        
        
    end 
    q_goal = Q(:,N+1);
end

function [T] = TaskTransform(t)
% transformacja prêdkoœci geometrycznych na prêdkoœæ zadania (prêdkoœæ koñcówek w uk³. kartezjañskim,
% prêdkoœæ obrotowa w pochodne parametrów Eulera
    T = eye(15);
    T(13:15,13:15) = EulerTransform(t(13:15));
end

function [T] = EulerTransform(e)
    % macierz tranformacji prêdkoœci k¹towej w pochodne k¹tów Eulera
    a = e(1);
    b = e(2);
    c = e(3);
    
    T = zeros(3,3);
    T(3,1) = cos(b);
    T(1,2) = sin(c);
    T(2,2) = cos(c) * cos(b);
    T(3,2) = sin(c) * sin(b);
    T(1,3) = cos(c);
    T(2,3) = -sin(c) * cos(b);
    T(3,3) = cos(c) * sin(b);
    
    T = T/ cos(b);
end

function gH = gradH(q)
method = 'limits';
gH = zeros(19,1);

switch method
	case 'limits'
        %                  1    2   3  4   5   6   7   8   9 10  11  12  13  14   15  16
        q_max = degtorad([ 15  15  0 90  90  30  15  15  0 90  90  30  90   0    0  90  90   0  15   ]);
        q_min = degtorad([-15 -15 -90  0 -90 -30 -15 -15 -90  0 -90 -30 -90 -90  -90 -90   0 -90 -15   ]);
        q_mid = (q_max + q_min)/2;
        
        gH = zeros(19,1);
        for i=1:19
        gH(i) = (q(i) - q_mid(i)) / (q_max(i) - q_min(i));
        end
        
	case 'none'

end

end

