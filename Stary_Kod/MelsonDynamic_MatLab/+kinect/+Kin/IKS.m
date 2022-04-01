function [q_goal Q] = IKS(RbtPar, Chain, q0,r_goal, time, dt)
% Funkcja rozwi¹zuje zadanie odwrotne kinematyki
% RbtPar - struktura zawieraj¹ca geometriê i rozk³ad mas robota
% Chain  - struktura z informacj¹ o 
% q0 - przybli¿enie startowe
% r_goal - zadana pozycja robota (kolejnych enpointów i CoM w uk³adzie RF)
% time - zadany czas trwania ruchu
% dt - krok ca³kowania

% q_goal - otrzymany wektor wspó³rzêdnych z³¹czowych
% Q - rozwi¹zania poœrednie, w kolejnych chwilach dt
    FreeHands = false;
        
    if nargin<6
        dt = 0.01;
    end
    if nargin<5
        time = 1;
    end
    
    N = round(time/dt);
    r_start = Kin.eval_r(RbtPar,q0);
    %% TODO: trapezowy profil prêdkoœci
    v = (r_goal - r_start) / time;
    v_old = v;
   
    if FreeHands
            rows_to_delete = [4 5 6 7 8 9];
            
           v(rows_to_delete) = [];
            
            
        end
    
    
    Q = zeros(19,N+1);
    Q(:,1) = q0; 
    K = 0.0;

    for Iter=1:N
        r_real = Kin.eval_r(RbtPar,Q(:,Iter));          %Aktualna pozycja rzeczywista
        J = Kin.eval_J(RbtPar, Chain, Q(:,Iter));       %Geometric Jacobian
        Jt = TaskTransform(r_real) * J;                 %Task Jacobian
        e = r_start + Iter/N *v_old *time - r_real;
        
        if FreeHands
            rows_to_delete = [4 5 6 7 8 9];
            
            Jt(rows_to_delete,:) = [];
            e(rows_to_delete) = []; 
        end
  
        dq_n = - 10 * gradH(Q(:,Iter));
        Q(:,Iter+1) = Q(:,Iter) + pinv(Jt) * (v + K*e)*dt + ( eye(19) - pinv( Jt ) * Jt ) * dq_n * dt;

    end 
    q_goal = Q(:,N+1);
end

function [T] = TaskTransform(t)
    T = eye(16);
    T(13:15,13:15) = EulerTransform(t(13:15));
end

function [T] = EulerTransform(e)
    % macierz tranformacji prêdkoœci k¹towej w pochodne parametrów Eulera
    fi = 2*asin( norm(e) );
    e0 = cos(fi/2);
    
    T = [e0     e(3)  -e(2);
         -e(3)  e0     e(1);
         e(2)  -e(1)   e0]  /2;

end

function gH = gradH(q)
method = 'none';
gH = zeros(19,1);

switch method
	case 'limits'
        %                  1    2   3  4   5   6   7   8   9 10  11  12  13  14   15  16
        q_max = degtorad([ 15  15  45 90  90  30  15  15  45 90  90  30  90   0    0  90  90   0  15   ]);
        q_min = degtorad([-15 -15 -90  0 -90 -30 -15 -15 -90  0 -90 -30 -90 -90  -90 -90   0 -90 -15   ]);
        q_mid = (q_max + q_min)/2;
        
        gH = zeros(19,1);
        for i=1:19
        gH(i) = (q(i) - q_mid(i)) / (q_max(i) - q_min(i));
        end
        
	case 'none'
%         
%     case 'manipulability'
%         gH = NumGrad(@manipulability, q)
% 		
end

end

% function H = manipulability(q)
%     J = Kin.eval_J(RbtPar, Chain, q);       %Geometric Jacobian
%     Jt = TaskTransform(r_real) * J;                 %Task Jacobian
%     H = -sqrt( det( Jt' * Jt ) );
% end

% function grad = NumGrad(FunHandler, q)
%     h = 10^(-6);
%     n = length(q);
%     grad = zeros(n,1);
%     H = feval(FunHandler, q);
%     
%     
%     
%     for j=1:n
%         q_h = q;
%         q_h(j) = q_h(j) + h;
%         H_h = feval( FunHandler, q_h );
%         grad(j) = ( H_h - H ) / h;
%     end
%     
%     
% end
