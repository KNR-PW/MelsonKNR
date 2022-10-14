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
    R = np.array([[0,-r(2),r(1)],
                  [r(2),0,-r(0)],
                  [-r(1),r(0),0]])
    return R
# Funkcja generująca odwrotną macierz rotacji:

def inv_rot(R):
    return np.transpose(R)

# Funkcja generująca Jakobian:

# TODO umiescic link do pdf'a

def Jacobian(q,r_trajectory_vector,trajectory_vector):
    RTz = q(1); RTx = q(2); RTy = q(3); RSy = q(4); RFy = q(5); RFx = q(6); LTz = q(7); LTx = q(8); LTy = q(9); LSy = q(10);
    LFy = q(11); LFx = q(12); RAy = q(13); RAx = q(14); RFAy = q(15); LAy = q(16); LAx = q(17); LFAy = q(18); CHz = q(19)


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

    R_0_RF = con.euler2rot(trajectory_vector[15:18])
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

    e1 = trajectory_vector[15]
    e2 = trajectory_vector[16]

    E = np.array([[math.cos(e1)*math.sin(e2)/math.cos(e2),math.sin(e2)*math.sin(e1)/cos(e2),1],
                  [-math.sin(e1), cos(e1), 0],
                  [cos(e1)/cos(e2), sin(e1)/cos(e2), 0]])
    
    T = np.array([[np.ones(12, 12), np.zeros(12, 4)],
                  [np.zeros(3, 12), E, np.zeros(3,1)],
                  [np.zeros(1,15), 1]])

    # --- Prawa Noga ---

    # kolumna 1 #

    d1_LF = R_RF_W @ (-r_W_RT + r_W_LT) + R_RF_LT @ r_LT_LS + R_RF_LS @ r_LS_LF
    u1_LF = R_RF_RT @ kin.rotY(-RTy) @ kin.rotX(-RTx) @ Uz
    Jv1_LF = skew_matrix(u1_LF) @ d1_LF
    d1_RH = R_RF_W @ (-r_W_RT + r_W_CH) + R_RF_CH @ r_CH_RA + R_RF_RA @ r_RA_RFA + R_RF_RFA @ r_RFA_RH
    u1_RH = u1_LF
    Jv1_RH = skew_matrix(u1_RH) @ d1_RH
    d1_LH = R_RF_W @ (-r_W_RT + r_W_CH) + R_RF_CH @ r_CH_LA + R_RF_LA @ r_LA_LFA + R_RF_LFA @ r_LFA_LH
    u1_LH = u1_LF
    Jv1_LH = skew_matrix(u1_LH) @ d1_LH
    u1_com = u1_LF
    Jv1_com = (skew_matrix(u1_com) / TotalMas) @( R_RF_W @ (-r_W_RT + r_com_W)*mW
              + ( -R_RF_W @ (-r_W_RT+r_W_CH) +R_RF_CH @ r_com_CH) * mCH
              + (-R_RF_W @ (-r_W_RT + r_W_CH) + R_RF_CH @ r_CH_RA + R_RF_RA @ r_com_RA) * mRA
              + (d1_RH - R_RF_RFA @ (r_RFA_RH - r_com_RFA)) * mRFA
              + (-R_RF_W @ (-r_W_RT + r_W_CH) + R_RF_CH @ r_CH_LA + R_RF_LA @ r_com_LA) * mLA
              + (d1_LH - R_RF_LFA @ (r_LFA_LH - r_com_LFA)) * mLFA
              + (R_RF_W @ (-r_W_RT + r_W_LT) + R_RF_LT @ r_com_LT) * mLT
              + (R_RF_W @ (-r_W_RT + r_W_LT) + R_RF_LT @ r_LT_LS + R_RF_LS @ r_com_LS) * mLS
              + (d1_LF + R_RF_LF @ r_com_LF) * mLF)
    Jomega1_LF = u1_LF
    Jomega1_eta = (1/(math.sqrt(1-R_0_W[3,1] ** 2)))*(R_0_RF @ np.transpose(OmegaZ @ R_W_RF))[3,1]

    J1 = np.concatenate((Jv1_LF, Jv1_RH, Jv1_LH, Jv1_LF, Jv1_com, Jomega1_LF, Jomega1_eta))

    # kolumna 2 #

    d2_LF = d1_LF
    u2_LF = R_RF_RT @ kin.rotY(-RTy) @ Ux
    Jv2_LF = skew_matrix(u2_LF) @ d2_LF
    d2_RH = d1_RH
    u2_RH = u2_LF
    Jv2_RH = skew_matrix(u2_RH) @ d2_RH
    d2_LH = d1_LH
    u2_LH = u2_LF
    Jv2_LH = skew_matrix(u2_LH) @ d2_LH
    u2_com = u2_LF
    Jv2_com = (skew_matrix(u2_com)) @ np.linalg.inv((skew_matrix(u1_com))) @ Jv1_com
    Jomega2_LF = u2_LF
    Jomega2_eta = (1 / (math.sqrt(1-R_0_W[3, 1] ** 2))) * (R_0_RF @ np.transpose(kin.rotZ(RTz) @ OmegaX @ kin.rotX(RTx) @ kin.rotY(RTy) @ R_RT_RS @ R_RS_RF))[3, 1]

    J2 = np.concatenate((Jv2_LF, Jv2_RH, Jv2_LH, Jv2_LF, Jv2_com, Jomega2_LF, Jomega2_eta))

    # kolumna 3 #

    d3_LF = d1_LF
    u3_LF = R_RF_RT @ Uy
    Jv3_LF = skew_matrix(u3_LF) @ d3_LF
    d3_RH = d1_RH
    u3_RH = u3_LF
    Jv3_RH = skew_matrix(u3_RH) @ d3_RH
    d3_LH = d1_LH
    u3_LH = u3_LF
    Jv3_LH = skew_matrix(u3_LH) @ d3_LH
    u3_com = u3_LF
    Jv3_com = (skew_matrix(u3_com)) @ np.linalg.inv((skew_matrix(u1_com))) @ Jv1_com
    Jomega3_LF = u3_LF
    Jomega3_eta = (1 / (math.sqrt(1 - R_0_W[3, 1] ** 2))) * \
                  (R_0_RF @ np.transpose(kin.rotZ(RTz) @ kin.rotX(RTx) @ OmegaY @ kin.rotY(RTy) @ R_RT_RS @ R_RS_RF))[3, 1]

    J3 = np.concatenate((Jv3_LF, Jv3_RH, Jv3_LH, Jv3_LF, Jv3_com, Jomega3_LF, Jomega3_eta))

    # kolumna 4 #

    a = R_RF_RT @ r_RT_RS
    b = R_RF_RT @ (-r_RT_RS + r_com_RT)
    d4_LF = d1_LF - a
    u4_LF = R_RF_RS @ Uy
    Jv4_LF = skew_matrix(u4_LF) @ d4_LF
    d4_RH = d1_RH - a
    u4_RH = u4_LF
    Jv4_RH = skew_matrix(u4_RH) @ d4_RH
    d4_LH = d1_LH - a
    u4_LH = u4_LF
    Jv4_LH = skew_matrix(u4_LH) @ d4_LH
    u4_com = u4_LF
    Jv4_com = ((skew_matrix(u4_com))/TotalMas) @ (b*mRT + (-a) * (mW + mCH + mRA + mRFA + mLA + mLFA + mLT + mLS + mLF) + np.linalg.inv((skew_matrix(u1_com))) @ Jv1_com * TotalMas)
    Jomega4_LF = u4_LF
    Jomega4_eta = (1 / (math.sqrt(1 - R_0_W[3, 1] ** 2))) * \
                  (R_0_RF @ np.transpose(R_W_RT @ OmegaY @ R_RT_RS @ R_RS_RF))[3, 1]

    J4 = np.concatenate((Jv4_LF, Jv4_RH, Jv4_LH, Jv4_LF, Jv4_com, Jomega4_LF, Jomega4_eta))

    # kolumna 5 #

    c = R_RF_RS @ r_RS_RF
    d = R_RF_RS @ (-r_RS_RF + r_com_RS)
    d5_LF = d4_LF - c
    u5_LF = kin.rotY(-RFx) @ Uy
    Jv5_LF = skew_matrix(u5_LF) @ d5_LF
    d5_RH = d4_RH - c
    u5_RH = u5_LF
    Jv5_RH = skew_matrix(u5_RH) @ d5_RH
    d5_LH = d4_LH - c
    u5_LH = u5_LF
    Jv5_LH = skew_matrix(u5_LH) @ d5_LH
    u5_com = u5_LF
    Jv5_com = ((skew_matrix(u5_com)) / TotalMas) @ (
                d * mRS + (-c) * (mRT + mW + mCH + mRA + mRFA + mLA + mLFA + mLT + mLS + mLF) + np.linalg.inv(
            (skew_matrix(u4_com))) @ Jv4_com * TotalMas)
    Jomega5_LF = u5_LF
    Jomega5_eta = (1 / (math.sqrt(1 - R_0_W[3, 1] ** 2))) * \
                  (R_0_RF @ np.transpose(R_W_RT @ R_RT_RS @ OmegaY @ R_RS_RF))[3, 1]

    J5 = np.concatenate((Jv5_LF, Jv5_RH, Jv5_LH, Jv5_LF, Jv5_com, Jomega5_LF, Jomega5_eta))

    # kolumna 6 #

    d6_LF = d5_LF
    u6_LF = Ux
    Jv6_LF = skew_matrix(u6_LF) @ d6_LF
    d6_RH = d5_RH
    u6_RH = u5_LF
    Jv6_RH = skew_matrix(u6_RH) @ d6_RH
    d6_LH = d5_LH
    u6_LH = u6_LF
    Jv6_LH = skew_matrix(u6_LH) @ d6_LH
    u6_com = u6_LF
    Jv6_com = (skew_matrix(u6_com)) @ np.linalg.inv((skew_matrix(u5_com))) @ Jv5_com
    Jomega6_LF = u6_LF
    Jomega6_eta = (1 / (math.sqrt(1 - R_0_W[3, 1] ** 2))) * \
                  (R_0_RF @ np.transpose(R_W_RT @ R_RT_RS @ kin.rotY(RFy) @ OmegaX @ kin.rotX(RFx)))[3, 1]

    J6 = np.concatenate((Jv6_LF, Jv6_RH, Jv6_LH, Jv6_LF, Jv6_com, Jomega6_LF, Jomega6_eta))

    # --- Lewa Noga ---

    # kolumna 7 #

    e = R_RF_W @ (-r_W_RT + r_W_LT)
    d7_LF = d7_LF - e
    u7_LF = R_RF_W @ Uz
    Jv7_LF = skew_matrix(u7_LF) @ d7_LF
    Jv7_RH = np.zeros((3, 1))
    Jv7_LH = np.zeros((3, 1))
    u7_com = u7_LF
    Jv7_com = (skew_matrix(u7_com) / TotalMas) @ (R_RF_LT @ r_com_LT * mLT
              + (R_RF_LT @ r_LT_LS + R_RF_LS @ r_com_LS) * mLS
              + (R_RF_LT @ r_LT_LS + R_RF_LS @ r_LS_LF + R_RF_LF @ r_com_LF) * mLF)
    Jomega7_LF = u7_LF
    Jomega7_eta = 0

    J7 = np.concatenate((Jv7_LF, Jv7_RH, Jv7_LH, Jv7_LF, Jv7_com, Jomega7_LF, Jomega7_eta))

    # kolumna 8 #

    d8_LF = d7_LF
    u8_LF = R_RF_W @ kin.rotZ(LTz) @ Ux
    Jv8_LF = skew_matrix(u8_LF) @ d8_LF
    Jv8_RH = np.zeros((3, 1))
    Jv8_LH = np.zeros((3, 1))
    u8_com = u8_LF
    Jv8_com = skew_matrix(u8_com) @ np.linalg.inv(skew_matrix(u7_com)) @ Jv7_com
    Jomega8_LF = u8_LF
    Jomega8_eta = 0

    J8 = np.concatenate((Jv8_LF, Jv8_RH, Jv8_LH, Jv8_LF, Jv8_com, Jomega8_LF, Jomega8_eta))

    # kolumna 9 #

    d9_LF = d7_LF
    u9_LF = R_RF_W @ kin.rotZ(LTz) @ kin.rotX(LTx) @ Uy
    Jv9_LF = skew_matrix(u9_LF) @ d9_LF
    Jv9_RH = np.zeros((3, 1))
    Jv9_LH = np.zeros((3, 1))
    u9_com = u9_LF
    Jv9_com = skew_matrix(u9_com) @ np.linalg.inv(skew_matrix(u7_com)) @ Jv7_com
    Jomega9_LF = u9_LF
    Jomega9_eta = 0

    J9 = np.concatenate((Jv9_LF, Jv9_RH, Jv9_LH, Jv9_LF, Jv9_com, Jomega9_LF, Jomega9_eta))

    # kolumna 10 #

    f = R_RF_LT @ r_LT_LS
    d10_LF = d7_LF - f
    u10_LF = R_RF_LT @ Uy
    Jv10_LF = skew_matrix(u10_LF) @ d10_LF
    Jv10_RH = np.zeros((3,1))
    Jv10_LH = np.zeros((3,1))
    u10_com = u10_LF
    Jv10_com = (skew_matrix(u10_com)/TotalMas) @ (np.linalg.inv(skew_matrix(u7_com))@Jv7_com*TotalMas - R_RF_LT @ r_com_LT*mLT+(-f) * (mLS+mLF))
    Jomega10_LF = u10_LF
    Jomega10_eta = 0

    J10 = np.concatenate((Jv10_LF, Jv10_RH, Jv10_LH, Jv10_LF, Jv10_com, Jomega10_LF, Jomega10_eta ))

    # kolumna 11 #

    Jv11_LF =np.zeros((3,1))
    Jv11_RH =np.zeros((3,1))
    Jv11_LH =np.zeros((3,1))
    u11_com = R_RF_LS @ Uy
    Jv11_com = (skew_matrix(u11_com)/TotalMas)*(R_RF_LF @ r_com_LF * mLF)
    Jomega11_LF = R_RF_LS @ Uy
    Jomega11_eta = 0

    J11 = np.concatenate((Jv11_LF, Jv11_RH, Jv11_LH, Jv11_LF, Jv11_com, Jomega11_LF, Jomega11_eta ))


    # kolumna 12 #

    Jv12_LF = np.zeros((3, 1))
    Jv12_RH = np.zeros((3, 1))
    Jv12_LH = np.zeros((3, 1))
    u12_com = R_RF_LS@kin.rotY(LFy)@Ux
    Jv12_com = skew_matrix(u12_com) @ np.linalg.inv(skew_matrix(u12_com)) @ Jv11_com
    Jomega12_LF = R_RF_LS @ kin.rotY(LFy) @ Ux
    Jomega12_eta = 0

    J12 = np.concatenate((Jv12_LF, Jv12_RH, Jv12_LH, Jv12_LF, Jv12_com, Jomega12_LF, Jomega12_eta ))
    # --- Prawa ręka ---

    # kolumna 13 #

    g = -R_RF_W @ r_W_RT + R_RF_CH @ r_CH_RA
    Jv13_LF = np.zeros((3,1))
    d13_RH = d1_RH - g
    u13_RH = R_RF_CH @ Uy
    Jv13_RH = skew_matrix(u13_RH) @ d13_RH
    Jv13_LH = np.zeros((3,1))
    u13_com = u13_RH
    Jv13_com = (skew_matrix(u13_com)/TotalMas)*(R_RF_RA@r_com_RA * mRA + (R_RF_RA @ r_RA_RFA +R_RF_RFA @ r_com_RFA) * mRFA)

    Jomega13_LF = np.zeros((3,1))
    Jomega13_eta = 0

    J13 = np.concatenate((Jv13_LF, Jv13_RH, Jv13_LH, Jv13_LF, Jv13_com, Jomega13_LF, Jomega13_eta ))


    # kolumna 14 #

    Jv14_LF = np.zeros((3,1))
    d14_RH = d13_RH
    u14_RH = R_RF_CH @ kin.rotY(RAy) @ Ux
    Jv14_RH = skew_matrix(u14_RH) @ d14_RH
    Jv14_LH = np.zeros((3,1))

    u14_com = u14_RH
    Jv14_com = skew_matrix(u14_com) @ np.linalg.inv(skew_matrix(u14_com)) @ Jv13_com
    Jomega14_LF = np.zeros((3,1))
    Jomega14_eta = 0

    J14 = np.concatenate((Jv14_LF, Jv14_RH, Jv14_LH, Jv14_LF, Jv14_com, Jomega14_LF, Jomega14_eta ))


    # kolumna 15 #

    h = R_RF_RA @ r_RA_RFA

    Jv15_LF = np.zeros((3,1))
    d15_RH = d13_RH - h
    u15_RH = R_RF_RA @ Uy
    Jv15_RH = skew_matrix(u15_RH) @ d15_RH

    Jv15_LH = np.zeros((3,1))

    u15_com = u15_RH
    Jv15_com = (skew_matrix(u15_com)/TotalMas)(R_RF_RFA @ r_com_RFA * mRFA) 
    Jomega15_LF = np.zeros((3,1))
    Jomega15_eta = 0

    J15 = np.concatenate((Jv15_LF, Jv15_RH, Jv15_LH, Jv15_LF, Jv15_com, Jomega15_LF, Jomega15_eta ))

    # --- Lewa ręka ---

    # kolumna 16 #

    i = -R_RF_W @ r_W_RT + R_RF_CH @ r_CH_LA

    Jv16_LF = np.zeros((3,1))
    Jv16_RH = np.zeros((3,1))

    d16_LH = d1_LH - i
    u16_LH = R_RF_CH @ Uy
    Jv16_LH = skew_matrix(u16_LH) @ d16_LH

    u16_com = u16_LH
    Jv16_com = (skew_matrix(u16_com)/TotalMas) * (R_RF_LA @ r_com_LA * mLFA)

    Jomega16_LF = np.zeros((3,1))
    Jomega16_eta = 0

    J16 = np.concatenate((Jv16_LF, Jv16_RH, Jv16_LH, Jv16_LF, Jv16_com, Jomega16_LF, Jomega16_eta ))

    # kolumna 17 #

    Jv17_LF = np.zeros((3,1))
    Jv17_RH = np.zeros((3,1))

    d17_LH = d16_LH
    u17_LH = R_RF_CH @ kin.rotY(LAy) @ Ux
    Jv17_LH = skew_matrix(u17_LH) @ d17_LH

    u17_com = u17_LH
    Jv17_com = skew_matrix(u17_com) @ np.linalg.inv(skew_matrix(u16_com)) @ Jv16_com

    Jomega17_LF = np.zeros((3, 1))
    Jomega17_eta = 0

    J17 = np.concatenate((Jv17_LF, Jv17_RH, Jv17_LH, Jv17_LF, Jv17_com, Jomega17_LF, Jomega17_eta ))

    # Kolumna 18 #

    j = R_RF_LA @ r_LA_LFA

    Jv18_LF = np.zeros((3,1))
    Jv18_RH = np.zeros((3,1))
    d18_LH = d16_LH - j
    u18_LH = R_RF_LA @ Uy
    Jv18_LH = skew_matrix(u18_LH) @ d18_LH

    u18_com = u18_LH
    Jv18_com = (skew_matrix(u18_com)/TotalMas) * (R_RF_LFA @ r_com_LFA * mLFA)

    Jomega18_LF = np.zeros((3, 1))
    Jomega18_eta = 0

    J18 = np.concatenate((Jv18_LF, Jv18_RH, Jv18_LH, Jv18_LF, Jv18_com, Jomega18_LF, Jomega18_eta ))

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
    Jv19_com = (skew_matrix(u19_com)/TotalMas)*(R_RF_CH @ r_com_CH * mCH
                + (R_RF_CH @ r_CH_RA + R_RF_RA @ r_com_RA) * mRA
                + (R_RF_CH @ r_CH_RA + R_RF_RA @ r_RA_RFA + R_RF_RFA @ r_com_RFA) * mRFA
                + (R_RF_CH @ r_CH_RA + R_RF_LA @ r_com_LA) * mLA
                + (R_RF_CH @ r_CH_LA + R_RF_LA @ r_LA_LFA + R_RF_LFA @ r_com_LFA) * mLFA)

    Jomega19_LF = np.zeros((3,1))
    Jomega19_eta = 0

    J19 = np.concatenate((Jv19_LF, Jv19_RH, Jv19_LH, Jv19_LF, Jv19_com, Jomega19_LF, Jomega19_eta ))

    J = np.column_stack(J1,J2,J3,J4,J5,J6,J7,J8,J9,J10,J11,J12,J13,J14,J15,J16,J17,J18,J19)
    
    Ja = T @ J

    return Ja
