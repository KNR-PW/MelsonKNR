AX_slope = 32;

RX_ContactSlope = 12;
RX_NonContactSlope = 16;


Robot_JointSlopes = zeros(19,GaitParameters.NumberOfTimeInstances);

for TimeIter = 1:1:GaitParameters.NumberOfTimeInstances
    Slopes = zeros(19,1);
    
    if CharPointsContactOnOff.RightFootCenter(TimeIter)
        Slopes(1:6) = ones(6,1) * RX_ContactSlope;
    else
        Slopes(1:6) = ones(6,1) * RX_NonContactSlope;
    end
    
    if CharPointsContactOnOff.LeftFootCenter(TimeIter)
        Slopes(7:12) = ones(6,1) * RX_ContactSlope;
    else
        Slopes(7:12) = ones(6,1) * RX_NonContactSlope;
    end
    
    Slopes(13:19) = AX_slope;
    Slopes(19) = 48;
    Slopes(2) = RX_ContactSlope;
    Slopes(8) = RX_ContactSlope;
    Robot_JointSlopes(:,TimeIter) = Slopes;    
end

clear AX_slope RX_ContactSlope RX_NonContactSlope;
clear Slopes;
