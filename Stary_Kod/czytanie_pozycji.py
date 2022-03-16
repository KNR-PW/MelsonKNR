from dynamixel_sdk import*
import time

stoper = time
PROTOCOL_VERSION = 1.0
BAUDERATE = 1000000
DEVICENAME = 'COM8'

ADDR_PRESENT_POSITION = 0x24
ADDR_GOAL_POSITION = 0x1E

portHandler = PortHandler(DEVICENAME)
packetHandler = PacketHandler(PROTOCOL_VERSION)

ID = 0x01

portHandler.openPort()

pozycje = [0]*20

for i in range(1,20):
    Pozycja,dxl_comm_result, dxl_error = packetHandler.read2ByteTxRx(portHandler,ID,ADDR_PRESENT_POSITION)
    print("ID: %s, poz: %s" %(ID,Pozycja))
    pozycje[i] = Pozycja
    ID = ID+1

#packetHandler.write1ByteTxOnly(portHandler,18,0x19,0)
print(pozycje)

target = [0,2048, 532, 379, 787, 655, 532, 2048, 492, 645, 237, 369, 492, 434, 539, 271, 590, 485, 753, 785]
skok = [0.0]*20
czas = 4.0
dt = 0.015
l_krokow = czas/dt
for i in range(1,20):
    skok[i] = (target[i]-pozycje[i])/l_krokow

t = 0.0

while t < czas:
    for i in range(1,20):
        pozycje[i] = pozycje[i]+skok[i]
        packetHandler.write2ByteTxOnly(portHandler,i,ADDR_GOAL_POSITION,int(pozycje[i]))

    t = t + dt
    stoper.sleep(dt)



portHandler.closePort()