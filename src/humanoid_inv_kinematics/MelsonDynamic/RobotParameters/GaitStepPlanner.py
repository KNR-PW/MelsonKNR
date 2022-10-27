import numpy as np
import math

import ModelParameters as mp
import GaitParameters as gp
import Conditions as con

## TODO funkcje "fix" oraz "polyval" zmiennik w PYTHONIE

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
    rotM = np.array([[math.cos(angles[2]), -math.sin(angles[2]), 0], [math.sin(angles[2]), math.cos(angles[2]), 0], [0, 0, 1]])
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

    tx = np.linspace(tstart, tfinal, SamplesNumber)
    ty = np.linspace(tstart, tfinal, SamplesNumber)
    tz_first = np.linspace(tstart, tmid, fix(SamplesNumber / 2))
    tz_second = np.linspace(tmid - tmid, tfinal - tmid, SamplesNumber - fix(SamplesNumber / 2))
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

for TimeIter in range(gp.NumberOfTimeInstances):
    if WhichPhase == 'DS':
        con.GaitPhases.LeftLeg[0][TimeIter] = 'support'
        con.GaitPhases.RightLeg[0][TimeIter] = 'support'
    elif WhichPhase == 'SS':
        if WhichLegSupportingInSS == 'right':
            con.GaitPhases.LeftLeg[0][TimeIter] = 'transfer'
            con.GaitPhases.RightLeg[0][TimeIter] = 'support'
        else:
            con.GaitPhases.LeftLeg[0][TimeIter] = 'support'
            con.GaitPhases.RightLeg[0][TimeIter] = 'transfer'

    if TimeIter > gp.NumberOfTimeInstances * (gp.PARAM_DS * math.floor((1+PhaseNumber)/2) + gp.PARAM_SS * math.floor(PhaseNumber/2)) / PhaseDivider:
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

for TimeIter in range(gp.NumberOfTimeInstances):
    if con.GaitPhases.LeftLeg[0][TimeIter] == 'support':
        con.CharPointsContactOnOff.LeftFootLeftToes[0][TimeIter] = True
        con.CharPointsContactOnOff.LeftFootRightToes[0][TimeIter] = True
        con.CharPointsContactOnOff.LeftFootLeftHeel[0][TimeIter] = True
        con.CharPointsContactOnOff.LeftFootRightHeel[0][TimeIter] = True
        con.CharPointsContactOnOff.LeftFootCenter[0][TimeIter] = True
    else:
        con.CharPointsContactOnOff.LeftFootLeftToes[0][TimeIter] = False
        con.CharPointsContactOnOff.LeftFootRightToes[0][TimeIter] = False
        con.CharPointsContactOnOff.LeftFootLeftHeel[0][TimeIter] = False
        con.CharPointsContactOnOff.LeftFootRightHeel[0][TimeIter] = False
        con.CharPointsContactOnOff.LeftFootCenter[0][TimeIter] = False
    
    if con.GaitPhases.RightLeg[0][TimeIter] == 'support':
        con.CharPointsContactOnOff.RightFootLeftToes[0][TimeIter] = True
        con.CharPointsContactOnOff.RightFootRightToes[0][TimeIter] = True
        con.CharPointsContactOnOff.RightFootLeftHeel[0][TimeIter] = True
        con.CharPointsContactOnOff.RightFootRightHeel[0][TimeIter] = True
        con.CharPointsContactOnOff.RightFootCenter[0][TimeIter] = True
    else:
        con.CharPointsContactOnOff.RightFootLeftToes[0][TimeIter] = False
        con.CharPointsContactOnOff.RightFootRightToes[0][TimeIter] = False
        con.CharPointsContactOnOff.RightFootLeftHeel[0][TimeIter] = False
        con.CharPointsContactOnOff.RightFootRightHeel[0][TimeIter] = False
        con.CharPointsContactOnOff.RightFootCenter[0][TimeIter] = False

## Foot position and orientation on ground
# temporary variables, to be transferred to EndPointsTrajectory
r_LeftFootOnGround = np.zeros((3, gp.NumOfStepsLeftLeg + 1))
r_RightFootOnGround = np.zeros((3, gp.NumOfStepsRightLeg + 1))
anglesCB_LeftFootOnGround = np.zeros((3, gp.NumOfStepsLeftLeg + 1))# Cardano Bryant - rotation x y z, intrinsic
anglesCB_RightFootOnGround = np.zeros((3, gp.NumOfStepsRightLeg + 1))  # Cardano Bryant - rotation x y z, intrinsic

