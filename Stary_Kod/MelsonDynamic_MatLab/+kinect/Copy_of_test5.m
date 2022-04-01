vid2 = videoinput('kinect',2);
src2 = getselectedsource(vid2);
src2.SkeletonsToTrack =1;

vid2.TriggerRepeat = 20000
vid2.FramesPerTrigger = 1
triggerconfig(vid2, 'manual')

src2.TrackingMode = 'Skeleton'

start(vid2)

error=0;
frame_counter = 0;

MeanProbes = 3;
actor.JointWorldCoordinatesMeanBuffer = zeros(3,20,MeanProbes);
q = zeros(1,7);
dq = zeros(1,7);
q_prev = zeros(1,7);
dq_prev = zeros(1,7);

cycle_time = 999;
max_speed = pi;
max_acceleration = 8*pi;
wymiary;

while(1)
    tic;
    frame_counter=frame_counter+1;
    trigger(vid2);
    
    while(islogging(vid2))
    end
    
    [frame, ts, metaData] = getdata(vid2);
    skeleton = metaData.JointWorldCoordinates;
    
    while( metaData.IsSkeletonTracked(1) == 0 && toc < 1/10 )
        %% tutaj czekamy maks. 100ms na uzyskanie danych z ostatniej klatki (liczy siê w tle)
    end
    
    
    if(metaData.IsSkeletonTracked(1) == 1)
        %Erase error counter
        error = 0;
        
        %Convert coordinates from kinect space to humanoid space
        %Column vectors
        actor.JointWorldCoordinatesMeanBuffer(:,:, mod(frame_counter,MeanProbes)+1 ) = kinect.convert( metaData.JointWorldCoordinates(:,:,1) );
        
        actor.JointWorldCoordinates = 0;
        for i=1:MeanProbes
            actor.JointWorldCoordinates = actor.JointWorldCoordinates + actor.JointWorldCoordinatesMeanBuffer(:,:,i);
        end
        
        actor.JointWorldCoordinates = actor.JointWorldCoordinates/MeanProbes;
        
        
        actor.Shoulders_vect = actor.JointWorldCoordinates(:,5) - actor.JointWorldCoordinates(:,9);
        actor.Hips_vect = actor.JointWorldCoordinates(:,13) - actor.JointWorldCoordinates(:,17);
        
        actor.Hips_Shoulders_vect = actor.Shoulders_vect - actor.Hips_vect;
        fi_CH = - atan2(actor.Hips_Shoulders_vect(1), actor.Hips_Shoulders_vect(2));
        
        
        actor.length_LHand = norm(actor.JointWorldCoordinates(:,7) - actor.JointWorldCoordinates(:,6)) + norm(actor.JointWorldCoordinates(:,6) - actor.JointWorldCoordinates(:,5));
        actor.length_RHand = norm(actor.JointWorldCoordinates(:,11) - actor.JointWorldCoordinates(:,10)) + norm(actor.JointWorldCoordinates(:,10) - actor.JointWorldCoordinates(:,9));
        
        actor.r_LShoulder_LWrist = actor.JointWorldCoordinates(:,7) - actor.JointWorldCoordinates(:,5);
        actor.r_RShoulder_RWrist = actor.JointWorldCoordinates(:,11) - actor.JointWorldCoordinates(:,9);
        
        humanoid.length_LHand = norm(humanoid.r_LA_LFA) + norm(humanoid.r_LFA_LH);
        humanoid.length_RHand = norm(humanoid.r_LA_LFA) + norm(humanoid.r_LFA_LH);
        
        humanoid_position.r_LA_LH = actor.r_LShoulder_LWrist / actor.length_LHand * humanoid.length_LHand;
        humanoid_position.r_RA_RH = actor.r_RShoulder_RWrist / actor.length_RHand * humanoid.length_RHand;
        
        LeftHand = (humanoid.r_CH_LA + humanoid_position.r_LA_LH);
        RightHand = (humanoid.r_CH_RA + humanoid_position.r_RA_RH);
        
        q_left = OZK_korpus_rekaLnew(LeftHand, [0 0 -pi/2], fi_CH);
        q_right = OZK_korpus_rekaPnew(RightHand, [0 0 -pi/2], fi_CH);
        
        q = [q_right q_left fi_CH];
        
        %Measuring present speed and acceleration
        
        dq = (q - q_prev)/cycle_time;
        d2q = (dq - dq_prev)/cycle_time;
        
        for i=1:7
            if ( abs(d2q(i)) > max_acceleration )
                d2q(i) = sign(d2q(i))*max_acceleration;
                dq(i) = dq_prev(i) + d2q(i)*cycle_time;
                q(i) = q_prev(i) + dq(i)*cycle_time;
            end
            
            if ( abs(dq(i)) > max_speed )
                dq(i) = sign(dq(i))*max_speed;
                q(i) = q_prev(i) + dq(i)*cycle_time;
            end
        end
        
        tr = abs(2 * (q - q_prev) ./ dq);
        
        for i=1:7
                if( max_acceleration*tr(i) <= abs(dq(i)) )
                d2q(i) = max_acceleration * (- sign(dq(i)));
                dq(i) = dq_prev(i) + d2q(i) * cycle_time;
                q(i) = q_prev(i) + dq(i) * cycle_time;
                end
        end
        
        
        
        
        q = [zeros(1,12) q];
        
%         clf;
%         stick_robot(q);
        q_DNMX = rad2DNMX(q);
        q_DNMX = q_DNMX(13:19);
        ustaw_x(q_DNMX, 13);
        q = q(13:19);
        
    else
        error = error+1;
        if (error>15)
            stop(vid2);
            start(vid2);
            error=0;
        end
    end
%     drawnow;
    
    toc
    q_prev = q;
    dq_prev = dq;
    cycle_time = 0.03;
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
