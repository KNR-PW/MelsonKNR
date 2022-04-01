function [GaitSupPol, GaitEnPtsTraj, GaitPhs, CharPtsCtctOnOff] = GaitStepPlaner(GaitPar, ModPar, GaitPhs, GaitSupPol, GaitEnPtsTraj, CharPtsCtctOnOff)

% 1. Znam liczbê kroków i udzia³ procentowy kolejnyc faz (DS SS) -> okreœl
% wszystkie fazy chodu dla ca³ego czasu
% 2. Zaznacz, które punkty bêd¹ dotykaæ pod³o¿a w danej chwili, a które nie
% 3. Okreœl po³o¿enie i orientacje stóp w chwilach gdy dotykaj¹ pod³o¿a
% 4. okreœl po³o¿enia i orientacjê stóp dla faz 'transfer'
% 5. Okreœl po³o¿enia d³oni (?)


%% Plan phases
%TODO: check num of steps. diff == 1 
NumberOfDSPhases = 1 + GaitPar.NumOfStepsLeftLeg + GaitPar.NumOfStepsRightLeg;
NumberOfSSPhases = GaitPar.NumOfStepsLeftLeg + GaitPar.NumOfStepsRightLeg;
PhaseDivider = NumberOfDSPhases * GaitPar.PARAM_DS + NumberOfSSPhases * GaitPar.PARAM_SS;

if GaitPar.NumOfStepsLeftLeg > GaitPar.NumOfStepsRightLeg
    WhichLegSupportingInSS = 'right'; %and same in last DS
else
    WhichLegSupportingInSS = 'left'; %and same in last DS 
end
WhichPhase = 'DS';
PhaseNumber = 1;

for TimeIter = 1:1:GaitPar.NumberOfTimeInstances
    if strcmp(WhichPhase,'DS')
       GaitPhs.LeftLeg(TimeIter) = 'support';
       GaitPhs.RightLeg(TimeIter) = 'support';
    elseif strcmp(WhichPhase,'SS')
        if strcmp(WhichLegSupportingInSS,'right')
            GaitPhs.LeftLeg(TimeIter) = 'transfer';
            GaitPhs.RightLeg(TimeIter) = 'support'; 
        else
            GaitPhs.LeftLeg(TimeIter) = 'support';
            GaitPhs.RightLeg(TimeIter) = 'transfer'; 
        end
    end

    if TimeIter > GaitPar.NumberOfTimeInstances * ( GaitPar.PARAM_DS * floor((1+PhaseNumber)/2) + GaitPar.PARAM_SS * floor((PhaseNumber)/2)) / PhaseDivider 
        PhaseNumber = PhaseNumber + 1;
        if strcmp(WhichPhase,'DS')
            WhichPhase = 'SS';
        else
            WhichPhase = 'DS';
            if strcmp(WhichLegSupportingInSS,'right')
                WhichLegSupportingInSS = 'left';
            else
                WhichLegSupportingInSS = 'right';
            end
        end
    end

end

%% Plan contact

for TimeIter = 1:1:GaitPar.NumberOfTimeInstances
    if strcmp(GaitPhs.LeftLeg(TimeIter),'support')
        CharPtsCtctOnOff.LeftFootLeftToes(TimeIter) = true;
        CharPtsCtctOnOff.LeftFootRightToes(TimeIter) = true;
        CharPtsCtctOnOff.LeftFootLeftHeel(TimeIter) = true;
        CharPtsCtctOnOff.LeftFootRightHeel(TimeIter) = true;
        CharPtsCtctOnOff.LeftFootCenter(TimeIter) = true;
    else
        CharPtsCtctOnOff.LeftFootLeftToes(TimeIter) = false;
        CharPtsCtctOnOff.LeftFootRightToes(TimeIter) = false;
        CharPtsCtctOnOff.LeftFootLeftHeel(TimeIter) = false;
        CharPtsCtctOnOff.LeftFootRightHeel(TimeIter) = false;
        CharPtsCtctOnOff.LeftFootCenter(TimeIter) = false;        
    end
    if strcmp(GaitPhs.RightLeg(TimeIter),'support')
        CharPtsCtctOnOff.RightFootLeftToes(TimeIter) = true;
        CharPtsCtctOnOff.RightFootRightToes(TimeIter) = true;
        CharPtsCtctOnOff.RightFootLeftHeel(TimeIter) = true;
        CharPtsCtctOnOff.RightFootRightHeel(TimeIter) = true;
        CharPtsCtctOnOff.RightFootCenter(TimeIter) = true;
    else
        CharPtsCtctOnOff.RightFootLeftToes(TimeIter) = false;
        CharPtsCtctOnOff.RightFootRightToes(TimeIter) = false;
        CharPtsCtctOnOff.RightFootLeftHeel(TimeIter) = false;
        CharPtsCtctOnOff.RightFootRightHeel(TimeIter) = false;
        CharPtsCtctOnOff.RightFootCenter(TimeIter) = false;
    end
