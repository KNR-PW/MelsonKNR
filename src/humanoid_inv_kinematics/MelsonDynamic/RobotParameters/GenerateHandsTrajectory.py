import numpy

import GaitParameters as GP
import numpy as np
from src.humanoid_inv_kinematics.MelsonDynamic.ConvertToRF import rot2euler
import GaitStepPlanner as GSP
from Kinematics import rotZ

for TimeIter in range(GP.NumberOfTimeInstances):

    r_center = (GSP.con.GaitEndPointsTrajectory.r_RF[:, TimeIter-1] + GSP.con.GaitEndPointsTrajectory.r_LF[:, TimeIter-1]) / 2
    r_center[2] = 0

    rot_RF = GSP.con.GaitEndPointsTrajectory.rot_RF[:,:, TimeIter-1]
    rot_LF = GSP.con.GaitEndPointsTrajectory.rot_LF[:,:, TimeIter-1]

    e_RF = rot2euler(rot_RF)
    e_LF = rot2euler(rot_LF)

    angleZ = (e_RF[0] + e_LF[0]) / 2

    rot = rotZ(angleZ)

    r_CoM_2d = GSP.con.GaitCoMTrajectory[:, TimeIter-1]
    r_CoM_2d[2] = 0

    r_center_CoM = (r_CoM_2d - r_center)

    r_hands = np.zeros((1, 3))
    r_hands[0][0] = r_center_CoM[0]
    r_hands[0][1] = 2.5 * r_center_CoM[1]
    r_hands[0][2] = GP.StepPelvisHeight + 30
    r_RH = r_center + r_hands + rot @ np.array([80, -140, 0])
    r_LH = r_center + r_hands + rot @ np.array([80, 140, 0])

    GSP.con.GaitEndPointsTrajectory.r_RH[:, [TimeIter-1]] = np.transpose(r_RH)
    GSP.con.GaitEndPointsTrajectory.r_LH[:, [TimeIter-1]] = np.transpose(r_LH)
