function [R_traj] = ConvertToRF(GaitEndPointsTrajectory,GaitCoMTrajectory, pitch_W)
    N = size(GaitEndPointsTrajectory.r_RF,2);
    R_traj = zeros(16,N);

    for TimeIter = 1:N        
        R_traj(:,TimeIter) = [ GaitEndPointsTrajectory.rot_RF(:,:,TimeIter)' * (GaitEndPointsTrajectory.r_LF(:,TimeIter) - GaitEndPointsTrajectory.r_RF(:,TimeIter));
                              GaitEndPointsTrajectory.rot_RF(:,:,TimeIter)' * (GaitEndPointsTrajectory.r_RH(:,TimeIter) - GaitEndPointsTrajectory.r_RF(:,TimeIter));
                              GaitEndPointsTrajectory.rot_RF(:,:,TimeIter)' * (GaitEndPointsTrajectory.r_LH(:,TimeIter) - GaitEndPointsTrajectory.r_RF(:,TimeIter));
                              GaitEndPointsTrajectory.rot_RF(:,:,TimeIter)' * (GaitCoMTrajectory(:,TimeIter) - GaitEndPointsTrajectory.r_RF(:,TimeIter));
                              rot2euler(GaitEndPointsTrajectory.rot_RF(:,:,TimeIter)' * GaitEndPointsTrajectory.rot_LF(:,:,TimeIter));
                              pitch_W];
    end  
end

