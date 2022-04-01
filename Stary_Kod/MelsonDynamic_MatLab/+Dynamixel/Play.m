function [] = Play( Q, Slopes, Time )
%PLAY Summary of this function goes here
%   Detailed explanation goes here
if (nargin<3)
    Time = 3
end

global port_num_485;
global port_num_TTL;
global PROTOCOL_VERSION;

prev_Slopes = zeros(19,1);

Dynamixel.SetParameters
Dynamixel.GotoJoint(Q(:,2),Time);
dt = 0.01;

for TimeIter=2: ( length(Q) -1 )
    tic;
    Dynamixel.SetPosition( Q(:,TimeIter) );
    Dynamixel.SetSlopes( Slopes(:,TimeIter));
 toc
    while(toc<dt)
    end
end
end

