import numpy as np
import math
import PCR_Parameters as pcr

# Funkcja generująca położenie środka masy w 1 wymiarze na podstawie wygenerowanej trajektorii ZMP dla jednej próbki

# INPUT:
# y_zmp - trajektoria ZMP z funkcji ZMP_Generation (musi być z "przyszłości")
# x0 - aktualny wektor zmiennych stanu (przy starcie ustawić na [0,0,0])
# sum_of_e0 - aktualna suma uchybu regulacji (przy starcie ustawić na 0)

# OUTPUT:
# sum_of_e - końcowa suma uchybu regulacji (należy użyć przy ponownym starcie CoM_Generation)
# x - końcowy wektor zmiennych stanu (należy użyć przy ponownym starcie CoM_Generation)
# y - aktualna wartość ZMP ( służcy do testów)

Nl = pcr.Nl
Ad = pcr.Ad
Bd = pcr.Bd
C = pcr.C
G_d = pcr.G_d
G_x = pcr.G_x
G_i = pcr.G_i
def Com_Generation_one_step(y_zmp,x0,sum_of_e0):
    u = 0;
    x = x0;
    sum_of_p = 0;
    sum_of_e = sum_of_e0;
    y = C@x0;
    e = 0
    e = y-y_zmp[0]
    sum_of_e = sum_of_e+e
    for j in range(1,Nl):
        if (j >= y_zmp.size):
            sum_of_p = sum_of_p + G_d[j - 1] * y_zmp[y_zmp.size - 1]
        if (j < y_zmp.size):
            sum_of_p = sum_of_p + G_d[j - 1] * y_zmp[j]
    u = -G_i*sum_of_e -G_x@x - sum_of_p
    sum_of_p = 0;
    x = Ad@x + Bd@u
    y = C@x
    return x,sum_of_e,y