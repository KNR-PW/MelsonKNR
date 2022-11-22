import numpy as np
import math
import PCR_Parameters as pcr

# Funkcja generująca położenie środka masy w 1 wymiarze na podstawie wygenerowanej trajektorii ZMP

# INPUT:
# y_zmp - trajektoria ZMP z funkcji ZMP_Generation
# x0 - aktualny wektor zmiennych stanu ( przy starcie ustawić na [0,0,0])
# N - liczba próbek z funkcji ZMP_Generation
# sum_of_e0 - aktualna suma uchybu regulacji ( przy starcie ustawić na 0)

# OUTPUT:
# x_w - wektor położenia środka masy na każdą próbkę
# dx_w - wektor predkości środka masy na każdą próbkę
# sum_of_e - końcowa suma uchybu regulacji ( należy użyć przy ponownym starcie CoM_Generation)
# x_k - końcowy wektor zmiennych stanu ( należy użyć przy ponownym starcie CoM_Generation)

Nl = pcr.Nl
Ad = pcr.Ad
Bd = pcr.Bd
C = pcr.C
G_d = pcr.G_d
G_x = pcr.G_x
G_i = pcr.G_i
def Com_Generation(y_zmp,x0,N,sum_of_e0):
    u = 0
    x = x0
    sum_of_p = 0
    sum_of_e = sum_of_e0
    y = C@x0
    e = 0
    x_w = np.zeros((int(N),1))
    dx_w = np.zeros((int(N), 1))
    for i in range(int(N)):
        e = y-y_zmp[i]
        sum_of_e = sum_of_e+e
        for j in range(1,Nl):
            if(i+j>N-1):
                sum_of_p = sum_of_p+G_d[j-1]*y_zmp[int(N)-1]
            if(i+j<=N-1):
                sum_of_p = sum_of_p + G_d[j - 1] * y_zmp[i+j]
        u = -G_i*sum_of_e -G_x@x - sum_of_p
        sum_of_p = 0;
        x = Ad @ x + Bd @ u
        y = C@x
        x_w[i] = x[0]
        dx_w[i] = x[1]
    x_k = x
    return x_w,dx_w,sum_of_e, x_k