import numpy as np
import math

import ModelParameters as mp
import GaitParameters as gp
import Conditions as con

# 1. Znam liczbe kroków i udzial procentowy kolejnych faz (DS SS) -> okresl
# wszystkie fazy chodu dla calego czasu
# 2. Zaznacz, które punkty beda dotykac podloza w danej chwili, a które nie
# 3. Okresl pololenie i orientacje stóp w chwilach gdy dotykaja podloza
# 4. okresl pololenia i orientacje stóp dla faz 'transfer'
# 5. Okresl pololenia dloni (?)


def GetZFromRotM(rotM):
    alpha = math.atan2(rotM[1,0],rotM[1,1])
    return alpha
def GetRotMFromAnglesCB(angles):
    rotM = np.array([[math.cos(angles(3)), -math.sin(angles(3)), 0], [math.sin(angles(3)), math.cos(angles(3)), 0], [0, 0, 1]])
    return rotM


def r_GenerateStep(r_start, r_end, SamplesNumber, stepHeight):

    tstart = 0
    tfinal = SamplesNumber
    tmid = (tstart + tfinal) / 2

    [a5, a4, a3, a2, a1, a0] = createTraj5(r_start(1), r_end(1), 0, 0, 0, 0, tstart, tfinal)
    pval_x = [a5, a4, a3, a2, a1, a0]
    [a5, a4, a3, a2, a1, a0] = createTraj5(r_start(2), r_end(2), 0, 0, 0, 0, tstart, tfinal)
    pval_y = [a5, a4, a3, a2, a1, a0]

    [a3, a2, a1, a0] = createTraj3(r_start(3), stepHeight, 0, 0, tstart, tmid)
    pval_z_first = [a3, a2, a1, a0]
    [a3, a2, a1, a0] = createTraj3(stepHeight, r_end(3), 0, 0, tmid, tfinal)
    pval_z_second = [a3, a2, a1, a0]

    tx = linspace(tstart, tfinal, SamplesNumber)
    ty = linspace(tstart, tfinal, SamplesNumber)
    tz_first = linspace(tstart, tmid, fix(SamplesNumber / 2))
    tz_second = linspace(tmid - tmid, tfinal - tmid, SamplesNumber - fix(SamplesNumber / 2))
    r_x = polyval(pval_x, tx)
    r_y = polyval(pval_y, ty)
    r_z_first = polyval(pval_z_first, tz_first)
    r_z_second = polyval(pval_z_second, tz_second)

    r_out = np.array([[r_x], [r_y], [r_z_first], [r_z_second]])
    return r_out


## Plan phases
#TODO: check num of steps. diff == 1
NumberOfDSPhases = 1 + gp.NumOfStepsLeftLeg + gp.NumOfStepsRightLeg
NumberOfSSPhases = gp.NumOfStepsLeftLeg + gp.NumOfStepsRightLeg
PhaseDivider = NumberOfDSPhases * gp.PARAM_DS + NumberOfSSPhases * gp.PARAM_SS

if gp.NumOfStepsLeftLeg > gp.NumOfStepsRightLeg:
    WhichLegSupportingInSS = 'right'  # and same in last DS
else:
    WhichLegSupportingInSS = 'left'  # and same in last DS

WhichPhase = 'DS'
PhaseNumber = 1

for TimeIter in gp.NumberOfTimeInstances:
    if WhichPhase == 'DS':
        con.GaitPhases.LeftLeg[TimeIter] = 'support'
        con.GaitPhases.RightLeg[TimeIter] = 'support'
    elif WhichPhase == 'SS':
        if WhichLegSupportingInSS == 'right':
            con.GaitPhases.LeftLeg[TimeIter] = 'transfer'
            con.GaitPhases.RightLeg[TimeIter] = 'support'
        else:
            con.GaitPhases.LeftLeg[TimeIter] = 'support'
            con.GaitPhases.RightLeg[TimeIter] = 'transfer'



    if TimeIter > gp.NumberOfTimeInstances * ( gp.PARAM_DS * round((1+PhaseNumber)/2) + gp.PARAM_SS * round((PhaseNumber)/2)) / PhaseDivider:
        PhaseNumber = PhaseNumber + 1
        if WhichPhase == 'DS':
            WhichPhase = 'SS'
        else:
            WhichPhase = 'DS'
            if WhichLegSupportingInSS == 'right':
                WhichLegSupportingInSS = 'left'
            else:
                WhichLegSupportingInSS = 'right'

