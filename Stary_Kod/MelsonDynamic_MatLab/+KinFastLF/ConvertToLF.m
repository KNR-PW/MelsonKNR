function [R_traj] = ConvertToLF(Traj)
    N = size(Traj,2);
    R_traj = zeros(15,N);
    M = size(Traj,1);
    
    for TimeIter = 1:N        
        rot_RF = Mat.euler2rot(Traj(16:18,TimeIter));
        rot_LF = Mat.euler2rot(Traj(19:21,TimeIter));
        
        R_traj(:,TimeIter) = [ rot_LF' * (Traj(1:3,TimeIter) - Traj(4:6,TimeIter));
                               rot_LF' * (Traj(7:9,TimeIter) - Traj(4:6,TimeIter));
                               rot_LF' * (Traj(10:12,TimeIter) - Traj(4:6,TimeIter));
                               rot_LF' * (Traj(13:15,TimeIter) - Traj(4:6,TimeIter));
                               Mat.rot2euler((rot_RF' * rot_LF)');
                               Traj(22:M,TimeIter)];
    end  
end

