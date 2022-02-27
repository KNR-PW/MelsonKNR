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
        ret, frame = vid.read()
        self.img_sub = rospy.Subscriber("rpicam", Image, self.img_callback)
        self.bridge = CvBridge()

    def img_callback(self, img_msg):
        cv_image = self.bridge.imgmsg_to_cv2(img_msg)
        now = datetime.now()
        current_time = now.strftime("%H %M %S")
        #cv2.imwrite(f'{current_time}.jpg', cv_image)
        print("Received img")


if __name__ == '__main__':
    rospy.init_node('img_sub')
    while not rospy.is_shutdown():
            ret, frame = vid.read()
            pub.publish(bridge.cv2_to_imgmsg(frame))
            rate.sleep()
    RpiSub()
    rospy.spin()
