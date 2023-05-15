import numpy as np
import math as math
from src.humanoid_inv_kinematics.MelsonDynamic.RobotParameters import Kinematics as kin
from src.humanoid_inv_kinematics.MelsonDynamic import ConvertToRF as con
from src.humanoid_inv_kinematics.MelsonDynamic.RobotParameters.ModelParameters import * # <- wszystkie wektory stałe, masy oraz wersory "u" brane z tego

# Główna funkcja do generacji Jakobianu Melsona (nie Melmana!)

# Praca oparta podstawie dokumentu "Jakobian Melsona"

# Budowa wektora wspolrzednych zlaczowych:
# q = [q(1); q(2); q(3); q(4); q(5); q(6); q(7); q(8); q(9); q(10); q(11); q(12); q(13); q(14); q(15); q(16); q(17); q(18); q(19)]
# q = [RTz;  RTx;  RTy;  RSy;  RFy;  RFx;  LTz;  LTx;  LTy;  LSy;   LFy;   LFx;   RAy;   RAx;   RFAy;  LAy;   LAx;   LFAy;  CHz]

# r_X_Y - polozenie czlonu Y w ukladzie czlonu poprzedzajacego X

# R_X_Y - macierz rotacji transformująca wektor w zapisie układu Y do zapisu w układzie X

# Funkcja generująca macierz stowarzyszoną z wektorem:

def skew_matrix(r):
    R = np.array([[0,-r[2],r[1]],
                  [r[2],0,-r[0]],
                  [-r[1],r[0],0]], dtype = np.float)
    return R
# Funkcja generująca odwrotną macierz rotacji:

def inv_rot(R):
    return np.transpose(R)

# Funkcja generująca Jakobian:

# TODO umiescic link do pdf'a


