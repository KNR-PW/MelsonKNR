import rospy
from sensor_msgs.msg import Image
import cv2
from cv_bridge import CvBridge, CvBridgeError



def talker():
    try:
        vid = cv2.VideoCapture(0)
        #vid.set(cv2.CAP_PROP_POS_FRAMES,0)
        vid.set(cv2.CAP_PROP_FRAME_WIDTH,1920)
        vid.set(cv2.CAP_PROP_FRAME_HEIGHT, 1080)
        vid.set(cv2.CAP_PROP_FPS,120)
        vid.set(cv2.CAP_PROP_AUTO_EXPOSURE, 1)  # manual mode
    except IOError:
        rospy.loginfo("Could not connect to given camera. Check camera Id")

    try:
        bridge = CvBridge()
        pub = rospy.Publisher('rpicam', Image, queue_size=10)
        rospy.init_node('rpicam_pub', anonymous=True)
        rate = rospy.Rate(60)  # 10Hz
    except ROSException:
        rospy.loginfo("Encountered problem during initializing camera check device or device id")

    while not rospy.is_shutdown():
            ret, frame = vid.read()
            pub.publish(bridge.cv2_to_imgmsg(frame))
            rate.sleep()



if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