end

%% Foot position and orientation on ground
%temporary variables, to be transfered to EndPointsTrajectory
r_LeftFootOnGround = zeros(3,GaitPar.NumOfStepsLeftLeg + 1);
r_RightFootOnGround = zeros(3,GaitPar.NumOfStepsRightLeg + 1);
anglesCB_LeftFootOnGround = zeros(3,GaitPar.NumOfStepsLeftLeg + 1); %Cardano Bryant -  rotation x y z, intrinsic
anglesCB_RightFootOnGround = zeros(3,GaitPar.NumOfStepsRightLeg + 1); %Cardano Bryant -  rotation x y z, intrinsic

r_LeftFootOnGround(:,GaitPar.NumOfStepsLeftLeg + 1) = GaitEnPtsTraj.r_LF(:,GaitPar.NumberOfTimeInstances);
r_LeftFootOnGround(:,1) = GaitEnPtsTraj.r_LF(:,1);
r_RightFootOnGround(:,GaitPar.NumOfStepsRightLeg + 1) = GaitEnPtsTraj.r_RF(:,GaitPar.NumberOfTimeInstances);
r_RightFootOnGround(:,1) = GaitEnPtsTraj.r_RF(:,1);
anglesCB_LeftFootOnGround(:,GaitPar.NumOfStepsLeftLeg + 1) = [0,0, GetZFromRotM( GaitEnPtsTraj.rot_LF(:,:,GaitPar.NumberOfTimeInstances) )]';
anglesCB_LeftFootOnGround(:,1) = [0,0, GetZFromRotM( GaitEnPtsTraj.rot_LF(:,:,1) )]';
anglesCB_RightFootOnGround(:,GaitPar.NumOfStepsRightLeg + 1) = [0,0, GetZFromRotM( GaitEnPtsTraj.rot_RF(:,:,GaitPar.NumberOfTimeInstances) )]';
anglesCB_RightFootOnGround(:,1) = [0,0, GetZFromRotM( GaitEnPtsTraj.rot_RF(:,:,1) )]';

