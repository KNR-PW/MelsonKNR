import numpy as np
import math
import Kinematics as kin
import ConvertToRF as con
from ModelParameters import * # <- wszystkie wektory stałe, masy oraz wersory "u" brane z tego

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

def Jacobian(q,r_trajectory_vector,trajectory_vector):
    RTz = q(1); RTx = q(2); RTy = q(3); RSy = q(4); RFy = q(5); RFx = q(6); LTz = q(7); LTx = q(8); LTy = q(9); LSy = q(10);
    LFy = q(11); LFx = q(12); RAy = q(13); RAx = q(14); RFAy = q(15); LAy = q(16); LAx = q(17); LFAy = q(18); CHz = q(19)


    R_RF_RFA = kin.rotY(RFAy)
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






