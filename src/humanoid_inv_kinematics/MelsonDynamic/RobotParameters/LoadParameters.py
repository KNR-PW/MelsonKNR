import numpy as np
import math

import Kinematics as kin
import ModelParameters as mp
import GaitParameters as gp

# Joint angles order:
# q = [ q(1) , q(2),  q(3),  q(4),   q(5),    q(6),    q(7),  q(8),  q(9),  q(10),
#       q(11),   q(12),   q(13), q(14), q(15),  q(16), q(17), q(18),  q(19) ]
# q = [ RHipZ, RHipX, RHipY, RKneeY, RAnkleY, RAnkleX, LHipZ, LHipX, LHipY, LKneeY, LAnkleY, LAnkleX,
#      RArmX, RArmY, RFarmX, RArmX, RArmY, RFarmX, Waist ]

## 1. LoadModelParameters

## 2. LoadGaitParameters

## 3. Start and End of motion
# Where robot starts:
rot_RF_start = np.eye(3)
r_RF_start = np.array([[0], [-42.8-gp.offset], [0]]) - rot_RF_start @ mp.r_RF_center

rot_LF_start = np.eye(3)
r_LF_start = np.array([[0],  [42.8+gp.offset], [0]]) - rot_LF_start @ mp.r_LF_center

r_W_start = np.array([[0], [0], [gp.StepPelvisHeight]])
rot_W_start = np.eye(3)

r_LH_start = kin.DKS_LeftHand(mp, r_W_start, rot_W_start, np.array([0, 15, -45]) * math.pi/180, 0)
r_RH_start = kin.DKS_RightHand(mp, r_W_start, rot_W_start, np.array([0, -15, -45]) * math.pi/180, 0)

r_CoM_start = r_W_start + np.array([[0], [0], [mp.r_W_RT[2]]])     # FROM r_w_o and constant vector
q_start = kin.IKS_Global(mp, r_W_start, rot_W_start, r_LF_start, rot_LF_start, r_RF_start, rot_RF_start, r_LH_start, r_RH_start, 0)  # IKS for xxx_0

# Where robot ends:
r_where_to_go = np.array([[210], [0], [0]])
ang_fin = 0*math.pi/180
rot_where_to_go = np.array([[math.cos(ang_fin), -math.sin(ang_fin), 0], [math.sin(ang_fin), math.cos(ang_fin), 0], [0, 0, 1]])

rot_RF_final = rot_where_to_go @ np.eye(3)
r_RF_final = r_where_to_go + rot_where_to_go @ (np.array([[0], [-42.8-gp.offset], [0]]) - mp.r_RF_center)

rot_LF_final = rot_where_to_go @ np.eye(3)
r_LF_final = r_where_to_go + rot_where_to_go * ( np.array([[0], [42.8+gp.offset], [0]]) - mp.r_LF_center)

r_W_final = r_where_to_go + np.array([[0], [0], [gp.StepPelvisHeight]])
rot_W_final = rot_where_to_go * np.eye(3)

r_LH_final = kin.DKS_LeftHand(mp, r_W_final, rot_W_final, np.multiply(np.array([0, 15, -45]), math.pi/180), 0)
r_RH_final = kin.DKS_RightHand(mp, r_W_final, rot_W_final, np.multiply(np.array([0, -15, -45]), math.pi/180), 0)

r_CoM_final = r_W_final + np.array([[0], [0], [mp.r_W_RT(3)]])  # FROM r_w_final and constant vector
q_final = kin.IKS_Global(mp, r_W_final, rot_W_final, r_LF_final, rot_LF_final, r_RF_final, rot_RF_final, r_LH_final, r_RH_final, 0)

## Create structures and load initial and terminal conditions
#LoadInitialConditions
#LoadTerminalConditions


## Clear arrays
# q_start = []
# rot_RF_start = []
# r_RF_start = []
# rot_LF_start = []
# r_LF_start = []
# r_W_start = []
# rot_W_start = []
# r_LH_start = []
# r_RH_start = []
# r_CoM_start = []
# q_final = []
# rot_RF_final = []
# r_RF_final = []
# rot_LF_final = []
# r_LF_final = []
# r_W_final = []
# rot_W_final = []
# r_LH_final = []
# r_RH_final = []
# r_CoM_final = []
# rot_where_to_go = []
# r_where_to_go = []
# ang_fin = []

# TODO: Check gait parameters
#[GaitParameters] = RobotParameters.GaitParametersCheck(GaitParameters)
