from dynamixel_sdk import *
import time


PROTOCOL_VERSION = 1.0
BAUDERATE = 1000000
DEVICENAME = 'COM8'
DEVICENAME_RX = 'COM11'

ADDR_PRESENT_POSITION = 0x24
ADDR_GOAL_POSITION = 0x1E

portHandler = PortHandler(DEVICENAME)
portRx = PortHandler(DEVICENAME_RX)

packetHandler = PacketHandler(PROTOCOL_VERSION)

ID = 0x01

portHandler.openPort()
portRx.openPort()


pozycje = [0]*20


for i in range(1,13):                                   # czytanie pozycji z Rx- ow
    Pozycja,dxl_comm_result, dxl_error = packetHandler.read2ByteTxRx(portRx,ID,ADDR_PRESENT_POSITION)
    print("ID: %s, poz: %s" %(ID,Pozycja))
    pozycje[i] = Pozycja
    ID = ID+1

for i in range(13,20):                                     # czytanie pozycji z AX-ow
    Pozycja,dxl_comm_result, dxl_error = packetHandler.read2ByteTxRx(portHandler,ID,ADDR_PRESENT_POSITION)
    print("ID: %s, poz: %s" %(ID,Pozycja))
    pozycje[i] = Pozycja
    ID = ID + 1

print(pozycje)
#packetHandler.write1ByteTxOnly(portHandler,18,0x19,0)

target = [0,2048, 532, 379, 787, 655, 532, 2048, 492, 645, 237, 369, 492, 434, 539, 271, 590, 485, 753, 785]
fi = [0.0]*20
#a_3 = [0.0]*20
a_2 = [0.0]*20


czas = 4.0
dt = 0.01
l_krokow = czas/dt
for i in range(1,20):
    fi[i] = (target[i]-pozycje[i])
    a_2[i] = 3.0*fi[i]/(czas**2)

t = 0.0
licznik = time.time()

while t < czas:
    if(time.time() - licznik > dt):
        licznik = time.time()
        t = t + dt
        for i in range(1,13):
            pos = (-2.0*a_2[i]/(3.0*czas))*(t**3) + a_2[i]*(t**2) + pozycje[i]
            packetHandler.write2ByteTxOnly(portRx,i,ADDR_GOAL_POSITION,int(pos))
        for i in range(13,20):
            pos = (-2.0*a_2[i]/(3.0*czas))*(t**3) + a_2[i]*(t**2) + pozycje[i]
            packetHandler.write2ByteTxOnly(portHandler,i,ADDR_GOAL_POSITION,int(pos))

portHandler.closePort()
portRx.closePort()
time.sleep(1)
ID = 0x01

portHandler.openPort()
portRx.openPort()
for i in range(1,13):                                   # czytanie pozycji z Rx- ow
    Pozycja,dxl_comm_result, dxl_error = packetHandler.read2ByteTxRx(portRx,i,ADDR_PRESENT_POSITION)
    print("ID: %s, poz: %s" %(ID,(target[i]-Pozycja)))
    pozycje[i] = Pozycja
    ID = ID+1

for i in range(13,20):                                     # czytanie pozycji z AX-ow
    Pozycja,dxl_comm_result, dxl_error = packetHandler.read2ByteTxRx(portHandler,i,ADDR_PRESENT_POSITION)
    print("ID: %s, poz: %s" %(ID,(target[i]-Pozycja)))
    pozycje[i] = Pozycja
    ID = ID + 1

packetHandler.write1ByteTxOnly(portHandler,4,0x19,1)
packetHandler.write1ByteTxOnly(portHandler,10,0x19,1)

portHandler.closePort()
portRx.closePort()













