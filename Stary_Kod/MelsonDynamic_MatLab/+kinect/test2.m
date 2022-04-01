
vid2 = videoinput('kinect',2);
src2 = getselectedsource(vid2);
src2.SkeletonsToTrack =1;

 vid2.TriggerRepeat = 10000
 vid2.FramesPerTrigger = 1
triggerconfig(vid2, 'manual')

src2.TrackingMode = 'Skeleton'

SkeletonConnectionMap = [[1 2]; % Spine
                         [2 3];
                         [3 4];
                         [3 5]; %Left Hand
                         [5 6];
                         [6 7];
                         [7 8];
                         [3 9]; %Right Hand
                         [9 10];
                         [10 11];
                         [11 12];
                         [1 17]; % Right Leg
                         [17 18];
                         [18 19];
                         [19 20];
                         [1 13]; % Left Leg
                         [13 14];
                         [14 15];
                         [15 16]];

start(vid2)
error=0;

while(1)
    
    trigger(vid2);
    while(islogging(vid2))
    end
    
    [frame, ts, metaData] = getdata(vid2);
    skeleton = metaData.JointWorldCoordinates;
    
    
    hold on;
    clf;
    az = 135;
    el = 22;
    view(az, el);
    axis equal;
    for i = 1:19
        Y1 = [skeleton(SkeletonConnectionMap(i,1),1,1) skeleton(SkeletonConnectionMap(i,2),1,1)];
        Z1 = [skeleton(SkeletonConnectionMap(i,1),2,1) skeleton(SkeletonConnectionMap(i,2),2,1)];
        X1 = [skeleton(SkeletonConnectionMap(i,1),3,1) skeleton(SkeletonConnectionMap(i,2),3,1)];
        line(X1,Y1,Z1, 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '+', 'Color', 'r');  
    end
    
    drawnow;
    
    
    if(metaData.IsSkeletonTracked(1) == 1)
        error = 0;
    else
        error = error+1;
        if (error>15)
            stop(vid2);
            start(vid2);
            error=0;
        end
    end
   
    
    ts
end
