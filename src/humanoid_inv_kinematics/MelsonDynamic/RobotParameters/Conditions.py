import numpy as np

import GaitParameters as gp
import ModelParameters as mp
import LoadParameters as lp
import Kinematics as kin

## TODO: Sprawdzić jak dziqłają wektory[] ostatni i pierwszy wyraz (chyba od 0 do n-1)

# -------------------- Initial Conditions ---------------------------

 # Need in workspace:
 #   - NumberOfTimeinstances
 #   - RobotModelParameters
 #   - q_start
 #   - r_W_start
 #   - rot_W_start
 #   - r_CoM_start
 # To be created and defined(1):
 #   - GaitSupportPolygon
 #   - CharPointsContactOnOff
 #   - GaitCoMPosition
 #   - GaitEndPointsTrajectory
 #   - GaitPhases


## End Points Position (and orientation]
class PointsPositionAndOrientation:
    def __init__(self, r_W, rot_W, r_RF, rot_RF, r_LF, rot_LF, r_LH, r_RH):
        self.r_W = r_W
        self.rot_W = rot_W
        self.r_RF=r_RF
        self.rot_RF=rot_RF
        self.r_LF=r_LF
        self.rot_LF=rot_LF
        self.r_LH=r_LH
        self.r_RH=r_RH

GaitEndPointsTrajectory=PointsPositionAndOrientation(np.zeros((3,gp.NumberOfTimeInstances)), np.zeros((3,3,gp.NumberOfTimeInstances)),
                                                     np.zeros((3,gp.NumberOfTimeInstances)),
                                                     np.zeros((3,3,gp.NumberOfTimeInstances)), np.zeros((3,gp.NumberOfTimeInstances)),
                                                     np.zeros((3,3,gp.NumberOfTimeInstances)),
                                                     np.zeros((3,gp.NumberOfTimeInstances)), np.zeros((3,gp.NumberOfTimeInstances)))
GaitEndPointsTrajectory.r_W[:, [0]] = lp.r_W_start
GaitEndPointsTrajectory.r_RF[:,[0]] = lp.r_W_start + lp.rot_W_start @ ( mp.r_W_RT +  kin.rotZ(lp.q_start[0]) @ kin.rotX(lp.q_start[1]) @ kin.rotY(lp.q_start[2]) @ ( mp.r_RT_RS + kin.rotY(lp.q_start[3]) @ (mp.r_RS_RF) ) )
GaitEndPointsTrajectory.rot_W[:,:,[0]] = lp.rot_W_start[:,:,np.newaxis]
GaitEndPointsTrajectory.rot_RF[:,:,[0]] = (lp.rot_W_start @ kin.rotZ(lp.q_start[0]) @ kin.rotX(lp.q_start[1]) @ kin.rotY(lp.q_start[2]) @ kin.rotY(lp.q_start[3]) @ kin.rotY(lp.q_start[4]) @ kin.rotX(lp.q_start[5]))[:,:,np.newaxis]
GaitEndPointsTrajectory.r_LF[:,[0]] = lp.r_W_start + lp.rot_W_start @ ( mp.r_W_LT +  kin.rotZ(lp.q_start[6]) @ kin.rotX(lp.q_start[7]) @ kin.rotY(lp.q_start[8]) @ ( mp.r_LT_LS + kin.rotY(lp.q_start[9]) @ (mp.r_LS_LF) ) )
GaitEndPointsTrajectory.rot_LF[:,:,[0]] = (lp.rot_W_start @ kin.rotZ(lp.q_start[6]) @ kin.rotX(lp.q_start[7]) @ kin.rotY(lp.q_start[8]) @ kin.rotY(lp.q_start[9]) @ kin.rotY(lp.q_start[10]) @ kin.rotX(lp.q_start[11]))[:,:,np.newaxis]
GaitEndPointsTrajectory.r_LH[:,[0]] = lp.r_W_start + lp.rot_W_start @ (mp.r_W_CH + kin.rotZ(lp.q_start[18]) @ (mp.r_CH_LA + kin.rotY(lp.q_start[15]) @ kin.rotX(lp.q_start[16]) @ (mp.r_LA_LFA + kin.rotY(lp.q_start[17]) @ mp.r_LFA_LH)))
GaitEndPointsTrajectory.r_RH[:,[0]] = lp.r_W_start + lp.rot_W_start @ (mp.r_W_CH + kin.rotZ(lp.q_start[18]) @ (mp.r_CH_RA + kin.rotY(lp.q_start[12]) @ kin.rotX(lp.q_start[13]) @ (mp.r_RA_RFA + kin.rotY(lp.q_start[14]) @ mp.r_RFA_RH)))

