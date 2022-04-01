function [  ] = GotoJoint( Joint, Time )
%GOTOJOINT Summary of this function goes here
%   Detailed explanation goes here
ADDR_MX_MOVING_SPEED_LIMIT=32;
LEN_MX_MOVING_SPEED_LIMIT = 2;


if nargin<2
    Time = 2;
end



    error = int16(Joint) - int16(Dynamixel.GetPosition);
    max_speed = zeros(19,1);
    
    for i=1:19
        max_speed(i)= uint16( 0.4399*abs(error(i))/Time );
    end
    
    Dynamixel.Block
    Dynamixel.SendVector(max_speed, ADDR_MX_MOVING_SPEED_LIMIT, LEN_MX_MOVING_SPEED_LIMIT)
    Dynamixel.SetPosition(Joint);
    pause(Time+1);
    max_speed=ones(1,19)*1023;
    Dynamixel.SendVector(max_speed, ADDR_MX_MOVING_SPEED_LIMIT, LEN_MX_MOVING_SPEED_LIMIT)
end

