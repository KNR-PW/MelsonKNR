RobotParameters.LoadModelParameters;
RbtPar = RobotModelParameters;

Chain(1).Name = 'Left Foot position';
Chain(1).JointOrder = [6 5 4 3 2 1 7 8 9 10 11 12];
Chain(1).R(:,1)     = zeros(3,1);
Chain(1).R(:,2)     = -RbtPar.r_RS_RF;
Chain(1).R(:,3)     = -RbtPar.r_RT_RS;
Chain(1).R(:,4)     = zeros(3,1);
Chain(1).R(:,5)     = zeros(3,1);
Chain(1).R(:,6)     = -RbtPar.r_W_RT + RbtPar.r_W_LT;
Chain(1).R(:,7)     = zeros(3,1);
Chain(1).R(:,8)     = zeros(3,1);
Chain(1).R(:,9)     = RbtPar.r_LT_LS;
Chain(1).R(:,10)    = RbtPar.r_LS_LF;
Chain(1).R(:,11)    = zeros(3,1);
Chain(1).R(:,12)    = zeros(3,1);

Chain(2).Name = 'Right Hand position';
Chain(2).JointOrder = [6 5 4 3 2 1 19 13 14 15];
Chain(2).R(:,1)     = zeros(3,1);
Chain(2).R(:,2)     = -RbtPar.r_RS_RF;
Chain(2).R(:,3)     = -RbtPar.r_RT_RS;
Chain(2).R(:,4)     = zeros(3,1);
Chain(2).R(:,5)     = zeros(3,1);
Chain(2).R(:,6)     = -RbtPar.r_W_RT + RbtPar.r_W_CH;
Chain(2).R(:,7)     = RbtPar.r_CH_RA;
Chain(2).R(:,8)     = zeros(3,1);
Chain(2).R(:,9)     = RbtPar.r_RA_RFA;
Chain(2).R(:,10)    = RbtPar.r_RFA_RH;

Chain(3).Name = 'Left Hand position';
Chain(3).JointOrder = [6 5 4 3 2 1 19 16 17 18];
Chain(3).R(:,1)     = zeros(3,1);
Chain(3).R(:,2)     = -RbtPar.r_RS_RF;
Chain(3).R(:,3)     = -RbtPar.r_RT_RS;
Chain(3).R(:,4)     = zeros(3,1);
Chain(3).R(:,5)     = zeros(3,1);
Chain(3).R(:,6)     = -RbtPar.r_W_RT + RbtPar.r_W_CH;
Chain(3).R(:,7)     = RbtPar.r_CH_LA;
Chain(3).R(:,8)     = zeros(3,1);
Chain(3).R(:,9)     = RbtPar.r_LA_LFA;
Chain(3).R(:,10)    = RbtPar.r_LFA_LH;

Chain(4).Name = 'Right Shank CoM position';
Chain(4).JointOrder = [6 5];
Chain(4).R(:,1)     = zeros(3,1);
Chain(4).R(:,2)     = -RbtPar.r_RS_RF + RbtPar.r_com_RS;

Chain(5).Name = 'Right Trunk CoM position';
Chain(5).JointOrder = [6 5 4];
Chain(5).R(:,1)     = zeros(3,1);
Chain(5).R(:,2)     = -RbtPar.r_RS_RF;
Chain(5).R(:,3)     = -RbtPar.r_RT_RS + RbtPar.r_com_RT;

Chain(6).Name = 'Waist CoM position';
Chain(6).JointOrder = [6 5 4 3 2 1];
Chain(6).R(:,1)     = zeros(3,1);
Chain(6).R(:,2)     = -RbtPar.r_RS_RF;
Chain(6).R(:,3)     = -RbtPar.r_RT_RS;
Chain(6).R(:,4)     = zeros(3,1);
Chain(6).R(:,5)     = zeros(3,1);
Chain(6).R(:,6)     = -RbtPar.r_W_RT + RbtPar.r_com_W;

Chain(7).Name = 'Left Trunk CoM position';
Chain(7).JointOrder = [6 5 4 3 2 1 7 8 9];
Chain(7).R(:,1)     = zeros(3,1);
Chain(7).R(:,2)     = -RbtPar.r_RS_RF;
Chain(7).R(:,3)     = -RbtPar.r_RT_RS;
Chain(7).R(:,4)     = zeros(3,1);
Chain(7).R(:,5)     = zeros(3,1);
Chain(7).R(:,6)     = -RbtPar.r_W_RT + RbtPar.r_W_LT;
Chain(7).R(:,7)     = zeros(3,1);
Chain(7).R(:,8)     = zeros(3,1);
Chain(7).R(:,9)     = RbtPar.r_com_LT;

Chain(8).Name = 'Left Shank CoM position';
Chain(8).JointOrder = [6 5 4 3 2 1 7 8 9 10];
Chain(8).R(:,1)     = zeros(3,1);
Chain(8).R(:,2)     = -RbtPar.r_RS_RF;
Chain(8).R(:,3)     = -RbtPar.r_RT_RS;
Chain(8).R(:,4)     = zeros(3,1);
Chain(8).R(:,5)     = zeros(3,1);
Chain(8).R(:,6)     = -RbtPar.r_W_RT + RbtPar.r_W_LT;
Chain(8).R(:,7)     = zeros(3,1);
Chain(8).R(:,8)     = zeros(3,1);
Chain(8).R(:,9)     = RbtPar.r_LT_LS;
Chain(8).R(:,10)    = RbtPar.r_com_LS;