r_LeftFootOnGround[:, [gp.NumOfStepsLeftLeg]] = con.GaitEndPointsTrajectory.r_LF[:, [gp.NumberOfTimeInstances - 1]]
r_LeftFootOnGround[:, [0]] = con.GaitEndPointsTrajectory.r_LF[:, [0]]
r_RightFootOnGround[:, [gp.NumOfStepsRightLeg]] = con.GaitEndPointsTrajectory.r_RF[:, [gp.NumberOfTimeInstances - 1]]
r_RightFootOnGround[:, [0]] = con.GaitEndPointsTrajectory.r_RF[:, [0]]

anglesCB_LeftFootOnGround[:, gp.NumOfStepsLeftLeg] = [0, 0, GetZFromRotM(con.GaitEndPointsTrajectory.rot_LF[:, :, [gp.NumberOfTimeInstances- 1]])]
anglesCB_LeftFootOnGround[:, 0] = [0, 0, GetZFromRotM(con.GaitEndPointsTrajectory.rot_LF[:,:, [0]])]
anglesCB_RightFootOnGround[:, gp.NumOfStepsRightLeg] = [0, 0, GetZFromRotM(con.GaitEndPointsTrajectory.rot_RF[:, :, [gp.NumberOfTimeInstances - 1]])]
anglesCB_RightFootOnGround[:, 0] = [0, 0, GetZFromRotM(con.GaitEndPointsTrajectory.rot_RF[:,:,[0]])]

if gp.NumOfStepsLeftLeg > gp.NumOfStepsRightLeg:  # if left leg starts
    # Left leg starts

    if gp.NumOfStepsLeftLeg >= 3:
        for IterPos in range(2, gp.NumOfStepsLeftLeg):
            r_LeftFootOnGround[:, IterPos-1] = con.GaitEndPointsTrajectory.r_LF[:, 0]\
                                             + (r_LeftFootOnGround[:, gp.NumOfStepsLeftLeg] - r_LeftFootOnGround[:, 0]) * (IterPos - 1.5) / (gp.NumOfStepsLeftLeg - 1)
            anglesCB_LeftFootOnGround[:, IterPos-1] = anglesCB_LeftFootOnGround[:, 0]\
                                                    + (anglesCB_LeftFootOnGround[:, gp.NumOfStepsLeftLeg] - anglesCB_LeftFootOnGround[:, 0])*(IterPos - 1.5) / ( gp.NumOfStepsLeftLeg - 1)

    elif gp.NumOfStepsLeftLeg >= 2:
        for IterPos in range(2, gp.NumOfStepsLeftLeg):
            r_LeftFootOnGround[:, IterPos-1] = con.GaitEndPointsTrajectory.r_LF[:, 0]\
                                             + (r_LeftFootOnGround[:, gp.NumOfStepsLeftLeg] - r_LeftFootOnGround[:, 0])*(IterPos - 1) / gp.NumOfStepsLeftLeg
            anglesCB_LeftFootOnGround[:, IterPos-1] = anglesCB_LeftFootOnGround[:, 1]\
                                                    + (anglesCB_LeftFootOnGround[:, gp.NumOfStepsLeftLeg] - anglesCB_LeftFootOnGround[:, 0])*(IterPos - 1) / (gp.NumOfStepsLeftLeg)


    if gp.NumOfStepsRightLeg >= 2:  # if right foot transfers twice then calculate middle positions
        for IterPos in range(2, gp.NumOfStepsRightLeg):
            r_RightFootOnGround[:, IterPos-1] = con.GaitEndPointsTrajectory.r_RF[:, 0]\
                                              + (r_RightFootOnGround[:, gp.NumOfStepsRightLeg] - r_RightFootOnGround[:, 0])*(IterPos - 1) / gp.NumOfStepsRightLeg
            anglesCB_RightFootOnGround[:, IterPos-1] = anglesCB_RightFootOnGround[:, 0]\
                                                     + (anglesCB_RightFootOnGround[:, gp.NumOfStepsRightLeg] - anglesCB_RightFootOnGround[:, 0])*(IterPos - 1) / (gp.NumOfStepsRightLeg)


