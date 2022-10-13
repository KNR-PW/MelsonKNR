import ZMP_Generation as zmp
import numpy as np
import math
import matplotlib.pyplot as plt
import CoM_Generation_one_step as cg
xd = np.array([0,1,2,3,4])
yd = np.array([0,1,-1,1,0])
t = np.array([2000,1500,400,1300,2000])
x = np.zeros((3,1))
sum_of_e = 0
Nl = cg.Nl
N = 0
x_ref1,y_ref1,n = zmp.ZMP_Generation(xd[0],yd[0],xd[1],yd[1],t[0],t[1]/2)
N = N+n
x_ref2,y_ref2,n = zmp.ZMP_Generation(xd[1],yd[1],xd[2],yd[2],t[1]/2,t[2]/2)
N = N+n
x_ref3,y_ref3,n = zmp.ZMP_Generation(xd[2],yd[2],xd[3],yd[3],t[2]/2,t[3]/2)
N = N+n
x_ref4,y_ref4,n = zmp.ZMP_Generation(xd[3],yd[3],xd[4],yd[4],t[3]/2,t[4])
N = N+n
x_ref = np.block([[x_ref1],[x_ref2],[x_ref3],[x_ref4]])
y_ref = np.block([[y_ref1],[y_ref2],[y_ref3],[y_ref4]])
x_w = np.zeros((int(N),1))
for i in range(int(N)):
    x,sum_of_e,y = cg.Com_Generation_one_step(y_ref[i:i+Nl],x, sum_of_e)
    x_w[i] = x[0]

plt.plot(range(int(N)),y_ref,label = "Input")
plt.plot(range(int(N)),x_w,label = "Output")
plt.legend()
plt.show()