## Support Polygon
class SupportPolygon:
    def __init__(self, LeftFootLeftToes, LeftFootRightToes, LeftFootLeftHeel, LeftFootRightHeel, LeftFootCenter,
                 RightFootLeftToes, RightFootRightToes, RightFootLeftHeel, RightFootRightHeel, RightFootCenter):

        self.LeftFootLeftToes = LeftFootLeftToes
        self.LeftFootRightToes = LeftFootRightToes
        self.LeftFootLeftHeel=LeftFootLeftHeel
        self.LeftFootRightHeel=LeftFootRightHeel
        self.LeftFootCenter=LeftFootCenter
        self.RightFootLeftToes=RightFootLeftToes
        self.RightFootRightToes=RightFootRightToes
        self.RightFootLeftHeel=RightFootLeftHeel
        self.RightFootRightHeel = RightFootRightHeel
        self.RightFootCenter = RightFootCenter

GaitSupportPolygon=SupportPolygon(np.zeros((3,gp.NumberOfTimeInstances)), np.zeros((3,gp.NumberOfTimeInstances)), np.zeros((3,gp.NumberOfTimeInstances)),
                                  np.zeros((3,gp.NumberOfTimeInstances)),  np.zeros((3,gp.NumberOfTimeInstances)), np.zeros((3,gp.NumberOfTimeInstances)),
                                  np.zeros((3,gp.NumberOfTimeInstances)), np.zeros((3,gp.NumberOfTimeInstances)), np.zeros((3,gp.NumberOfTimeInstances)),
                                  np.zeros((3,gp.NumberOfTimeInstances)))

CharPointsContactOnOff=SupportPolygon(np.zeros((1,gp.NumberOfTimeInstances)), np.zeros((1,gp.NumberOfTimeInstances)), np.zeros((1,gp.NumberOfTimeInstances)),
                                      np.zeros((1,gp.NumberOfTimeInstances)), np.zeros((1,gp.NumberOfTimeInstances)), np.zeros((1,gp.NumberOfTimeInstances)),
                                      np.zeros((1,gp.NumberOfTimeInstances)), np.zeros((1,gp.NumberOfTimeInstances)), np.zeros((1,gp.NumberOfTimeInstances)),
                                      np.zeros((1,gp.NumberOfTimeInstances)))


