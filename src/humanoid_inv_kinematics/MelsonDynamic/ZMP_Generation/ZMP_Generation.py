import numpy as np
import math
import ModelParameters as mp
import GaitParameters as gp


# Funkcja do generowania funkcji ZMP dla dwóch ostatnich położeń stóp

# INPUT:
# x_p, y_p - położenie x i y stopy poprzedniej
# x_n, y_n -  położenie x i y stopy następnej
# t_p, t_n - czas na poprzedniej stopie, czas na następnej stopie

# OUTPUT:
# x, y, N - wektory położenia x i y ZMP na każdą próbkę oraz liczba próbek (potrzebna w CoM_Generation)

# Funkcje są skokowe
# W trakcie pracy online pamiętać, aby czas na jednej stopie rozdzielić na t_n pierwszej symulacji, i t_p drugiej symulacji


T = gp.TimeInterval
def ZMP_Generation(x_p,y_p,x_n,y_n,t_p,t_n):
    n1 = t_p/T+1
    n2 = t_n/T+1
    x = np.zeros((int(n1+n2),1))
    y = np.zeros((int(n1+n2),1))
    for i in range(int(n1)):
        x[i] = x_p
        y[i] = y_p
    for i in range(int(n1),int(n1+n2)):
        x[i] = x_n
        y[i] = y_n
    return x, y, n1+n2

