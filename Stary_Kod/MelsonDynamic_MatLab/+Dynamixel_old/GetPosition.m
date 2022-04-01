function [ Position ] = GetPosition()
%GETPOSITION Summary of this function goes here
%   Detailed explanation goes here
ADDR_MX_PRESENT_POSITION=36;

global port_num;
global PROTOCOL_VERSION;

Position = zeros(1,19);
tic
for i=1 : 19
     Position(i)= read2ByteTxRx(port_num, PROTOCOL_VERSION, i, ADDR_MX_PRESENT_POSITION);
end
toc

end

