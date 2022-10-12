import numpy as np
import math
from src.humanoid_inv_kinematics.MelsonDynamic.RobotParameters import Kinematics as kin
from src.humanoid_inv_kinematics.MelsonDynamic import ConvertToRF as con
from src.humanoid_inv_kinematics.MelsonDynamic.RobotParameters.ModelParameters import * # <- wszystkie wektory stałe, masy oraz wersory "u" brane z tego

# Główna funkcja do generacji Jakobianu Melsona

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

    R_LF_LFA = kin.rotY(LFAy)
    R_CH_LA = kin.rotY(LAy) @ kin.rotX(LAx)
    R_W_CH = kin.rotZ(CHz)
    R_W_LT = kin.rotZ(LTz) @ kin.rotX(LTx) @ kin.rotY(LTy)
    R_LT_LS = kin.rotY(LSy)
    R_LS_LF = kin.rotY(LFy) @ kin.rotX(LFx)

    r_RF_LF = r_trajectory_vector[0:3]
    r_RF_RH = r_trajectory_vector[3:6]
    r_RF_LH = r_trajectory_vector[6:9]

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
    R_0_W = R_0_RF@inv_rot(R_W_RT@R_RT_RS@R_RS_RF)

    R_RF_LS = 
    R_RF_LT =
    R_RF_LF =
    R_RF_W =
    R_RF_RA =
    R_RF_CH =
    R_RF_RFA =
    R_RF_LA =
    R_RF_LFA =
    # --- Lewa Noga ---

    # kolumna 10 #

    f = R_RF_LT @ R_LT_LS
    d10_LF = d7_LF - f
    u10_LF = R_RF_LT @ Uy
    Jv10_LF = skew_matrix(u10_LF) @ d10_LF
    Jv10_RH = np.zeros((3,1))
    Jv10_LH = np.zeros((3,1))
    u10_com = u10_LF
    Jv10_com = (skew_matrix(u10_com)/TotalMas) @ (inv_rot(skew_matrix(u7_com))@Jv7_com*TotalMas - R_RF_LT @ r_com_LT*mLT+(-f))
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
    Jv12_com = skew_matrix(u12_com) @ inv_rot(skew_matrix(u12_com)) @ Jv11_com
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
    Jv14_com = skew_matrix(u14_com) @ inv_rot(skew_matrix(u14_com)) @ Jv13_com
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
    Jv15_com = (skew_matrix(u15_com)/TotalMas)(R_RF_RFA @ r_com_RFA * mRFA) # w doc chyba jest blad
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
    Jv17_com = skew_matrix(u17_com) @ inv_rot(skew_matrix(u16_com)) @ Jv16_com

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
