function [ CurrentRecord ] = Record( VidInput )
%RECORD Summary of this function goes here
%   Detailed explanation goes here
    
%% Rozruch
    start(VidInput);
    error=0;
    
    while kinect.GetPos(VidInput) == 0
        error = error + 1;
        if error > 10
            error = 0;
            stop(VidInput);
            start(VidInput);
        end
    end
    
 %% Rejestracja
    TimeIter = 0;
    
    gcf = figure();
    set(gcf,'currentchar','~');         % set a dummy character
   
    
    CurrentRecord.SkeletonCoords(:,:,1) = zeros(20,3);
    CurrentRecord.TimeSpan(1) = 0;
    CurrentRecord.metaData(1) = 0;
    CurrentRecord.frame(:,:,1) = zeros(480, 640);
    
    while get(gcf,'currentchar')=='~'  % which gets changed when key is pressed
        tic;
        TimeIter = TimeIter+1;
        [ isSuccess, SkeletonCoords, ts, metaData, frame] = kinect.GetPos( VidInput );
        
        CurrentRecord.SkeletonCoords(:,:,TimeIter) = SkeletonCoords;
        CurrentRecord.TimeSpan(TimeIter) = ts;
        %CurrentRecord.metaData(TimeIter) = metaData;
        CurrentRecord.frame(:,:,TimeIter) = frame;
        
        % rysowanie 2D
        
                     
        clf;
        % P³aszczyzna czo³owa
        subplot(1,2,1);
        kinect.DrawSkeletonYZ(SkeletonCoords);
        
        % p³aszczyzna boczna
        subplot(1,2,2);
        kinect.DrawSkeletonXZ(SkeletonCoords);
        
        drawnow;
        
        
        toc;
    end
    
    
    stop(VidInput);
    

end

