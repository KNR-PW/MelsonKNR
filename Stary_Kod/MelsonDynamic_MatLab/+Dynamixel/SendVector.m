function [ ] = SendVector( vector, addr, data_length )
%% Send data to multiple Dynamixels with SyncWrite
global port_num_485;
global port_num_TTL;
global PROTOCOL_VERSION
group_num_485 = groupSyncWrite(port_num_485, PROTOCOL_VERSION, addr, data_length);

for i=1: length(vector)
    if (i<=12)
        groupSyncWriteAddParam(group_num_485, i, vector(i), data_length);
    end
end

% Sending
groupSyncWriteTxPacket(group_num_485);

% Clearing queue
groupSyncWriteClearParam(group_num_485);


group_num_TTL = groupSyncWrite(port_num_TTL, PROTOCOL_VERSION, addr, data_length);

for i=1: length(vector)
    if (i>12)
        groupSyncWriteAddParam(group_num_TTL, i, vector(i), data_length);
    end
end

% Sending
groupSyncWriteTxPacket(group_num_TTL);

% Clearing queue
groupSyncWriteClearParam(group_num_TTL);
end
