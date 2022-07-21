from dynamixel_workbench_msgs.srv import DynamixelCommand,DynamixelCommandRequest
import rospy
import time

number_of_servos=20

one_servo_service=rospy.ServiceProxy('/dynamixel_workbench/dynamixel_command',DynamixelCommand)
one_servo_request=DynamixelCommandRequest()
one_servo_request.addr_name='Goal_Position'
with open('/home/drozdzal/MelsonKNR/src/humanoid_hardware/static_moves/krok_przod.txt') as f:
    line = f.readline()
    while True:
        line = f.readline()
        servo_values=line.split(' ')
        for servo in range(number_of_servos):
            one_servo_request.id = servo
            one_servo_request.value = servo_values[servo]
            one_servo_service(one_servo_request)
        if not line:
            break
    f.close()


