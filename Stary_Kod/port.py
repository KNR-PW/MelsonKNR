import serial
import time

port = serial.Serial(port='COM8', baudrate=1000000 , bytesize=serial.EIGHTBITS)





pos_1 = [0xFF,0xFF,0xFE,0x05,0x03,0x1E,0x00,0x02,0xD9]
pos_2 = [0xFF,0xFF,0xFE,0x05,0x03,0x1E,0xEF,0x00,0xEC]







czas = time.time()

k = 0

while True:
    if(time.time()-czas > 2):
        if(k==0):
            print(str(wlacz))
            j =port.write(bytearray(pos_1))
            print(j)
            czas = time.time()
            k=1
        else:
            print(wylacz)
            port.write(bytearray(pos_2))
            czas = time.time()
            k=0







#port.close()