elif gp.NumOfStepsLeftLeg < gp.NumOfStepsRightLeg:  # Right leg starts
    if gp.NumOfStepsLeftLeg >= 2: # if left foot transfers twice then calculate middle positions
        for IterPos in range(2, gp.NumOfStepsLeftLeg):
            r_LeftFootOnGround[:, IterPos-1] = con.GaitEndPointsTrajectory.r_LF[:, 0]\
                                             + (r_LeftFootOnGround[:, gp.NumOfStepsLeftLeg] - r_LeftFootOnGround[:, 0])*(IterPos - 1) / gp.NumOfStepsLeftLeg
            anglesCB_LeftFootOnGround[:, IterPos-1] = anglesCB_LeftFootOnGround[:, 0]\
                                                    + (anglesCB_LeftFootOnGround[:, gp.NumOfStepsLeftLeg] - anglesCB_LeftFootOnGround[:, 0])*(IterPos - 1) / (gp.NumOfStepsLeftLeg)


    if gp.NumOfStepsRightLeg >= 3:
        for IterPos in range(2, gp.NumOfStepsRightLeg):
            r_RightFootOnGround[:, IterPos-1] = con.GaitEndPointsTrajectory.r_RF[:, 0]\
                                              + (r_RightFootOnGround[:, gp.NumOfStepsRightLeg] - r_RightFootOnGround[:, 0])*(IterPos - 1.5) / (gp.NumOfStepsRightLeg - 1)
            anglesCB_RightFootOnGround[:, IterPos-1] = anglesCB_RightFootOnGround[:, 0]\
                                                     + (anglesCB_RightFootOnGround[:, gp.NumOfStepsRightLeg] - anglesCB_RightFootOnGround[:, 0])*(IterPos - 1.5) / (gp.NumOfStepsRightLeg - 1)

    elif gp.NumOfStepsRightLeg >= 2:
        for IterPos in range(2, gp.NumOfStepsRightLeg):
            r_RightFootOnGround[:, IterPos-1] = con.GaitEndPointsTrajectory.r_RF[:, 0]\
                                              + (r_RightFootOnGround[:, gp.NumOfStepsRightLeg] - r_RightFootOnGround[:, 0])*(IterPos - 1) / gp.NumOfStepsRightLeg
            anglesCB_RightFootOnGround[:, IterPos-1] = anglesCB_RightFootOnGround[:, 0]\
                                                     + (anglesCB_RightFootOnGround[:, gp.NumOfStepsRightLeg] - anglesCB_RightFootOnGround[:, 0])*(IterPos - 1) / (gp.NumOfStepsRightLeg)


else:  # equal number of steps -> right leg starts
    if gp.NumOfStepsLeftLeg >= 2:  # if left foot transfers twice then calculate middle positions
        for IterPos in range(2, gp.NumOfStepsRightLeg):
            r_LeftFootOnGround[:, IterPos-1] = con.GaitEndPointsTrajectory.r_LF[:, 0]\
                                             + (r_LeftFootOnGround[:, gp.NumOfStepsLeftLeg] - r_LeftFootOnGround[:, 0])*(IterPos - 1) / gp.NumOfStepsLeftLeg
            anglesCB_LeftFootOnGround[:, IterPos-1] = anglesCB_LeftFootOnGround[:, 0]\
                                                    + (anglesCB_LeftFootOnGround[:, gp.NumOfStepsLeftLeg] - anglesCB_LeftFootOnGround[:, 0])*(IterPos - 1) / (gp.NumOfStepsLeftLeg)


    if gp.NumOfStepsRightLeg >= 2:  # if right foot transfers twice then calculate middle positions
        for IterPos in range(2, gp.NumOfStepsRightLeg):
            r_RightFootOnGround[:, IterPos-1] =  con.GaitEndPointsTrajectory.r_RF[:, 0]\
                                               +(r_RightFootOnGround[:, gp.NumOfStepsRightLeg] - r_RightFootOnGround[:, 0])*(IterPos - 1) / gp.NumOfStepsRightLeg
            anglesCB_RightFootOnGround[:, IterPos-1] = anglesCB_RightFootOnGround[:, 0]\
                                                     + (anglesCB_RightFootOnGround[:, gp.NumOfStepsRightLeg] - anglesCB_RightFootOnGround[:, 0])*(IterPos - 1) / (gp.NumOfStepsRightLeg)

# Fill Gait End Points Trajectory
PhaseNumberLeftFoot = 1
PhaseNumberRightFoot = 1

