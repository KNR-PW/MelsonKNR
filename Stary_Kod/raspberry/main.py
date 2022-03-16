import time
import datetime
from communication import Connections
import sys
from melson_the_state_machine import RobotMachine


def main(args):
    step = 0.01  # w sekundach
    comm = Connections()
    print('connections')
    # potem może być Control panel
    machine = RobotMachine(comm)
    machine.wstan()
    a = time.time()
    while 1:
        # comm.update()
        print('main loop')
        machine.work()
        print('after work')
        b = time.time()  # spróbować time.time
        c = b - a

        while(c < step):  # zmienić na while, przetestować sleep
            time.sleep(0.0001)
            b = time.time()
            c = b - a


if __name__ == '__main__':
    main(sys.argv)


# dla przejżystości dodałem logikę sprintu i sumo w oddzielnych funkcjach
def sprint(control, sensors_state):
    if sensors_state.R < 15:    # get_sensors powinno zwracać zbiekt z trzema wartościami założyłem nazwy R, L, F
        control.set_servo()
    elif sensors_state.L < 15:  # git nie działa :(
        control.set_servo()
    else:
        control.set_servo()


def sumo(control, sensors_state):
    last_seen = 1
    if sensors_state.R < 63:
        last_seen = 3
        if sensors_state.F < 20:
            control.set_servo()
        else:
            control.set_servo()
    elif sensors_state.R < 63:
        last_seen = 1
        control.set_servo()
    elif sensors_state.L < 63:
        last_seen = 2
        control.set_servo()
    else:
        if last_seen == 1:
            control.set_servo()
        elif last_seen == 2:
            control.set_servo()
        elif last_seen == 3:
            control.set_servo()


def decision(control):  # funkcja zawierającą główną logikę bota
    sensors_state = control.get_sensors()
    if control.get_category() == 1:
        sprint(control, sensors_state)
    elif control.get_category() == 2:
        sumo(control, sensors_state)
        return
    control.send_servo()