## Plan contact

for TimeIter in gp.NumberOfTimeInstances:
    if con.GaitPhases.LeftLeg[TimeIter] == 'support':
        con.CharPointsContactOnOff.LeftFootLeftToes[TimeIter] = True
        con.CharPointsContactOnOff.LeftFootRightToes[TimeIter] = True
        con.CharPointsContactOnOff.LeftFootLeftHeel[TimeIter] = True
        con.CharPointsContactOnOff.LeftFootRightHeel[TimeIter] = True
        con.CharPointsContactOnOff.LeftFootCenter[TimeIter] = True
    else:
        con.CharPointsContactOnOff.LeftFootLeftToes[TimeIter] = False
        con.CharPointsContactOnOff.LeftFootRightToes[TimeIter] = False
        con.CharPointsContactOnOff.LeftFootLeftHeel[TimeIter] = False
        con.CharPointsContactOnOff.LeftFootRightHeel[TimeIter] = False
        con.CharPointsContactOnOff.LeftFootCenter[TimeIter] = False

    if con.GaitPhases.RightLeg[TimeIter] == 'support':
        con.CharPointsContactOnOff.RightFootLeftToes[TimeIter] = True
        con.CharPointsContactOnOff.RightFootRightToes[TimeIter] = True
        con.CharPointsContactOnOff.RightFootLeftHeel[TimeIter] = True
        con.CharPointsContactOnOff.RightFootRightHeel[TimeIter] = True
        con.CharPointsContactOnOff.RightFootCenter[TimeIter] = True
    else:
        con.CharPointsContactOnOff.RightFootLeftToes[TimeIter] = False
        con.CharPointsContactOnOff.RightFootRightToes[TimeIter] = False
        con.CharPointsContactOnOff.RightFootLeftHeel[TimeIter] = False
        con.CharPointsContactOnOff.RightFootRightHeel[TimeIter] = False
        con.CharPointsContactOnOff.RightFootCenter[TimeIter] = False

## Foot position and orientation on ground
# temporary variables, to be transferred to EndPointsTrajectory
r_LeftFootOnGround = np.zeros(3, gp.NumOfStepsLeftLeg + 1)
r_RightFootOnGround = np.zeros(3, gp.NumOfStepsRightLeg + 1)
anglesCB_LeftFootOnGround = np.zeros(3, gp.NumOfStepsLeftLeg + 1)  # Cardano Bryant - rotation x y z, intrinsic
anglesCB_RightFootOnGround = np.zeros(3, gp.NumOfStepsRightLeg + 1)  # Cardano Bryant - rotation x y z, intrinsic

r_LeftFootOnGround[:, gp.NumOfStepsLeftLeg + 1] = con.GaitEndPointsTrajectory.r_LF[:, gp.NumberOfTimeInstances]
r_LeftFootOnGround[:, 1] = con.GaitEndPointsTrajectory.r_LF[:, 1]
r_RightFootOnGround[:, gp.NumOfStepsRightLeg + 1] = con.GaitEndPointsTrajectory.r_RF[:, gp.NumberOfTimeInstances]
r_RightFootOnGround[:, 1] = con.GaitEndPointsTrajectory.r_RF[:, 1]