for TimeIter in range(gp.NumberOfTimeInstances):
    if con.GaitPhases.LeftLeg[0][TimeIter-1] == 'support':
        con.GaitEndPointsTrajectory.r_LF[:, TimeIter-1] = r_LeftFootOnGround[:,PhaseNumberLeftFoot-1]
        con.GaitEndPointsTrajectory.rot_LF[:, :, TimeIter-1] = GetRotMFromAnglesCB(anglesCB_LeftFootOnGround[:, PhaseNumberLeftFoot-1])
        if TimeIter < gp.NumberOfTimeInstances:
            if con.GaitPhases.LeftLeg[0][TimeIter] == 'transfer':
                PhaseNumberLeftFoot = PhaseNumberLeftFoot + 1

    if con.GaitPhases.RightLeg[0][TimeIter-1] == 'support':
        con.GaitEndPointsTrajectory.r_RF[:, TimeIter-1] = r_RightFootOnGround[:,PhaseNumberRightFoot-1]
        con.GaitEndPointsTrajectory.rot_RF[:, :, TimeIter-1] = GetRotMFromAnglesCB(anglesCB_RightFootOnGround[:, PhaseNumberRightFoot-1])
        if TimeIter < gp.NumberOfTimeInstances:
            if con.GaitPhases.RightLeg[0][TimeIter] == 'transfer':
                PhaseNumberRightFoot = PhaseNumberRightFoot + 1

## Foot position and orientation in transfer phases
LeftLegTransferLength = 0
RightLegTransferLength = 0

for TimeIter in range(gp.NumberOfTimeInstances):
    if con.GaitPhases.LeftLeg[0][TimeIter-1] == 'transfer':
        LeftLegTransferLength = LeftLegTransferLength + 1
    elif con.GaitPhases.LeftLeg[0][TimeIter-1] == 'support':
        if LeftLegTransferLength != 0:
            if (TimeIter - LeftLegTransferLength - 1) > 0:
                con.GaitEndPointsTrajectory.r_LF[:, TimeIter - LeftLegTransferLength - 2: TimeIter-1] = r_GenerateStep(con.GaitEndPointsTrajectory.r_LF[:, TimeIter - LeftLegTransferLength - 2], con.GaitEndPointsTrajectory.r_LF[:, TimeIter-1], LeftLegTransferLength + 1, gp.StepHeight-1)
                con.GaitEndPointsTrajectory.rot_LF[:, :, TimeIter - LeftLegTransferLength - 2: TimeIter-1] = rot_GenerateStep(con.GaitEndPointsTrajectory.rot_LF[:, :, TimeIter - LeftLegTransferLength - 2], con.GaitEndPointsTrajectory.rot_LF[:, :, TimeIter-1], LeftLegTransferLength + 1)
            #else:
                 # TODO: traj gen start( if leg started in transfer mode)
    LeftLegTransferLength = 0

# if LeftLegTransferLength != 0:
    # TODO: traj gen ( if leg ended in transfer mode)


for TimeIter in range(gp.NumberOfTimeInstances):
    if con.GaitPhases.LeftLeg[0][TimeIter-1] == 'transfer':
        LeftLegTransferLength = LeftLegTransferLength + 1
    elif con.GaitPhases.LeftLeg[0][TimeIter-1] == 'support':
        if LeftLegTransferLength != 0:
            if (TimeIter - LeftLegTransferLength - 1) > 0:
                con.GaitEndPointsTrajectory.r_LF[:, TimeIter - LeftLegTransferLength - 2: TimeIter-1] = r_GenerateStep(con.GaitEndPointsTrajectory.r_LF[:, TimeIter - LeftLegTransferLength - 2], con.GaitEndPointsTrajectory.r_LF[:, TimeIter-1], LeftLegTransferLength + 2, gp.StepHeight)
                con.GaitEndPointsTrajectory.rot_LF[:,:, TimeIter - LeftLegTransferLength - 2: TimeIter-1] = rot_GenerateStep(con.GaitEndPointsTrajectory.rot_LF[:,:, TimeIter - LeftLegTransferLength - 2], con.GaitEndPointsTrajectory.rot_LF[:,:, TimeIter-1], LeftLegTransferLength + 2)
            #else:
                # TODO: traj gen start( if leg started in transfer mode)

    LeftLegTransferLength = 0


    if con.GaitPhases.RightLeg[0][TimeIter-1] == 'transfer':
        RightLegTransferLength = RightLegTransferLength + 1
    elif con.GaitPhases.RightLeg[0][TimeIter-1] == 'support':
        if RightLegTransferLength != 0:
            if (TimeIter - RightLegTransferLength - 1) > 0:
                con.GaitEndPointsTrajectory.r_RF[:, TimeIter - RightLegTransferLength - 2: TimeIter-1] = r_GenerateStep(con.GaitEndPointsTrajectory.r_RF[:, TimeIter - RightLegTransferLength - 2], con.GaitEndPointsTrajectory.r_RF[:, TimeIter-1], RightLegTransferLength + 2, gp.StepHeight)
                con.GaitEndPointsTrajectory.rot_RF[:,:, TimeIter - RightLegTransferLength - 2: TimeIter-1] = rot_GenerateStep(con.GaitEndPointsTrajectory.rot_RF[:,:, TimeIter - RightLegTransferLength - 2], con.GaitEndPointsTrajectory.rot_RF[:,:, TimeIter-1], RightLegTransferLength + 2)           #else:
                 # TODO: traj gen start( if leg started in transfer mode)

    RightLegTransferLength = 0

