import math
import numpy as np
from src.humanoid_inv_kinematics.MelsonDynamic.RobotParameters import Kinematics as kin

# transformacja z macierzy eulera do macierzy rotacji
def euler2rot(e):
    return kin.rotZ(e[0]) * kin.rotY(e[1]) * kin.rotX(e[2])


# transformacja z macierzy rotacji do macierzy eulera
# def rot2euler(rot):
#     b = np.arctan2([-rot[0, 2]], [math.sqrt(rot[0, 0] ** 2 + rot[0, 1] ** 2)])
#     a = np.arctan2([rot[0, 1]], [rot[0, 0]])
#     c = np.arctan2([rot[1, 2]], [rot[2, 2]])
#     return np.concatenate([a, b, c])
def rot2euler(rot):
    b = np.arctan2([-rot[2, 0]], [math.sqrt(rot[0, 0] ** 2 + rot[0, 1] ** 2)])
    #b = -np.arcsin([rot[2, 0]])
    a = np.arctan2([rot[1, 0]], [rot[0, 0]])
    c = np.arctan2([rot[2, 1]], [rot[2, 2]])
    return np.concatenate([a, b, c])


# Zmiana układu z "0" do układu prawej nogi


def convert_to_rf(trajectory):
    m, n = trajectory.shape
    r_trajectory = np.zeros((15, n))

    for i in range(0, n):
        rot_rf = euler2rot(trajectory[15:18, [i]])
        rot_lf = euler2rot(trajectory[18:21, [i]])
        rot_mul = np.transpose(rot_rf) * rot_lf
        r_trajectory[:, [i]] = np.block([[np.transpose(rot_rf).dot(trajectory[3:6, [i]] - trajectory[0:3, [i]])],
                                        [np.transpose(rot_rf).dot(trajectory[6:9, [i]] - trajectory[0:3, [i]])],
                                        [np.transpose(rot_rf).dot(trajectory[9:12, [i]] - trajectory[0:3, [i]])],
                                        [np.transpose(rot_rf).dot(trajectory[12:15, [i]] - trajectory[0:3, [i]])],
                                        [rot2euler(rot_mul).reshape((3,1))]])
    return r_trajectory