if GaitPar.NumOfStepsLeftLeg > GaitPar.NumOfStepsRightLeg % if left leg starts 
    % Left leg starts    
    
    if GaitPar.NumOfStepsLeftLeg >= 3
        for IterPos = 2:1:(GaitPar.NumOfStepsLeftLeg)
            r_LeftFootOnGround(:,IterPos) = GaitEnPtsTraj.r_LF(:,1) + (r_LeftFootOnGround(:,GaitPar.NumOfStepsLeftLeg + 1) - r_LeftFootOnGround(:,1)).*(IterPos - 1.5)/(GaitPar.NumOfStepsLeftLeg-1);
            anglesCB_LeftFootOnGround(:,IterPos) = anglesCB_LeftFootOnGround(:,1) + (anglesCB_LeftFootOnGround(:,GaitPar.NumOfStepsLeftLeg + 1) - anglesCB_LeftFootOnGround(:,1)).*(IterPos - 1.5)/(GaitPar.NumOfStepsLeftLeg-1);
        end
    elseif GaitPar.NumOfStepsLeftLeg >= 2
        for IterPos = 2:1:GaitPar.NumOfStepsLeftLeg
            r_LeftFootOnGround(:,IterPos) = GaitEnPtsTraj.r_LF(:,1) + (r_LeftFootOnGround(:,GaitPar.NumOfStepsLeftLeg + 1) - r_LeftFootOnGround(:,1)).*(IterPos - 1)/GaitPar.NumOfStepsLeftLeg;
            anglesCB_LeftFootOnGround(:,IterPos) = anglesCB_LeftFootOnGround(:,1) + (anglesCB_LeftFootOnGround(:,GaitPar.NumOfStepsLeftLeg + 1) - anglesCB_LeftFootOnGround(:,1)).*(IterPos - 1)/(GaitPar.NumOfStepsLeftLeg);
        end
    end 
    
    if GaitPar.NumOfStepsRightLeg >= 2                         %% if right foot transfers twice then calculate middle positions
        for IterPos = 2:1:GaitPar.NumOfStepsRightLeg
            r_RightFootOnGround(:,IterPos) =  GaitEnPtsTraj.r_RF(:,1) +(r_RightFootOnGround(:,GaitPar.NumOfStepsRightLeg + 1) - r_RightFootOnGround(:,1)).*(IterPos - 1)/GaitPar.NumOfStepsRightLeg;
            anglesCB_RightFootOnGround(:,IterPos) = anglesCB_RightFootOnGround(:,1) + (anglesCB_RightFootOnGround(:,GaitPar.NumOfStepsRightLeg + 1) - anglesCB_RightFootOnGround(:,1)).*(IterPos - 1)/(GaitPar.NumOfStepsRightLeg);
        end
    end
elseif GaitPar.NumOfStepsLeftLeg < GaitPar.NumOfStepsRightLeg       % Right leg starts
    if GaitPar.NumOfStepsLeftLeg >= 2                         %% if left foot transfers twice then calculate middle positions
        for IterPos = 2:1:GaitPar.NumOfStepsLeftLeg
            r_LeftFootOnGround(:,IterPos) = GaitEnPtsTraj.r_LF(:,1) + (r_LeftFootOnGround(:,GaitPar.NumOfStepsLeftLeg + 1) - r_LeftFootOnGround(:,1)).*(IterPos - 1)/GaitPar.NumOfStepsLeftLeg;
            anglesCB_LeftFootOnGround(:,IterPos) = anglesCB_LeftFootOnGround(:,1) + (anglesCB_LeftFootOnGround(:,GaitPar.NumOfStepsLeftLeg + 1) - anglesCB_LeftFootOnGround(:,1)).*(IterPos - 1)/(GaitPar.NumOfStepsLeftLeg);
        end
    end
    
    if GaitPar.NumOfStepsRightLeg >= 3
        for IterPos = 2:1:(GaitPar.NumOfStepsRightLeg)
            r_RightFootOnGround(:,IterPos) = GaitEnPtsTraj.r_RF(:,1) + (r_RightFootOnGround(:,GaitPar.NumOfStepsRightLeg + 1) - r_RightFootOnGround(:,1)).*(IterPos - 1.5)/(GaitPar.NumOfStepsRightLeg-1);
            anglesCB_RightFootOnGround(:,IterPos) = anglesCB_RightFootOnGround(:,1) + (anglesCB_RightFootOnGround(:,GaitPar.NumOfStepsRightLeg + 1) - anglesCB_RightFootOnGround(:,1)).*(IterPos - 1.5)/(GaitPar.NumOfStepsRightLeg - 1);
        end
    elseif GaitPar.NumOfStepsRightLeg >= 2
        for IterPos = 2:1:GaitPar.NumOfStepsRightLeg
            r_RightFootOnGround(:,IterPos) = GaitEnPtsTraj.r_RF(:,1) + (r_RightFootOnGround(:,GaitPar.NumOfStepsRightLeg + 1) - r_RightFootOnGround(:,1)).*(IterPos - 1)/GaitPar.NumOfStepsRightLeg;
            anglesCB_RightFootOnGround(:,IterPos) = anglesCB_RightFootOnGround(:,1) + (anglesCB_RightFootOnGround(:,GaitPar.NumOfStepsRightLeg + 1) - anglesCB_RightFootOnGround(:,1)).*(IterPos - 1)/(GaitPar.NumOfStepsRightLeg);
        end
    end    
