import numpy as np
import math

import src.humanoid_inv_kinematics.MelsonDynamic.RobotParameters.ModelParameters as mp
import src.humanoid_inv_kinematics.MelsonDynamic.RobotParameters.GaitParameters as gp
import src.humanoid_inv_kinematics.MelsonDynamic.RobotParameters.Conditions as con

from matplotlib import pyplot as plt


# 1. Znam liczbe kroków i udzial procentowy kolejnych faz (DS SS) -> okresl
# wszystkie fazy chodu dla calego czasu
# 2. Zaznacz, które punkty beda dotykac podloza w danej chwili, a które nie
# 3. Okresl pololenie i orientacje stóp w chwilach gdy dotykaja podloza
# 4. okresl pololenia i orientacje stóp dla faz 'transfer'
# 5. Okresl pololenia dloni (?)

def rot_GenerateStep(rot_start, rot_end, SamplesNumber):
    AnglesCB = np.zeros((3, SamplesNumber))
    AnglesCB[:, [0]] = np.array([[0], [0], [GetZFromRotM(rot_start)]])
    AnglesCB[:, [SamplesNumber - 1]] = np.array([[0], [0], [GetZFromRotM(rot_end)]])

    tstart = 0
    tfinal = SamplesNumber

    # pval_CBx = [a5, a4, a3, a2, a1, a0]
    pval_CBx = createTraj5(AnglesCB[0, 0], AnglesCB[0, SamplesNumber - 1], 0, 0, 0, 0, tstart, tfinal)

    # pval_CBy = [a5, a4, a3, a2, a1, a0]
    pval_CBy = createTraj5(AnglesCB[1, 0], AnglesCB[1, SamplesNumber - 1], 0, 0, 0, 0, tstart, tfinal)

    # pval_CBz = [a5, a4, a3, a2, a1, a0]
    pval_CBz = createTraj5(AnglesCB[2, 0], AnglesCB[2, SamplesNumber - 1], 0, 0, 0, 0, tstart, tfinal)

    t = np.linspace(tstart, tfinal, SamplesNumber)

    AnglesCB[0, :] = np.polyval(pval_CBx, t)
    AnglesCB[1, :] = np.polyval(pval_CBy, t)
    AnglesCB[2, :] = np.polyval(pval_CBz, t)

    rot_out = np.zeros((3, 3, SamplesNumber))

    for TimeIter in range(SamplesNumber):
        rot_out[:, :, TimeIter - 1] = GetRotMFromAnglesCB(AnglesCB[:, TimeIter - 1])

    return rot_out


def createTraj5(theta0, thetaf, thetad0, thetadf, thetadd0, thetaddf, tstart, tfinal):
    T = tfinal - tstart
    a0 = theta0
    a1 = thetad0
    a2 = 0.5 * thetadd0
    a3 = (1 / (2 * T ** 3)) * (
                20 * (thetaf - theta0) - (8 * thetadf + 12 * thetad0) * T - (3 * thetaddf - thetadd0) * T ** 2)
    a4 = (1 / (2 * T ** 4)) * (
                30 * (theta0 - thetaf) + (14 * thetadf + 16 * thetad0) * T + (3 * thetaddf - 2 * thetadd0) * T ** 2)
    a5 = (1 / (2 * T ** 5)) * (12 * (thetaf - theta0) - 6 * (thetadf + thetad0) * T - (thetaddf - thetadd0) * T ** 2)

    ret = np.array([a5, a4, a3, a2, a1, a0])
    return ret


def createTraj3(theta0, thetaf, thetad0, thetadf, tstart, tfinal):
    T = tfinal - tstart
    a0 = theta0
    a1 = thetad0
    a2 = (-3 * (theta0 - thetaf) - (2 * thetad0 + thetadf) * T) / T ** 2
    a3 = (2 * (theta0 - thetaf) + (thetad0 + thetadf) * T) / T ** 3

    ret = np.array([a3, a2, a1, a0])
    return ret


def GetZFromRotM(rotM):
    alpha = math.atan2(rotM[1, 0], rotM[1, 1])
    return alpha


def GetRotMFromAnglesCB(angles):
    rotM = np.array(
        [[math.cos(angles[2]), -math.sin(angles[2]), 0], [math.sin(angles[2]), math.cos(angles[2]), 0], [0, 0, 1]])
    return rotM