def Jacobian_Melson(q, forward_kinematics_trajectory, trajectory_vector_0):
    RTz = q[0]; RTx = q[1]; RTy = q[2]; RSy = q[3]; RFy = q[4]; RFx = q[5]; LTz = q[6]; LTx = q[7]; LTy = q[8]; LSy = q[9]
    LFy = q[10]; LFx = q[11]; RAy = q[12]; RAx = q[13]; RFAy = q[14]; LAy = q[15]; LAx = q[16]; LFAy = q[17]; CHz = q[18]

    R_RA_RFA = kin.rotY(RFAy)
    R_CH_RA = kin.rotY(RAy)@kin.rotX(RAx)
    R_W_CH = kin.rotZ(CHz)
    R_W_RT = kin.rotZ(RTz)@kin.rotX(RTx)@kin.rotY(RTy)
    R_RT_RS = kin.rotY(RSy)
    R_RS_RF = kin.rotY(RFy)@kin.rotX(RFx)

    R_LA_LFA = kin.rotY(LFAy)
    R_CH_LA = kin.rotY(LAy) @ kin.rotX(LAx)
    R_W_CH = kin.rotZ(CHz)
    R_W_LT = kin.rotZ(LTz) @ kin.rotX(LTx) @ kin.rotY(LTy)
    R_LT_LS = kin.rotY(LSy)
    R_LS_LF = kin.rotY(LFy) @ kin.rotX(LFx)

    OmegaX = np.array([[0,0,0],
                       [0,0,-1],
                       [0,1,0]])
    OmegaY = np.array([[0, 0, 1],
                       [0, 0, 0],
                       [-1, 0, 0]])
    OmegaZ = np.array([[0, -1, 0],
                       [1, 0, 0],
                       [0, 0, 0]])

    R_0_RF = con.euler2rot(trajectory_vector_0[15:18])
    R_W_RF = R_W_RT @ R_RT_RS @ R_RS_RF
    R_RF_W = inv_rot(R_W_RF)
    R_0_W = R_0_RF @ R_RF_W
    R_RF_LT = R_RF_W @ R_W_LT
    R_RF_LS = R_RF_LT @ R_LT_LS
    R_RF_LF = R_RF_LS @ R_LS_LF
    R_RF_CH = R_RF_W @ R_W_CH
    R_RF_RA = R_RF_CH @ R_CH_RA
    R_RF_RFA = R_RF_RA @ R_RA_RFA
    R_RF_LA = R_RF_CH @ R_CH_LA
    R_RF_LFA = R_RF_LA @ R_LA_LFA
    R_RF_RT = R_RF_W @ R_W_RT
    R_RF_RS = R_RF_RT @ R_RT_RS

    e1 = forward_kinematics_trajectory[12]
    e2 = forward_kinematics_trajectory[13]
    e3 = forward_kinematics_trajectory[14]

    E = np.array([[math.cos(e1)*math.sin(e2)/math.cos(e2),math.sin(e2)*math.sin(e1)/math.cos(e2),1],
                 [-math.sin(e1), math.cos(e1), 0],
                 [math.cos(e1)/math.cos(e2), math.sin(e1)/math.cos(e2), 0]])
    #E = 1/math.cos(e2)* np.array([[0, math.sin(e3) , math.cos(e3)],
                   #[0, math.cos(e2)*math.cos(e3), -math.sin(e3)*math.cos(e2)],
                   #[math.cos(e2), math.sin(e3)*math.sin(e2),  math.cos(e3)*math.sin(e2)]])

    T = np.block([[np.eye(12), np.zeros((12, 3))],
                  [np.zeros((3, 12)), E]])

    # --- Prawa Noga ---

    # kolumna 1 #

    d1_LF = R_RF_W @ (-r_W_RT + r_W_LT) + R_RF_LT @ r_LT_LS + R_RF_LS @ r_LS_LF
    u1_LF = - R_RF_RT @ kin.rotY(-RTy) @ kin.rotX(-RTx) @ Uz
    Jv1_LF = skew_matrix(u1_LF) @ d1_LF
    d1_RH = R_RF_W @ (-r_W_RT + r_W_CH) + R_RF_CH @ r_CH_RA + R_RF_RA @ r_RA_RFA + R_RF_RFA @ r_RFA_RH
    u1_RH = u1_LF
    Jv1_RH = skew_matrix(u1_RH) @ d1_RH
    d1_LH = R_RF_W @ (-r_W_RT + r_W_CH) + R_RF_CH @ r_CH_LA + R_RF_LA @ r_LA_LFA + R_RF_LFA @ r_LFA_LH
    u1_LH = u1_LF
    Jv1_LH = skew_matrix(u1_LH) @ d1_LH
    u1_com = u1_LF
    Jv1_com_prev = ( R_RF_W @ (-r_W_RT + r_com_W)*mW
              + (R_RF_W @ (-r_W_RT+r_W_CH) +R_RF_CH @ r_com_CH) * mCH
              + (R_RF_W @ (-r_W_RT + r_W_CH) + R_RF_CH @ r_CH_RA + R_RF_RA @ r_com_RA) * mRA
              + (d1_RH - R_RF_RFA @ (r_RFA_RH - r_com_RFA)) * mRFA
              + (R_RF_W @ (-r_W_RT + r_W_CH) + R_RF_CH @ r_CH_LA + R_RF_LA @ r_com_LA) * mLA
              + (d1_LH - R_RF_LFA @ (r_LFA_LH - r_com_LFA)) * mLFA
              + (R_RF_W @ (-r_W_RT + r_W_LT) + R_RF_LT @ r_com_LT) * mLT
              + (R_RF_W @ (-r_W_RT + r_W_LT) + R_RF_LT @ r_LT_LS + R_RF_LS @ r_com_LS) * mLS
              + (d1_LF + R_RF_LF @ r_com_LF) * mLF)
    Jv1_com = (skew_matrix(u1_com) / TotalMas) @ Jv1_com_prev
    Jomega1_LF = u1_LF
    #Jomega1_eta = -(1/(math.sqrt(1-R_0_W[2,0] ** 2)))*(R_0_RF @ np.transpose(OmegaZ @ R_W_RF))[2,0]

    J1 = np.concatenate([Jv1_LF, Jv1_RH, Jv1_LH, Jv1_com, Jomega1_LF])
    # J1 = np.append(J1, Jomega1_eta)
    # kolumna 2 #

    d2_LF = d1_LF
    u2_LF = - R_RF_RT @ kin.rotY(-RTy) @ Ux
    Jv2_LF = skew_matrix(u2_LF) @ d2_LF
    d2_RH = d1_RH
    u2_RH = u2_LF
    Jv2_RH = skew_matrix(u2_RH) @ d2_RH
    d2_LH = d1_LH
    u2_LH = u2_LF
    Jv2_LH = skew_matrix(u2_LH) @ d2_LH
    u2_com = u2_LF
    Jv2_com = ((skew_matrix(u2_com)) / TotalMas) @ Jv1_com_prev
    Jomega2_LF = u2_LF
    #Jomega2_eta = -(1 / (math.sqrt(1-R_0_W[2, 0] ** 2))) * (R_0_RF @ np.transpose(kin.rotZ(RTz) @ OmegaX @ kin.rotX(RTx) @ kin.rotY(RTy) @ R_RT_RS @ R_RS_RF))[2, 0]

    J2 = np.concatenate((Jv2_LF, Jv2_RH, Jv2_LH, Jv2_com, Jomega2_LF))
    # J2 = np.append(J2, Jomega2_eta)
    # kolumna 3 #

    d3_LF = d1_LF
    u3_LF = - R_RF_RT @ Uy
    Jv3_LF = skew_matrix(u3_LF) @ d3_LF
    d3_RH = d1_RH
    u3_RH = u3_LF
    Jv3_RH = skew_matrix(u3_RH) @ d3_RH
    d3_LH = d1_LH
    u3_LH = u3_LF
    Jv3_LH = skew_matrix(u3_LH) @ d3_LH
    u3_com = u3_LF
    Jv3_com = ((skew_matrix(u3_com))/TotalMas) @ Jv1_com_prev
    Jomega3_LF = u3_LF
    #Jomega3_eta = -(1 / (math.sqrt(1 - R_0_W[2, 0] ** 2))) * \
                 # (R_0_RF @ np.transpose(kin.rotZ(RTz) @ kin.rotX(RTx) @ OmegaY @ kin.rotY(RTy) @ R_RT_RS @ R_RS_RF))[2, 0]

    J3 = np.concatenate((Jv3_LF, Jv3_RH, Jv3_LH, Jv3_com, Jomega3_LF))
    #J3 = np.append(J3, Jomega3_eta)
    # kolumna 4 #

    a = R_RF_RT @ r_RT_RS
    b = R_RF_RT @ (-r_RT_RS + r_com_RT)
    d4_LF = d1_LF - a
    u4_LF = - R_RF_RS @ Uy
    Jv4_LF = skew_matrix(u4_LF) @ d4_LF
    d4_RH = d1_RH - a
    u4_RH = u4_LF
    Jv4_RH = skew_matrix(u4_RH) @ d4_RH
    d4_LH = d1_LH - a
    u4_LH = u4_LF
    Jv4_LH = skew_matrix(u4_LH) @ d4_LH
    u4_com = u4_LF
    Jv4_com_prev = (b*mRT + (-a) * (mW + mCH + mRA + mRFA + mLA + mLFA + mLT + mLS + mLF) + Jv1_com_prev)
    Jv4_com = ((skew_matrix(u4_com))/TotalMas) @ Jv4_com_prev
    Jomega4_LF = u4_LF
