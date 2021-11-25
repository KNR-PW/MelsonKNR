from sensors import Sensors
import time

sens = Sensors()
while True:
    sens.update_sensors()
    time.sleep(2)
