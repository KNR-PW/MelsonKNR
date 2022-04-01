% Generate reference ZMP trajectory 
% 1. Search for SS phases -> mean value of activated end points (no center)
% 2. Search for DS phases
%   - if DS is not last or first -> half time ZMP is value of prev phase
%   and half time ZMP is value of next phase
%   - if ds is last or first phase -> mean value
 

function [GaitZMPRefTraj] = GaitGenerateZMPRef(GaitSupPol, ChrPtsCtctOnOff, GaitPhases)

NumberOfSamples = size(GaitSupPol.LeftFootLeftToes,2);
GaitZMPRefTraj = zeros(2,NumberOfSamples);

%% Search for single support phases
for TimeIter = 1:1:NumberOfSamples
   if strcmp(GaitPhases.LeftLeg(TimeIter), 'support') && strcmp(GaitPhases.RightLeg(TimeIter), 'transfer')
       HowManyPtsInContact = 0;
       if ChrPtsCtctOnOff.LeftFootLeftToes(TimeIter) == true
            GaitZMPRefTraj(:,TimeIter) = GaitZMPRefTraj(:,TimeIter) + GaitSupPol.LeftFootLeftToes(1:2,TimeIter);
            HowManyPtsInContact = HowManyPtsInContact + 1;
       end
       if ChrPtsCtctOnOff.LeftFootRightToes(TimeIter) == 1
            GaitZMPRefTraj(:,TimeIter) = GaitZMPRefTraj(:,TimeIter) + GaitSupPol.LeftFootRightToes(1:2,TimeIter);
            HowManyPtsInContact = HowManyPtsInContact + 1;
       end
       if ChrPtsCtctOnOff.LeftFootLeftHeel(TimeIter) == 1
            GaitZMPRefTraj(:,TimeIter) = GaitZMPRefTraj(:,TimeIter) + GaitSupPol.LeftFootLeftHeel(1:2,TimeIter);
            HowManyPtsInContact = HowManyPtsInContact + 1;
       end
       if ChrPtsCtctOnOff.LeftFootRightHeel(TimeIter) == 1
            GaitZMPRefTraj(:,TimeIter) = GaitZMPRefTraj(:,TimeIter) + GaitSupPol.LeftFootRightHeel(1:2,TimeIter);
            HowManyPtsInContact = HowManyPtsInContact + 1;
       end
       if HowManyPtsInContact ~= 0
            GaitZMPRefTraj(:,TimeIter) = GaitZMPRefTraj(:,TimeIter) ./ HowManyPtsInContact;
       else
           disp('Tried do divide by 0 in GaitGenerateZMPRef: tag1');
           disp(TimeIter);
       end
       
   elseif strcmp(GaitPhases.LeftLeg(TimeIter), 'transfer') && strcmp(GaitPhases.RightLeg(TimeIter), 'support')
       HowManyPtsInContact = 0;
       if ChrPtsCtctOnOff.RightFootLeftToes(TimeIter) == 1
            GaitZMPRefTraj(:,TimeIter) = GaitZMPRefTraj(:,TimeIter) + GaitSupPol.RightFootLeftToes(1:2,TimeIter);
            HowManyPtsInContact = HowManyPtsInContact + 1;
       end
       if ChrPtsCtctOnOff.RightFootRightToes(TimeIter) == 1
            GaitZMPRefTraj(:,TimeIter) = GaitZMPRefTraj(:,TimeIter) + GaitSupPol.RightFootRightToes(1:2,TimeIter);
            HowManyPtsInContact = HowManyPtsInContact + 1;
       end
       if ChrPtsCtctOnOff.RightFootLeftHeel(TimeIter) == 1
            GaitZMPRefTraj(:,TimeIter) = GaitZMPRefTraj(:,TimeIter) + GaitSupPol.RightFootLeftHeel(1:2,TimeIter);
            HowManyPtsInContact = HowManyPtsInContact + 1;
       end
       if ChrPtsCtctOnOff.RightFootRightHeel(TimeIter) == 1
            GaitZMPRefTraj(:,TimeIter) = GaitZMPRefTraj(:,TimeIter) + GaitSupPol.RightFootRightHeel(1:2,TimeIter);
            HowManyPtsInContact = HowManyPtsInContact + 1;
       end
       
       if HowManyPtsInContact ~= 0
            GaitZMPRefTraj(:,TimeIter) = GaitZMPRefTraj(:,TimeIter) ./ HowManyPtsInContact;
       else
           disp('Tried do divide by 0 in GaitGenerateZMPRef: tag2');
           disp(TimeIter);
       end
   end
