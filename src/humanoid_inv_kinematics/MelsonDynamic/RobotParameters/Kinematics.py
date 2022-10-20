import numpy as np
import math

import src.humanoid_inv_kinematics.MelsonDynamic.RobotParameters.ModelParameters as mp
import src.humanoid_inv_kinematics.MelsonDynamic.RobotParameters.GaitParameters as gp
import cmath

# Macierze rotacji X Y Z
def rotZ(alpha):
    rot = np.array([
        [math.cos(alpha), -math.sin(alpha), 0],
        [math.sin(alpha), math.cos(alpha), 0],
        [0, 0, 1]])
    return rot

def rotY(alpha):
    rot = np.array([
        [math.cos(alpha), 0, math.sin(alpha)],
        [0, 1, 0],
        [-math.sin(alpha), 0, math.cos(alpha)]])
    return rot

def rotX(alpha):
    rot = np.array([
        [1, 0, 0],
        [0, math.cos(alpha), -math.sin(alpha)],
        [0, math.sin(alpha), math.cos(alpha)]])
    return rot

def DKS_LeftHand(mp, r_W, rot_W, q_ULL, fi_CH ):
    # Zadanie proste kinematyki dla kończyny górnej lewej
    r_LH = r_W + rot_W @ (mp.r_W_CH + rotZ(fi_CH) @ (mp.r_CH_LA + rotY(q_ULL[0]) @ rotX(q_ULL[1]) @ (mp.r_LA_LFA + rotY(q_ULL[2]) @ mp.r_LFA_LH)))

    return r_LH

def DKS_RightHand(mp, r_W, rot_W, q_URL, fi_CH ):
    # Zadanie proste kinematyki dla kończyny górnej prawej
    r_RH = r_W + rot_W @ (mp.r_W_CH + rotZ(fi_CH) @ (mp.r_CH_RA + rotY(q_URL[0]) @ rotX(q_URL[1]) @ (mp.r_RA_RFA + rotY(q_URL[2]) @ mp.r_RFA_RH)))
    return r_RH

def IKS_Waist_LeftHand(mp, r_W_LH , fi_CH=0):
    # Zadanie odwrotne kinematyki dla kończyny górnej lewej ( IKS - Inverse Kinematic Solver )
    # Wejście:
    # r_W_LH - położenie końcówki (dłoni) w układzie bioder
    # fi_CH - kąt obrotu między biodrami a klatką piersiową (opcjonalnie)
    # Wyjście:
    # q - wektor wsp. złączowych
    # q = [ fi_LAy fi_LAx fi_LFA];

    # Macierz rotacji między układami klatki piersiowej i bioder
    rot_W_CH = rotZ(fi_CH)

    # Położenie końcówki (dłoni) w układzie klatki piersiowej
    r_CH_LH = np.matmul(np.transpose(rot_W_CH), r_W_LH)

    # Prawa strona równania
    r = r_CH_LH - mp.r_CH_LA

    # Długości członów
    l_LA = mp.r_LA_LFA[2]     #długość ramienia (ujemna!) wartość w 3-cim wierszu
    l_LFA = mp.r_LFA_LH[2]    #długość przedramienia (ujemna!) wartość w 3-cim wierszu
    print((np.matmul(np.transpose(r), r) - l_LA**2 - l_LFA**2) / (2*l_LA*l_LFA))
    # Wyliczanie wartości wsp. złączowych
    fi_LFA = -math.acos((np.matmul(np.transpose(r), r) - l_LA**2 - l_LFA**2) / (2*l_LA*l_LFA))
    fi_LAx = math.asin(-r[1] / (l_LA + l_LFA*math.cos(fi_LFA)))

    # Wyznaczenie fi_RAy
    # układ rónań liniowych:

    A = np.array([[(l_LA[0] + l_LFA[0]*math.cos(fi_LFA)) * math.cos(fi_LAx), l_LFA[0]*math.sin(fi_LFA)],
                 [- l_LFA[0] * math.sin(fi_LFA), (l_LFA[0] * math.cos(fi_LFA) + l_LA[0]) * math.cos(fi_LAx)]])

    b = np.array([[r[0], r[2]]])

    x = np.linalg.inv(A) @ b

    fi_LAy = math.atan2(x[0][0], x[0][1])

    # zbudowanie wektora wsp. złączowych
    q = np.array([fi_LAy, fi_LAx, fi_LFA])
    return q

