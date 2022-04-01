function [ ] = SendVector( vector, addr, data_length )
%% Send data to multiple Dynamixels with SyncWrite
global port_num;
global PROTOCOL_VERSION
group_num = groupSyncWrite(port_num, PROTOCOL_VERSION, addr, data_length);

for i=1: length(vector)
    groupSyncWriteAddParam(group_num, i, vector(i), data_length);
end

% Sending
groupSyncWriteTxPacket(group_num);

% Clearing queue
groupSyncWriteClearParam(group_num);

end