# Generate Initial condition
GaitSupportPolygon.LeftFootLeftToes[:,[0]] = GaitEndPointsTrajectory.r_LF[:,[0]] + GaitEndPointsTrajectory.rot_LF[:,:,[0]] @ mp.r_LF_left_toe
GaitSupportPolygon.LeftFootRightToes[:,[0]] = GaitEndPointsTrajectory.r_LF[:,[0]] + GaitEndPointsTrajectory.rot_LF[:,:,[0]] @ mp.r_LF_right_toe
GaitSupportPolygon.LeftFootLeftHeel[:,[0]] = GaitEndPointsTrajectory.r_LF[:,[0]] + GaitEndPointsTrajectory.rot_LF[:,:,[0]] @ mp.r_LF_left_heel
GaitSupportPolygon.LeftFootRightHeel[:,[0]] = GaitEndPointsTrajectory.r_LF[:,[0]] + GaitEndPointsTrajectory.rot_LF[:,:,[0]] @ mp.r_LF_right_heel
GaitSupportPolygon.LeftFootCenter[:,[0]] = GaitEndPointsTrajectory.r_LF[:,[0]] + GaitEndPointsTrajectory.rot_LF[:,:,[0]] @ mp.r_LF_center
GaitSupportPolygon.RightFootLeftToes[:,[0]] = GaitEndPointsTrajectory.r_RF[:,[0]] + GaitEndPointsTrajectory.rot_RF[:,:,[0]] @ mp.r_RF_left_toe
GaitSupportPolygon.RightFootRightToes[:,[0]] = GaitEndPointsTrajectory.r_RF[:,[0]] + GaitEndPointsTrajectory.rot_RF[:,:,[0]] @ mp.r_RF_right_toe
GaitSupportPolygon.RightFootLeftHeel[:,[0]] = GaitEndPointsTrajectory.r_RF[:,[0]] + GaitEndPointsTrajectory.rot_RF[:,:,[0]] @ mp.r_RF_left_heel
GaitSupportPolygon.RightFootRightHeel[:,[0]] = GaitEndPointsTrajectory.r_RF[:,[0]] + GaitEndPointsTrajectory.rot_RF[:,:,[0]] @ mp.r_RF_right_heel
GaitSupportPolygon.RightFootCenter[:,[0]] = GaitEndPointsTrajectory.r_RF[:,[0]] + GaitEndPointsTrajectory.rot_RF[:,:,[0]] @ mp.r_RF_center

CharPointsContactOnOff.LeftFootLeftToes[0] = True
CharPointsContactOnOff.LeftFootRightToes[0] = True
CharPointsContactOnOff.LeftFootLeftHeel[0] = True
CharPointsContactOnOff.LeftFootRightHeel[0] = True
CharPointsContactOnOff.LeftFootCenter[0] = True
CharPointsContactOnOff.RightFootLeftToes[0] = True
CharPointsContactOnOff.RightFootRightToes[0] = True
CharPointsContactOnOff.RightFootLeftHeel[0] = True
CharPointsContactOnOff.RightFootRightHeel[0] = True
CharPointsContactOnOff.RightFootCenter[0] = True

##TODO: zobaczyc czemu zakomentowane \/ \/ \/

## Center of Mass Position
#GaitCoMPosition = np.zeros(3,gp.NumberOfTimeInstances)
#GaitCoMPosition[:,0] = r_CoM_start

## ZMP Trajectory
GaitCoMTrajectory = np.zeros((3,gp.NumberOfTimeInstances))
GaitZMPReferenceTrajectory = np.zeros((2,gp.NumberOfTimeInstances))
GaitZMPPlannedTrajectory = np.zeros((2,gp.NumberOfTimeInstances))

## Gait phases

class PhasesOfGait:
    def __init__(self, LeftLeg, RightLeg):
        self.LeftLeg = LeftLeg
        self.RightLeg = RightLeg


GaitPhases=PhasesOfGait(np.zeros((1,gp.NumberOfTimeInstances)).astype(str), np.zeros((1,gp.NumberOfTimeInstances)).astype(str))

GaitPhases.LeftLeg[0] = "support"
GaitPhases.RightLeg[0] = "support"

# -------------------- Terminal Conditions ---------------------------

# Need in workspace:
#   - NumberOfTimeinstances
#   - RobotModelParameters
#   - q_final
#   - r_W_final
#   - rot_W_final
#   - r_CoM_final
#   - GaitSupportPolygon
#   - CharPointsContactOnOff
#   - GaitCoMPosition
#   - GaitEndPointsTrajectory
# To be defined(last):
#   - GaitSupportPolygon
#   - CharPointsContactOnOff
#   - GaitCoMPosition
#   - GaitEndPointsTrajectory