def IKS_Waist_RightHand(mp, r_W_RH , fi_CH=0):
    # Zadanie odwrotne kinematyki dla kończyny górnej prawej ( IKS - Inverse Kinematic Solver )
    # Wejście:
    # r_W_LH - położenie końcówki (dłoni) w układzie bioder
    # fi_CH - kąt obrotu między biodrami a klatką piersiową (opcjonalnie)
    # Wyjście:
    # q - wektor wsp. złączowych
    # q = [ fi_RAy fi_RAx fi_RFA];

    # Macierz rotacji między układami klatki piersiowej i bioder
    rot_W_CH = rotZ(fi_CH)

    # Położenie końcówki (dłoni) w układzie klatki piersiowej
    r_CH_RH = np.matmul(np.transpose(rot_W_CH), r_W_RH)

    # Prawa strona równania
    r = r_CH_RH - mp.r_CH_RA

    # Długości członów
    l_RA = mp.r_RA_RFA[2]     #długość ramienia (ujemna!) wartość w 3-cim wierszu
    l_RFA = mp.r_RFA_RH[2]    #długość przedramienia (ujemna!) wartość w 3-cim wierszu

    # Wyliczanie wartości wsp. złączowych
    fi_RFA = -math.acos((np.matmul(np.transpose(r), r) - l_RA**2 - l_RFA**2) / (2*l_RA*l_RFA))
    fi_RAx = math.asin(-r[1] / (l_RA + l_RFA*math.cos(fi_RFA)))

    # Wyznaczenie fi_RAy
    # układ rónań liniowych:

    A = np.array([[(l_RA[0] + l_RFA[0]*math.cos(fi_RFA)) * math.cos(fi_RAx), l_RFA[0]*math.sin(fi_RFA)],
                 [- l_RFA[0] * math.sin(fi_RFA), (l_RFA[0] * math.cos(fi_RFA) + l_RA[0]) * math.cos(fi_RAx)]])

    b = np.array([[r[0], r[2]]])

    x = np.linalg.inv(A) @ b

    fi_RAy = math.atan2(x[0][0], x[0][1])

    # zbudowanie wektora wsp. złączowych
    q = np.array([fi_RAy, fi_RAx, fi_RFA])
    return q

def IKS_Waist_LeftFoot(mp, r_W_LF_char_point, rot_W_LF=np.eye(3), r_LF_char_point=mp.r_LF_center):
    # Zadanie odwrotne kinematyki dla kończyny dolnej lewej
    # Wejście:
    # r_W_LF_char_point - położenie punktu charakterystycznego (domyślni środka stopy) w układzie bioder
    # rot_W_LF - rotacja stopy względem bioder
    # r_LF_char_point - współrzędne charakterystycznego punktu w układzie stopy
    # Wyjście:
    # q - wektor wsp. złączowych
    # q = [fi_LTz fi_LTx fi_LTy fi_LS fi_LFy fi_LFx]

    ## związki geometryczne

    l_LT = mp.r_LT_LS[2]
    l_LS = mp.r_LS_LF[2]

    ## Obliczenia

    r = np.matmul(np.transpose(rot_W_LF), r_W_LF_char_point) - r_LF_char_point - np.matmul(np.transpose(rot_W_LF), mp.r_W_LT)
    fi_LS = math.acos((np.matmul(np.transpose(r), r) - l_LS**2 - l_LT**2) / (2*l_LS*l_LT))

    A = -l_LS - l_LT * math.cos(fi_LS)
    B = -l_LT * math.sin(fi_LS)
    Psi = math.atan(B/A)

    fi_LFy = math.asin(r[0] / math.sqrt(A**2+B**2)) - Psi

    if math.radians(-90) > fi_LFy or fi_LFy > math.radians(90):
        fi_LFy = math.pi - math.asin( r[0] / math.sqrt(A**2+B**2)) - Psi

    fi_LFx = math.asin( r[1]/( l_LT*math.cos(fi_LS+fi_LFy) + l_LS*math.cos(fi_LFy)))


    rot_LT_LF = np.matmul(np.matmul(rotY(fi_LS), rotY(fi_LFy)), rotX(fi_LFx))
    rot_W_LT = np.matmul(rot_W_LF, np.transpose(rot_LT_LF))

    r_zy = rot_W_LT[2,1]
    r_zx = rot_W_LT[2,0]
    r_xy = rot_W_LT[0,1]

    fi_LTx = math.asin(r_zy)
    fi_LTy = math.asin( -r_zx/math.cos(fi_LTx) )
    fi_LTz = math.asin( -r_xy/math.cos(fi_LTx) )

    q = np.array([fi_LTz, fi_LTx, fi_LTy, fi_LS, fi_LFy, fi_LFx])
    return q