def r_GenerateStep(r_start, r_end, SamplesNumber, stepHeight):
    tstart = 0
    tfinal = SamplesNumber
    tmid = (tstart + tfinal) / 2

    [a5, a4, a3, a2, a1, a0] = createTraj5(r_start[0], r_end[0], 0, 0, 0, 0, tstart, tfinal)
    pval_x = [a5, a4, a3, a2, a1, a0]
    [a5, a4, a3, a2, a1, a0] = createTraj5(r_start[1], r_end[1], 0, 0, 0, 0, tstart, tfinal)
    pval_y = [a5, a4, a3, a2, a1, a0]

    [a3, a2, a1, a0] = createTraj3(r_start[2], stepHeight, 0, 0, tstart, tmid)
    pval_z_first = [a3, a2, a1, a0]
    [a3, a2, a1, a0] = createTraj3(stepHeight, r_end[2], 0, 0, tmid, tfinal)
    pval_z_second = [a3, a2, a1, a0]

    tx = np.linspace(tstart, tfinal, SamplesNumber)
    ty = np.linspace(tstart, tfinal, SamplesNumber)
    tz_first = np.linspace(tstart, tmid, int(np.fix(SamplesNumber / 2)))
    tz_second = np.linspace(tmid - tmid, tfinal - tmid, int(SamplesNumber - np.fix(SamplesNumber / 2)))
    r_x = np.polyval(pval_x, tx)
    r_y = np.polyval(pval_y, ty)
    r_z_first = np.polyval(pval_z_first, tz_first)
    r_z_second = np.polyval(pval_z_second, tz_second)

    r_out = np.column_stack((r_x, r_y, np.concatenate((r_z_first, r_z_second))))
    r_out = np.transpose(r_out)
    return r_out


def plotResults(traj, title):
    # Set up a subplot grid that has height 3 and width 1,
    # and set the first such subplot as active. 
    plt.subplot(3, 1, 1)

    # More intuitive name
    horizontal_axis = gp.NumberOfTimeInstances

    # Make the first plot 
    plt.title(title)
    plt.xlabel("Step")
    plt.ylabel("Angle")
    plt.plot(np.arange(horizontal_axis), np.transpose(traj[0,:]))
    # Set the second subplot as active, and make the second plot. 
    plt.subplot(3, 1, 2)

    plt.title(title)
    plt.xlabel("Step")
    plt.ylabel("X")
    plt.plot(np.arange(horizontal_axis), np.transpose(traj[1,:]))

    # Set the third subplot as active, and make the third plot. 
    plt.subplot(3, 1, 3)

    plt.title(title)
    plt.xlabel("Step")
    plt.ylabel("Y")
    plt.plot(np.arange(horizontal_axis), np.transpose(traj[2,:]))

    # Show the figure. 
    plt.show()


## Plan phases
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

    if TimeIter > (gp.NumberOfTimeInstances - 1) * (
            gp.PARAM_DS * math.floor((1 + PhaseNumber) / 2) + gp.PARAM_SS * math.floor(PhaseNumber / 2)) / PhaseDivider:
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
anglesCB_LeftFootOnGround = np.zeros((3, gp.NumOfStepsLeftLeg + 1))  # Cardano Bryant - rotation x y z, intrinsic
anglesCB_RightFootOnGround = np.zeros((3, gp.NumOfStepsRightLeg + 1))  # Cardano Bryant - rotation x y z, intrinsic

r_LeftFootOnGround[:, [gp.NumOfStepsLeftLeg]] = con.GaitEndPointsTrajectory.r_LF[:, [gp.NumberOfTimeInstances - 1]]
r_LeftFootOnGround[:, [0]] = con.GaitEndPointsTrajectory.r_LF[:, [0]]
r_RightFootOnGround[:, [gp.NumOfStepsRightLeg]] = con.GaitEndPointsTrajectory.r_RF[:, [gp.NumberOfTimeInstances - 1]]
r_RightFootOnGround[:, [0]] = con.GaitEndPointsTrajectory.r_RF[:, [0]]

anglesCB_LeftFootOnGround[:, gp.NumOfStepsLeftLeg] = [0, 0, GetZFromRotM(
    con.GaitEndPointsTrajectory.rot_LF[:, :, [gp.NumberOfTimeInstances - 1]])]
anglesCB_LeftFootOnGround[:, 0] = [0, 0, GetZFromRotM(con.GaitEndPointsTrajectory.rot_LF[:, :, [0]])]
anglesCB_RightFootOnGround[:, gp.NumOfStepsRightLeg] = [0, 0, GetZFromRotM(
    con.GaitEndPointsTrajectory.rot_RF[:, :, [gp.NumberOfTimeInstances - 1]])]
