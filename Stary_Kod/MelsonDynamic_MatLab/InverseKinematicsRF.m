function [Motion] = InverseKinematicsRF(Motion, GoalElem, q0, SolverOptions)
    % inicjalizacja parametrów
    k1 = -Motion.k_torque(GoalElem);             % sprzê¿enie od gradH dla momentów
    k2 = -Motion.k_limits(GoalElem);
    
%     disp("right")
    %% Okreœlenie pozycji koñcowej i startowej w danej chwili
    
    if Motion.enable_aug
        rot_RF = Mat.RPY(Motion.X_Planned(16:18,GoalElem));
        
        X_goal  = [Motion.X_PlannedInRF(:,GoalElem);
                   Motion.X_aug(:,GoalElem)];
        X_start = [KinFastRF.eval_r(q0);
                   KinFastRF.eval_r_aug(q0, rot_RF)];
    else
        X_goal  = Motion.X_PlannedInRF(:,GoalElem);
        X_start = KinFastRF.eval_r(q0);
    end

    % Zadana prêdkoœæ we wspó³rzêdnych zewnêtrznych
    Vel = X_goal - X_start;
        
    %% Obliczenie jakobianu
    GeometricJacobian = KinFastRF.eval_J(q0);                          % Geometric Jacobian
    
    if Motion.enable_aug
        AugJacobian = KinFastRF.eval_J_aug(q0, rot_RF);          % Augmented Jacobian part
    else
        AugJacobian = [];
    end
      
    TaskJacobian = [TaskTransform(X_start) * GeometricJacobian; AugJacobian];                % Task Jacobian
    
    %% Eliminacja wierszy
    TaskJacobian(Motion.Disable,:) = [];
    Vel(Motion.Disable,:) = [];
    
    %% IK
    dq_null = k1 * gradH(Motion, GoalElem, q0,'torques',SolverOptions) + k2*gradH(Motion, GoalElem, q0,'limits',SolverOptions);                            % prêdkoœæ w nullspace 
    
    JacInv = ginv(TaskJacobian);
    
    q_goal = q0 + JacInv * Vel +...
             ( eye(19) - JacInv * TaskJacobian ) * dq_null;
    
    Motion.JointPos(:,GoalElem) = q_goal;
    Motion.JointTorque(:,GoalElem) = CalculateTorques(Motion, GoalElem, q_goal);
    
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

function gH = gradH(Motion, GoalElem, q, method, SolverOptions)

gH = zeros(19,1);

switch method
	case 'limits'
        %                  1    2   3  4   5   6   7   8   9 10  11  12  13  14   15  16
        q_max = degtorad([ 15  15  0  90  90  30  15  15  0  90  90  30  90   0    0  90  90   0  15   ]);
        q_min = degtorad([-15 -15 -90  0 -90 -30 -15 -15 -90  0 -90 -30 -90 -90  -90 -90   0 -90 -15   ]);
        q_mid = (q_max + q_min)/2;
        
        gH = zeros(19,1);
        for i=1:19
        gH(i) = (q(i) - q_mid(i)) / (q_max(i) - q_min(i));
        end
    case 'torques'
        dq = 0.001;
        
        R = SolverOptions.R;
        
        Torque0 = CalculateTorques(Motion, GoalElem, q);
        Torque0 = 0.5*Torque0' * R * Torque0;
        
        gH = zeros(19,1);
        Q_matrix = eye(19,19)*dq + q;
        for Iter = 1:19
            Torque = CalculateTorques(Motion, GoalElem, Q_matrix(:,Iter));
            gH(Iter) = 0.5*Torque' * R * Torque - Torque0;
        end
        
        gH = gH / dq;
%         global Motion
        Motion.H = [Motion.H Torque0]; 
        
	case 'none'

end

end

function Torque = CalculateTorques(Motion, GoalElem, q)
    Jacobian = KinFastRF.eval_J(q);
    Div = [ones(12,19)*1000; ones(3,19)];
    Jacobian = Jacobian./Div;
    
    Force = Motion.ExtForcesInRF(:,GoalElem);

    Torque =  Jacobian' * Force;
end