anglesCB_LeftFootOnGround[:, gp.NumOfStepsLeftLeg + 1] = [0, 0, GetZFromRotM(con.GaitEndPointsTrajectory.rot_LF[:, :, gp.NumberOfTimeInstances] )]
anglesCB_LeftFootOnGround[:, 1] = [0, 0, GetZFromRotM(con.GaitEndPointsTrajectory.rot_LF[:,:, 1])]
anglesCB_RightFootOnGround[:, gp.NumOfStepsRightLeg + 1] = [0, 0, GetZFromRotM(con.GaitEndPointsTrajectory.rot_RF[:, :, gp.NumberOfTimeInstances])]
anglesCB_RightFootOnGround[:, 1] = [0, 0, GetZFromRotM(con.GaitEndPointsTrajectory.rot_RF[:,:, 1])]

if gp.NumOfStepsLeftLeg > gp.NumOfStepsRightLeg:  # if left leg starts
    # Left leg starts

    if gp.NumOfStepsLeftLeg >= 3:
        for IterPos in range(2, gp.NumOfStepsLeftLeg):
            r_LeftFootOnGround[:, IterPos] = con.GaitEndPointsTrajectory.r_LF[:, 1]\
                                             + (r_LeftFootOnGround[:, gp.NumOfStepsLeftLeg + 1] - r_LeftFootOnGround[:, 1]) * (IterPos - 1.5) / (gp.NumOfStepsLeftLeg - 1)
            anglesCB_LeftFootOnGround[:, IterPos] = anglesCB_LeftFootOnGround[:, 1]\
                                                    + (anglesCB_LeftFootOnGround[:, gp.NumOfStepsLeftLeg + 1] - anglesCB_LeftFootOnGround[:, 1])*(IterPos - 1.5) / ( gp.NumOfStepsLeftLeg - 1)

    elif gp.NumOfStepsLeftLeg >= 2:
        for IterPos in range(2, gp.NumOfStepsLeftLeg):
            r_LeftFootOnGround[:, IterPos] = con.GaitEndPointsTrajectory.r_LF[:, 1]\
                                             + (r_LeftFootOnGround[:, gp.NumOfStepsLeftLeg + 1] - r_LeftFootOnGround[:, 1])*(IterPos - 1) / gp.NumOfStepsLeftLeg
            anglesCB_LeftFootOnGround[:, IterPos] = anglesCB_LeftFootOnGround[:, 1]\
                                                    + (anglesCB_LeftFootOnGround[:, gp.NumOfStepsLeftLeg + 1] - anglesCB_LeftFootOnGround[:, 1])*(IterPos - 1) / (gp.NumOfStepsLeftLeg)


    if gp.NumOfStepsRightLeg >= 2:  # if right foot transfers twice then calculate middle positions
        for IterPos in range(2, gp.NumOfStepsRightLeg):
            r_RightFootOnGround[:, IterPos] = con.GaitEndPointsTrajectory.r_RF[:, 1]\
                                              + (r_RightFootOnGround[:, gp.NumOfStepsRightLeg + 1] - r_RightFootOnGround[:, 1])*(IterPos - 1) / gp.NumOfStepsRightLeg
            anglesCB_RightFootOnGround[:, IterPos] = anglesCB_RightFootOnGround[:, 1]\
                                                     + (anglesCB_RightFootOnGround[:, gp.NumOfStepsRightLeg + 1] - anglesCB_RightFootOnGround[:, 1])*(IterPos - 1) / (gp.NumOfStepsRightLeg)


