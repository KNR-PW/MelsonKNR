clear;
GaitEndPointsTrajectory = struct;


%% Parametry dla wszystkich odcinków ruchu, mo¿na zadaæ ró¿ne
c1 = 0.2;
c2 = 0.2;
ProfileType = 'trapezoidal';
MotionType = 'LIN'
dt = 0.01;
TimeScale = 0.8;
przysiad = 30;
cios = 0.5;

%% £adowanie geometrii robota
LoadModelParameters;
RbtMdlPar = RobotModelParameters;

%% opis kolejnych punktów
Points = struct;

Points(1).r_RF = [0 -42.8-10 0]';
Points(1).r_LF = [0 42.8+10 0]';
Points(1).r_RH = [20 -140  140]';
Points(1).r_LH = [20 140  140]';
Points(1).r_CoM = [0 0 150+5]';
Points(1).Rzyx_RF =  pi/180*[0 0 0]';
Points(1).Rzyx_LF =  pi/180*[0 0 0]';
Points(1).Time = 1;
Points(1).c1 = c1;
Points(1).c2 = c2;
Points(1).ProfileType = ProfileType;
Points(1).MotionType = MotionType;

Points(2).r_RF = [0 -42.8-10 0]';
Points(2).r_LF = [0 42.8+10 0]';
Points(2).r_RH = [20 -140  140-przysiad]';
Points(2).r_LH = [20 140  140-przysiad]';
Points(2).r_CoM = [0 0 150+5-przysiad]';
Points(2).Rzyx_RF =  pi/180*[0 0 0]';
Points(2).Rzyx_LF =  pi/180*[0 0 0]';
Points(2).Time = 1;
Points(2).c1 = c1;
Points(2).c2 = c2;
Points(2).ProfileType = ProfileType;
Points(2).MotionType = MotionType;








Points(3).r_RF = [0 -42.8-10 0]';
Points(3).r_LF = [0 42.8+10 0]';
Points(3).r_RH = [100 -100  180-przysiad]';
Points(3).r_LH = [100 100  180-przysiad]';
Points(3).r_CoM = [0 0 150+5-przysiad]';
Points(3).Rzyx_RF =  pi/180*[0 0 0]';
Points(3).Rzyx_LF =  pi/180*[0 0 0]';
Points(3).Time = 1;
Points(3).c1 = c1;
Points(3).c2 = c2;
Points(3).ProfileType = ProfileType;
Points(3).MotionType = MotionType;

Points(4).r_RF = [0 -42.8-10 0]';
Points(4).r_LF = [0 42.8+10 0]';
Points(4).r_RH = [240 0  230-przysiad]';
Points(4).r_LH = [0 120  180-przysiad]';
Points(4).r_CoM = [0 0 150+5-przysiad]';
Points(4).Rzyx_RF =  pi/180*[0 0 0]';
Points(4).Rzyx_LF =  pi/180*[0 0 0]';
Points(4).Time = cios;
Points(4).c1 = c1;
Points(4).c2 = c2;
Points(4).ProfileType = ProfileType;
Points(4).MotionType = MotionType;

Points(5).r_RF = [0 -42.8-10 0]';
Points(5).r_LF = [0 42.8+10 0]';
Points(5).r_LH = [240 0  230-przysiad]';
Points(5).r_RH = [0 -120  180-przysiad]';
Points(5).r_CoM = [0 0 150+5-przysiad]';
Points(5).Rzyx_RF =  pi/180*[0 0 0]';
Points(5).Rzyx_LF =  pi/180*[0 0 0]';
Points(5).Time = 2*cios;
Points(5).c1 = c1;
Points(5).c2 = c2;
Points(5).ProfileType = ProfileType;
Points(5).MotionType = MotionType;

Points(6) = Points(2);
Points(7) = Points(1);



X_Planned = [];     %zaplanowana trajektoria w uk³adzie 0
Q =[];              %po³o¿enia z³¹czowe
q0 = RbtMdlPar.q0;  %przybli¿one po³o¿enie startowe

%% Pozycja we wspó³rzêdnych zewnêtrznych na pocz¹tku ruchu
x0 = [  Points(1).r_RF;
        Points(1).r_LF;
        Points(1).r_RH;
        Points(1).r_LH;
        Points(1).r_CoM;
        Points(1).Rzyx_RF;
        Points(1).Rzyx_LF ];

x0_RF = KinFast.ConvertToRF(x0);

%% Pozycja z³¹czowa na pocz¹tku ruchu
% Q = KinFast.IKS(q0,x0_RF, euler2rot(Points(1).Rzyx_RF), 100);
Q = SolveInverseKinematics(q0, x0, 100);

for i=2:length(Points);
    r_start = [ Points(i-1).r_RF;
                Points(i-1).r_LF;
                Points(i-1).r_RH;
                Points(i-1).r_LH;
                Points(i-1).r_CoM;
                Points(i-1).Rzyx_RF;
                Points(i-1).Rzyx_LF];
    
    r_end =   [ Points(i).r_RF;
                Points(i).r_LF;
                Points(i).r_RH;
                Points(i).r_LH;
                Points(i).r_CoM;
                Points(i).Rzyx_RF;
                Points(i).Rzyx_LF];
    Time = TimeScale * Points(i).Time;
    c1 = Points(i).c1;
    c2 = Points(i).c2;
    ProfileType = Points(i).ProfileType;
    
    %% Domyœlnie dla wszystkich odcinków generowana jest trajektoria linoniowa
    x_part = GenerateLinTrajectory(r_start, r_end, Time, dt, c1, c2, ProfileType);
    
    if Points(i).MotionType == 'LIN'
        N = size(x_part,2);
        q0 = Q(:, size(Q,2));
        q_part = zeros(19,N);
        
        q_part(:,1) = SolveInverseKinematics(q0,x_part(:,1),  1);
        for Iter = 2:N
            q_part(:,Iter) = SolveInverseKinematics(q_part(:,Iter-1),x_part(:,Iter-1),  1);
        end
        
        X_Planned = [X_Planned x_part];
        Q = [Q q_part];
    else
        N = size(x_part,2);
        q0 = Q(:, size(Q,2));
        
        q_end = SolveInverseKinematics(q0,r_end, N);
  
        q_part = q0 * ones(1,N) + (q_end - q0) * GenerateProfile(Time,dt,c1,c2,ProfileType);        
        
        X_Planned = [X_Planned x_part]; %Tutaj nale¿a³oby wyznaczyæ zadanie proste
        Q = [Q q_part];
    end
        
end
Q = Q(:,2:size(Q,2)); %% Usuniêcie pierwszej, przybli¿onej pozycji startowej
N = size(Q,2);
t = dt:dt:N*dt;

%% Dynamixele

Slopes = [7*ones(1,12) 32*ones(1,7)]' * ones(1,N);

GaitPhases.LeftLeg = strings(1,N);
GaitPhases.RightLeg =strings(1,N);

for i=1:N
    GaitPhases.LeftLeg(i) = 'support';
    GaitPhases.RightLeg(i) = 'support';
end


Robot_JointAngles =  zeros(19,N);
for TimeIter = 1:N
    Robot_JointAngles(:,TimeIter) = radModel2Dnmx(Q(:,TimeIter));    
end
 GaitJointAngles = Q;

