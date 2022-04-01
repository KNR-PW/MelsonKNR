
%% czyszczenie Workspace'a, ³adowanie danych
clear;
% load('chod200.mat')
load('chodok.mat')

LoadModelParameters;
RbtMdlPar = RobotModelParameters;

%% Zapis trajektorii enpointów i CoM w uk³adzie prawej stopy (RF), 
% R_traj = [ R_RF_LF;       - kolejne pozycje lewej stopy
%            R_RF_RH;       - kolejne pozycje prawej d³oni
%            R_RF_LH;       - kolejne pozycje lewej d³oni
%            R_RF_CoM;      - kolejne pozycje œrodka masy
%            E_RF_LF;       - kolejne parametry eulera opisuj¹ce orientacjê
%            Pitch_W;       - pochylenie bioder( i ca³ego korpusu)

 N = size(GaitEndPointsTrajectory.r_RF,2);
    X_Planned = zeros(21,N);

    for TimeIter = 1:N        
        X_Planned(:,TimeIter) = [    GaitEndPointsTrajectory.r_RF(:,TimeIter);
                                     GaitEndPointsTrajectory.r_LF(:,TimeIter);
                                     GaitEndPointsTrajectory.r_RH(:,TimeIter);
                                     GaitEndPointsTrajectory.r_LH(:,TimeIter);
                                     GaitCoMTrajectory(:,TimeIter);
                                     Mat.rot2euler(GaitEndPointsTrajectory.rot_RF(:,:,TimeIter));
                                     Mat.rot2euler(GaitEndPointsTrajectory.rot_LF(:,:,TimeIter))];
    end  

N = size(X_Planned,2);


%% Przybli¿enie startowe 
q0 = RbtMdlPar.q0;

%% Kolejne wsp. z³¹czowe
Q = zeros(19,N);

%% Rozwi¹zanie dla pierwszej pozycji
Q = SolveInverseKinematics(q0, X_Planned(:,1), 100);

%% Kolejne rozwi¹zania
tic;
for TimeIter = 2:N        
    Q(:,TimeIter) = SolveInverseKinematics(Q(:,TimeIter-1),X_Planned(:,TimeIter), 1);
end 
toc




