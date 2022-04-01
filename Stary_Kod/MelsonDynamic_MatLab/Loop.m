clear;
%% 0-1. Load parameters.
disp('Gait Parameters Check ...');tic;
RobotParameters.LoadParameters;
toc

%% 2. Plan steps and feet trajectory
disp('Gait Step Planer ...');tic;
[GaitSupportPolygon, GaitEndPointsTrajectory, GaitPhases, CharPointsContactOnOff] = GaitStepPlaner(GaitParameters, RobotModelParameters, GaitPhases, GaitSupportPolygon, GaitEndPointsTrajectory, CharPointsContactOnOff);
toc

%% 3. Generate reference ZMP trajectory
disp('Gait Generate ZMP Ref ...');tic;
[GaitZMPReferenceTrajectory] = GaitGenerateZMPRef(GaitSupportPolygon, CharPointsContactOnOff, GaitPhases);

for TimeIter = 1:1:GaitParameters.NumberOfTimeInstances
    GaitZMPReferenceTrajectory(2,TimeIter) = GaitZMPReferenceTrajectory(2,TimeIter)*0.8;
end
toc

%% 4. Generate CoM trajectory
disp('Gait Generate Com Trajectory ...');tic;
[GaitCoMTrajectory(1,:), GaitZMPPlannedTrajectory(1,:)] = GaitGenerateComTrajectory(GaitZMPReferenceTrajectory(1,:), GaitParameters, RobotModelParameters, [GaitZMPReferenceTrajectory(1,1) 0 0]');
[GaitCoMTrajectory(2,:), GaitZMPPlannedTrajectory(2,:)] = GaitGenerateComTrajectory(GaitZMPReferenceTrajectory(2,:), GaitParameters, RobotModelParameters, [GaitZMPReferenceTrajectory(2,1) 0 0]');
GaitCoMTrajectory(3,:) = ones(1,GaitParameters.NumberOfTimeInstances) .* GaitParameters.StepPelvisHeight;
toc

%% 5. Generate hands trajectory
disp('Generate Hand Trajectory ...'); tic;
[GaitEndPointsTrajectory] = GenerateHandsTrajectory(GaitEndPointsTrajectory, GaitCoMTrajectory, GaitParameters, RobotModelParameters);
toc

%% 6. Packing data to structure
disp('Packing data to structure...'); tic;

LoadSolverOptions;
[Motion] = GenerateMotionStruct(GaitEndPointsTrajectory, GaitCoMTrajectory, GaitPhases, RobotModelParameters);




%% 7. Loop

gamma_grav_vector = 0:0.02:2;
gamma_joint_vector = 0:0.02:1.1;

results = struct;
results.JointPos = zeros(19,Motion.N);
results.JointVel = zeros(19,Motion.N);
results.JointTorque = zeros(19,Motion.N);
results.gamma_grav = 0;
results.gamma_joint = 0;
results.score = 0;

results(length(gamma_grav_vector),length(gamma_joint_vector)) = results;


for IterGrav = 1:length(gamma_grav_vector)
    for IterJoint = 1:length(gamma_joint_vector)
        tic
        
        
        SolverOptions.gamma_grav = gamma_grav_vector(IterGrav);
        SolverOptions.gamma_joint = gamma_joint_vector(IterJoint);
        ans = ['Calculating results for gamma_grav=',num2str(SolverOptions.gamma_grav),' and gamma_joint=',num2str(SolverOptions.gamma_joint)];
        disp(ans)
        
        %% New parameters
        [Motion] = MotionStructSolverParameters(Motion,SolverOptions);
        %% IK
        [Motion]  = GenerateJointAngles2(Motion, RobotModelParameters, SolverOptions);
        
        %% result
        results(IterGrav,IterJoint).gamma_grav = gamma_grav_vector(IterGrav);
        results(IterGrav,IterJoint).gamma_joint = gamma_joint_vector(IterJoint);
        
        for Iter=1:Motion.N-1
            Motion.JointVel(:,Iter) = Motion.JointPos(:,Iter+1) - Motion.JointPos(:,Iter);
        end
        Motion.JointVel = Motion.JointVel/0.01;
        
        
        results(IterGrav,IterJoint).JointPos = Motion.JointPos;
        results(IterGrav,IterJoint).JointVel = Motion.JointVel;
        results(IterGrav,IterJoint).JointTorque = Motion.JointTorque;
        results(IterGrav,IterJoint).score = 0;
        
        score = 0;
        R = SolverOptions.R;
        %% Calculating Score
        for Iter=1:Motion.N
            JointTorque = Motion.JointTorque(:,Iter);
            score = score + JointTorque' * R * JointTorque;
        end
        results(IterGrav,IterJoint).score = score;
        
        ans = ['Score=',num2str(score)];
        disp(ans)
        
        toc
    end
end

X_Planned = Motion.X_Planned;

save('wyniki.mat','-v7.3');