anglesCB_RightFootOnGround[:, 0] = [0, 0, GetZFromRotM(con.GaitEndPointsTrajectory.rot_RF[:, :, [0]])]

if gp.NumOfStepsLeftLeg > gp.NumOfStepsRightLeg:  # if left leg starts
    # Left leg starts

    if gp.NumOfStepsLeftLeg >= 3:
        for IterPos in range(2, gp.NumOfStepsLeftLeg):
            r_LeftFootOnGround[:, IterPos - 1] = con.GaitEndPointsTrajectory.r_LF[:, 0] \
                                                 + (r_LeftFootOnGround[:, gp.NumOfStepsLeftLeg] - r_LeftFootOnGround[:,
                                                                                                  0]) * (
                                                             IterPos - 1.5) / (gp.NumOfStepsLeftLeg - 1)
            anglesCB_LeftFootOnGround[:, IterPos - 1] = anglesCB_LeftFootOnGround[:, 0] \
                                                        + (anglesCB_LeftFootOnGround[:,
                                                           gp.NumOfStepsLeftLeg] - anglesCB_LeftFootOnGround[:, 0]) * (
                                                                    IterPos - 1.5) / (gp.NumOfStepsLeftLeg - 1)

    elif gp.NumOfStepsLeftLeg >= 2:
        for IterPos in range(2, gp.NumOfStepsLeftLeg):
            r_LeftFootOnGround[:, IterPos - 1] = con.GaitEndPointsTrajectory.r_LF[:, 0] \
                                                 + (r_LeftFootOnGround[:, gp.NumOfStepsLeftLeg] - r_LeftFootOnGround[:,
                                                                                                  0]) * (
                                                             IterPos - 1) / gp.NumOfStepsLeftLeg
            anglesCB_LeftFootOnGround[:, IterPos - 1] = anglesCB_LeftFootOnGround[:, 1] \
                                                        + (anglesCB_LeftFootOnGround[:,
                                                           gp.NumOfStepsLeftLeg] - anglesCB_LeftFootOnGround[:, 0]) * (
                                                                    IterPos - 1) / (gp.NumOfStepsLeftLeg)

    if gp.NumOfStepsRightLeg >= 2:  # if right foot transfers twice then calculate middle positions
        for IterPos in range(2, gp.NumOfStepsRightLeg):
            r_RightFootOnGround[:, IterPos - 1] = con.GaitEndPointsTrajectory.r_RF[:, 0] \
                                                  + (r_RightFootOnGround[:,
                                                     gp.NumOfStepsRightLeg] - r_RightFootOnGround[:, 0]) * (
                                                              IterPos - 1) / gp.NumOfStepsRightLeg
            anglesCB_RightFootOnGround[:, IterPos - 1] = anglesCB_RightFootOnGround[:, 0] \
                                                         + (anglesCB_RightFootOnGround[:,
                                                            gp.NumOfStepsRightLeg] - anglesCB_RightFootOnGround[:,
                                                                                     0]) * (IterPos - 1) / (
                                                             gp.NumOfStepsRightLeg)


