# function responsible for converting data model to model compatible with dynamixels
import math
import numpy as np


def radmodel2dnmx(data):
    dynamixel_data = np.zeros(19)

    dynamixel_data[5] = 512 + int(round(data[5] * 1024 / math.radians(300)))
    dynamixel_data[4] = 512 - int(round(data[4] * 1024 / math.radians(300)))
    dynamixel_data[3] = 512 + int(round(data[3] * 1024 / math.radians(300)))
    dynamixel_data[2] = 512 + int(round(data[2] * 1024 / math.radians(300)))

    dynamixel_data[1] = 512 - int(round(data[1] * 1024 / math.radians(300)))
    dynamixel_data[0] = 2048 - int(round(data[0] * 4096 / math.radians(360)))

    dynamixel_data[11] = 512 + int(round(data[11] * 1024 / math.radians(300)))
    dynamixel_data[10] = 512 + int(round(data[10] * 1024 / math.radians(300)))
    dynamixel_data[9] = 512 - int(round(data[9] * 1024 / math.radians(300)))
    dynamixel_data[8] = 512 - int(round(data[8] * 1024 / math.radians(300)))

    dynamixel_data[7] = 512 - int(round(data[7] * 1024 / math.radians(300)))
    dynamixel_data[6] = 2048 - int(round(data[6] * 4096 / math.radians(360)))

    dynamixel_data[12] = 512 - int(round(data[12] * 1024 / math.radians(300)))
    dynamixel_data[13] = 512 - int(round(data[13] * 1024 / math.radians(300)))
    dynamixel_data[14] = 512 + int(round(data[14] * 1024 / math.radians(300)))
    dynamixel_data[15] = 512 + int(round(data[15] * 1024 / math.radians(300)))
    dynamixel_data[16] = 512 - int(round(data[16] * 1024 / math.radians(300)))
    dynamixel_data[17] = 512 - int(round(data[17] * 1024 / math.radians(300)))
    dynamixel_data[18] = 477 + int(round(data[18] * 1024 / math.radians(300)))

    for i in range(12, 19):
        if (dynamixel_data[i] > 1023):
            dynamixel_data[i] = 1023
        if(dynamixel_data[i] < 0):
            dynamixel_data[i] = 0

    return dynamixel_data