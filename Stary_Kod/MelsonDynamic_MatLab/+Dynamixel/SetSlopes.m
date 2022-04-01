function [ ] = SetSlopes( Slope)
global port_num_485;
global port_num_TTL;
global PROTOCOL_VERSION;

NumberOfDynamixels = 19;
DynamixelAX = [0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1];
DynamixelRX = [0 1 1 1 1 1 0 1 1 1 1 1 0 0 0 0 0 0 0];
DynamixelMX = [1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0];


ADDR_RX_CW_COMPLIANCE_SLOP = 28;
ADDR_RX_CCW_COMPLIANCE_SLOP = 29;
LEN_RX_CW_COMPLIANCE_SLOP = 1;
LEN_RX_CCW_COMPLIANCE_SLOP = 1;

Slope(1) = 32;
Slope(7) = 32;


Dynamixel.SendVector( Slope, ADDR_RX_CW_COMPLIANCE_SLOP, LEN_RX_CW_COMPLIANCE_SLOP );
Dynamixel.SendVector( Slope, ADDR_RX_CCW_COMPLIANCE_SLOP, LEN_RX_CCW_COMPLIANCE_SLOP );

end
