import src.humanoid_inv_kinematics.MelsonDynamic.RobotParameters.GenerateHandsTrajectory
import numpy as np
import math
import matplotlib.pyplot as plt
from Jacobian_generator import Jacobian
import src.humanoid_inv_kinematics.MelsonDynamic.RobotParameters.GaitParameters as gp
import src.humanoid_inv_kinematics.MelsonDynamic.RadModelToDynamixel as dynamixel
from src.humanoid_inv_kinematics.MelsonDynamic.RobotParameters.ModelParameters import *
## (1) Load Parameters wywoła się w StepPlanner
## (2) ZMP i CoM trajectory
## (3) Trajektoria rąk
## (4) Generowanie Jakobianu
## (5) konwersja na dynamixele
Gait_JointAngles = Jacobian(q,trajectory_vector)
Robot_JointAngles = np.zeros(gp.NumberOfTimeInstances, 18)
for i in range(gp.NumberOfTimeInstances):
    Robot_JointAngles[:,i-1] = dynamixel.rad_model_to_dynamixel(Gait_JointAngles[:, i-1])

## wysyłanie tego do pliku
file = open("output.txt", "a")
for i in range(gp.NumberOfTimeInstances):
    file.write(Robot_JointAngles[:,i-1])
file.close()
