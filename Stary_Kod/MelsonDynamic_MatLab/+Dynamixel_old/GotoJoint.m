function [  ] = GotoJoint( Joint, Time )
%GOTOJOINT Summary of this function goes here
%   Detailed explanation goes here
ADDR_MX_MOVING_SPEED_LIMIT=32;
LEN_MX_MOVING_SPEED_LIMIT = 2;

dt = 0.005;

if nargin<2
    Time = 3;
end

    CurrentPos = Dynamixel.GetPosition';
    CurrentPos(13:19) = 512*ones(7,1);
    Speed = [1023 * ones(12,1);
             100 * ones(7,1)];
    
    Time = 0:dt:Time;

    Q = zeros(12, length(Time));
    
    for i=1:12
        Q(i,:) = linspace(double(CurrentPos(i)), double(Joint(i)), length(Time))';        
    end
    
    Q = uint16(Q);
    
    
    Dynamixel.Block
    Dynamixel.SendVector(Speed, ADDR_MX_MOVING_SPEED_LIMIT, LEN_MX_MOVING_SPEED_LIMIT)
    Q_start = [CurrentPos(1:12);               Joint(13:19)];
    Dynamixel.SetPosition(Q_start);
    
    
    for i=1:length(Time)
        tic
        Dynamixel.SetPosition(Q(:,i));
        
        while toc<dt
        end
    end 
    
    
    Speed = 1023*ones(19,1);
    Dynamixel.SendVector(Speed, ADDR_MX_MOVING_SPEED_LIMIT, LEN_MX_MOVING_SPEED_LIMIT)

end