end

%% Search for Double Support phases
HowLongIsDSPhase = 0;
for TimeIter = 1:1:NumberOfSamples
    if strcmp(GaitPhases.LeftLeg(TimeIter), 'support') && strcmp(GaitPhases.RightLeg(TimeIter), 'support')
        HowLongIsDSPhase = HowLongIsDSPhase + 1;
    else
        if TimeIter - HowLongIsDSPhase == 1
            % Case if first phase is ds phase
            HowManyPtsInContact = 0;
            if ChrPtsCtctOnOff.LeftFootLeftToes(TimeIter-1) == 1
                GaitZMPRefTraj(:,1) = GaitZMPRefTraj(:,1) + GaitSupPol.LeftFootLeftToes(1:2,TimeIter-1);
                HowManyPtsInContact = HowManyPtsInContact + 1;
            end
            if ChrPtsCtctOnOff.LeftFootRightToes(TimeIter-1) == 1
                GaitZMPRefTraj(:,1) = GaitZMPRefTraj(:,1) + GaitSupPol.LeftFootRightToes(1:2,TimeIter-1);
                HowManyPtsInContact = HowManyPtsInContact + 1;
            end
            if ChrPtsCtctOnOff.LeftFootLeftHeel(TimeIter-1) == 1
                GaitZMPRefTraj(:,1) = GaitZMPRefTraj(:,1) + GaitSupPol.LeftFootLeftHeel(1:2,TimeIter-1);
                HowManyPtsInContact = HowManyPtsInContact + 1;
            end
            if ChrPtsCtctOnOff.LeftFootRightHeel(TimeIter-1) == 1
                GaitZMPRefTraj(:,1) = GaitZMPRefTraj(:,1) + GaitSupPol.LeftFootRightHeel(1:2,TimeIter-1);
                HowManyPtsInContact = HowManyPtsInContact + 1;
            end
            if ChrPtsCtctOnOff.RightFootLeftToes(TimeIter-1) == 1
                GaitZMPRefTraj(:,1) = GaitZMPRefTraj(:,1) + GaitSupPol.RightFootLeftToes(1:2,TimeIter-1);
                HowManyPtsInContact = HowManyPtsInContact + 1;
            end
            if ChrPtsCtctOnOff.RightFootRightToes(TimeIter-1) == 1
                GaitZMPRefTraj(:,1) = GaitZMPRefTraj(:,1) + GaitSupPol.RightFootRightToes(1:2,TimeIter-1);
                HowManyPtsInContact = HowManyPtsInContact + 1;
            end
            if ChrPtsCtctOnOff.RightFootLeftHeel(TimeIter-1) == 1
                GaitZMPRefTraj(:,1) = GaitZMPRefTraj(:,1) + GaitSupPol.RightFootLeftHeel(1:2,TimeIter-1);
                HowManyPtsInContact = HowManyPtsInContact + 1;
            end
            if ChrPtsCtctOnOff.RightFootRightHeel(TimeIter-1) == 1
                GaitZMPRefTraj(:,1) = GaitZMPRefTraj(:,1) + GaitSupPol.RightFootRightHeel(1:2,TimeIter-1);
                HowManyPtsInContact = HowManyPtsInContact + 1;
            end
            
            if HowManyPtsInContact ~= 0
                GaitZMPRefTraj(:,1) = GaitZMPRefTraj(:,1) ./ HowManyPtsInContact;
            else
               disp('Tried do divide by 0 in GaitGenerateZMPRef: tag3');
               disp(TimeIter);
            end
            
            
            for InsertIter = 1:1:TimeIter-1
                GaitZMPRefTraj(:,InsertIter) = GaitZMPRefTraj(:,1);
            end
        elseif HowLongIsDSPhase ~= 0
            % DS in between SS phases -> half time ZMP(DS) is previous ZMP(SS), half time ZMP(DS) is ZMP(SS)
            for InsertIter = (TimeIter-HowLongIsDSPhase):1:(TimeIter-HowLongIsDSPhase + fix(HowLongIsDSPhase/2) -1)
                GaitZMPRefTraj(:,InsertIter) = GaitZMPRefTraj(:,TimeIter-HowLongIsDSPhase-1);
            end
            for InsertIter = (TimeIter-HowLongIsDSPhase+ fix(HowLongIsDSPhase/2)):1:(TimeIter-1)
                GaitZMPRefTraj(:,InsertIter) = GaitZMPRefTraj(:,TimeIter);
            end
            
            DSPhaseLengthForSmooth = HowLongIsDSPhase;
        end
        
        HowLongIsDSPhase = 0;
    end