elif gp.NumOfStepsLeftLeg < gp.NumOfStepsRightLeg:  # Right leg starts
    if gp.NumOfStepsLeftLeg >= 2: # if left foot transfers twice then calculate middle positions
        for IterPos in range(2, gp.NumOfStepsLeftLeg):
            r_LeftFootOnGround[:, IterPos] = con.GaitEndPointsTrajectory.r_LF[:, 1]\
                                             + (r_LeftFootOnGround[:, gp.NumOfStepsLeftLeg + 1] - r_LeftFootOnGround[:, 1])*(IterPos - 1) / gp.NumOfStepsLeftLeg
            anglesCB_LeftFootOnGround[:, IterPos] = anglesCB_LeftFootOnGround[:, 1]\
                                                    + (anglesCB_LeftFootOnGround[:, gp.NumOfStepsLeftLeg + 1] - anglesCB_LeftFootOnGround[:, 1])*(IterPos - 1) / (gp.NumOfStepsLeftLeg)


    if gp.NumOfStepsRightLeg >= 3:
        for IterPos in range(2, gp.NumOfStepsRightLeg):
            r_RightFootOnGround[:, IterPos] = con.GaitEndPointsTrajectory.r_RF[:, 1]\
                                              + (r_RightFootOnGround[:, gp.NumOfStepsRightLeg + 1] - r_RightFootOnGround[:, 1])*(IterPos - 1.5) / (gp.NumOfStepsRightLeg - 1)
            anglesCB_RightFootOnGround[:, IterPos] = anglesCB_RightFootOnGround[:, 1]\
                                                     + (anglesCB_RightFootOnGround[:, gp.NumOfStepsRightLeg + 1] - anglesCB_RightFootOnGround[:, 1])*(IterPos - 1.5) / (gp.NumOfStepsRightLeg - 1)

    elif gp.NumOfStepsRightLeg >= 2:
        for IterPos in range(2, gp.NumOfStepsRightLeg):
            r_RightFootOnGround[:, IterPos] = con.GaitEndPointsTrajectory.r_RF[:, 1]\
                                              + (r_RightFootOnGround[:, gp.NumOfStepsRightLeg + 1] - r_RightFootOnGround[:, 1])*(IterPos - 1) / gp.NumOfStepsRightLeg
            anglesCB_RightFootOnGround[:, IterPos] = anglesCB_RightFootOnGround[:, 1]\
                                                     + (anglesCB_RightFootOnGround[:, gp.NumOfStepsRightLeg + 1] - anglesCB_RightFootOnGround[:, 1])*(IterPos - 1) / (gp.NumOfStepsRightLeg)


else:  # equal number of steps -> right leg starts
    if gp.NumOfStepsLeftLeg >= 2:  # if left foot transfers twice then calculate middle positions
        for IterPos in range(2, gp.NumOfStepsRightLeg):
            r_LeftFootOnGround[:, IterPos] = con.GaitEndPointsTrajectory.r_LF[:, 1]\
                                             + (r_LeftFootOnGround[:, gp.NumOfStepsLeftLeg + 1] - r_LeftFootOnGround[:, 1])*(IterPos - 1) / gp.NumOfStepsLeftLeg
            anglesCB_LeftFootOnGround[:, IterPos] = anglesCB_LeftFootOnGround[:, 1]\
                                                    + (anglesCB_LeftFootOnGround[:, gp.NumOfStepsLeftLeg + 1] - anglesCB_LeftFootOnGround[:, 1])*(IterPos - 1) / (gp.NumOfStepsLeftLeg)


    if gp.NumOfStepsRightLeg >= 2:  # if right foot transfers twice then calculate middle positions
        for IterPos in range(2, gp.NumOfStepsRightLeg):
            r_RightFootOnGround[:, IterPos] =  con.GaitEndPointsTrajectory.r_RF[:, 1]\
                                               +(r_RightFootOnGround[:, gp.NumOfStepsRightLeg + 1] - r_RightFootOnGround[:, 1])*(IterPos - 1) / gp.NumOfStepsRightLeg
            anglesCB_RightFootOnGround[:, IterPos] = anglesCB_RightFootOnGround[:, 1]\
                                                     + (anglesCB_RightFootOnGround[:, gp.NumOfStepsRightLeg + 1] - anglesCB_RightFootOnGround[:, 1])*(IterPos - 1) / (gp.NumOfStepsRightLeg)

# Fill Gait End Points Trajectory
PhaseNumberLeftFoot = 1
PhaseNumberRightFoot = 1