# Jomega4_eta = -(1 / (math.sqrt(1 - R_0_W[2, 0] ** 2))) * \
                  #(R_0_RF @ np.transpose(R_W_RT @ OmegaY @ R_RT_RS @ R_RS_RF))[2, 0]

    J4 = np.concatenate((Jv4_LF, Jv4_RH, Jv4_LH, Jv4_com, Jomega4_LF))
    #J4 = np.append(J4, Jomega4_eta)
    # kolumna 5 #

    c = R_RF_RS @ r_RS_RF
    d = R_RF_RS @ (-r_RS_RF + r_com_RS)
    d5_LF = d4_LF - c
    u5_LF = - kin.rotY(-RFx) @ Uy
    Jv5_LF = skew_matrix(u5_LF) @ d5_LF
    d5_RH = d4_RH - c
    u5_RH = u5_LF
    Jv5_RH = skew_matrix(u5_RH) @ d5_RH
    d5_LH = d4_LH - c
    u5_LH = u5_LF
    Jv5_LH = skew_matrix(u5_LH) @ d5_LH
    u5_com = u5_LF
    Jv5_com_prev = (
                d * mRS + (-c) * (mRT + mW + mCH + mRA + mRFA + mLA + mLFA + mLT + mLS + mLF) + Jv4_com_prev)
    Jv5_com = ((skew_matrix(u5_com)) / TotalMas) @ Jv5_com_prev
    Jomega5_LF = u5_LF