elif gp.NumOfStepsLeftLeg < gp.NumOfStepsRightLeg:  # Right leg starts
    if gp.NumOfStepsLeftLeg >= 2:  # if left foot transfers twice then calculate middle positions
        for IterPos in range(2, gp.NumOfStepsLeftLeg):
            r_LeftFootOnGround[:, IterPos - 1] = con.GaitEndPointsTrajectory.r_LF[:, 0] \
                                                 + (r_LeftFootOnGround[:, gp.NumOfStepsLeftLeg] - r_LeftFootOnGround[:,
                                                                                                  0]) * (
                                                             IterPos - 1) / gp.NumOfStepsLeftLeg
            anglesCB_LeftFootOnGround[:, IterPos - 1] = anglesCB_LeftFootOnGround[:, 0] \
                                                        + (anglesCB_LeftFootOnGround[:,
                                                           gp.NumOfStepsLeftLeg] - anglesCB_LeftFootOnGround[:, 0]) * (
                                                                    IterPos - 1) / (gp.NumOfStepsLeftLeg)

    if gp.NumOfStepsRightLeg >= 3:
        for IterPos in range(2, gp.NumOfStepsRightLeg):
            r_RightFootOnGround[:, IterPos - 1] = con.GaitEndPointsTrajectory.r_RF[:, 0] \
                                                  + (r_RightFootOnGround[:,
                                                     gp.NumOfStepsRightLeg] - r_RightFootOnGround[:, 0]) * (
                                                              IterPos - 1.5) / (gp.NumOfStepsRightLeg - 1)
            anglesCB_RightFootOnGround[:, IterPos - 1] = anglesCB_RightFootOnGround[:, 0] \
                                                         + (anglesCB_RightFootOnGround[:,
                                                            gp.NumOfStepsRightLeg] - anglesCB_RightFootOnGround[:,
                                                                                     0]) * (IterPos - 1.5) / (
                                                                     gp.NumOfStepsRightLeg - 1)

    elif gp.NumOfStepsRightLeg >= 2:
        for IterPos in range(2, gp.NumOfStepsRightLeg):
            r_RightFootOnGround[:, IterPos - 1] = con.GaitEndPointsTrajectory.r_RF[:, 0] \
                                                  + (r_RightFootOnGround[:,
                                                     gp.NumOfStepsRightLeg] - r_RightFootOnGround[:, 0]) * (
                                                              IterPos - 1) / gp.NumOfStepsRightLeg
            anglesCB_RightFootOnGround[:, IterPos - 1] = anglesCB_RightFootOnGround[:, 0] \
                                                         + (anglesCB_RightFootOnGround[:,
                                                            gp.NumOfStepsRightLeg] - anglesCB_RightFootOnGround[:,
                                                                                     0]) * (IterPos - 1) / (
                                                             gp.NumOfStepsRightLeg)


else:  # equal number of steps -> right leg starts
    if gp.NumOfStepsLeftLeg >= 2:  # if left foot transfers twice then calculate middle positions
        for IterPos in range(2, gp.NumOfStepsRightLeg):
            r_LeftFootOnGround[:, IterPos - 1] = con.GaitEndPointsTrajectory.r_LF[:, 0] \
                                                 + (r_LeftFootOnGround[:, gp.NumOfStepsLeftLeg] - r_LeftFootOnGround[:,
                                                                                                  0]) * (
                                                             IterPos - 1) / gp.NumOfStepsLeftLeg
            anglesCB_LeftFootOnGround[:, IterPos - 1] = anglesCB_LeftFootOnGround[:, 0] \
                                                        + (anglesCB_LeftFootOnGround[:,
                                                           gp.NumOfStepsLeftLeg] - anglesCB_LeftFootOnGround[:, 0]) * (
                                                                    IterPos - 1) / (gp.NumOfStepsLeftLeg)

    if gp.NumOfStepsRightLeg >= 2:  # if right foot transfers twice then calculate middle positions
        for IterPos in range(2, gp.NumOfStepsRightLeg):
            r_RightFootOnGround[:, IterPos - 1] = con.GaitEndPointsTrajectory.r_RF[:, 0] \
                                                  + (r_RightFootOnGround[:,
                                                     gp.NumOfStepsRightLeg] - r_RightFootOnGround[:, 0]) * (
                                                              IterPos - 1) / gp.NumOfStepsRightLeg
            anglesCB_RightFootOnGround[:, IterPos - 1] = anglesCB_RightFootOnGround[:, 0] \
                                                         + (anglesCB_RightFootOnGround[:,
                                                            gp.NumOfStepsRightLeg] - anglesCB_RightFootOnGround[:,
                                                                                     0]) * (IterPos - 1) / (
                                                             gp.NumOfStepsRightLeg)

# Fill Gait End Points Trajectory
PhaseNumberLeftFoot = 1
PhaseNumberRightFoot = 1

for TimeIter in range(gp.NumberOfTimeInstances):
    if con.GaitPhases.LeftLeg[0][TimeIter - 1] == 'support':
        con.GaitEndPointsTrajectory.r_LF[:, TimeIter - 1] = r_LeftFootOnGround[:, PhaseNumberLeftFoot - 1]
        con.GaitEndPointsTrajectory.rot_LF[:, :, TimeIter - 1] = GetRotMFromAnglesCB(
            anglesCB_LeftFootOnGround[:, PhaseNumberLeftFoot - 1])
        if TimeIter < gp.NumberOfTimeInstances:
            if con.GaitPhases.LeftLeg[0][TimeIter] == 'transfer':
                PhaseNumberLeftFoot = PhaseNumberLeftFoot + 1

    if con.GaitPhases.RightLeg[0][TimeIter - 1] == 'support':
        con.GaitEndPointsTrajectory.r_RF[:, TimeIter - 1] = r_RightFootOnGround[:, PhaseNumberRightFoot - 1]
        con.GaitEndPointsTrajectory.rot_RF[:, :, TimeIter - 1] = GetRotMFromAnglesCB(
            anglesCB_RightFootOnGround[:, PhaseNumberRightFoot - 1])
        if TimeIter < gp.NumberOfTimeInstances:
            if con.GaitPhases.RightLeg[0][TimeIter] == 'transfer':
                PhaseNumberRightFoot = PhaseNumberRightFoot + 1