for TimeIter in range(1, gp.NumberOfTimeInstances):
    if con.GaitPhases.LeftLeg[TimeIter] == 'support':
        con.GaitEndPointsTrajectory.r_LF[:, TimeIter] = r_LeftFootOnGround[:,PhaseNumberLeftFoot]
        con.GaitEndPointsTrajectory.rot_LF[:, :, TimeIter] = GetRotMFromAnglesCB(anglesCB_LeftFootOnGround[:, PhaseNumberLeftFoot])
        if TimeIter < gp.NumberOfTimeInstances:
            if con.GaitPhases.LeftLeg[TimeIter + 1] == 'transfer':
                PhaseNumberLeftFoot = PhaseNumberLeftFoot + 1

    if con.GaitPhases.RightLeg[TimeIter] == 'support':
        con.GaitEndPointsTrajectory.r_RF[:, TimeIter] = r_RightFootOnGround[:,PhaseNumberRightFoot]
        con.GaitEndPointsTrajectory.rot_RF[:, :, TimeIter] = GetRotMFromAnglesCB(anglesCB_RightFootOnGround[:, PhaseNumberRightFoot])
        if TimeIter < gp.NumberOfTimeInstances:
            if con.GaitPhases.RightLeg[TimeIter + 1] == 'transfer':
                PhaseNumberRightFoot = PhaseNumberRightFoot + 1

## Foot position and orientation in transfer phases
LeftLegTransferLength = 0
RightLegTransferLength = 0

for TimeIter in range(1, gp.NumberOfTimeInstances):
    if con.GaitPhases.LeftLeg[TimeIter] == 'transfer':
        LeftLegTransferLength = LeftLegTransferLength + 1
    elif con.GaitPhases.LeftLeg[TimeIter] == 'support':
        if LeftLegTransferLength != 0:
            if (TimeIter - LeftLegTransferLength - 1) > 0:
                con.GaitEndPointsTrajectory.r_LF[:, TimeIter - LeftLegTransferLength - 1: TimeIter] = r_GenerateStep(con.GaitEndPointsTrajectory.r_LF[:, TimeIter - LeftLegTransferLength - 1], con.GaitEndPointsTrajectory.r_LF[:, TimeIter], LeftLegTransferLength + 2, gp.StepHeight)
                con.GaitEndPointsTrajectory.rot_LF[:, :, TimeIter - LeftLegTransferLength - 1: TimeIter] = rot_GenerateStep(con.GaitEndPointsTrajectory.rot_LF[:, :, TimeIter - LeftLegTransferLength - 1], con.GaitEndPointsTrajectory.rot_LF[:, :, TimeIter], LeftLegTransferLength + 2)
            #else:
                 # TODO: traj gen start( if leg started in transfer mode)
    LeftLegTransferLength = 0

# if LeftLegTransferLength != 0:
    # TODO: traj gen ( if leg ended in transfer mode)


for TimeIter in range(1, gp.NumberOfTimeInstances):
    if con.GaitPhases.LeftLeg[TimeIter] == 'transfer':
        LeftLegTransferLength = LeftLegTransferLength + 1
    elif con.GaitPhases.LeftLeg[TimeIter] == 'support':
        if LeftLegTransferLength != 0:
            if (TimeIter - LeftLegTransferLength - 1) > 0:
                con.GaitEndPointsTrajectory.r_LF[:, TimeIter - LeftLegTransferLength - 1: TimeIter] = r_GenerateStep(con.GaitEndPointsTrajectory.r_LF[:, TimeIter - LeftLegTransferLength - 1], con.GaitEndPointsTrajectory.r_LF[:, TimeIter], LeftLegTransferLength + 2, gp.StepHeight)
                con.GaitEndPointsTrajectory.rot_LF[:,:, TimeIter - LeftLegTransferLength - 1: TimeIter] = rot_GenerateStep(con.GaitEndPointsTrajectory.rot_LF[:,:, TimeIter - LeftLegTransferLength - 1], con.GaitEndPointsTrajectory.rot_LF[:,:, TimeIter], LeftLegTransferLength + 2)
            #else:
                # TODO: traj gen start( if leg started in transfer mode)

    LeftLegTransferLength = 0


    if con.GaitPhases.RightLeg[TimeIter] == 'transfer':
        RightLegTransferLength = RightLegTransferLength + 1
    elif con.GaitPhases.RightLeg[TimeIter] == 'support':
        if RightLegTransferLength != 0:
            if (TimeIter - RightLegTransferLength - 1) > 0:
                con.GaitEndPointsTrajectory.r_RF[:, TimeIter - RightLegTransferLength - 1: TimeIter] = r_GenerateStep(con.GaitEndPointsTrajectory.r_RF[:, TimeIter - RightLegTransferLength - 1], con.GaitEndPointsTrajectory.r_RF[:, TimeIter], RightLegTransferLength + 2, gp.StepHeight)
                con.GaitEndPointsTrajectory.rot_RF[:,:, TimeIter - RightLegTransferLength - 1: TimeIter] = rot_GenerateStep(con.GaitEndPointsTrajectory.rot_RF[:,:, TimeIter - RightLegTransferLength - 1], con.GaitEndPointsTrajectory.rot_RF[:,:, TimeIter], RightLegTransferLength + 2)
            #else:
                 # TODO: traj gen start( if leg started in transfer mode)

    RightLegTransferLength = 0

