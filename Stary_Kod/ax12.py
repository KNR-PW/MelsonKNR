from dynamixel_sdk import*


class Ax12:
    def __init__(self,nazwa_portu='COM8'):
        self.ID=[13,14,15,16,17,18,19]
        self.PORT = nazwa_portu
        self.BAUD = 1000000
        self.PROTOCOL_VERSION = 1.0
        self.portHandler = PortHandler(self.PORT)
        self.packetHandler = PacketHandler(self.PROTOCOL_VERSION)
        self.portHandler.openPort()
        self.portHandler.setBaudRate(self.BAUD)
        self.ADDR_POZYCJI = 0x1E
        self.ADDR_PRESENT_POSITION = 0x24
        self.Current_Pos = [0]*7



    def sync_write_pos(self,pozycje):
        self.pakietPozycji = GroupSyncWrite(self.PORT,self.packetHandler,self.ADDR_POZYCJI,2)
        for i in range(0,8):
            self.pakietPozycji.addParam(ID[i],pozycje[i])
        self.pakietPozycji.txPacket()
        self.pakietPozycji.clearParam()

    def read_position(self):
        for i in range(0,8):
            self.Current_Pos[i] = self.packetHandler.read2ByteTxRx(self.PORT,self.ID[i],self.ADDR_PRESENT_POSITION)

        return self.Current_Pos







    def __del__(self):
        self.portHandler.closePort()
        print('zlikwidowano ax12')