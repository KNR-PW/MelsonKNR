from dynamixel_workbench_msgs.srv import DynamixelCommand,DynamixelCommandRequest
from dynamixel_workbench_msgs.msg import DynamixelStateList
import rospy
import time
import numpy as np

class PositionHolder():
    def __init__(self):
        self.steps_to_stand = 5
        rospy.Subscriber('/dynamixel_workbench/dynamixel_state', DynamixelStateList, self.position_actualizer)
        #WARTOSC Z INDEKSEM 0 NIE JEST UZYWANA,ID SERWA POKRYWA SIE Z ID W TABLIC SERWO JEDEN TO WARTOSC self.stand_values[1]
        self.stand_values = np.array([0, 2048, 2048, 1400, 2770, 1665, 2048, 2048, 2048, 1400, 2770, 1665, 2048, 1800, 200, 2048, 2400, 2400, 2048])
        self.one_servo_value = DynamixelCommandRequest()
        self.one_servo_value.addr_name = 'Goal_Position'
        self.service = rospy.ServiceProxy('/dynamixel_workbench/dynamixel_command', DynamixelCommand)
        time.sleep(1)
        self.try_to_stand()
        rospy.spin()

    #Ta metoda przyjmuje id serwa oraz wartosc jaka ma byc na nie przypisana, metoda uwzglednia krytyczne wartosci serw
    def execute_move(self, servo_id,servo_value):
        self.value_threshold={
            "1" : (1023,2500),
            "2" : (2048,3073),
            "3" : (500,2600),
            "4" : (1250,3500),
            "5" : (1023,2500),
            "6" :(1023,3073),
            "7": (1023, 2500),
            "8": (2048, 3073),
            "9": (500, 2600),
            "10": (1250, 3500),
            "11": (1023, 2500),
            "12": (1023, 3073),
            "13": (0, 2100),
            "14": (50, 1700),
            "15": (800, 3300),
            "16": (1950, 4050),
            "17": (2048, 4050),
            "18": (800, 3300)
        }
        if servo_value<self.value_threshold[str(servo_id)][1] and servo_value>self.value_threshold[str(servo_id)][0]:            #tu nie wiem czy to był blad ale znak nierownosci w 2 warunku był taki sam jak w 1
            self.one_servo_value.id = servo_id
            self.one_servo_value.value = servo_value
            self.service(self.one_servo_value)
            print("nie spadne z rowerka")
        else:
            print("Desired Servo value will do colision")

    def position_actualizer(self,dynamixel_state_msg):
        number_of_servos=18
        self.dynamixel_state_msg=dynamixel_state_msg
        self.position_array=np.zeros(number_of_servos+1)
        #Serwa wczytywane sa randomowo,niezbedne jest korzystanie z ID serw
        for i in range(number_of_servos):
            try:
                servo_id=dynamixel_state_msg.dynamixel_state[i].id
                #Ta tablica zawiera aktualne pozycje na serwach z id [0 1 2 3 4 5] id o numerze 0 nie istnieje więc ma 0 zawsze
                self.position_array[servo_id]=dynamixel_state_msg.dynamixel_state[i].present_position
            except:
                print("costam")
        print((self.stand_values-self.position_array)/self.steps_to_stand)

    # def try_to_stand(self):
    #     number_of_servos=13
    #     change_value=(self.stand_values-self.position_array)/self.steps_to_stand
    #     for j in range(self.steps_to_stand):
    #         for i in range(number_of_servos):
    #             servo_id = int(self.dynamixel_state_msg.dynamixel_state[i - 1].id)
    #
    #             servo_value=int(self.position_array[servo_id]+int(change_value[servo_id]))
    #             self.execute_move(servo_id,servo_value)
    #             # self.one_servo_value.id = servo_id
    #             # self.one_servo_value.value = int(self.position_array[servo_id]+int(change_value[servo_id]))
    #             # self.service(self.one_servo_value)
    #         time.sleep(0.05)

    def try_to_stand(self):
        number_of_servos=19
        for actual_step_number in range(self.steps_to_stand):
            change_value = (self.stand_values - self.position_array) / (self.steps_to_stand-actual_step_number)
            for servo in range(number_of_servos):
                servo_id = int(self.dynamixel_state_msg.dynamixel_state[servo - 1].id)

                servo_value=int(self.position_array[servo_id]+int(change_value[servo_id]))
                self.execute_move(servo_id,servo_value)
                # self.one_servo_value.id = servo_id
                # self.one_servo_value.value = int(self.position_array[servo_id]+int(change_value[servo_id]))
                # self.service(self.one_servo_value)
            time.sleep(0.05)

if __name__ == '__main__':
    rospy.init_node('stand_service', anonymous=True)
    PositionHolder()
