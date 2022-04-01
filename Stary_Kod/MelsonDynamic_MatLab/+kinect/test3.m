
vid2 = videoinput('kinect',2);
src2 = getselectedsource(vid2);
src2.SkeletonsToTrack =1;

 vid2.TriggerRepeat = 20000
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
    clf;
    
    subplot(1,2,1);
    hold on;
    
    az = 135;
    el = 22;
    view(az, el);
    axis equal;
    for i = 1:19
        X1 = -[skeleton(SkeletonConnectionMap(i,1),3,1) skeleton(SkeletonConnectionMap(i,2),3,1)];
        Y1 = -[skeleton(SkeletonConnectionMap(i,1),1,1) skeleton(SkeletonConnectionMap(i,2),1,1)];
        Z1 = [skeleton(SkeletonConnectionMap(i,1),2,1) skeleton(SkeletonConnectionMap(i,2),2,1)];
        line(X1,Y1,Z1, 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '+', 'Color', 'r');  
    end
    
    hold off;
    
    
    if(metaData.IsSkeletonTracked(1) == 1)
        error = 0;
        
        JointWorldCoordinates = metaData.JointWorldCoordinates(:,:,1);
        LeftHand = JointWorldCoordinates(8,:) - JointWorldCoordinates(2,:);
        RightHand = JointWorldCoordinates(12,:) - JointWorldCoordinates(2,:);
        % zapis -Y Z -X
        LeftHand = 300*[-LeftHand(3); -LeftHand(1); LeftHand(2)];
        RightHand = 300*[-RightHand(3); -RightHand(1); RightHand(2)];
        
        wymiary;
        vect_left = LeftHand - r_CH_LA;
        vect_right = RightHand - r_CH_RA;
        
        if ( norm(vect_left) > 190)
            vect_left = vect_left * 190 / norm(vect_left);
        end
        
        if ( norm(vect_right) > 190)
            vect_right = vect_right * 190 / norm(vect_right);
        end
        
         if ( norm(vect_left) < 30)
            vect_left = vect_left * 30 / norm(vect_left);
        end
        
        if ( norm(vect_right) < 30)
            vect_right = vect_right * 30 / norm(vect_right);
        end
        
        LeftHand = r_CH_LA + vect_left;
        RightHand = r_CH_RA + vect_right;
        
        
        
        
        
        q_left = OZK_korpus_rekaL(LeftHand, 0);
        q_right = OZK_korpus_rekaP(RightHand, 0);
        q = [zeros(1,12) q_right q_left 0];
%         
        subplot(1,2,2);
        stick_robot(q);
           drawnow;

        
        
    else
        error = error+1;
        if (error>15)
            stop(vid2);
            start(vid2);
            error=0;
        end
    end
    
    
   drawnow;
    
    ts
end

% 
% Hip_Center = 1;
%    Spine = 2;
%    Shoulder_Center = 3;
%    Head = 4;
%    Shoulder_Left = 5;
%    Elbow_Left = 6;
%    Wrist_Left = 7;
%    Hand_Left = 8;
%    Shoulder_Right = 9;
%    Elbow_Right = 10;
%    Wrist_Right = 11;
%    Hand_Right = 12;
%    Hip_Left = 13;
%    Knee_Left = 14;
%    Ankle_Left = 15;
%    Foot_Left = 16; 
%    Hip_Right = 17;
%    Knee_Right = 18;
%    Ankle_Right = 19;
%    Foot_Right = 20;
