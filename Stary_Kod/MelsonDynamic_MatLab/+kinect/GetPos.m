function [ isSuccess, SkeletonCoords, ts, metaData, frame] = GetPos( VidInput )
    trigger(VidInput);
    
%     while(islogging(VidInput))
%     end
    
    [frame, ts, metaData] = getdata(VidInput);
    
    tic;
    while( metaData.IsSkeletonTracked(1) == 0 && toc < 1/10 )
        %% tutaj czekamy maks. 100ms na uzyskanie danych z ostatniej klatki (liczy siê w tle)
    end

%     pause(0.1);
    SkeletonCoords = [ -metaData.JointWorldCoordinates(:,3,1) -metaData.JointWorldCoordinates(:,1,1) metaData.JointWorldCoordinates(:,2,1)];
    isSuccess = metaData.IsSkeletonTracked(1);
    
    
end

