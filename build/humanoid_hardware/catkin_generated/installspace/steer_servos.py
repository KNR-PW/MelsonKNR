from dynamixel_workbench_msgs.srv import DynamixelCommand,DynamixelCommandRequest
import rospy
import time

one_servo_value=DynamixelCommandRequest()
one_servo_value.id=2
one_servo_value.addr_name='Goal_Position'
service=rospy.ServiceProxy('/dynamixel_workbench/dynamixel_command',DynamixelCommand)
i=0
for i in range(20):
    one_servo_value.value=100*i
    time.sleep(0.1)
    service(one_servo_value)
    print(i)



