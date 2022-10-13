import rospy
from sensor_msgs.msg import Image
import cv2
from cv_bridge import CvBridge, CvBridgeError
import queue, threading, time


class VideoCapture:

    def __init__(self):
        self.cap = cv2.VideoCapture(-1, cv2.CAP_V4L2)
        self.q = queue.Queue()
        t = threading.Thread(target=self._reader)
        t.daemon = True
        t.start()

    # read frames as soon as they are available, keeping only most recent one
    def _reader(self):
        while True:
            ret, frame = self.cap.read()
            if not ret:
                break
            if not self.q.empty():
                try:
                    self.q.get_nowait()  # discard previous (unprocessed) frame
                except queue.Empty:
                    pass
            self.q.put(frame)

    def read(self):
        return self.q.get()


def image_publisher():
    try:
        vid = VideoCapture()
    except IOError:
        rospy.loginfo("Could not connect to given camera. Check camera Id")

    try:
        bridge = CvBridge()
        pub = rospy.Publisher('rpicam', Image, queue_size=10)
        rospy.init_node('rpicam_pub', anonymous=True)
        rate = rospy.Rate(30)  # 1Hz
    except ROSException:
        rospy.loginfo("Encountered problem during initializing camera check device or device id")

    while not rospy.is_shutdown():
        frame = vid.read()
        pub.publish(bridge.cv2_to_imgmsg(frame))
        rate.sleep()


if __name__ == '__main__':
    try:
        image_publisher()
    except rospy.ROSInterruptException:
        pass