##TODO: zobaczyc czemu zakomentowane \/ \/ \/

## End Points Position (and orientation)
GaitEndPointsTrajectory.r_W[:,gp.NumberOfTimeInstances] = lp.r_W_final
GaitEndPointsTrajectory.rot_W[:,:,gp.NumberOfTimeInstances] = lp.rot_W_final
GaitEndPointsTrajectory.r_RF[:,gp.NumberOfTimeInstances] = lp.r_W_final + lp.rot_W_final @ ( mp.r_W_RT +  kin.rotZ(lp.q_final[0]) @ kin.rotX(lp.q_final[1]) @ kin.rotY(lp.q_final[2]) @ ( mp.r_RT_RS + kin.rotY(lp.q_final[3]) @ (mp.r_RS_RF) ) )
GaitEndPointsTrajectory.rot_RF[:,:,gp.NumberOfTimeInstances] = lp.rot_W_final @ kin.rotZ(lp.q_final[0]) @ kin.rotX(lp.q_final[1]) @ kin.rotY(lp.q_final[2]) @ kin.rotY(lp.q_final[3]) @ kin.rotY(lp.q_final[4]) @ kin.rotX(lp.q_final[5])
GaitEndPointsTrajectory.r_LF[:,gp.NumberOfTimeInstances] = lp.r_W_final + lp.rot_W_final @ ( mp.r_W_LT +  kin.rotZ(lp.q_final[6]) @ kin.rotX(lp.q_final[7]) @ kin.rotY(lp.q_final[8]) @ ( mp.r_LT_LS + kin.rotY(lp.q_final[9]) @ (mp.r_LS_LF) ) )
GaitEndPointsTrajectory.rot_LF[:,:,gp.NumberOfTimeInstances] = lp.rot_W_final @ kin.rotZ(lp.q_final[6]) @ kin.rotX(lp.q_final[7]) @ kin.rotY(lp.q_final[8]) @ kin.rotY(lp.q_final[9]) @ kin.rotY(lp.q_final[10]) @ kin.rotX(lp.q_final[11])
GaitEndPointsTrajectory.r_LH[:,gp.NumberOfTimeInstances] = lp.r_W_final + lp.rot_W_final @ (mp.r_W_CH + kin.rotZ(lp.q_final[18]) @ (mp.r_CH_LA + kin.rotY(lp.q_final[15]) @ kin.rotX(lp.q_final[16]) @ (mp.r_LA_LFA + kin.rotY(lp.q_final[17]) @ mp.r_LFA_LH)))
#GaitEndPointsTrajectory.rot_LH[:,:,0] =
GaitEndPointsTrajectory.r_RH[:,gp.NumberOfTimeInstances] = lp.r_W_final + lp.rot_W_final @ (mp.r_W_CH + kin.rotZ(lp.q_final[18]) @ (mp.r_CH_RA + kin.rotY(lp.q_final[12]) @ kin.rotX(lp.q_final[13]) @ (mp.r_RA_RFA + kin.rotY(lp.q_final[14]) @ mp.r_RFA_RH)))
#GaitEndPointsTrajectory.rot_RH[:,:,0] =

