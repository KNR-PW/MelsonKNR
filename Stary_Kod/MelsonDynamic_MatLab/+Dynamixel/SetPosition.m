function [ ] = SetPosition( Position)
%% Send data to multiple Dynamixels with SyncWrite
global port_num_485;
global port_num_TTL;
global PROTOCOL_VERSION

ADDR_RX_GOAL_POSITION = 30;
LEN_RX_GOAL_POSITION = 2;

Dynamixel.SendVector( Position, ADDR_RX_GOAL_POSITION, LEN_RX_GOAL_POSITION )

end