# if LeftLegTransferLength != 0:
    # TODO: traj gen ( if leg ended in transfer mode)

# if RightLegTransferLength != 0:
    # TODO: traj gen ( if leg ended in transfer mode)

    # Fill Gait SubPol
    for TimeIter in range(gp.NumberOfTimeInstances):
        con.GaitSupportPolygon.LeftFootLeftToes[:, [TimeIter-1]] = con.GaitEndPointsTrajectory.r_LF[:, [TimeIter-1]] + con.GaitEndPointsTrajectory.rot_LF[:,:, TimeIter-1] @ mp.r_LF_left_toe
        con.GaitSupportPolygon.LeftFootRightToes[:, [TimeIter-1]] = con.GaitEndPointsTrajectory.r_LF[:, [TimeIter-1]] + con.GaitEndPointsTrajectory.rot_LF[:,:, TimeIter-1] @ mp.r_LF_right_toe
        con.GaitSupportPolygon.LeftFootLeftHeel[:, [TimeIter-1]] = con.GaitEndPointsTrajectory.r_LF[:, [TimeIter-1]] + con.GaitEndPointsTrajectory.rot_LF[:,:, TimeIter-1] @ mp.r_LF_left_heel
        con.GaitSupportPolygon.LeftFootRightHeel[:, [TimeIter-1]] = con.GaitEndPointsTrajectory.r_LF[:, [TimeIter-1]] + con.GaitEndPointsTrajectory.rot_LF[:,:, TimeIter-1] @ mp.r_LF_right_heel
        con.GaitSupportPolygon.LeftFootCenter[:, [TimeIter-1]] = con.GaitEndPointsTrajectory.r_LF[:, [TimeIter-1]] + con.GaitEndPointsTrajectory.rot_LF[:,:, TimeIter-1] @ mp.r_LF_center
        con.GaitSupportPolygon.RightFootLeftToes[:, [TimeIter-1]] = con.GaitEndPointsTrajectory.r_RF[:, [TimeIter-1]] + con.GaitEndPointsTrajectory.rot_RF[:,:, TimeIter-1] @ mp.r_RF_left_toe
        con.GaitSupportPolygon.RightFootRightToes[:, [TimeIter-1]] = con.GaitEndPointsTrajectory.r_RF[:, [TimeIter-1]] + con.GaitEndPointsTrajectory.rot_RF[:,:, TimeIter-1] @ mp.r_RF_right_toe
        con.GaitSupportPolygon.RightFootLeftHeel[:, [TimeIter-1]] = con.GaitEndPointsTrajectory.r_RF[:, [TimeIter-1]] + con.GaitEndPointsTrajectory.rot_RF[:,:, TimeIter-1] @ mp.r_RF_left_heel
        con.GaitSupportPolygon.RightFootRightHeel[:, [TimeIter-1]] = con.GaitEndPointsTrajectory.r_RF[:, [TimeIter-1]] + con.GaitEndPointsTrajectory.rot_RF[:,:, TimeIter-1] @ mp.r_RF_right_heel
        con.GaitSupportPolygon.RightFootCenter[:, [TimeIter-1]] = con.GaitEndPointsTrajectory.r_RF[:, [TimeIter-1]] + con.GaitEndPointsTrajectory.rot_RF[:,:, TimeIter-1] @ mp.r_RF_center
    a = 2
