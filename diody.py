import RPi.GPIO as GPIO

class Diody:

  def __init__(self):

    GPIO.setmode(GPIO.BCM)
    GPIO.setwarnings(False)

    self.GPIO.setup(12, GPIO.OUT)
    self.GPIO.setup(16, GPIO.OUT)
    self.GPIO.setup(20, GPIO.OUT)
    self.GPIO.setup(21, GPIO.OUT)


  def update_diody(self, schody, sprint, sumo, zdalny):

    if (self.schody == 1):
        self.GPIO.output(12, GPIO.HIGH)
    else:
        self.GPIO.output(12, GPIO.LOW)

    if (self.sprint == 1):
        self.GPIO.output(16, GPIO.HIGH)
    else:
        self.GPIO.output(16, GPIO.LOW)

    if (self.sumo == 1):
        self.GPIO.output(20, GPIO.HIGH)
    else:
        self.GPIO.output(20, GPIO.LOW)

    if (self.zdalny == 1):
        self.GPIO.output(21, GPIO.HIGH)
    else:
        self.GPIO.output(21, GPIO.LOW)