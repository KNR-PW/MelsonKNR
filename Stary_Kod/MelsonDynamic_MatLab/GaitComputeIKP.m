function [GaitJointAngles] = GaitComputeIKP(GaitCoMTrajectory, GaitEndPointsTrajectory, PlanarRobotModelParameters)


tic
r_left_hip_ankle_global = GaitEndPointsTrajectory.LeftFootAnkle - GaitCoMTrajectory;
[IKPJointAngles] = IKPSolutionFor2DoF(r_left_hip_ankle_global, PlanarRobotModelParameters.r_LT_LS_lt(2), PlanarRobotModelParameters.r_LS_LF_ls(2));
GaitJointAngles.LeftHip = IKPJointAngles(1,:);
GaitJointAngles.LeftKnee = IKPJointAngles(2,:);

r_right_hip_ankle_global = GaitEndPointsTrajectory.RightFootAnkle - GaitCoMTrajectory;
[IKPJointAngles] = IKPSolutionFor2DoF(r_right_hip_ankle_global, PlanarRobotModelParameters.r_RT_RS_rt(2), PlanarRobotModelParameters.r_RS_RF_rs(2));
GaitJointAngles.RightHip = IKPJointAngles(1,:);
GaitJointAngles.RightKnee = IKPJointAngles(2,:);

GaitJointAngles.LeftAnkle = - (GaitJointAngles.LeftHip + GaitJointAngles.LeftKnee);
GaitJointAngles.RightAnkle = - (GaitJointAngles.RightHip + GaitJointAngles.RightKnee);
toc
end