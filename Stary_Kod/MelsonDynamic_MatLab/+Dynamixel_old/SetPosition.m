function [ ] = SetPosition( Position)
%% Send data to multiple Dynamixels with SyncWrite
global port_num;
global PROTOCOL_VERSION

ADDR_RX_GOAL_POSITION = 30;
LEN_RX_GOAL_POSITION = 2;

group_num = groupSyncWrite(port_num, PROTOCOL_VERSION, ADDR_RX_GOAL_POSITION, LEN_RX_GOAL_POSITION);

for i=1: length(Position)
    groupSyncWriteAddParam(group_num, i, Position(i), LEN_RX_GOAL_POSITION);
end

% Sending
groupSyncWriteTxPacket(group_num);

% Clearing queue
groupSyncWriteClearParam(group_num);

end