def r_GenerateStep(r_start, r_end, SamplesNumber, stepHeight):

    tstart = 0
    tfinal = SamplesNumber
    tmid = (tstart + tfinal) / 2

    # Nie jestem pewien czy to tak zadziala, czy przypadkiem nie musze wczesniej
    # zadeklarowac tych pval_x itd. jako np.array'ie ???

    # pval_x = [a5, a4, a3, a2, a1, a0]
    pval_x = createTraj5(r_start(1), r_end(1), 0, 0, 0, 0, tstart, tfinal)

    # pval_y = [a5, a4, a3, a2, a1, a0]
    pval_y = createTraj5(r_start(2), r_end(2), 0, 0, 0, 0, tstart, tfinal)

    # pval_z_first = [a3, a2, a1, a0]
    pval_z_first = createTraj3(r_start(3), stepHeight, 0, 0, tstart, tmid)

    # pval_z_second = [a3, a2, a1, a0]
    pval_z_second = createTraj3(stepHeight, r_end(3), 0, 0, tmid, tfinal)


    tx = np.linspace(tstart, tfinal, SamplesNumber)
    ty = np.linspace(tstart, tfinal, SamplesNumber)
    tz_first = np.linspace(tstart, tmid, fix(SamplesNumber / 2))
    tz_second = np.linspace(tmid - tmid, tfinal - tmid, SamplesNumber - fix(SamplesNumber / 2))
    r_x = polyval(pval_x, tx)
    r_y = polyval(pval_y, ty)
    r_z_first = polyval(pval_z_first, tz_first)
    r_z_second = polyval(pval_z_second, tz_second)

    # Niewiem jak skleic taka macierz z wektorowi macierzy. Tu jest poloczenie ";" i ","
    # r_out = np.array([r_x ;r_y; r_z_first, r_z_second]) TODO
    r_out = []
    return r_out


def rot_GenerateStep(rot_start, rot_end, SamplesNumber):

    AnglesCB = np.zeros(3, SamplesNumber)
    AnglesCB[:, 1] = np.array([[0], [0], [GetZFromRotM(rot_start)]])
    AnglesCB[:, SamplesNumber] = np.array([[0], [0], [GetZFromRotM(rot_end)]])

    tstart = 0
    tfinal = SamplesNumber

    # pval_CBx = [a5, a4, a3, a2, a1, a0]
    pval_CBx = createTraj5(AnglesCB[1, 1], AnglesCB[1, SamplesNumber], 0, 0, 0, 0, tstart, tfinal)

    # pval_CBy = [a5, a4, a3, a2, a1, a0]
    pval_CBy = createTraj5(AnglesCB[2, 1], AnglesCB[2, SamplesNumber], 0, 0, 0, 0, tstart, tfinal)

    # pval_CBz = [a5, a4, a3, a2, a1, a0]
    pval_CBz = createTraj5(AnglesCB[3, 1], AnglesCB[3, SamplesNumber], 0, 0, 0, 0, tstart, tfinal)


    t = np.linspace(tstart, tfinal, SamplesNumber)

    # To moze byc skomplikowane żeby tego "polyval" napisac w PYTHONIE
    # nie wiem jeszcze jak to zrobic

    AnglesCB[1,:] = polyval(pval_CBx, t)
    AnglesCB[2,:] = polyval(pval_CBy, t)
    AnglesCB[3,:] = polyval(pval_CBz, t)

    rot_out = np.zeros(3, 3, SamplesNumber)

    for TimeIter in SamplesNumber:
        rot_out[:,:, TimeIter] = GetRotMFromAnglesCB(AnglesCB[:, TimeIter])

    return rot_out


def createTraj5(theta0,thetaf,thetad0,thetadf,thetadd0,thetaddf,tstart,tfinal):
    T = tfinal - tstart
    a0 = theta0
    a1 = thetad0
    a2 = 0.5 * thetadd0
    a3 =(1/(2*T**3)) * (20 * (thetaf - theta0) - (8 * thetadf+ 12*thetad0 )*T - (3 * thetaddf - thetadd0 )*T**2 )
    a4 =(1/(2*T**4)) * (30 * (theta0 - thetaf) + (14 * thetadf+ 16*thetad0 )*T + (3 * thetaddf - 2*thetadd0 )*T**2 )
    a5 =(1/(2*T**5)) * (12 * (thetaf - theta0) - 6*(thetadf+ thetad0 )*T - (thetaddf - thetadd0 )*T**2 )

    ret = np.array([a5,a4,a3,a2,a1,a0])
    return ret


def createTraj3(theta0,thetaf,thetad0,thetadf,tstart,tfinal):
    T=tfinal-tstart
    a0=theta0
    a1=thetad0
    a2 = (-3 * (theta0 - thetaf) - (2 * thetad0 + thetadf) * T) / T ** 2
    a3 = (2 * (theta0 - thetaf) + (thetad0 + thetadf) * T) / T ** 3

    ret = np.array([a3,a2,a1,a0])
    return ret

