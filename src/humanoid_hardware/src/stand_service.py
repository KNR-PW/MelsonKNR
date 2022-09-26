from dynamixel_workbench_msgs.srv import DynamixelCommand,DynamixelCommandRequest,DynamixelStateList
import rospy
import time
import numpy as np

class PositionHolder():
    def __init__(self):
        rospy.Subscriber('/dynamixel_workbench/dynamixel_state', DynamixelStateList, position_actualizer)

    def position_actualizer(self,dynamixel_state_msg):
        number_of_servos=len(dynamixel_state_msg)
        self.position_array=np.zeros(number_of_servos)
        for i in range(number_of_servos):
            self.position_array[i]=dynamixel_state_msg[i].present_position