## Foot position and orientation in transfer phases
LeftLegTransferLength = 0
RightLegTransferLength = 0

for TimeIter in range(gp.NumberOfTimeInstances):
    if con.GaitPhases.LeftLeg[0][TimeIter - 1] == 'transfer':
        LeftLegTransferLength = LeftLegTransferLength + 1
    elif con.GaitPhases.LeftLeg[0][TimeIter - 1] == 'support':
        if LeftLegTransferLength != 0:
            if (TimeIter - LeftLegTransferLength) > 0:
                con.GaitEndPointsTrajectory.r_LF[:,
                TimeIter - LeftLegTransferLength - 3: TimeIter - 1] = r_GenerateStep(
                    con.GaitEndPointsTrajectory.r_LF[:, TimeIter - LeftLegTransferLength - 2],
                    con.GaitEndPointsTrajectory.r_LF[:, TimeIter - 1], LeftLegTransferLength + 2, gp.StepHeight)
                con.GaitEndPointsTrajectory.rot_LF[:, :,
                TimeIter - LeftLegTransferLength - 3: TimeIter - 1] = rot_GenerateStep(
                    con.GaitEndPointsTrajectory.rot_LF[:, :, TimeIter - LeftLegTransferLength - 2],
                    con.GaitEndPointsTrajectory.rot_LF[:, :, TimeIter - 1], LeftLegTransferLength + 2)
            # else:
            # TODO: traj gen start( if leg started in transfer mode)
        LeftLegTransferLength = 0

# if LeftLegTransferLength != 0:
# TODO: traj gen ( if leg ended in transfer mode)


for TimeIter in range(gp.NumberOfTimeInstances):
    if con.GaitPhases.LeftLeg[0][TimeIter - 1] == 'transfer':
        LeftLegTransferLength = LeftLegTransferLength + 1
    elif con.GaitPhases.LeftLeg[0][TimeIter - 1] == 'support':
        if LeftLegTransferLength != 0:
            if (TimeIter - LeftLegTransferLength - 1) > 0:
                con.GaitEndPointsTrajectory.r_LF[:,
                TimeIter - LeftLegTransferLength - 2: TimeIter - 1] = r_GenerateStep(
                    con.GaitEndPointsTrajectory.r_LF[:, TimeIter - LeftLegTransferLength - 2],
                    con.GaitEndPointsTrajectory.r_LF[:, TimeIter - 1], LeftLegTransferLength + 2, gp.StepHeight)
                con.GaitEndPointsTrajectory.rot_LF[:, :,
                TimeIter - LeftLegTransferLength - 2: TimeIter - 1] = rot_GenerateStep(
                    con.GaitEndPointsTrajectory.rot_LF[:, :, TimeIter - LeftLegTransferLength - 2],
                    con.GaitEndPointsTrajectory.rot_LF[:, :, TimeIter - 1], LeftLegTransferLength + 2)
            # else:
            # TODO: traj gen start( if leg started in transfer mode)

    LeftLegTransferLength = 0

    if con.GaitPhases.RightLeg[0][TimeIter - 1] == 'transfer':
        RightLegTransferLength = RightLegTransferLength + 1
    elif con.GaitPhases.RightLeg[0][TimeIter - 1] == 'support':
        if RightLegTransferLength != 0:
            if (TimeIter - RightLegTransferLength - 1) > 0:
                con.GaitEndPointsTrajectory.r_RF[:,
                TimeIter - RightLegTransferLength - 2: TimeIter - 1] = r_GenerateStep(
                    con.GaitEndPointsTrajectory.r_RF[:, TimeIter - RightLegTransferLength - 2],
                    con.GaitEndPointsTrajectory.r_RF[:, TimeIter - 1], RightLegTransferLength + 2, gp.StepHeight)
                con.GaitEndPointsTrajectory.rot_RF[:, :,
                TimeIter - RightLegTransferLength - 2: TimeIter - 1] = rot_GenerateStep(
                    con.GaitEndPointsTrajectory.rot_RF[:, :, TimeIter - RightLegTransferLength - 2],
                    con.GaitEndPointsTrajectory.rot_RF[:, :, TimeIter - 1], RightLegTransferLength + 2)  # else:
                # TODO: traj gen start( if leg started in transfer mode)

    RightLegTransferLength = 0