def IKS_Waist_RightFoot(mp, r_W_RF_char_point, rot_W_RF = np.eye(3), r_RF_char_point = mp.r_RF_center):
    # Zadanie odwrotne kinematyki dla kończyny dolnej prawej
    # Wejście:
    # r_W_RF_char_point - położenie punktu charakterystycznego (domyślni środka stopy) w układzie bioder
    # rot_W_RF - rotacja stopy względem bioder
    # r_RF_char_point - współrzędne charakterystycznego punktu w układzie stopy
    # Wyjście:
    # q - wektor wsp. złączowych
    # q = [fi_RTz fi_RTx fi_RTy fi_RS fi_RFy fi_RFx]

    ## związki geometryczne

    l_RT = mp.r_RT_RS[2]
    l_RS = mp.r_RS_RF[2]

    ## Obliczenia

    r = np.matmul(np.transpose(rot_W_RF), r_W_RF_char_point) - r_RF_char_point - np.matmul(np.transpose(rot_W_RF), mp.r_W_RT)

    fi_RS = math.acos((np.matmul(np.transpose(r), r) - l_RS**2 - l_RT**2) / (2*l_RS*l_RT))

    A = -l_RS - l_RT * math.cos(fi_RS)
    B = -l_RT * math.sin(fi_RS)
    Psi = math.atan(B/A)

    fi_RFy = math.asin(r[0] / math.sqrt(A**2+B**2)) - Psi

    if math.radians(-90) > fi_RFy or fi_RFy > math.radians(90):
        fi_RFy = math.pi - math.asin( r[0] / math.sqrt(A**2+B**2)) - Psi

    fi_RFx = math.asin( r[1]/( l_RT*math.cos(fi_RS+fi_RFy) + l_RS*math.cos(fi_RFy)))


    rot_RT_RF = np.matmul(np.matmul(rotY(fi_RS), rotY(fi_RFy)), rotX(fi_RFx))
    rot_W_RT = np.matmul(rot_W_RF, np.transpose(rot_RT_RF))

    r_zy = rot_W_RT[2,1]
    r_zx = rot_W_RT[2,0]
    r_xy = rot_W_RT[0,1]

    fi_RTx = math.asin(r_zy)
    fi_RTy = math.asin(-r_zx/math.cos(fi_RTx) )
    fi_RTz = math.asin(-r_xy/math.cos(fi_RTx) )

    q = np.array([fi_RTz, fi_RTx, fi_RTy, fi_RS, fi_RFy, fi_RFx])
    return q

def IKS_Global(mp, r_W, rot_W, r_LF, rot_LF, r_RF, rot_RF, r_LH, r_RH, fi_CH):
    q_UpperLeftLimb = IKS_Waist_LeftHand(mp, np.transpose(rot_W) @ (r_LH - r_W), fi_CH)

    q_UpperRightLimb = IKS_Waist_RightHand(mp, np.transpose(rot_W) @ (r_RH - r_W), fi_CH)

    q_LowerLeftLimb = IKS_Waist_LeftFoot(mp, np.transpose(rot_W) @ (r_LF - r_W + np.transpose(rot_W) @ rot_LF @ mp.r_LF_center),
                                            rot_W.transpose() @ rot_LF, mp.r_LF_center)
    q_LowerRightLimb = IKS_Waist_RightFoot(mp, np.transpose(rot_W) @ (r_RF - r_W + np.transpose(rot_W) @ rot_RF @ mp.r_RF_center),
                                             np.transpose(rot_W) @ rot_RF, mp.r_RF_center)
    q = np.concatenate((q_LowerRightLimb, q_LowerLeftLimb, q_UpperRightLimb, q_UpperLeftLimb, ))
    q = np.append(q, fi_CH)
    return q