from time import sleep
from communication import Communication


def sprint(control, sensors_state):  # dla przejżystości dodałem logikę sprintu i sumo w oddzielnych funkcjach
    if sensors_state.R < 15:    # get_sensors powinno zwracać zbiekt z trzema wartościami założyłem nazwy R, L, F
        control.set_servo()
    elif sensors_state.L < 15:
        control.set_servo()
    else:
        control.set_servo()


def sumo(control, sensors_state):
    last_seen = 3
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
        if last_seen == 3:
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


sensors = Communication()

while 1:  # narazie tak zostawię, ale potem trzeba będzie dodać wątki
    sleep(0.4)
    decision(sensors)
