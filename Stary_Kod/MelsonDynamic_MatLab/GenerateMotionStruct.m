function [Motion] = GenerateMotionStruct(GaitEndPointsTrajectory, GaitCoMTrajectory, GaitPhases, RobotModelParameters)
%% przyspieszenie ziemskie
grav = [0 0 -9.81]';
dt = 0.01;

%% Zapis trajektorii w postaci macierzy wektorów
N = size(GaitCoMTrajectory,2);
Motion.N = N;
Motion.X_Planned = zeros(21,N);

for TimeIter = 1:N        
    Motion.X_Planned(:,TimeIter) = [    GaitEndPointsTrajectory.r_RF(:,TimeIter);
                                        GaitEndPointsTrajectory.r_LF(:,TimeIter);
                                        GaitEndPointsTrajectory.r_RH(:,TimeIter);
                                        GaitEndPointsTrajectory.r_LH(:,TimeIter);
                                        GaitCoMTrajectory(:,TimeIter);
                                        Mat.rot2euler(GaitEndPointsTrajectory.rot_RF(:,:,TimeIter));
                                        Mat.rot2euler(GaitEndPointsTrajectory.rot_LF(:,:,TimeIter))];
end

Motion.X_PlannedInRF = zeros(15,N);
Motion.X_PlannedInLF = zeros(15,N);

for TimeIter = 1:N        
    Motion.X_PlannedInRF(:,TimeIter) = KinFastRF.ConvertToRF(Motion.X_Planned(:,TimeIter));
    Motion.X_PlannedInLF(:,TimeIter) = KinFastLF.ConvertToLF(Motion.X_Planned(:,TimeIter));
end


%% Zapis informacji o podparciu
for TimeIter = 1:N
    if GaitPhases.LeftLeg(TimeIter) == "support"
        if GaitPhases.RightLeg(TimeIter) == "support"
            Motion.SupportLeg(TimeIter) = "Both";
        else
            Motion.SupportLeg(TimeIter) = "Left";
        end
    else
        Motion.SupportLeg(TimeIter) = "Right";
    end
end

%% Suma si³y grawitacji dzia³aj¹cej na CoM
Motion.CoMForce = grav * RobotModelParameters.TotalMass/1000 * ones(1,N);

%% Wyznaczenie si³y i momentu reakcji w lewej stopie
Motion.LeftFootReactF = zeros(3,N);
Motion.LeftFootReactT = zeros(3,N);

%% Zapis macierzy wektorów si³ zewnêtrznych
Motion.ExtForcesInRF = zeros(15,N);
Motion.ExtForcesInLF = zeros(15,N);

for TimeIter = 1:N
    rot_RF = GaitEndPointsTrajectory.rot_RF(:,:,TimeIter);
    Motion.ExtForcesInRF(10:12,TimeIter) = rot_RF' * Motion.CoMForce(:,TimeIter); %CoM
    
    rot_LF = GaitEndPointsTrajectory.rot_LF(:,:,TimeIter);
    Motion.ExtForcesInLF(10:12,TimeIter) = rot_LF' * Motion.CoMForce(:,TimeIter); %CoM
end



%% Inne
Motion.JointPos = zeros(19,N);
Motion.JointVel = zeros(19,N);
Motion.JointTorque = zeros(19,N);


end

