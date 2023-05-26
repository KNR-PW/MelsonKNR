import numpy as np
import math as math
import src.humanoid_inv_kinematics.MelsonDynamic.RobotParameters.GaitParameters as gp
from src.humanoid_inv_kinematics.Forward_kinematics_Melson import Forward_kinematics_Melson as k_for
from src.humanoid_inv_kinematics.Jacobian_Melson_generator import Jacobian_Melson as J_M

# Funkcja do generowania współrzędnych wewnętrznych za pomocą metody CLIK (Closed-Loop Inverse Kinematics)

# INPUT:
# q_i - współ. wewnętrzne kroku i
# x_i -  współ. zewnętrzne (względem RF) kroku i
# x_i_w -  współ. zewnętrzne (względem układu 0) kroku i

# OUTPUT:
# q_new - współ. wewnętrzne kroku i+1

# Parametry:
# F - Macierz zawierającą wektory mające dane: wiersz 1 - środkowa wartość kąta serwa, wiersz 2 - maksymalna wartość kąta serwa, wiersz 3 - minimalna wartość kąta serwa
# k - współczynnik dla wektora prędkości wewnętrznych funckji celu (praca Kacpra Mikołajczyka wzór 4.39)
# dt - krok czasowy
# n - liczba napędów (kolumn Jakobianu)

q_max = np.array([15, 15, 0, 90, 90, 30, 15, 15, 0, 90, 90, 30, 90, 0, 0, 90, 90, 0, 15]) * math.pi/180.0
q_min = np.array([-15, -15, -90, 0, -90, -30, -15, -15, -90, 0, -90, -30, -90, -90, -90, -90, 0, -90, -15]) * math.pi/180.0
q_mid = (q_max+q_min)/2.0
k = 1;
n = 19
damping_constant = 0;
# Główna funkcja:
def CLIK(q_i,x_i_w, x_i):

    kq_i = k_for(q_i, x_i_w)
    v_i = (x_i - kq_i)
    #print(f"norm =  {np.linalg.norm(x_i - kq_i)}")
    # print(f"x =  {x_i}")
    #print(f"v =  {v_i}")
    J_i = np.array(J_M(q_i, kq_i, x_i_w), dtype=np.float)
    # J_p_i = np.linalg.pinv(J_i)
    J_p_i = np.array(np.transpose(J_i) @ np.linalg.inv(J_i @ np.transpose(J_i)+damping_constant**2*np.eye(15)),dtype = np.float)
    dq0 = np.zeros((n, 1))
    for j in range(n):
        dq0[j] = -k * (q_i[j] - q_mid[j]) / (q_max[j] - q_min[j])

    dq_i = np.dot(J_p_i, v_i) + (np.eye(n) - J_p_i @ J_i) @ dq0
    # print(f"dq =  {dq_i}")
    q_new = q_i + dq_i

    return q_new