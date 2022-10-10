import rospy
from sensor_msgs.msg import Image
import cv2
from cv_bridge import CvBridge, CvBridgeError
from datetime import datetime
import rospy
import math

'''
Due to the fact that drone will be flying in Poland i am using abs value (Exif gives error when i
'''


class RpiSub:
    def __init__(self):
        rospy.init_node('img_server')
        self.img_sub = rospy.Subscriber("rpicam", Image, self.img_callback)
        self.bridge = CvBridge()

    def img_callback(self, img_msg):
        cv_image = self.bridge.imgmsg_to_cv2(img_msg)
        now = datetime.now()
        current_time = now.strftime("%H %M %S")
        cv2.imshow('okno',cv_image)
        cv2.waitKey(1)
        print("Received img")


if __name__ == '__main__':
    RpiSub()
    rospy.spin()