else        % equal number of steps -> right leg starts
    if GaitPar.NumOfStepsLeftLeg >= 2                         %% if left foot transfers twice then calculate middle positions
        for IterPos = 2:1:GaitPar.NumOfStepsLeftLeg
            r_LeftFootOnGround(:,IterPos) = GaitEnPtsTraj.r_LF(:,1) + (r_LeftFootOnGround(:,GaitPar.NumOfStepsLeftLeg + 1) - r_LeftFootOnGround(:,1)).*(IterPos - 1)/GaitPar.NumOfStepsLeftLeg;
            anglesCB_LeftFootOnGround(:,IterPos) = anglesCB_LeftFootOnGround(:,1) + (anglesCB_LeftFootOnGround(:,GaitPar.NumOfStepsLeftLeg + 1) - anglesCB_LeftFootOnGround(:,1)).*(IterPos - 1)/(GaitPar.NumOfStepsLeftLeg);
        end
    end
    
    if GaitPar.NumOfStepsRightLeg >= 2                         %% if right foot transfers twice then calculate middle positions
        for IterPos = 2:1:GaitPar.NumOfStepsRightLeg
            r_RightFootOnGround(:,IterPos) =  GaitEnPtsTraj.r_RF(:,1) +(r_RightFootOnGround(:,GaitPar.NumOfStepsRightLeg + 1) - r_RightFootOnGround(:,1)).*(IterPos - 1)/GaitPar.NumOfStepsRightLeg;
            anglesCB_RightFootOnGround(:,IterPos) = anglesCB_RightFootOnGround(:,1) + (anglesCB_RightFootOnGround(:,GaitPar.NumOfStepsRightLeg + 1) - anglesCB_RightFootOnGround(:,1)).*(IterPos - 1)/(GaitPar.NumOfStepsRightLeg);
        end
    end    
end

% Fill Gait End Points Trajectory
PhaseNumberLeftFoot = 1;
PhaseNumberRightFoot = 1;
for TimeIter = 1:1:GaitPar.NumberOfTimeInstances
    if strcmp(GaitPhs.LeftLeg(TimeIter),'support')
        GaitEnPtsTraj.r_LF(:,TimeIter) = r_LeftFootOnGround(:,PhaseNumberLeftFoot);
        GaitEnPtsTraj.rot_LF(:,:,TimeIter) = GetRotMFromAnglesCB( anglesCB_LeftFootOnGround(:,PhaseNumberLeftFoot) );
        if TimeIter < GaitPar.NumberOfTimeInstances
            if strcmp(GaitPhs.LeftLeg(TimeIter + 1),'transfer')
                PhaseNumberLeftFoot = PhaseNumberLeftFoot + 1;
            end
        end
    end
    if strcmp(GaitPhs.RightLeg(TimeIter),'support')
        GaitEnPtsTraj.r_RF(:,TimeIter) = r_RightFootOnGround(:,PhaseNumberRightFoot);
        GaitEnPtsTraj.rot_RF(:,:,TimeIter) = GetRotMFromAnglesCB( anglesCB_RightFootOnGround(:,PhaseNumberRightFoot) );
        if TimeIter < GaitPar.NumberOfTimeInstances
            if strcmp(GaitPhs.RightLeg(TimeIter + 1),'transfer')
                PhaseNumberRightFoot = PhaseNumberRightFoot + 1;
            end
        end
    end    
end

%% Foot position and orientation in transfer phases
LeftLegTransferLength = 0;
RightLegTransferLength = 0;