# Jomega5_eta = -(1 / (math.sqrt(1 - R_0_W[2, 0] ** 2))) * \
                  #(R_0_RF @ np.transpose(R_W_RT @ R_RT_RS @ OmegaY @ R_RS_RF))[2, 0]

    J5 = np.concatenate((Jv5_LF, Jv5_RH, Jv5_LH, Jv5_com, Jomega5_LF))
# J5 = np.append(J5, Jomega5_eta)
    # kolumna 6 #

    d6_LF = d5_LF
    u6_LF = - Ux
    Jv6_LF = skew_matrix(u6_LF) @ d6_LF
    d6_RH = d5_RH
    u6_RH = u6_LF
    Jv6_RH = skew_matrix(u6_RH) @ d6_RH
    d6_LH = d5_LH
    u6_LH = u6_LF
    Jv6_LH = skew_matrix(u6_LH) @ d6_LH
    u6_com = u6_LF
    Jv6_com = ((skew_matrix(u6_com))/TotalMas) @ Jv5_com_prev
    Jomega6_LF = u6_LF
    #Jomega6_eta = -(1 / (math.sqrt(1 - R_0_W[2, 0] ** 2))) * \
                  #(R_0_RF @ np.transpose(R_W_RT @ R_RT_RS @ kin.rotY(RFy) @ OmegaX @ kin.rotX(RFx)))[2, 0]

    J6 = np.concatenate((Jv6_LF, Jv6_RH, Jv6_LH, Jv6_com, Jomega6_LF))
