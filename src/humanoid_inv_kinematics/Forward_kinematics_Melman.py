import numpy as np
import math as math
from src.humanoid_inv_kinematics.MelsonDynamic.RobotParameters import Kinematics as kin
from src.humanoid_inv_kinematics.MelsonDynamic import ConvertToRF as con
from src.humanoid_inv_kinematics.MelsonDynamic.RobotParameters.ModelParameters import * # <- wszystkie wektory stałe, masy oraz wersory "u" brane z tego
from src.humanoid_inv_kinematics.MelsonDynamic.ConvertToRF import rot2euler as euler
# Funkcja do generowania kinematyki prostej Melmana (nie Melsona!)

# Biodro (W) oraz klatka (CH) zostały zastąpione jednym członem klato_biodrem (CHW) xD

# Praca oparta podstawie dokumentu "Jakobian Melsona"

# Budowa wektora wspolrzednych zlaczowych:
# q = [q(1); q(2); q(3); q(4); q(5); q(6); q(7); q(8); q(9); q(10); q(11); q(12); q(13); q(14); q(15); q(16); q(17); q(18)]
# q = [RTz;  RTx;  RTy;  RSy;  RFy;  RFx;  LTz;  LTx;  LTy;  LSy;   LFy;   LFx;   RAy;   RAx;   RFAy;  LAy;   LAx;   LFAy]

# r_X_Y - polozenie czlonu Y w ukladzie czlonu poprzedzajacego X

# R_X_Y - macierz rotacji transformująca wektor w zapisie układu Y do zapisu w układzie X

# Funkcja generująca macierz stowarzyszoną z wektorem:

def skew_matrix(r):
    R = np.array([[0,-r[2],r[1]],
                  [r[2],0,-r[0]],
                  [-r[1],r[0],0]])
    return R
# Funkcja generująca odwrotną macierz rotacji:

def inv_rot(R,trajectory_vector):
    return np.transpose(R)

# Funkcja do kinematyki prostej:

def Forawrd_kinematics_Melman(q):
    RTz = q[0];RTx = q[1];RTy = q[2];RSy = q[3];RFy = q[4];RFx = q[5];LTz = q[6];LTx = q[7];LTy = q[8];LSy = q[9]
    LFy = q[10];LFx = q[11];RAy = q[12];RAx = q[13];RFAy = q[14];LAy = q[15]; LAx = q[16];LFAy = q[17];

    R_RA_RFA = kin.rotY(RFAy)
    R_CHW_RA = kin.rotY(RAy) @ kin.rotX(RAx)
    R_CHW_RT = kin.rotZ(RTz) @ kin.rotX(RTx) @ kin.rotY(RTy)
    R_RT_RS = kin.rotY(RSy)
    R_RS_RF = kin.rotY(RFy) @ kin.rotX(RFx)

    R_LA_LFA = kin.rotY(LFAy)
    R_CHW_LA = kin.rotY(LAy) @ kin.rotX(LAx)
    R_CHW_LT = kin.rotZ(LTz) @ kin.rotX(LTx) @ kin.rotY(LTy)
    R_LT_LS = kin.rotY(LSy)
    R_LS_LF = kin.rotY(LFy) @ kin.rotX(LFx)


    R_CHW_RF = R_CHW_RT @ R_RT_RS @ R_RS_RF
    R_RF_CHW = inv_rot(R_CHW_RF)
    R_0_CHW = R_0_RF @ R_RF_CHW
    R_RF_LT = R_RF_CHW @ R_CHW_LT
    R_RF_LS = R_RF_LT @ R_LT_LS
    R_RF_LF = R_RF_LS @ R_LS_LF
    R_RF_RA = R_RF_CHW @ R_CHW_RA
    R_RF_RFA = R_RF_RA @ R_RA_RFA
    R_RF_LA = R_RF_CHW @ R_CHW_LA
    R_RF_LFA = R_RF_LA @ R_LA_LFA
    R_RF_RT = R_RF_CHW @ R_CHW_RT
    R_RF_RS = R_RF_RT @ R_RT_RS

    # Położenie LF względem RF
    r_RF_LF = -R_RF_RS @ r_RS_RF - R_RF_RT @ r_RT_RS + R_RF_CHW @ ( -r_CHW_RT + r_CHW_LT) +R_RF_LT @ r_LT_LS + R_RF_LS @ r_LS_LF

    # Położenie RH względem RF
    r_RF_RH = -R_RF_RS @ r_RS_RF - R_RF_RT @ r_RT_RS + R_RF_CHW @ ( -r_CHW_RT + r_CHW_RA) +R_RF_RA @ r_RA_RFA + R_RF_RFA @ r_RFA_RH

    # Położenie LH względem RF
    r_RF_LH = -R_RF_RS @ r_RS_RF - R_RF_RT @ r_RT_RS + R_RF_CHW @ (-r_CHW_RT + r_CHW_LA) + R_RF_LA @ r_RA_LFA + R_RF_LFA @ r_LFA_RH

    # Położenie CoM względem RF
    r_RF_CoM = 1/TotalMas * (mRF * (r_com_RF)
                             + mRS * (R_RF_RS @ (-r_RS_RF+r_com_RS))
                             + mRT * (-R_RF_RS @ r_RS_RF +R_RF_RT @ (-r_RT_RS +r_com_RT))
                             + mCHW * (-R_RF_RS @ r_RS_RF -R_RF_RT @ r_RT_RS + R_RF_CHW @ (-r_CHW_RT + r_com_CHW))
                             + mLT * (-R_RF_RS @ r_RS_RF -R_RF_RT @ r_RT_RS + R_RF_CHW @ (-r_CHW_RT + r_CHW_LT) + R_RF_LT @ r_com_LT)
                             + mLS * (-R_RF_RS @ r_RS_RF -R_RF_RT @ r_RT_RS + R_RF_CHW @ (-r_CHW_RT + r_CHW_LT) + R_RF_LT @ r_LT_LS + R_RF_LS @ r_com_LS)
                             + mLF * (r_RF_LF + R_RF_LF @ r_com_LF)
                             + mLA * (-R_RF_RS @ r_RS_RF -R_RF_RT @ r_RT_RS + R_RF_CHW @ (-r_CHW_RT + r_CHW_LA) + R_RF_LA @ r_com_LA)
                             + mLFA * (-R_RF_RS @ r_RS_RF -R_RF_RT @ r_RT_RS + R_RF_CHW @ (-r_CHW_RT + r_CHW_LA) + R_RF_LA @ r_LA_LFA + R_RF_LFA @ r_com_LFA)
                             + mRA * (-R_RF_RS @ r_RS_RF - R_RF_RT @ r_RT_RS + R_RF_CHW @ (-r_CHW_RT + r_CHW_RA) + R_RF_RA @ r_com_RA)
                             + mRFA * (-R_RF_RS @ r_RS_RF - R_RF_RT @ r_RT_RS + R_RF_CHW @ (-r_CHW_RT + r_CHW_RA) + R_RF_RA @ r_RA_RFA + R_RF_RFA @ r_com_RFA))

    # Kąty eulera LF względem RF
    gamma_RF_LF = euler(R_RF_LF)

    x =np.concatenate((r_RF_LF, r_RF_RH, r_RF_LH, r_RF_CoM, gamma_RF_LF))
    return x
