import numpy as np
import src.humanoid_inv_kinematics.MelsonDynamic.RobotParameters.ModelParameters as mp
import math
import src.humanoid_inv_kinematics.MelsonDynamic.RobotParameters.GaitParameters as gp
from scipy import linalg as la
import matplotlib.pyplot as plt
# Skrypt przechowywujący parametry układu oraz regulatora Preview Control

# Input: R, Qe, Q
# Output: G_i, G_x,G_d

T = gp.TimeInterval*10**(-3) # Krok czasowy

# Parametry układu

z_c = 1
g = 9.81

# Parametry regulatora Preview Control
R = 0.00001;
Qe = 1;
Q = np.array([[0.01,0,0],[0, 0.01,0],[0,0,0.01]])
Nl = 240;
N = np.linspace(0,Nl,Nl)
# Dyskretne macierze rozwiązania równań stanu

Ad = np.array([[1,T,T**2/2],[0,1,T],[0,0,1]])
Bd = np.array([[T**3/6],[T**2/2],[T]])
C = np.array([1,0,-z_c/g])

#Macierze regulatora Preview Control

B_ = np.block([[C@Bd],[Bd]])
I_ = np.array([[1],[0],[0],[0]])
F_ = np.block([[C@Ad],[Ad]])
A_ = np.block([I_,F_])
Q_ = np.block([[np.block([[Qe,np.zeros((1,3))]])],[np.block([[np.zeros((3,1)),Q]])]])
K_ =  la.solve_discrete_are(A_, B_, Q_, R, e=None, s=None, balanced=True)
A_c = A_ - B_@np.transpose(B_)@K_@A_/(R+np.transpose(B_)@K_@B_)
G_i = np.transpose(B_)@K_@I_/(R+np.transpose(B_)@K_@B_)
G_x = np.transpose(B_)@K_@F_/(R+np.transpose(B_)@K_@B_)
G_d = np.zeros((Nl,1))
G_d[0] = -G_i;
X = -np.transpose(A_c)@K_@I_
for i in range(1,Nl):
    G_d[i] = np.transpose(B_)@X/(R+np.transpose(B_)@K_@B_)
    X = np.transpose(A_c)@X