for TimeIter = 1:1:GaitPar.NumberOfTimeInstances
    if strcmp(GaitPhs.LeftLeg(TimeIter),'transfer')
        LeftLegTransferLength = LeftLegTransferLength + 1;
    elseif strcmp(GaitPhs.LeftLeg(TimeIter),'support')
        if LeftLegTransferLength ~= 0
            if (TimeIter - LeftLegTransferLength - 1) > 0 
                GaitEnPtsTraj.r_LF(:,TimeIter-LeftLegTransferLength-1:TimeIter) = r_GenerateStep(GaitEnPtsTraj.r_LF(:,TimeIter-LeftLegTransferLength-1), GaitEnPtsTraj.r_LF(:,TimeIter), LeftLegTransferLength+2, GaitPar.StepHeight);
                GaitEnPtsTraj.rot_LF(:,:,TimeIter-LeftLegTransferLength-1:TimeIter) = rot_GenerateStep(GaitEnPtsTraj.rot_LF(:,:,TimeIter-LeftLegTransferLength-1), GaitEnPtsTraj.rot_LF(:,:,TimeIter), LeftLegTransferLength+2);
            else
                %TODO: traj gen start (if leg started in transfer mode)
            end
        end
        LeftLegTransferLength = 0;
    end
end

if LeftLegTransferLength ~= 0
   %TODO: traj gen end (if leg ended in transfer mode)
end

for TimeIter = 1:1:GaitPar.NumberOfTimeInstances
    if strcmp(GaitPhs.LeftLeg(TimeIter),'transfer')
        LeftLegTransferLength = LeftLegTransferLength + 1;
    elseif strcmp(GaitPhs.LeftLeg(TimeIter),'support')
        if LeftLegTransferLength ~= 0
            if (TimeIter - LeftLegTransferLength - 1) > 0 
                GaitEnPtsTraj.r_LF(:,TimeIter-LeftLegTransferLength-1:TimeIter) = r_GenerateStep(GaitEnPtsTraj.r_LF(:,TimeIter-LeftLegTransferLength-1), GaitEnPtsTraj.r_LF(:,TimeIter), LeftLegTransferLength+2, GaitPar.StepHeight);
                GaitEnPtsTraj.rot_LF(:,:,TimeIter-LeftLegTransferLength-1:TimeIter) = rot_GenerateStep(GaitEnPtsTraj.rot_LF(:,:,TimeIter-LeftLegTransferLength-1), GaitEnPtsTraj.rot_LF(:,:,TimeIter), LeftLegTransferLength+2);
            else
                %TODO: traj gen start (if leg started in transfer mode)
            end
        end
        LeftLegTransferLength = 0;
    end
    
    if strcmp(GaitPhs.RightLeg(TimeIter),'transfer')
        RightLegTransferLength = RightLegTransferLength + 1;
    elseif strcmp(GaitPhs.RightLeg(TimeIter),'support')
        if RightLegTransferLength ~= 0
            if (TimeIter - RightLegTransferLength - 1) > 0 
                GaitEnPtsTraj.r_RF(:,TimeIter-RightLegTransferLength-1:TimeIter) = r_GenerateStep(GaitEnPtsTraj.r_RF(:,TimeIter-RightLegTransferLength-1), GaitEnPtsTraj.r_RF(:,TimeIter), RightLegTransferLength+2, GaitPar.StepHeight);
                GaitEnPtsTraj.rot_RF(:,:,TimeIter-RightLegTransferLength-1:TimeIter) = rot_GenerateStep(GaitEnPtsTraj.rot_RF(:,:,TimeIter-RightLegTransferLength-1), GaitEnPtsTraj.rot_RF(:,:,TimeIter), RightLegTransferLength+2);
            else
                %TODO: traj gen start (if leg started in transfer mode)
            end
        end
        RightLegTransferLength = 0;
    end
end

if LeftLegTransferLength ~= 0
   %TODO: traj gen end (if leg ended in transfer mode)
end
if RightLegTransferLength ~= 0
   %TODO: traj gen end (if leg ended in transfer mode)
end



