import rospy
from sensor_msgs.msg import Image
import cv2
from cv_bridge import CvBridge, CvBridgeError
from datetime import datetime
import rospy
import math
import actionlib
import numpy as np
from time import sleep
'''
Due to the fact that drone will be flying in Poland i am using abs value (Exif gives error when i
'''


class Controller:
    def __init__(self):
        rospy.init_node('img_sub')
        self.bridge = CvBridge()
        self.move_finished = True
        def img_callback_closure(img_msg):
            self.img_callback(img_msg)

        rospy.Subscriber('rpicam', Image, img_callback_closure)


    def img_callback(self,img_msg):
            cv_image = self.bridge.imgmsg_to_cv2(img_msg)
            imgHSV = cv2.cvtColor(cv_image, cv2.COLOR_BGR2HSV)
            cv2.imshow('okienko',cv_image)
            cv2.waitKey(1)


if __name__ == '__main__':
    Controller()
    rospy.spin()