function [Motion] = MotionStructSolverParameters(Motion,SolverOptions)

N = Motion.N;

Motion.k_torque = zeros(1,N);
Motion.k_limits = zeros(1,N);

for Iter = 1:N
    if Motion.SupportLeg(Iter) == "Both"
    else
        Motion.k_torque(Iter) = 1;
    end
end

for Iter = 1:N-1
    if Motion.k_torque(Iter) == 0
        if Motion.k_torque(Iter+1) == 1
            for Iter2 = 1:SolverOptions.IncreaseElements
                Motion.k_torque(Iter+Iter2) = Motion.k_torque(Iter+Iter2) * Iter2/SolverOptions.IncreaseElements;
            end
        end
    end
end

for Iter = N:(-1):2
    if Motion.k_torque(Iter) == 0
        if Motion.k_torque(Iter-1) ~= 0
           for Iter2 = 1:SolverOptions.DecreaseElements
                Motion.k_torque(Iter-Iter2) = min(Motion.k_torque(Iter-Iter2),Iter2/SolverOptions.DecreaseElements);
           end
        end
    end        
end

Motion.k_torque = Motion.k_torque * SolverOptions.gamma_grav;
Motion.k_limits = ones(1,N) * SolverOptions.gamma_joint;

Motion.enable_aug = true;
Motion.Disable = [];

Motion.X_aug = deg2rad(12) * ones(1,N);

Motion.H = [];
end

