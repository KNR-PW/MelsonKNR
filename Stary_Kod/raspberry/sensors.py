import time

import Adafruit_GPIO.SPI as SPI
import Adafruit_MCP3008


class Sensors:

    def __init__(self):

        CLK = 18
        MISO = 23
        MOSI = 24
        CS = 25
        SPI_PORT = 0
        SPI_DEVICE = 0
        self.mcp = Adafruit_MCP3008.MCP3008(
            spi=SPI.SpiDev(SPI_PORT, SPI_DEVICE))

        print('Reading MCP3008 values, press Ctrl-C to quit...')
        print('| {0:>4} | {1:>4} | {2:>4} | {3:>4} | {4:>4} | {5:>4} | {6:>4} | {7:>4} |'.format(
            *range(8)))
        print('-' * 57)

        self.front_suma = 0
        self.left_suma = 0
        self.right_suma = 0
        self.k = 0
        self.R = 0
        self.F = 0
        self.L = 0
        self.update_sensors()

    def update_sensors_inner(self):
        values = [0]*8
        for i in range(8):
            # The read_adc function will get the value of the specified channel (0-7).
            values[i] = self.mcp.read_adc(i)
    # Print the ADC values.
        if values[7] == 0:
            values[7] = 1
        if values[6] == 0:
            values[6] = 1
        if values[5] == 0:
            values[5] = 1

        front_dane = values[7]*3.3/1023
        right_dane = values[6]*3.3/1023
        left_dane = values[5]*3.3/1023

        # print(str(front_dane))

        front = 24.665*(front_dane**(-1.131))
        # print(str(front))
        right = 24.665*(right_dane**(-1.131))
        left = 24.665*(left_dane**(-1.131))

        self.k = self.k + 1
        #print("k: " + str(self.k) + "(sensors)")

        self.front_suma = self.front_suma + front
        self.right_suma = self.right_suma + right
        self.left_suma = self.left_suma + left

        if (self.k >= 100):
            # print("finish_czujniki")
            self.F = self.front_suma / 100
            self.R = self.right_suma / 100
            self.L = self.left_suma / 100

            print('front = ', self.F)
            print('left = ', self.L)
            print('right = ', self.R)
            print(' ')

    def update_sensors(self):

        self.k = 0
        self.F = 0
        self.L = 0
        self.R = 0
        #print("updating sensors")

        self.front_suma = 0
        self.left_suma = 0
        self.right_suma = 0

        for i in range(101):
            self.update_sensors_inner()