# J6 = np.append(J6, Jomega6_eta)
    # --- Lewa Noga ---

    # kolumna 7 #

    e = R_RF_W @ (-r_W_RT + r_W_LT)
    d7_LF = d1_LF - e
    u7_LF = R_RF_W @ Uz
    Jv7_LF = skew_matrix(u7_LF) @ d7_LF
    Jv7_RH = np.zeros((3, 1))
    Jv7_LH = np.zeros((3, 1))
    u7_com = u7_LF
    Jv7_com_prev = (R_RF_LT @ r_com_LT * mLT
              + (R_RF_LT @ r_LT_LS + R_RF_LS @ r_com_LS) * mLS
              + (R_RF_LT @ r_LT_LS + R_RF_LS @ r_LS_LF + R_RF_LF @ r_com_LF) * mLF)
    Jv7_com = (skew_matrix(u7_com) / TotalMas) @ Jv7_com_prev
    Jomega7_LF = u7_LF
    #Jomega7_eta = 0

    J7 = np.concatenate((Jv7_LF, Jv7_RH, Jv7_LH, Jv7_com, Jomega7_LF))
    #J7 = np.append(J7, Jomega7_eta)

    # kolumna 8 #

    d8_LF = d7_LF
    u8_LF = R_RF_W @ kin.rotZ(LTz) @ Ux
    Jv8_LF = skew_matrix(u8_LF) @ d8_LF
    Jv8_RH = np.zeros((3, 1))
    Jv8_LH = np.zeros((3, 1))
    u8_com = u8_LF
    Jv8_com = (skew_matrix(u8_com)/TotalMas) @ Jv7_com_prev
    Jomega8_LF = u8_LF
    #Jomega8_eta = 0

    J8 = np.concatenate((Jv8_LF, Jv8_RH, Jv8_LH, Jv8_com, Jomega8_LF))
    #J8 = np.append(J8, Jomega8_eta)

    # kolumna 9 #

    d9_LF = d7_LF
    u9_LF = R_RF_W @ kin.rotZ(LTz) @ kin.rotX(LTx) @ Uy
    Jv9_LF = skew_matrix(u9_LF) @ d9_LF
    Jv9_RH = np.zeros((3, 1))
    Jv9_LH = np.zeros((3, 1))
    u9_com = u9_LF
    Jv9_com = (skew_matrix(u9_com)/TotalMas) @ Jv7_com_prev
    Jomega9_LF = u9_LF
    #Jomega9_eta = 0

    J9 = np.concatenate((Jv9_LF, Jv9_RH, Jv9_LH, Jv9_com, Jomega9_LF))
    #J9 = np.append(J9, Jomega9_eta)

    # kolumna 10 #

    f = R_RF_LT @ r_LT_LS
    d10_LF = d7_LF - f
    u10_LF = R_RF_LT @ Uy
    Jv10_LF = skew_matrix(u10_LF) @ d10_LF
    Jv10_RH = np.zeros((3,1))
    Jv10_LH = np.zeros((3,1))
    u10_com = u10_LF
    Jv10_com = (skew_matrix(u10_com)/TotalMas) @ (Jv7_com_prev - R_RF_LT @ r_com_LT*mLT+(-f) * (mLS+mLF))
    Jomega10_LF = u10_LF
    #Jomega10_eta = 0

    J10 = np.concatenate((Jv10_LF, Jv10_RH, Jv10_LH, Jv10_com, Jomega10_LF))
    #J10 = np.append(J10, Jomega10_eta)
    # kolumna 11 #

    Jv11_LF =np.zeros((3,1))
    Jv11_RH =np.zeros((3,1))
    Jv11_LH =np.zeros((3,1))
    u11_com = R_RF_LS @ Uy
    Jv11_com_prev = (R_RF_LF @ r_com_LF * mLF)
    Jv11_com = (skew_matrix(u11_com)/TotalMas) @ Jv11_com_prev
    Jomega11_LF = R_RF_LS @ Uy
    #Jomega11_eta = 0

    J11 = np.concatenate((Jv11_LF, Jv11_RH, Jv11_LH, Jv11_com, Jomega11_LF))
    #J11 = np.append(J11, Jomega11_eta)


    # kolumna 12 #

    Jv12_LF = np.zeros((3, 1))
    Jv12_RH = np.zeros((3, 1))
    Jv12_LH = np.zeros((3, 1))
    u12_com = R_RF_LS@kin.rotY(LFy)@Ux
    Jv12_com = (skew_matrix(u12_com)/TotalMas) @  Jv11_com_prev
    Jomega12_LF = R_RF_LS @ kin.rotY(LFy) @ Ux
    #Jomega12_eta = 0

    J12 = np.concatenate((Jv12_LF, Jv12_RH, Jv12_LH, Jv12_com, Jomega12_LF))
    #J12 = np.append(J12, Jomega12_eta)

    # --- Prawa ręka ---

    # kolumna 13 #

    g = -R_RF_W @ r_W_RT + R_RF_CH @ r_CH_RA
    Jv13_LF = np.zeros((3,1))
    d13_RH = d1_RH - g
    u13_RH = R_RF_CH @ Uy
    Jv13_RH = skew_matrix(u13_RH) @ d13_RH
    Jv13_LH = np.zeros((3,1))
    u13_com = u13_RH
    JV13_com_prev = (R_RF_RA@r_com_RA * mRA + (R_RF_RA @ r_RA_RFA +R_RF_RFA @ r_com_RFA) * mRFA)
    Jv13_com = (skew_matrix(u13_com)/TotalMas) @ JV13_com_prev
    Jomega13_LF = np.zeros((3,1))
    #Jomega13_eta = 0

    J13 = np.concatenate((Jv13_LF, Jv13_RH, Jv13_LH, Jv13_com, Jomega13_LF))
    #J13 = np.append(J13, Jomega13_eta)


    # kolumna 14 #

    Jv14_LF = np.zeros((3,1))
    d14_RH = d13_RH
    u14_RH = R_RF_CH @ kin.rotY(RAy) @ Ux
    Jv14_RH = skew_matrix(u14_RH) @ d14_RH
    Jv14_LH = np.zeros((3,1))

    u14_com = u14_RH
    Jv14_com = skew_matrix(u14_com)/TotalMas @ JV13_com_prev
    Jomega14_LF = np.zeros((3,1))
    #Jomega14_eta = 0

    J14 = np.concatenate((Jv14_LF, Jv14_RH, Jv14_LH, Jv14_com, Jomega14_LF))
    #J14 = np.append(J14, Jomega14_eta)

    # kolumna 15 #

    h = R_RF_RA @ r_RA_RFA

    Jv15_LF = np.zeros((3,1))
    d15_RH = d13_RH - h
    u15_RH = R_RF_RA @ Uy
    Jv15_RH = skew_matrix(u15_RH) @ d15_RH

    Jv15_LH = np.zeros((3,1))

    u15_com = u15_RH
    Jv15_com_prev = (R_RF_RFA @ r_com_RFA * mRFA)
    Jv15_com = (skew_matrix(u15_com)/TotalMas) @ Jv15_com_prev
    Jomega15_LF = np.zeros((3,1))
    #Jomega15_eta = 0

    J15 = np.concatenate((Jv15_LF, Jv15_RH, Jv15_LH, Jv15_com, Jomega15_LF))
    #J15 = np.append(J15, Jomega15_eta)

    # --- Lewa ręka ---

    # kolumna 16 #

    i = -R_RF_W @ r_W_RT + R_RF_CH @ r_CH_LA

    Jv16_LF = np.zeros((3,1))
    Jv16_RH = np.zeros((3,1))

    d16_LH = d1_LH - i
    u16_LH = R_RF_CH @ Uy
    Jv16_LH = skew_matrix(u16_LH) @ d16_LH

    u16_com = u16_LH
    Jv16_com_prev = (R_RF_LA @ r_com_LA * mLA + (R_RF_LA @ r_LA_LFA + R_RF_LFA @ r_com_LFA) * mLFA)
    Jv16_com = (skew_matrix(u16_com)/TotalMas) @ Jv16_com_prev

    Jomega16_LF = np.zeros((3,1))
    #Jomega16_eta = 0

    J16 = np.concatenate((Jv16_LF, Jv16_RH, Jv16_LH, Jv16_com, Jomega16_LF))
    #J16 = np.append(J16, Jomega16_eta)

    # kolumna 17 #

    Jv17_LF = np.zeros((3,1))
    Jv17_RH = np.zeros((3,1))

    d17_LH = d16_LH
    u17_LH = R_RF_CH @ kin.rotY(LAy) @ Ux
    Jv17_LH = skew_matrix(u17_LH) @ d17_LH

    u17_com = u17_LH
    Jv17_com = skew_matrix(u17_com)/TotalMas @ Jv16_com_prev

    Jomega17_LF = np.zeros((3, 1))
    #Jomega17_eta = 0

    J17 = np.concatenate((Jv17_LF, Jv17_RH, Jv17_LH, Jv17_com, Jomega17_LF))
    #J17 = np.append(J17, Jomega17_eta)

    # Kolumna 18 #

    j = R_RF_LA @ r_LA_LFA

    Jv18_LF = np.zeros((3,1))
    Jv18_RH = np.zeros((3,1))
    d18_LH = d16_LH - j
    u18_LH = R_RF_LA @ Uy
    Jv18_LH = skew_matrix(u18_LH) @ d18_LH
    u18_com = u18_LH
    Jv18_com_prev = (R_RF_LFA @ r_com_LFA * mLFA)
    Jv18_com = (skew_matrix(u18_com)/TotalMas) @ Jv18_com_prev

    Jomega18_LF = np.zeros((3, 1))
    #Jomega18_eta = 0

    J18 = np.concatenate((Jv18_LF, Jv18_RH, Jv18_LH, Jv18_com, Jomega18_LF))
    #J18 = np.append(J18, Jomega18_eta)

    # --- Klatka piersiowa ---

    # Kolumna 19 #

    k = -R_RF_W @ r_W_RT

    Jv19_LF = np.zeros((3, 1))

    d19_RH = d1_RH - k
    u19_RH = R_RF_W @ Uz
    Jv19_RH = skew_matrix(u19_RH) @ d19_RH

    d19_LH = d1_LH - k
    u19_LH = u19_RH
    Jv19_LH = skew_matrix(u19_LH) @ d19_LH

    u19_com = u19_LH
    Jv19_com = (skew_matrix(u19_com)/TotalMas)@(R_RF_CH @ r_com_CH * mCH
                + (R_RF_CH @ r_CH_RA + R_RF_RA @ r_com_RA) * mRA
                + (R_RF_CH @ r_CH_RA + R_RF_RA @ r_RA_RFA + R_RF_RFA @ r_com_RFA) * mRFA
                + (R_RF_CH @ r_CH_LA + R_RF_LA @ r_com_LA) * mLA
                + (R_RF_CH @ r_CH_LA + R_RF_LA @ r_LA_LFA + R_RF_LFA @ r_com_LFA) * mLFA)

    Jomega19_LF = np.zeros((3,1))
    #Jomega19_eta = 0

    J19 = np.concatenate((Jv19_LF, Jv19_RH, Jv19_LH, Jv19_com, Jomega19_LF))
    #J19 = np.append(J19, Jomega19_eta)

    J = np.column_stack((J1,J2,J3,J4,J5,J6,J7,J8,J9,J10,J11,J12,J13,J14,J15,J16,J17,J18,J19))

    J_a = T @ J
    return J_a
#J = Jacobian([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
#print(Jacobian([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]))