## Support Polygon
GaitSupportPolygon.LeftFootLeftToes[:,gp.NumberOfTimeInstances] = GaitEndPointsTrajectory.r_LF[:,gp.NumberOfTimeInstances] + GaitEndPointsTrajectory.rot_LF[:,:,gp.NumberOfTimeInstances] @ mp.r_LF_left_toe
GaitSupportPolygon.LeftFootRightToes[:,gp.NumberOfTimeInstances] = GaitEndPointsTrajectory.r_LF[:,gp.NumberOfTimeInstances] + GaitEndPointsTrajectory.rot_LF[:,:,gp.NumberOfTimeInstances] @ mp.r_LF_right_toe
GaitSupportPolygon.LeftFootLeftHeel[:,gp.NumberOfTimeInstances] = GaitEndPointsTrajectory.r_LF[:,gp.NumberOfTimeInstances] + GaitEndPointsTrajectory.rot_LF[:,:,gp.NumberOfTimeInstances] @ mp.r_LF_left_heel
GaitSupportPolygon.LeftFootRightHeel[:,gp.NumberOfTimeInstances] = GaitEndPointsTrajectory.r_LF[:,gp.NumberOfTimeInstances] + GaitEndPointsTrajectory.rot_LF[:,:,gp.NumberOfTimeInstances] @ mp.r_LF_right_heel
GaitSupportPolygon.LeftFootCenter[:,gp.NumberOfTimeInstances] = GaitEndPointsTrajectory.r_LF[:,gp.NumberOfTimeInstances] + GaitEndPointsTrajectory.rot_LF[:,:,gp.NumberOfTimeInstances] @ mp.r_LF_center
GaitSupportPolygon.RightFootLeftToes[:,gp.NumberOfTimeInstances] = GaitEndPointsTrajectory.r_RF[:,gp.NumberOfTimeInstances] + GaitEndPointsTrajectory.rot_RF[:,:,gp.NumberOfTimeInstances] @ mp.r_RF_left_toe
GaitSupportPolygon.RightFootRightToes[:,gp.NumberOfTimeInstances] = GaitEndPointsTrajectory.r_RF[:,gp.NumberOfTimeInstances] + GaitEndPointsTrajectory.rot_RF[:,:,gp.NumberOfTimeInstances] @ mp.r_RF_right_toe
GaitSupportPolygon.RightFootLeftHeel[:,gp.NumberOfTimeInstances] = GaitEndPointsTrajectory.r_RF[:,gp.NumberOfTimeInstances] + GaitEndPointsTrajectory.rot_RF[:,:,gp.NumberOfTimeInstances] @ mp.r_RF_left_heel
GaitSupportPolygon.RightFootRightHeel[:,gp.NumberOfTimeInstances] = GaitEndPointsTrajectory.r_RF[:,gp.NumberOfTimeInstances] + GaitEndPointsTrajectory.rot_RF[:,:,gp.NumberOfTimeInstances] @ mp.r_RF_right_heel
GaitSupportPolygon.RightFootCenter[:,gp.NumberOfTimeInstances] = GaitEndPointsTrajectory.r_RF[:,gp.NumberOfTimeInstances] + GaitEndPointsTrajectory.rot_RF[:,:,gp.NumberOfTimeInstances] @ mp.r_RF_center


CharPointsContactOnOff.LeftFootLeftToes[gp.NumberOfTimeInstances] = True
CharPointsContactOnOff.LeftFootRightToes[gp.NumberOfTimeInstances] = True
CharPointsContactOnOff.LeftFootLeftHeel[gp.NumberOfTimeInstances] = True
CharPointsContactOnOff.LeftFootRightHeel[gp.NumberOfTimeInstances] = True
CharPointsContactOnOff.LeftFootCenter[gp.NumberOfTimeInstances] = True
CharPointsContactOnOff.RightFootLeftToes[gp.NumberOfTimeInstances] = True
CharPointsContactOnOff.RightFootRightToes[gp.NumberOfTimeInstances] = True
CharPointsContactOnOff.RightFootLeftHeel[gp.NumberOfTimeInstances] = True
CharPointsContactOnOff.RightFootRightHeel[gp.NumberOfTimeInstances] = True
CharPointsContactOnOff.RightFootCenter[gp.NumberOfTimeInstances] = True

## Center of Mass Position
GaitCoMTrajectory[:,gp.NumberOfTimeInstances] = lp.r_CoM_final

## Gait phases
GaitPhases.LeftLeg[gp.NumberOfTimeInstances] = 'support'
GaitPhases.RightLeg[gp.NumberOfTimeInstances] = 'support'
