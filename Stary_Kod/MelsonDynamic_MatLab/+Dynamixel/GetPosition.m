function [ Position ] = GetPosition()
%GETPOSITION Summary of this function goes here
%   Detailed explanation goes here
ADDR_MX_PRESENT_POSITION=36;

global port_num_485;
global port_num_TTL;
global PROTOCOL_VERSION;

Position = zeros(1,19);
tic
for i=1 : 19
    if (i<=12) 
        Position(i)= read2ByteTxRx(port_num_485, PROTOCOL_VERSION, i, ADDR_MX_PRESENT_POSITION);
    else
        Position(i)= read2ByteTxRx(port_num_TTL, PROTOCOL_VERSION, i, ADDR_MX_PRESENT_POSITION);
    end
toc

end

