function [Traj] = GenerateLinTrajectory(r_start, r_end, Time, dt, t1, t2, ProfileType)
%
    if nargin<7
        profile = 'const'
    end
    
    N = round(Time / dt);
    
    % obliczenie r0 i rk (wsp. kartezjanskie, orientacja oœ-k¹t
    % r_start = [   r_RF;
    %               r_LF;
    %               r_RH;
    %               r_LH;
    %               r_Com;
    %               e_RF;
    %               e_LF;
    %               r_aug;
    
    
    
        rot_start_RF = Mat.euler2rot(r_start(16:18)); %orientacje poczatkowe
        rot_start_LF = Mat.euler2rot(r_start(19:21));
        
        rot_end_RF = Mat.euler2rot(r_end(16:18)); %orientacje koncowe
        rot_end_LF = Mat.euler2rot(r_end(19:21));
        
        rot_trans_RF = rot_start_RF' * rot_end_RF; %orientacje wzgledne
        rot_trans_LF = rot_start_LF' * rot_end_LF;
    
        
    r0 = r_start;
    r0(16:18) = zeros(3,1);
    r0(19:21) = zeros(3,1);
    
    rk = r_end;
    rk(16:18) = rot2axa(rot_trans_RF);
    rk(19:21) = rot2axa(rot_trans_LF);
    
    
    d = rk - r0;
    
    profile = GenerateProfile(Time,dt,t1,t2,ProfileType);
    Traj = r0 * ones(1,N) + d * profile;
    
    for Iter=1:N
        Traj(16:18,Iter) = Mat.rot2euler( rot_start_RF * axa2rot(Traj(16:18,Iter)));
        Traj(19:21,Iter) = Mat.rot2euler( rot_start_LF * axa2rot(Traj(19:21,Iter)));
    end
    
    
    
end

function w = rot2axa(rot)
    fi = acos( (  trace(rot) -1) / 2 );
    
    w = [rot(3,2) - rot(2,3);
         rot(1,3) - rot(3,1);
         rot(2,1) - rot(1,2)] / (2*sin(fi));
     
     w = w*fi;
     
     if fi==0
         w = zeros(3,1);
     end
end

function rot = axa2rot(w)
   fi = norm(w);
   w = w/fi;
   
   c = cos(fi);
   s = sin(fi);
   
   v = 1 - cos(fi);
   
   x = w(1);
   y = w(2);
   z = w(3);
   
   rot = w * w' * v + eye(3)*c + [0 -z y; z 0 -x; -y x 0]*s; 
   if fi==0
       rot = eye(3);
   end
end

