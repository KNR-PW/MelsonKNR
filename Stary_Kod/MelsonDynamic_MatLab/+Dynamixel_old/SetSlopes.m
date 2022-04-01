function [ ] = SetSlopes( Slope)
global port_num;
global PROTOCOL_VERSION;

NumberOfDynamixels = 19;
DynamixelAX = [0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1];
DynamixelRX = [0 1 1 1 1 1 0 1 1 1 1 1 0 0 0 0 0 0 0];
DynamixelMX = [1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0];


ADDR_RX_CW_COMPLIANCE_SLOP = 28;
ADDR_RX_CCW_COMPLIANCE_SLOP = 29;
LEN_RX_CW_COMPLIANCE_SLOP = 1;
LEN_RX_CCW_COMPLIANCE_SLOP = 1;

group_num = groupSyncWrite(port_num, PROTOCOL_VERSION, ADDR_RX_CW_COMPLIANCE_SLOP, LEN_RX_CW_COMPLIANCE_SLOP);

for i=1:NumberOfDynamixels
    if DynamixelRX(i) || DynamixelAX(i)
        groupSyncWriteAddParam(group_num, i, Slope(i), LEN_RX_CW_COMPLIANCE_SLOP);
    end
end

groupSyncWriteTxPacket(group_num);
groupSyncWriteClearParam(group_num);

group_num = groupSyncWrite(port_num, PROTOCOL_VERSION, ADDR_RX_CCW_COMPLIANCE_SLOP, LEN_RX_CCW_COMPLIANCE_SLOP);

for i=1:NumberOfDynamixels
    if DynamixelRX(i) || DynamixelAX(i)
        groupSyncWriteAddParam(group_num, i, Slope(i), LEN_RX_CCW_COMPLIANCE_SLOP);
    end
end

groupSyncWriteTxPacket(group_num);
groupSyncWriteClearParam(group_num);

end
