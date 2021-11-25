# strorzyć klasę control
# Klasa nadrzędna
# ta klasa musi zawierać zmienne (np. numery pinów) i funkcje, potrzebne do łączenia z czujnikami
from humanoid import Humanoid
from buttons import Button

class Connections:  # nazwać w jakiś inny sposób
    # jakieś zmienne
    def __init__(self):  # ustawienie czujników (to nie musimy pisać)
        self.servos = Humanoid()
        #self.imu = Imu()
        self.buttons = Button()

    def update(self):
        self.servos.update()
        self.distance.update()
        self.imu.update()