# if LeftLegTransferLength != 0:
# TODO: traj gen ( if leg ended in transfer mode)

# if RightLegTransferLength != 0:
# TODO: traj gen ( if leg ended in transfer mode)

# Fill Gait SubPol
for TimeIter in range(gp.NumberOfTimeInstances):
    con.GaitSupportPolygon.LeftFootLeftToes[:, [TimeIter - 1]] = con.GaitEndPointsTrajectory.r_LF[:,
                                                                 [TimeIter - 1]] + con.GaitEndPointsTrajectory.rot_LF[:,
                                                                                   :, TimeIter - 1] @ mp.r_LF_left_toe
    con.GaitSupportPolygon.LeftFootRightToes[:, [TimeIter - 1]] = con.GaitEndPointsTrajectory.r_LF[:,
                                                                  [TimeIter - 1]] + con.GaitEndPointsTrajectory.rot_LF[
                                                                                    :, :,
                                                                                    TimeIter - 1] @ mp.r_LF_right_toe
    con.GaitSupportPolygon.LeftFootLeftHeel[:, [TimeIter - 1]] = con.GaitEndPointsTrajectory.r_LF[:,
                                                                 [TimeIter - 1]] + con.GaitEndPointsTrajectory.rot_LF[:,
                                                                                   :, TimeIter - 1] @ mp.r_LF_left_heel
    con.GaitSupportPolygon.LeftFootRightHeel[:, [TimeIter - 1]] = con.GaitEndPointsTrajectory.r_LF[:,
                                                                  [TimeIter - 1]] + con.GaitEndPointsTrajectory.rot_LF[
                                                                                    :, :,
                                                                                    TimeIter - 1] @ mp.r_LF_right_heel
    con.GaitSupportPolygon.LeftFootCenter[:, [TimeIter - 1]] = con.GaitEndPointsTrajectory.r_LF[:,
                                                               [TimeIter - 1]] + con.GaitEndPointsTrajectory.rot_LF[:,
                                                                                 :, TimeIter - 1] @ mp.r_LF_center
    con.GaitSupportPolygon.RightFootLeftToes[:, [TimeIter - 1]] = con.GaitEndPointsTrajectory.r_RF[:,
                                                                  [TimeIter - 1]] + con.GaitEndPointsTrajectory.rot_RF[
                                                                                    :, :,
                                                                                    TimeIter - 1] @ mp.r_RF_left_toe
    con.GaitSupportPolygon.RightFootRightToes[:, [TimeIter - 1]] = con.GaitEndPointsTrajectory.r_RF[:,
                                                                   [TimeIter - 1]] + con.GaitEndPointsTrajectory.rot_RF[
                                                                                     :, :,
                                                                                     TimeIter - 1] @ mp.r_RF_right_toe
    con.GaitSupportPolygon.RightFootLeftHeel[:, [TimeIter - 1]] = con.GaitEndPointsTrajectory.r_RF[:,
                                                                  [TimeIter - 1]] + con.GaitEndPointsTrajectory.rot_RF[
                                                                                    :, :,
                                                                                    TimeIter - 1] @ mp.r_RF_left_heel
    con.GaitSupportPolygon.RightFootRightHeel[:, [TimeIter - 1]] = con.GaitEndPointsTrajectory.r_RF[:,
                                                                   [TimeIter - 1]] + con.GaitEndPointsTrajectory.rot_RF[
                                                                                     :, :,
                                                                                     TimeIter - 1] @ mp.r_RF_right_heel
    con.GaitSupportPolygon.RightFootCenter[:, [TimeIter - 1]] = con.GaitEndPointsTrajectory.r_RF[:,
                                                                [TimeIter - 1]] + con.GaitEndPointsTrajectory.rot_RF[:,
                                                                                  :, TimeIter - 1] @ mp.r_RF_center

# Plotting results
plotResults(con.GaitEndPointsTrajectory.r_LF, "Left Foot")
plotResults(con.GaitEndPointsTrajectory.r_LH, "Left Hand")
plotResults(con.GaitEndPointsTrajectory.r_RF, "Right Foot")
plotResults(con.GaitEndPointsTrajectory.r_RH, "Left Hand")
plotResults(con.GaitEndPointsTrajectory.r_W, "Waist")
