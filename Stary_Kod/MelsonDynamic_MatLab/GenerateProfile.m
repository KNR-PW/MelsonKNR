function [profile vel acc] = GenerateProfile(Time,dt,c1,c2,ProfileType);
    N = round(Time/dt);
    
    N1 = round(N * c1);
    N2 = round(N * c2);
    
    V = ones(1,N);
    
    switch ProfileType
        case 'trapezoidal'
            V1 = (1 / N1):(1 / N1):1;
            V2 = ones(1,N2) - [(1 / N2):(1 / N2):1]; 
        
            V(1:N1) = V1;
            V((N-N2+1):N) = V2;
            
           
        case 'sinusoidal'
            for i=1:N
                t = i * Time /N;
                if t<c1*Time
                    x = pi *t / (c1*Time);
                    V(i) = (x - sin(x) * cos(x))/pi;
                end
                
                if t>(Time-c2*Time)
                    x = - pi /(c2*Time) * (t - Time *(1 - c2));
                    V(i) = (x - sin(x) * cos(x))/pi + 1;
                end
            end
            
        otherwise 
    end
    
    
    
    profile = zeros(1,N);
    
    profile(1) = V(1);
    for Iter=2:N
        profile(Iter) = profile(Iter-1) + V(Iter);
    end
    profile = profile / profile(N);
    
    acc = zeros(1,N);
    vel = V;
    
%     for i=2:N
%         vel(i) = (profile(i) - profile(i-1))/dt;
%     end
    
    for i=2:N
        acc(i) = (vel(i) - vel(i-1))/dt;
    end
    
    
end