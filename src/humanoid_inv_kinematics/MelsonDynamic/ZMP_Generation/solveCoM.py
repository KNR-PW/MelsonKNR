import src.humanoid_inv_kinematics.MelsonDynamic.RobotParameters.GaitStepPlanner as GSP
import src.humanoid_inv_kinematics.MelsonDynamic.ZMP_Generation.ZMP_Generation as zmp
import src.humanoid_inv_kinematics.MelsonDynamic.ZMP_Generation.CoM_Generation as CG
import src.humanoid_inv_kinematics.MelsonDynamic.RobotParameters.GaitParameters as GP
import numpy as np
import matplotlib.pyplot as plt
r_LF = GSP.con.GaitEndPointsTrajectory.r_LF
r_RF = GSP.con.GaitEndPointsTrajectory.r_RF
RF_contact = GSP.con.CharPointsContactOnOff.RightFootCenter
LF_contact = GSP.con.CharPointsContactOnOff.LeftFootCenter
N = GP.NumberOfTimeInstances
### Liczenie ZMP a potem COM
### uaktualnić GSP.con.GaitCoMTrajectory
z_height = GP.StepPelvisHeight
## Wektory położeń stopy, która w tym momencie podpiera robota oraz wektor czasu, kiedy te stopy podpierają
x_zmp = np.zeros((N,1)) # dla osi x
y_zmp = np.zeros((N,1)) # dla osi y
# dla osi z jest stałe w trakcie chodu
j = 0
support = "none"
## Pętla na podstawie tablic kontaktu wylicza x_zmp oraz y_zmp:
while j < N:
    if ((RF_contact[0][j] == True) & (LF_contact[0][j] == False)):
        support = "right"
        x_zmp[j] = r_RF[0][j]
        y_zmp[j] = r_RF[1][j]
    elif ((RF_contact[0][j] == False) & (LF_contact[0][j] == True)):
        support = "left"
        x_zmp[j] = r_LF[0][j]
        y_zmp[j] = r_LF[1][j]
    elif ((RF_contact[0][j] == True) & (LF_contact[0][j] == True)):
        if(support == "right"):
            x_zmp[j] = r_LF[0][j]
            y_zmp[j] = r_LF[1][j]
        elif(support == "left"):
            x_zmp[j] = r_RF[0][j]
            y_zmp[j] = r_RF[1][j]
    j+=1
j = 0
while j < N:
    if ((RF_contact[0][j] == True) & (LF_contact[0][j] == True)):
        x_zmp[j] = (r_RF[0][j]+r_LF[0][j])/2
        y_zmp[j] = (r_RF[1][j]+r_LF[1][j])/2
    else:
        break
    j+=1
j = N-1
while j >= 0:
    if ((RF_contact[0][j] == True) & (LF_contact[0][j] == True)):
        x_zmp[j] = (r_RF[0][j]+r_LF[0][j])/2
        y_zmp[j] = (r_RF[1][j]+r_LF[1][j])/2
    else:
        break
    j-=1
plt.plot(range(N),y_zmp)
plt.show()
## Generowanie położenia CoM na podstawie ZMP:
x_com,dx_com,sum_of_e_x, x_k = CG.Com_Generation(x_zmp,np.zeros((3,1)),x_zmp.size,0)
y_com,dy_com,sum_of_e_y, y_k = CG.Com_Generation(y_zmp,np.zeros((3,1)),y_zmp.size,0)
z_com = np.ones((x_zmp.size,1))*z_height

## Nadpisanie wektora położenia bioder (CoM):
GSP.con.GaitEndPointsTrajectory.r_W = np.block([[np.transpose(x_com)],[np.transpose(y_com)],[np.transpose(z_com)]])

## Plotowanie wyników:
#GSP.plotResults(GSP.con.GaitEndPointsTrajectory.r_W, "Waist")
