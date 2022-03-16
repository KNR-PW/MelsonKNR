from dynamixel_sdk import *
import time
ADDR_GOAL_POS = 0x1E

LEN_GOAL_POS = 2

VAL_HIGH_POS = 0x2F
VAL_LOW_POS = 0x0F

PROTOCOL_VERSION = 1.0

BAUDERATE = 1000000
DEVICENAME = 'COM8'

AX_ID = 0xFE

portHandler = PortHandler(DEVICENAME)

packetHandler = PacketHandler(PROTOCOL_VERSION)

groupSyncWrite = GroupSyncWrite(portHandler, packetHandler, ADDR_GOAL_POS, LEN_GOAL_POS)

portHandler.openPort()

portHandler.setBaudRate(BAUDERATE)

i =0
czas = time.time()
while True:
    if (time.time() - czas > 1):
        if i==0:
            packetHandler.write2ByteTxRx(portHandler,AX_ID,ADDR_GOAL_POS,VAL_HIGH_POS)
            i=1
        elif i==1:
            packetHandler.write2ByteTxRx(portHandler,AX_ID,ADDR_GOAL_POS,VAL_LOW_POS)
            i=0
        czas = time.time()


