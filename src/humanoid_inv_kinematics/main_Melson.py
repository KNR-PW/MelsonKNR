import src.humanoid_inv_kinematics.MelsonDynamic.RobotParameters.GenerateHandsTrajectory as GH
import numpy as np
import math
import matplotlib.pyplot as plt
import src.humanoid_inv_kinematics.MelsonDynamic.ConvertToRF as Conv
import src.humanoid_inv_kinematics.MelsonDynamic.RobotParameters.GaitParameters as GP
import src.humanoid_inv_kinematics.MelsonDynamic.RadModelToDynamixel as dynamixel
from src.humanoid_inv_kinematics.MelsonDynamic.RobotParameters.ModelParameters import *
from src.humanoid_inv_kinematics.CLIK_Melson import CLIK
from src.humanoid_inv_kinematics.Forward_kinematics_Melson import Forward_kinematics_Melson as k_for
## (1) Load Parameters wywoła się w StepPlanner
## (2) Trajektoria nóg -> r_stóp_k[x,y,0] (dla wartości końcowych) i r_stóp_t (w czasie chodu (w powietrzu))
## (3) ZMP i CoM trajectory:

## (4) Trajektoria rąk
## (5) Generowanie Jakobianu
## (6) konwersja na dynamixele
# Trajektoria względem układu 0 (przyczepiony do podłogi):
trajectory_0= np.empty([21,GP.NumberOfTimeInstances])
for TimeIter in range(GP.NumberOfTimeInstances):
    RF_euler = Conv.rot2euler(GH.SCoM.GSP.con.GaitEndPointsTrajectory.rot_RF[:,:,[TimeIter]])
    LF_euler = Conv.rot2euler(GH.SCoM.GSP.con.GaitEndPointsTrajectory.rot_LF[:, :, [TimeIter]])
    trajectory_0[:,[TimeIter]] = np.block([[GH.SCoM.GSP.con.GaitEndPointsTrajectory.r_RF[:,[TimeIter]]],
                                             [GH.SCoM.GSP.con.GaitEndPointsTrajectory.r_LF[:,[TimeIter]]],
                                             [GH.SCoM.GSP.con.GaitEndPointsTrajectory.r_RH[:,[TimeIter]]],
                                             [GH.SCoM.GSP.con.GaitEndPointsTrajectory.r_LH[:,[TimeIter]]],
                                             [GH.SCoM.GSP.con.GaitEndPointsTrajectory.r_W[:,[TimeIter]]],
                                             [RF_euler],[LF_euler]])
# Trajektoria względem RF:
trajectory_RF = Conv.convert_to_rf(trajectory_0)
# Pierwsza iteracja CLIK:
Test_Trajectory = np.zeros((GP.NumberOfTimeInstances, 15))
Gait_JointAngles = np.zeros((GP.NumberOfTimeInstances, 19))
q_0 = q0
Gait_JointAngles[0][:] = np.transpose(q_0)
for i in range(100):
    Gait_JointAngles[[0], :] = np.transpose(
        CLIK(np.transpose(Gait_JointAngles[[0], :]), trajectory_0[:, [0]], trajectory_RF[:, [0]]))
Test_Trajectory[[0], :] = np.transpose(k_for(np.transpose(Gait_JointAngles[[0], :]),trajectory_0[:, [0]]))
for i in range(1, GP.NumberOfTimeInstances):
    Gait_JointAngles[[i], :] = np.transpose(CLIK(np.transpose(Gait_JointAngles[[i-1], :]), trajectory_0[:, [i]], trajectory_RF[:, [i]]))
    Test_Trajectory[[i], :] = np.transpose(k_for(np.transpose(Gait_JointAngles[[i], :]),trajectory_0[:, [i]]))


plt.plot(range(GP.NumberOfTimeInstances),Gait_JointAngles[:, [0]])
plt.show()
plt.plot(range(GP.NumberOfTimeInstances),Gait_JointAngles[:, [1]])
plt.show()
plt.plot(range(GP.NumberOfTimeInstances),Gait_JointAngles[:, [2]])
plt.show()
plt.plot(range(GP.NumberOfTimeInstances),Gait_JointAngles[:, [3]])
plt.show()
plt.plot(range(GP.NumberOfTimeInstances),Gait_JointAngles[:, [4]])
plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),Gait_JointAngles[:, [5]])
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),Gait_JointAngles[:, [6]])
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),Gait_JointAngles[:, [7]])
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),Gait_JointAngles[:, [8]])
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),Gait_JointAngles[:, [9]])
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),Gait_JointAngles[:, [10]])
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),Gait_JointAngles[:, [11]])
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),Gait_JointAngles[:, [12]])
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),Gait_JointAngles[:, [13]])
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),Gait_JointAngles[:, [14]])
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),Gait_JointAngles[:, [15]])
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),Gait_JointAngles[:, [16]])
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),Gait_JointAngles[:, [17]])
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),Gait_JointAngles[:, [18]])
# plt.show()
#
# plt.plot(range(GP.NumberOfTimeInstances),Test_Trajectory[:, [0]])
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),np.transpose(trajectory_RF[[0], :]))
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),Test_Trajectory[:, [1]])
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),np.transpose(trajectory_RF[[1], :]))
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),Test_Trajectory[:, [2]])
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),np.transpose(trajectory_RF[[2], :]))
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),Test_Trajectory[:, [3]])
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),np.transpose(trajectory_RF[[3], :]))
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),Test_Trajectory[:, [4]])
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),np.transpose(trajectory_RF[[4], :]))
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),Test_Trajectory[:, [5]])
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),np.transpose(trajectory_RF[[5], :]))
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),Test_Trajectory[:, [6]])
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),np.transpose(trajectory_RF[[6], :]))
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),Test_Trajectory[:, [7]])
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),np.transpose(trajectory_RF[[7], :]))
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),Test_Trajectory[:, [8]])
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),np.transpose(trajectory_RF[[8], :]))
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),Test_Trajectory[:, [9]])
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),np.transpose(trajectory_RF[[9], :]))
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),Test_Trajectory[:, [10]])
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),np.transpose(trajectory_RF[[10], :]))
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),Test_Trajectory[:, [11]])
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),np.transpose(trajectory_RF[[11], :]))
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),Test_Trajectory[:, [12]])
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),np.transpose(trajectory_RF[[12], :]))
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),Test_Trajectory[:, [13]])
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),np.transpose(trajectory_RF[[13], :]))
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),Test_Trajectory[:, [14]])
# plt.show()
# plt.plot(range(GP.NumberOfTimeInstances),np.transpose(trajectory_RF[[14], :]))
# plt.show()
print(np.linalg.norm(Test_Trajectory-np.transpose(trajectory_RF)))
Robot_JointAngles = np.zeros((GP.NumberOfTimeInstances, 19))

for i in range(GP.NumberOfTimeInstances):
    Robot_JointAngles[i][:] = dynamixel.rad_model_to_dynamixel(Gait_JointAngles[i][:])

## wysyłanie tego do pliku
file = open("output.txt", "a")
for i in range(gp.NumberOfTimeInstances):
    file.write(Robot_JointAngles[:,i-1])
file.close()