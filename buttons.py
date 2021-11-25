import RPi.GPIO as GPIO
from time import sleep


class Button:
    def __init__(self):
        GPIO.setmode(GPIO.BCM)
        GPIO.setwarnings(False)
        self.STAIRS = 6
        self.SPRINT = 13
        self.BATTLE = 19
        self.REMOTE = 26
        GPIO.setup(self.STAIRS, GPIO.IN,  pull_up_down=GPIO.PUD_UP)
        GPIO.setup(self.SPRINT, GPIO.IN, pull_up_down=GPIO.PUD_UP)
        GPIO.setup(self.BATTLE, GPIO.IN, pull_up_down=GPIO.PUD_UP)
        GPIO.setup(self.REMOTE, GPIO.IN, pull_up_down=GPIO.PUD_UP)

    def choose_mode(self):
        while True:
            if GPIO.input(self.STAIRS) == 0:
                sleep(1)
                if GPIO.input(self.STAIRS) == 0:
                    mode = 'sprint'
                    break

            elif GPIO.input(self.SPRINT) == 0:
                sleep(1)
                if GPIO.input(self.SPRINT) == 0:
                    mode = 'battle'
                    break

            elif GPIO.input(self.BATTLE) == 0:
                sleep(1)
                if GPIO.input(self.BATTLE) == 0:
                    mode = 'remote'
                    break

            elif GPIO.input(self.REMOTE) == 0:
                sleep(1)
                if GPIO.input(self.REMOTE) == 0:
                    mode = 'stairs'
                    break

        return mode

    def get_mode(self):
        if GPIO.input(self.STAIRS) == 0:
            return True

        elif GPIO.input(self.SPRINT) == 0:
            return True

        elif GPIO.input(self.BATTLE) == 0:
            return True

        elif GPIO.input(self.REMOTE) == 0:
            return True

        return False

    def __del__(self):
        GPIO.cleanup()
