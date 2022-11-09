import numpy as np


# Skrypt przechowujacy wymiary humanoida w postaci wektorowej DLA MELMANA!

# Polozenie kolejnych czlonow w ukldach zwiazanych z czlonem poprzedzajacym. Glownym czlonem sa biodra (W-waist).

# r_X_Y - polozenie czlonu Y w ukladzie czlonu poprzedzajacego X


r_CHW_RT = np.array([[0], [-42.8], [-100]])
r_RT_RS = np.array([[0], [0], [-96.283]])
r_RS_RF = np.array([[0], [0], [-95]])

r_CHW_LT = np.array([[0], [42.8], [-100]])
r_LT_LS = np.array([[0], [0], [-96.283]])
r_LS_LF = np.array([[0], [0], [-95]])

r_CHW_RA = np.array([[0], [-102], [54.25]])
r_RA_RFA = np.array([[0], [0], [-103]])
r_RFA_RH = np.array([[0], [0], [-90]])

r_CHW_LA = np.array([[0], [102], [54.25]])
r_LA_LFA = np.array([[0], [0], [-103]])
r_LFA_LH = np.array([[0], [0], [-90]])

# Polozenienie srodkow mas czlonow w ukladach z nimi zwiazanych.

# r_com_X - polozenie srodka masy czlonu X w zwiazanym z nim ukladzie

r_com_CHW = np.array([[-15.048], [-0.004], [-92.396]])
r_com_RT = np.array([[-0.912], [0.433], [-66.801]])
r_com_LT = np.array([[-0.912], [-0.433], [-66.801]])
r_com_RS = np.array([[9.397], [0.390], [-40.345]])
r_com_LS = np.array([[9.397], [0.390], [-40.345]])
r_com_RF = np.array([[-11.196], [-4.147], [-0.605]])
r_com_LF = np.array([[-11.196], [4.147], [-0.605]])
r_com_RA = np.array([[0.274], [0.274], [-51.498]])
r_com_LA = np.array([[0.274], [-0.274], [-51.498]])
r_com_RFA = np.array([[0.000], [0.400], [-68.248]])
r_com_LFA = np.array([[0.000], [-0.400], [-68.248]])

# Masy poszczegolnych czlonow [gramy]

mCHW = 1171
mRT = 132
mLT = 132
mRS = 61
mLS = 61
mRF = 254
mLF = 254
mRA = 131
mLA = 131
mRFA = 56
mLFA = 56

# Masa całego robota [gramy]

TotalMas = np.sum([mCHW, mRT, mLT, mRS, mLS, mRF, mLF, mRA, mLA, mRFA, mLFA])

# Polozenie punktow charakterystycznych stop w ukladach zwiazanymi ze stopami

r_RF_center = np.array([[0], [0], [-35]])
r_RF_right_toe = np.array([[63], [-51.5], [-35]])
r_RF_left_toe = np.array([[63], [28.5], [-35]])
r_RF_right_heel = np.array([[-57], [-51.5], [-35]])
r_RF_left_heel = np.array([[-57], [28.5], [-35]])

r_LF_center = np.array([[0], [0], [-35]])
r_LF_right_toe = np.array([[63], [-28.5], [-35]])
r_LF_left_toe = np.array([[63], [51.5], [-35]])
r_LF_right_heel = np.array([[-57], [-28.5], [-35]])
r_LF_left_heel = np.array([[-57], [51.5], [-35]])

# Konfiguracja poczatkowa dla zadania kinematyki (nogi ugiete, ?? r璚e ?? w "gotowosci") dla ktorej jakobian ma pelny rzad

q0 = np.array([[-0.0000],
                [-0.1031],
                [-0.6778],
                [1.4081],
                [-0.7303],
                [0.1031],
                [0.0000],
                [0.1031],
                [-0.6778],
                [1.4081],
                [-0.7303],
                [-0.1031],
                [0.3999],
                [-0.1360],
                [-1.2334],
                [0.3999],
                [0.1360],
                [-1.2334]])

# Budowa wektora wspolrzednych zlaczowych:
# q = [q(1); q(2); q(3); q(4); q(5); q(6); q(7); q(8); q(9); q(10);
#      q(11); q(12); q(13); q(14); q(15); q(16); q(17); q(18)]
# q = [RTz;  RTx;  RTy;  RSy;  RFy;  RFx;  LTz;  LTx;  LTy;  LSy;   LFy;   LFx;
#      RAy;   RAx;   RFAy;  LAy;   LAx;   LFAy]

# AAo - kat pary obrotowej wokol osi 'o' ukladu AA

# Wersory kierunkowe osi poszczegolnych par obrotowych:

# Stopnie swobody

DoF = 18

# Macierz o wymiarach 19x3

JointRotOrderPrev = np.array([[0, 6],
                                [6, 5],
                                [5, 4],
                                [4, 3],
                                [3, 2],
                                [2, 1],
                                [1, 7],
                                [7, 8],
                                [8, 9],
                                [9, 10],
                                [10, 11],
                                [11, 12],
                                [1, 19],
                                [19, 13],
                                [13, 14],
                                [14, 15],
                                [19, 16],
                                [16, 17]])


Ux = np.array([[1], [0], [0]])
Uy = np.array([[0], [1], [0]])
Uz = np.array([[0], [0], [1]])

# Macierz o wymiarach 3x19 powstala z polaczenia kolumnowych wektorow Ux Uy Uz

JointU = np.concatenate(([-Uz, -Ux, -Uy, -Uy, -Uy, -Ux, Uz, Ux, Uy, Uy, Uy, Ux, Uy, Ux, Uy, Uy, Ux, Uy]), axis = 1)

#    return r_W_CH, r_W_RT, r_RT_RS, r_RS_RF, r_W_LT, r_LT_LS, r_LS_LF, r_CH_RA, r_RA_RFA, r_RFA_RH, r_CH_LA, r_LA_LFA, r_LFA_LH,\
#           r_com_W, r_com_CH, r_com_RT, r_com_LT, r_com_RS, r_com_LS,r_com_RF, r_com_LF,  r_com_RA, r_com_LA, r_com_RFA, r_com_LFA, \
#           mW, mCH, mRT, mRT, mRS, mLS, mRF, mLF, mRA, mLA, mRFA, mLFA, TotalMas, \
#           r_RF_center, r_RF_right_toe, r_RF_left_toe, r_RF_right_heel, r_RF_left_heel, \
#           r_LF_center, r_LF_right_toe, r_LF_left_toe, r_LF_right_heel, r_LF_left_heel, \
#           q0, DoF, JointRotOrderPrev, JointU