% Fill Gait SubPol
for TimeIter = 1:1:GaitPar.NumberOfTimeInstances
    GaitSupPol.LeftFootLeftToes(:,TimeIter) = GaitEnPtsTraj.r_LF(:,TimeIter) + GaitEnPtsTraj.rot_LF(:,:,TimeIter) * ModPar.r_LF_left_toe;
    GaitSupPol.LeftFootRightToes(:,TimeIter) = GaitEnPtsTraj.r_LF(:,TimeIter) + GaitEnPtsTraj.rot_LF(:,:,TimeIter) * ModPar.r_LF_right_toe;
    GaitSupPol.LeftFootLeftHeel(:,TimeIter) = GaitEnPtsTraj.r_LF(:,TimeIter) + GaitEnPtsTraj.rot_LF(:,:,TimeIter) * ModPar.r_LF_left_heel;
    GaitSupPol.LeftFootRightHeel(:,TimeIter) = GaitEnPtsTraj.r_LF(:,TimeIter) + GaitEnPtsTraj.rot_LF(:,:,TimeIter) * ModPar.r_LF_right_heel;
    GaitSupPol.LeftFootCenter(:,TimeIter) = GaitEnPtsTraj.r_LF(:,TimeIter) + GaitEnPtsTraj.rot_LF(:,:,TimeIter) * ModPar.r_LF_center;
    GaitSupPol.RightFootLeftToes(:,TimeIter) = GaitEnPtsTraj.r_RF(:,TimeIter) + GaitEnPtsTraj.rot_RF(:,:,TimeIter) * ModPar.r_RF_left_toe;
    GaitSupPol.RightFootRightToes(:,TimeIter) = GaitEnPtsTraj.r_RF(:,TimeIter) + GaitEnPtsTraj.rot_RF(:,:,TimeIter) * ModPar.r_RF_right_toe;
    GaitSupPol.RightFootLeftHeel(:,TimeIter) = GaitEnPtsTraj.r_RF(:,TimeIter) + GaitEnPtsTraj.rot_RF(:,:,TimeIter) * ModPar.r_RF_left_heel;
    GaitSupPol.RightFootRightHeel(:,TimeIter) = GaitEnPtsTraj.r_RF(:,TimeIter) + GaitEnPtsTraj.rot_RF(:,:,TimeIter) * ModPar.r_RF_right_heel;
    GaitSupPol.RightFootCenter(:,TimeIter) = GaitEnPtsTraj.r_RF(:,TimeIter) + GaitEnPtsTraj.rot_RF(:,:,TimeIter) * ModPar.r_RF_center;

end


   

end





function [r_out] = r_GenerateStep(r_start, r_end, SamplesNumber, stepHeight)

    tstart = 0;
    tfinal = SamplesNumber;
    tmid = (tstart + tfinal) /2;
    
    [a5,a4,a3,a2,a1,a0] =  createTraj5(r_start(1),r_end(1),0,0,0,0,tstart,tfinal);
    pval_x  = [a5,a4,a3,a2,a1,a0];
    [a5,a4,a3,a2,a1,a0] =  createTraj5(r_start(2),r_end(2),0,0,0,0,tstart,tfinal);
    pval_y  = [a5,a4,a3,a2,a1,a0];
    
    
    [a3,a2,a1,a0] =  createTraj3(r_start(3),stepHeight,0,0,tstart,tmid);
    pval_z_first = [a3,a2,a1,a0];
    [a3,a2,a1,a0] =  createTraj3(stepHeight,r_end(3),0,0,tmid,tfinal);
    pval_z_second = [a3,a2,a1,a0];

    tx = linspace(tstart,tfinal,SamplesNumber);
    ty = linspace(tstart,tfinal,SamplesNumber);
    tz_first = linspace(tstart,tmid,fix(SamplesNumber/2));
    tz_second = linspace(tmid-tmid,tfinal-tmid,SamplesNumber-fix(SamplesNumber/2));
    r_x = polyval(pval_x,tx);
    r_y = polyval(pval_y,ty);
    r_z_first = polyval(pval_z_first,tz_first);
    r_z_second = polyval(pval_z_second,tz_second);

    r_out = [r_x; r_y; r_z_first, r_z_second ];
end