# if LeftLegTransferLength != 0:
    # TODO: traj gen ( if leg ended in transfer mode)

# if RightLegTransferLength != 0:
    # TODO: traj gen ( if leg ended in transfer mode)

    # Fill Gait SubPol
    for TimeIter in range(1, gp.NumberOfTimeInstances):
        con.GaitSupportPolygon.LeftFootLeftToes[:, TimeIter] = con.GaitEndPointsTrajectory.r_LF[:, TimeIter] + con.GaitEndPointsTrajectory.rot_LF[:,:, TimeIter] * mp.r_LF_left_toe
        con.GaitSupportPolygon.LeftFootRightToes[:, TimeIter] = con.GaitEndPointsTrajectory.r_LF[:, TimeIter] + con.GaitEndPointsTrajectory.rot_LF[:,:, TimeIter] * mp.r_LF_right_toe
        con.GaitSupportPolygon.LeftFootLeftHeel[:, TimeIter] = con.GaitEndPointsTrajectory.r_LF[:, TimeIter] + con.GaitEndPointsTrajectory.rot_LF[:,:, TimeIter] * mp.r_LF_left_heel
        con.GaitSupportPolygon.LeftFootRightHeel[:, TimeIter] = con.GaitEndPointsTrajectory.r_LF[:, TimeIter] + con.GaitEndPointsTrajectory.rot_LF[:,:, TimeIter] * mp.r_LF_right_heel
        con.GaitSupportPolygon.LeftFootCenter[:, TimeIter] = con.GaitEndPointsTrajectory.r_LF[:, TimeIter] + con.GaitEndPointsTrajectory.rot_LF[:,:, TimeIter] * mp.r_LF_center
        con.GaitSupportPolygon.RightFootLeftToes[:, TimeIter] = con.GaitEndPointsTrajectory.r_RF[:, TimeIter] + con.GaitEndPointsTrajectory.rot_RF[:,:, TimeIter] * mp.r_RF_left_toe
        con.GaitSupportPolygon.RightFootRightToes[:, TimeIter] = con.GaitEndPointsTrajectory.r_RF[:, TimeIter] + con.GaitEndPointsTrajectory.rot_RF[:,:, TimeIter] * mp.r_RF_right_toe
        con.GaitSupportPolygon.RightFootLeftHeel[:, TimeIter] = con.GaitEndPointsTrajectory.r_RF[:, TimeIter] + con.GaitEndPointsTrajectory.rot_RF[:,:, TimeIter] * mp.r_RF_left_heel
        con.GaitSupportPolygon.RightFootRightHeel[:, TimeIter] = con.GaitEndPointsTrajectory.r_RF[:, TimeIter] + con.GaitEndPointsTrajectory.rot_RF[:,:, TimeIter] * mp.r_RF_right_heel
        con.GaitSupportPolygon.RightFootCenter[:, TimeIter] = con.GaitEndPointsTrajectory.r_RF[:, TimeIter] + con.GaitEndPointsTrajectory.rot_RF[:,:, TimeIter] * mp.r_RF_center