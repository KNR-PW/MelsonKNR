import rospy
import cv2
from cv_bridge import CvBridge, CvBridgeError
from sensor_msgs.msg import Image
from datetime import datetime
from humanoid_msgs.srv import img,imgResponse

class ImgServer:
    def __init__(self):
        try:
            self.vid = cv2.VideoCapture(0)
        except IOError:
            rospy.loginfo("Could not connect to given camera. Check camera Id")
        self.img_server = rospy.Service("img_server", Image, self.img_callback)
        self.bridge = CvBridge()
        self.img_server = rospy.Service('one_img_pls', img, img_callback)
        rospy.spin()

    def img_callback(self, img_msg):
        ret, frame = self.vid.read()
        return imgResponse(self.bridge.cv2_to_imgmsg(frame))
        print("Sent uno imigo")

if __name__ == '__main__':
    ImgServer()