import numpy as np
import math as math
import GaitParameters as gp
from Forward_kinematics_Melman import Forward_kinematics_Melman as k_for
from Jacobian_Melman_generator import Jacobian_Melman as J_M

# Funkcja do generowania współrzędnych wewnętrznych za pomocą metody CLIK (Closed-Loop Inverse Kinematics)

# INPUT:
# q_i - współ. wewnętrzne kroku i
# q_i_i - współ. wewnętrzne kroku i-1
# x_i -  współ. zewnętrzne (względem RF) kroku i

# OUTPUT:
# q_new - współ. wewnętrzne kroku i+1

## TODO ogarnąć wektor q0
# Parametry:
# F - Macierz zawierającą wektory mające dane: wiersz 1 - środkowa wartość kąta serwa, wiersz 2 - maksymalna wartość kąta serwa, wiersz 3 - minimalna wartość kąta serwa
# k - współczynnik dla wektora prędkości wewnętrznych funckji celu (praca Kacpra wzór 4.39)
# dt - krok czasowy
# n - liczba napędów (kolumn Jakobianu)

F = np.array([[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], # wartość środkowa
              [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1], # wartość maksymalna
              [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]]) # wartość minimalna
k = 1;
dt = gp.TimeInterval*10**(-3)
n = 18

# Główna funkcja:
def CLIK(q_i,q_i_1,x_i):

    kq_i_1 = k_for(q_i_i)
    v_i = (x_i-kq_i_1)/dt
    J_i = J_M(q_i,x_i)
    J_p_i = np.transpose(J_i) @ np.linalg.inv(J_i @ np.transpose(J_i))
    dq0 = np.zeros((n , 1))
    for j in range(n):
        dq0[j] = -k * (q_i[j]- F[1][j])/(F[3][j]-F[2][j])

    dq_i = J_p_i @ v_i + (np.eye(n) - J_p_i @ J_i) @ dq0
    q_new = q_i + dq_i*dt

    return q_new