Chain(9).Name = 'Left Foot CoM position';
Chain(9).JointOrder = [6 5 4 3 2 1 7 8 9 10 11 12];
Chain(9).R(:,1)     = zeros(3,1);
Chain(9).R(:,2)     = -RbtPar.r_RS_RF;
Chain(9).R(:,3)     = -RbtPar.r_RT_RS;
Chain(9).R(:,4)     = zeros(3,1);
Chain(9).R(:,5)     = zeros(3,1);
Chain(9).R(:,6)     = -RbtPar.r_W_RT + RbtPar.r_W_LT;
Chain(9).R(:,7)     = zeros(3,1);
Chain(9).R(:,8)     = zeros(3,1);
Chain(9).R(:,9)     = RbtPar.r_LT_LS;
Chain(9).R(:,10)    = RbtPar.r_LS_LF;
Chain(9).R(:,11)    = zeros(3,1);
Chain(9).R(:,12)    = RbtPar.r_com_LF;

Chain(10).Name = 'Chest CoM position';
Chain(10).JointOrder = [6 5 4 3 2 1 19 ];
Chain(10).R(:,1)     = zeros(3,1);
Chain(10).R(:,2)     = -RbtPar.r_RS_RF;
Chain(10).R(:,3)     = -RbtPar.r_RT_RS;
Chain(10).R(:,4)     = zeros(3,1);
Chain(10).R(:,5)     = zeros(3,1);
Chain(10).R(:,6)     = -RbtPar.r_W_RT + RbtPar.r_W_CH;
Chain(10).R(:,7)     = RbtPar.r_com_CH;

Chain(11).Name = 'Right Arm CoM position';
Chain(11).JointOrder = [6 5 4 3 2 1 19 13 14];
Chain(11).R(:,1)     = zeros(3,1);
Chain(11).R(:,2)     = -RbtPar.r_RS_RF;
Chain(11).R(:,3)     = -RbtPar.r_RT_RS;
Chain(11).R(:,4)     = zeros(3,1);
Chain(11).R(:,5)     = zeros(3,1);
Chain(11).R(:,6)     = -RbtPar.r_W_RT + RbtPar.r_W_CH;
Chain(11).R(:,7)     = RbtPar.r_CH_RA;
Chain(11).R(:,8)     = zeros(3,1);
Chain(11).R(:,9)     = RbtPar.r_com_RA;

Chain(12).Name = 'Right Fore Arm CoM position';
Chain(12).JointOrder = [6 5 4 3 2 1 19 13 14 15];
Chain(12).R(:,1)     = zeros(3,1);
Chain(12).R(:,2)     = -RbtPar.r_RS_RF;
Chain(12).R(:,3)     = -RbtPar.r_RT_RS;
Chain(12).R(:,4)     = zeros(3,1);
Chain(12).R(:,5)     = zeros(3,1);
Chain(12).R(:,6)     = -RbtPar.r_W_RT + RbtPar.r_W_CH;
Chain(12).R(:,7)     = RbtPar.r_CH_RA;
Chain(12).R(:,8)     = zeros(3,1);
Chain(12).R(:,9)     = RbtPar.r_RA_RFA;
Chain(12).R(:,10)    = RbtPar.r_com_RFA;

Chain(13).Name = 'Left Arm CoM position';
Chain(13).JointOrder = [6 5 4 3 2 1 19 16 17];
Chain(13).R(:,1)     = zeros(3,1);
Chain(13).R(:,2)     = -RbtPar.r_RS_RF;
Chain(13).R(:,3)     = -RbtPar.r_RT_RS;
Chain(13).R(:,4)     = zeros(3,1);
Chain(13).R(:,5)     = zeros(3,1);
Chain(13).R(:,6)     = -RbtPar.r_W_RT + RbtPar.r_W_CH;
Chain(13).R(:,7)     = RbtPar.r_CH_LA;
Chain(13).R(:,8)     = zeros(3,1);
Chain(13).R(:,9)     = RbtPar.r_com_LA;

Chain(14).Name = 'Left Fore Arm CoM position';
Chain(14).JointOrder = [6 5 4 3 2 1 19 16 17 18];
Chain(14).R(:,1)     = zeros(3,1);
Chain(14).R(:,2)     = -RbtPar.r_RS_RF;
Chain(14).R(:,3)     = -RbtPar.r_RT_RS;
Chain(14).R(:,4)     = zeros(3,1);
Chain(14).R(:,5)     = zeros(3,1);
Chain(14).R(:,6)     = -RbtPar.r_W_RT + RbtPar.r_W_CH;
Chain(14).R(:,7)     = RbtPar.r_CH_LA;
Chain(14).R(:,8)     = zeros(3,1);
Chain(14).R(:,9)     = RbtPar.r_LA_LFA;
Chain(14).R(:,10)    = RbtPar.r_com_LFA;

Chain(15).Name = 'Waist position';
Chain(15).JointOrder = [6 5 4 3 2 1];
Chain(15).R(:,1)     = zeros(3,1);
Chain(15).R(:,2)     = -RbtPar.r_RS_RF;
Chain(15).R(:,3)     = -RbtPar.r_RT_RS;
Chain(15).R(:,4)     = zeros(3,1);
Chain(15).R(:,5)     = zeros(3,1);
Chain(15).R(:,6)     = -RbtPar.r_W_RT;