function [rot_out] = rot_GenerateStep(rot_start, rot_end, SamplesNumber)

    AnglesCB = zeros(3, SamplesNumber);
    AnglesCB(:,1) = [0, 0, GetZFromRotM(rot_start)]';
    AnglesCB(:,SamplesNumber) = [0, 0, GetZFromRotM(rot_end)]';
    
    tstart = 0;
    tfinal = SamplesNumber;
    
    [a5,a4,a3,a2,a1,a0] =  createTraj5(AnglesCB(1,1),AnglesCB(1,SamplesNumber),0,0,0,0,tstart,tfinal);
    pval_CBx  = [a5,a4,a3,a2,a1,a0];
    [a5,a4,a3,a2,a1,a0] =  createTraj5(AnglesCB(2,1),AnglesCB(2,SamplesNumber),0,0,0,0,tstart,tfinal);
    pval_CBy  = [a5,a4,a3,a2,a1,a0];
    [a5,a4,a3,a2,a1,a0] =  createTraj5(AnglesCB(3,1),AnglesCB(3,SamplesNumber),0,0,0,0,tstart,tfinal);
    pval_CBz  = [a5,a4,a3,a2,a1,a0];
    
    


    t = linspace(tstart,tfinal,SamplesNumber);
    
    AnglesCB(1,:) = polyval(pval_CBx,t);
    AnglesCB(2,:) = polyval(pval_CBy,t);
    AnglesCB(3,:) = polyval(pval_CBz,t);

    rot_out = zeros(3,3,SamplesNumber);
    for TimeIter = 1:1:SamplesNumber
        rot_out(:,:,TimeIter) = GetRotMFromAnglesCB(AnglesCB(:,TimeIter));
    end
    
end

function [a5,a4,a3,a2,a1,a0] = createTraj5(theta0,thetaf,thetad0,thetadf,thetadd0,thetaddf,tstart,tfinal)
	% inputs : initial position, velocity, and acceleration + final position, velocity, and acceleration, + initial and final times
	% output : a vector specifying the polynomial and can be used with poly functions such as : polyder, polyval, etc.
	% create a 5th order trajectory
	% example:
	% createTraj5(10,30,0,0,0,0,0,1)
	%
	%
	% By: Reza Ahmadzadeh - Matlab/Octave - 2013
	T = tfinal - tstart;
	a0 = theta0;
	a1 = thetad0;
	a2 = 0.5 * thetadd0;
	a3 =(1/(2*T^3)) * (20 * (thetaf - theta0) - (8 * thetadf+ 12*thetad0 )*T - (3 * thetaddf - thetadd0 )*T^2 );
	a4 =(1/(2*T^4)) * (30 * (theta0 - thetaf) + (14 * thetadf+ 16*thetad0 )*T + (3 * thetaddf - 2*thetadd0 )*T^2 );
	a5 =(1/(2*T^5)) * (12 * (thetaf - theta0) - 6*(thetadf+ thetad0 )*T - (thetaddf - thetadd0 )*T^2 );		

end	

function [a3,a2,a1,a0] = createTraj3(theta0,thetaf,thetad0,thetadf,tstart,tfinal)
	% inputs : initial position, velocity + final position, velocity + initial and final times
	% output : a vector specifying the polynomial and can be used with poly functions such as : polyder, polyval, etc.
	% create a 3rd order trajectory
	% example:
	% createTraj3(10,30,0,0,0,1)
	%
	%
	% By: Reza Ahmadzadeh - Matlab/Octave - 2013
	T = tfinal - tstart;
	a0 = theta0;
	a1 = thetad0;
	a2 = (-3 * (theta0 - thetaf) - (2 * thetad0+thetadf )*T)/ T ^ 2;
	a3 = (2 * (theta0 - thetaf) + (thetad0+thetadf )*T)/ T ^ 3;
	
end	

function [alpha] = GetZFromRotM( rotM )
alpha = atan2(rotM(2,1),rotM(2,2));
end

function [rotM] = GetRotMFromAnglesCB( angles )
rotM = [cos(angles(3)), -sin(angles(3)), 0; sin(angles(3)), cos(angles(3)), 0; 0, 0, 1];
end