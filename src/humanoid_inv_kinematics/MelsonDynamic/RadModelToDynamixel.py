from UtilityFunctions import DegToRad
import numpy as np

from src.humanoid_inv_kinematics.MelsonDynamic.UtilityFunctions.DegToRad import deg_to_rad


def rad_model_to_dynamixel(gait_joint_angles):
    dynamixel_values = np.zeros(19)
    dynamixel_values[5] = 512 + int(gait_joint_angles(6) * 1024 / deg_to_rad(300))
    dynamixel_values[4] = 512 - int(gait_joint_angles(5) * 1024 / deg_to_rad(300))
    dynamixel_values[3] = 512 + int(gait_joint_angles(4) * 1024 / deg_to_rad(300))
    dynamixel_values[2] = 512 + int(gait_joint_angles(3) * 1024 / deg_to_rad(300))

    dynamixel_values[1] = 512 - int(gait_joint_angles(2) * 1024 / deg_to_rad(300))
    dynamixel_values[0] = 2048 - int(gait_joint_angles(1) * 4096 / deg_to_rad(360))

    dynamixel_values[11] = 512 + int(gait_joint_angles(12) * 1024 / deg_to_rad(300))
    dynamixel_values[10] = 512 + int(gait_joint_angles(11) * 1024 / deg_to_rad(300))
    dynamixel_values[9] = 512 - int(gait_joint_angles(10) * 1024 / deg_to_rad(300))
    dynamixel_values[8] = 512 - int(gait_joint_angles(9) * 1024 / deg_to_rad(300))

    dynamixel_values[7] = 512 - int(gait_joint_angles(8) * 1024 / deg_to_rad(300))
    dynamixel_values[6] = 2048 - int(gait_joint_angles(7) * 4096 / deg_to_rad(360))

    dynamixel_values[12] = 512 - int(gait_joint_angles(13) * 1024 / deg_to_rad(300))
    dynamixel_values[13] = 512 - int(gait_joint_angles(14) * 1024 / deg_to_rad(300))
    dynamixel_values[14] = 512 + int(gait_joint_angles(15) * 1024 / deg_to_rad(300))
    dynamixel_values[15] = 512 + int(gait_joint_angles(16) * 1024 / deg_to_rad(300))
    dynamixel_values[16] = 512 - int(gait_joint_angles(17) * 1024 / deg_to_rad(300))
    dynamixel_values[17] = 512 - int(gait_joint_angles(18) * 1024 / deg_to_rad(300))
    dynamixel_values[18] = 477 + int((gait_joint_angles(19)) * 1024 / deg_to_rad(300))

    for i in range(12, 19):
        if dynamixel_values[i] > 1023:
            dynamixel_values[i] = 1023
        if dynamixel_values[i] < 0:
            dynamixel_values[i] = 0

    return dynamixel_values