end

if HowLongIsDSPhase ~= 0    
    % for DS phase that would be last
    HowManyPtsInContact = 0;
    if ChrPtsCtctOnOff.LeftFootLeftToes(TimeIter) == 1
        GaitZMPRefTraj(:,NumberOfSamples) = GaitZMPRefTraj(:,NumberOfSamples) + GaitSupPol.LeftFootLeftToes(1:2,TimeIter);
        HowManyPtsInContact = HowManyPtsInContact + 1;
    end
    if ChrPtsCtctOnOff.LeftFootRightToes(TimeIter) == 1
        GaitZMPRefTraj(:,NumberOfSamples) = GaitZMPRefTraj(:,NumberOfSamples) + GaitSupPol.LeftFootRightToes(1:2,TimeIter);
        HowManyPtsInContact = HowManyPtsInContact + 1;
    end
    if ChrPtsCtctOnOff.LeftFootLeftHeel(TimeIter) == 1
        GaitZMPRefTraj(:,NumberOfSamples) = GaitZMPRefTraj(:,NumberOfSamples) + GaitSupPol.LeftFootLeftHeel(1:2,TimeIter);
        HowManyPtsInContact = HowManyPtsInContact + 1;
    end
    if ChrPtsCtctOnOff.LeftFootRightHeel(TimeIter) == 1
        GaitZMPRefTraj(:,NumberOfSamples) = GaitZMPRefTraj(:,NumberOfSamples) + GaitSupPol.LeftFootRightHeel(1:2,TimeIter);
        HowManyPtsInContact = HowManyPtsInContact + 1;
    end
    if ChrPtsCtctOnOff.RightFootLeftToes(TimeIter) == 1
        GaitZMPRefTraj(:,NumberOfSamples) = GaitZMPRefTraj(:,NumberOfSamples) + GaitSupPol.RightFootLeftToes(1:2,TimeIter);
        HowManyPtsInContact = HowManyPtsInContact + 1;
    end
    if ChrPtsCtctOnOff.RightFootRightToes(TimeIter) == 1
        GaitZMPRefTraj(:,NumberOfSamples) = GaitZMPRefTraj(:,NumberOfSamples) + GaitSupPol.RightFootRightToes(1:2,TimeIter);
        HowManyPtsInContact = HowManyPtsInContact + 1;
    end
    if ChrPtsCtctOnOff.RightFootLeftHeel(TimeIter) == 1
        GaitZMPRefTraj(:,NumberOfSamples) = GaitZMPRefTraj(:,NumberOfSamples) + GaitSupPol.RightFootLeftHeel(1:2,TimeIter);
        HowManyPtsInContact = HowManyPtsInContact + 1;
    end
    if ChrPtsCtctOnOff.RightFootRightHeel(TimeIter) == 1
        GaitZMPRefTraj(:,NumberOfSamples) = GaitZMPRefTraj(:,NumberOfSamples) + GaitSupPol.RightFootRightHeel(1:2,TimeIter);
        HowManyPtsInContact = HowManyPtsInContact + 1;
    end
    
    if HowManyPtsInContact ~= 0
        GaitZMPRefTraj(:,NumberOfSamples) = GaitZMPRefTraj(:,NumberOfSamples) ./ HowManyPtsInContact;
    else
       disp('Tried do divide by 0 in GaitGenerateZMPRef: tag4');
       disp(TimeIter);
    end
    for InsertIter = (NumberOfSamples - HowLongIsDSPhase + 1):1:NumberOfSamples
        GaitZMPRefTraj(:,InsertIter) = GaitZMPRefTraj(:,NumberOfSamples);
    end
end

% Smoothing trajectory
GaitZMPRefTraj(1,:) = smooth(GaitZMPRefTraj(1,:),DSPhaseLengthForSmooth/4);
GaitZMPRefTraj(1,:) = smooth(GaitZMPRefTraj(1,:),DSPhaseLengthForSmooth/4);
GaitZMPRefTraj(2,:) = smooth(GaitZMPRefTraj(2,:),DSPhaseLengthForSmooth/4);
GaitZMPRefTraj(2,:) = smooth(GaitZMPRefTraj(2,:),DSPhaseLengthForSmooth/4);
end

