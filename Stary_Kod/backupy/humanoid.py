from dynamixel_sdk import *
import time
class Humanoid:
    def __init__(self,                   # po utworzeniu obiektu dobrze jest postawic melsona funkcja wstawanie
                 portAX='COM8',          # port, który obsluguje AX
                 portRX='COM11'):           # port, który obsluguje RX
        self.ID = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]
        self.port_AX = PortHandler(portAX)
        self.port_RX = PortHandler(portRX)
        self.packetHandler = PacketHandler(1.0)       # 1.0 to wersja protokolu
        self.Baudrate = 1000000
        self.port_AX.openPort()
        self.port_RX.openPort()
        self.ADR_POZ = 0x1E
        self.ADR_OB_POZ = 0x24
        self.ADR_SLOPE_CW = 0x1C
        self.ADR_SLOPE_CCW = 0x1D
        self.ADR_TOR_EN = 0x18
        self.poz_start = [0,2048, 532, 379, 787, 655, 532, 2048, 492, 645, 237, 369, 492, 434, 539, 271, 590, 485, 753, 785]
        self.slope_CW = [0,32,2,2,2,2,2,32,2,2,2,2,2,32,32,32,32,32,32,64]
        self.slope_CCW = [0,32,2,2,2,2,2,32,2,2,2,2,2,32,32,32,32,32,32,64]


    def res_port(self):                              # włączanie i wyłączanie portów
        self.port_AX.closePort()
        self.port_RX.closePort()

        self.port_AX.openPort()
        self.port_RX.openPort()
        time.sleep(0.0001)

    def poj_odczyt(self,                        # odczyt wartosci z pojedynczego serwa
                   id,                     # id serwa
                   addres,                  # adres rejestru dynamixela gdzie wyslac dane
                   l_bajtow):                  # liczba bajtow ile te dane zajmuja, patrz: http://support.robotis.com/en/product/actuator/dynamixel/ax_series/dxl_ax_actuator.htm#Actuator_Address_1A
        if l_bajtow == 1:
            if id > 12:
                x, dxl_comm_result, dxl_error = self.packetHandler.read1ByteTxRx(self.port_AX,id,addres)
            else:
                x, dxl_comm_result, dxl_error = self.packetHandler.read1ByteTxRx(self.port_RX, id, addres)

        elif l_bajtow == 2:
            if id > 12:
                x, dxl_comm_result, dxl_error = self.packetHandler.read2ByteTxRx(self.port_AX, id, addres)
            else:
                x, dxl_comm_result, dxl_error = self.packetHandler.read2ByteTxRx(self.port_RX, id, addres)

        return x


    def sync_read(self,     #  metoda zwraca tablice z wartościami na wybranym rejestrze wszystkich serw. np połozenie kazdego serwa
                  adres,    # adres rejestru, który chcemy odczytać
                  l_bajtow):  # liczba bajtow ile zajmuje dana wartosc ( mozliwe wartosci: 1 lub 2)
        x = [0]*20
        if l_bajtow == 1:
            for i in range(1,13):
                x[i],n,m = self.packetHandler.read1ByteTxRx(self.port_RX,i,adres)
            for i in range(13,20):
                x[i],n,m = self.packetHandler.read1ByteTxRx(self.port_AX,i,adres)

        elif l_bajtow == 2:
            for i in range(1,13):
                x[i],n,m = self.packetHandler.read2ByteTxRx(self.port_RX,i,adres)
            for i in range(13,20):
                x[i],n,m = self.packetHandler.read2ByteTxRx(self.port_AX,i,adres)

        return x



    def odczyt_poz(self):                   # czyta pozycje kazdego serwa i zwraca w postaci tablicy
        self.res_port()
        x = [0]*20
        for i in range(1,13):
            x[i],n,m = self.packetHandler.read2ByteTxRx(self.port_RX,i,self.ADR_OB_POZ)
        for i in range(13,20):
            x[i],n,m = self.packetHandler.read2ByteTxRx(self.port_AX,i,self.ADR_OB_POZ)

        return x

    def sync_write_1(self,        # taka funkcja co wysyła do wszystkich serw jakas wartosc (1 bajtowa)
                                  # pod zadany adres
                     Adres,        #   adres rejestru w dynamixelach
                     values):      # lista z wartościami dla każdego serwa
        pakietAX = GroupSyncWrite(self.port_AX,self.packetHandler,Adres,1)
        pakietRX = GroupSyncWrite(self.port_RX,self.packetHandler,Adres,1)

        for i in range(1,13):
            pakietAX.addParam(i,values[i])                    # do obiektu trzeba dodac wartosci

        for i in range(13,20):
            pakietRX.addParam(i,values[i])

        pakietAX.txPacket()
        pakietRX.txPacket()     # wysyłanie

        pakietAX.clearParam()
        pakietRX.clearParam()


    def sync_write_2(self,             # wysyla do kazdego podlaczonego serwa jakad wartosc ( 2 bajtowa)
                                       # pod zadany adres
                     Adres,            # adres, do którego wysylamy (adres nizszego bajtu)
                     values):          # lista z wartościami

        pakietAX = GroupSyncWrite(self.port_AX,self.packetHandler,Adres,2)
        pakietRX = GroupSyncWrite(self.port_RX,self.packetHandler,Adres,2)

        for i in range(1,13):
            pakietAX.addParam(i,values[i])                    # do obiektu trzeba dodac wartosci

        for i in range(13,20):
            pakietRX.addParam(i,values[i])

        pakietAX.txPacket()
        pakietRX.txPacket()  # wysyłanie

        pakietAX.clearParam()
        pakietRX.clearParam()




    def send_pos(self,                                  # taka metoda, ze dajesz liste z pozycjami i melson sie ustawia
                 poz):                                 #  lista z pozycjami
        for i in range(1, 13):

            self.packetHandler.write2ByteTxOnly(self.port_RX, i, self.ADR_POZ, poz[i])
        for i in range(13, 20):

            self.packetHandler.write2ByteTxOnly(self.port_AX, i, self.ADR_POZ, poz[i])

        return


    def setSlope(self,                                  # ustawia slope'y w zaleznosci od nogi, na ktorej stoi
                 noga):                                 # noga, na której stoi Melson: 'B' -obie, 'L' - Lewa, 'R' - prawa
        self.res_port()
        if(noga == 'B'):
            SlopeCW = [0,32, 2, 2, 2, 2, 2, 32, 2, 2, 2, 2, 2, 32, 32, 32, 32, 32, 32, 64]
            SlopeCCW = [0,32, 2, 2, 2, 2, 2, 32, 2, 2, 2, 2, 2, 32, 32, 32, 32, 32, 32, 64]
            for i in range(1, 13):  # na poczatek ustaw slope'y
                self.packetHandler.write1ByteTxOnly(self.port_RX, i, self.ADR_SLOPE_CW, SlopeCW[i])
                time.sleep(0.001)
                self.packetHandler.write1ByteTxOnly(self.port_RX, i, self.ADR_SLOPE_CCW, SlopeCCW[i])
                time.sleep(0.001)

            for i in range(13, 20):
                self.packetHandler.write1ByteTxOnly(self.port_AX, i, self.ADR_SLOPE_CW, SlopeCW[i])
                time.sleep(0.001)
                self.packetHandler.write1ByteTxOnly(self.port_AX, i, self.ADR_SLOPE_CCW, SlopeCCW[i])
                time.sleep(0.001)

        if(noga == 'R'):
            SlopeCW = [0,32, 2, 2, 2, 2, 2, 32, 7, 7, 7, 7, 7, 32, 32, 32, 32, 32, 32, 64]
            SlopeCCW = [0,32, 2, 2, 2, 2, 2, 32, 7, 7, 7, 7, 7, 32, 32, 32, 32, 32, 32, 64]
            for i in range(1, 13):  # na poczatek ustaw slope'y
                self.packetHandler.write1ByteTxOnly(self.port_RX, i, self.ADR_SLOPE_CW, SlopeCW[i])
                time.sleep(0.001)
                self.packetHandler.write1ByteTxOnly(self.port_RX, i, self.ADR_SLOPE_CCW, SlopeCCW[i])
                time.sleep(0.001)

            for i in range(13, 20):
                self.packetHandler.write1ByteTxOnly(self.port_AX, i, self.ADR_SLOPE_CW, SlopeCW[i])
                time.sleep(0.001)
                self.packetHandler.write1ByteTxOnly(self.port_AX, i, self.ADR_SLOPE_CCW, SlopeCCW[i])
                time.sleep(0.001)

        if(noga == 'L'):
            SlopeCW = [0,32, 7, 7, 7, 7, 7, 32, 2, 2, 2, 2, 2, 32, 32, 32, 32, 32, 32, 64]
            SlopeCCW = [0,32, 7, 7, 7, 7, 7, 32, 2, 2, 2, 2, 2, 32, 32, 32, 32, 32, 32, 64]
            for i in range(1, 13):  # na poczatek ustaw slope'y
                self.packetHandler.write1ByteTxOnly(self.port_RX, i, self.ADR_SLOPE_CW, SlopeCW[i])
                time.sleep(0.001)
                self.packetHandler.write1ByteTxOnly(self.port_RX, i, self.ADR_SLOPE_CCW, SlopeCCW[i])
                time.sleep(0.001)

            for i in range(13, 20):
                self.packetHandler.write1ByteTxOnly(self.port_AX, i, self.ADR_SLOPE_CW, SlopeCW[i])
                time.sleep(0.001)
                self.packetHandler.write1ByteTxOnly(self.port_AX, i, self.ADR_SLOPE_CCW, SlopeCCW[i])
                time.sleep(0.001)

        self.res_port()
        return





    def wstawanie(self):                  # funkcja, która ustawia melsona w wyjsciowej pozycji w ciągu 4 sekund

        pozycje = self.odczyt_poz()
        for i in range(1,13):     # na poczatek ustaw  torque enable
            self.packetHandler.write1ByteTxOnly(self.port_RX, i, self.ADR_TOR_EN, 1)

        for i in range(13,20):
            self.packetHandler.write1ByteTxOnly(self.port_AX, i, self.ADR_TOR_EN, 1)

        for i in range(1,13):     # na poczatek ustaw slope'y
            self.packetHandler.write1ByteTxOnly(self.port_RX, i, self.ADR_SLOPE_CW, self.slope_CW[i])
            time.sleep(0.001)
            self.packetHandler.write1ByteTxOnly(self.port_RX, i, self.ADR_SLOPE_CCW, self.slope_CCW[i])
            time.sleep(0.001)

        for i in range(13,20):
            self.packetHandler.write1ByteTxOnly(self.port_AX, i, self.ADR_SLOPE_CW, self.slope_CW[i])
            time.sleep(0.001)
            self.packetHandler.write1ByteTxOnly(self.port_AX, i, self.ADR_SLOPE_CCW, self.slope_CCW[i])
            time.sleep(0.001)


        czas = 4.0
        dt = 0.01
        fi = [0]*20
        a_2 = [0]*20
        for i in range(1,20):
            fi[i] = (self.poz_start[i] - pozycje[i])
            a_2[i] = 3.0 * fi[i] / (czas ** 2)

        t = 0.0
        licznik = time.time()
        while (t < czas):
            if(time.time() - licznik >  dt):
                licznik = time.time()
                t = t + dt
                for i in range(1, 13):
                    pos = (-2.0 * a_2[i] / (3.0 * czas)) * (t ** 3) + a_2[i] * (t ** 2) + pozycje[i]
                    self.packetHandler.write2ByteTxOnly(self.port_RX, i, self.ADR_POZ, int(pos))
                for i in range(13, 20):
                    pos = (-2.0 * a_2[i] / (3.0 * czas)) * (t ** 3) + a_2[i] * (t ** 2) + pozycje[i]
                    self.packetHandler.write2ByteTxOnly(self.port_AX, i, self.ADR_POZ, int(pos))

        self.res_port()
        return

    def przejscie(self,                      # metoda, która ustawia MelSona w wybranej pozycji
                  pozycja_docelowa,          # pozycja, ktora ma osiagnac MelSon. Tablica int 20 element. 0 el. jest nieuzywany
                                             # nr elementu tablicy odpowiada ID serwa
                  czas):                     # czas, w jakim MelSon ma osiągnąc zadana pozycje
        pozycje = self.odczyt_poz()
        dt = 0.01
        fi = [0] * 20
        a_2 = [0] * 20
        for i in range(1, 20):
            fi[i] = (pozycja_docelowa[i] - pozycje[i])
            a_2[i] = 3.0 * fi[i] / (czas ** 2)

        t = 0.0

        licznik = time.time()
        while (t < czas):
            if (time.time() - licznik > dt):
                licznik = time.time()
                t = t + dt
                for i in range(1, 13):
                    pos = (-2.0 * a_2[i] / (3.0 * czas)) * (t ** 3) + a_2[i] * (t ** 2) + pozycje[i]
                    self.packetHandler.write2ByteTxOnly(self.port_RX, i, self.ADR_POZ, int(pos))
                for i in range(13, 20):
                    pos = (-2.0 * a_2[i] / (3.0 * czas)) * (t ** 3) + a_2[i] * (t ** 2) + pozycje[i]
                    self.packetHandler.write2ByteTxOnly(self.port_AX, i, self.ADR_POZ, int(pos))


        self.res_port()
        return













    def __del__(self):                  # destruktor, zamyka porty i wyswietla napis 'Skasowano obiekt humanoid'
        self.port_RX.closePort()
        self.port_AX.closePort()
        print('Skasowano obiekt humanoid')
