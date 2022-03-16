import re
import time


class Readtxt:
    

    def __init__(self):
        self.nazwy = {
            "sumo_atak": "sumo/atak.txt",
            "sumo_akatold" : "sumo_atakold.txt",
            "sumo_chod" : "sumo/chod.txt",
            "sumo_przod2" : "sumo/kroki2_przod_50.txt",
            "sumo_kopl" : "sumo/kop_lewa.txt",
            "sumo_kopp" : "sumo/kop_prawa.txt",
            "sumo_przod" : "sumo/krok_przod.txt",
            "sumo_tyl" : "sumo/krok_tyl.txt",
            "sumo_lewo15" : "sumo/obrot_l_15.txt",
            "sumo_prawo15" : "sumo/obrot_r_15.txt",
            "sumo_lewo135" : "sumo/obrot_l_135.txt",
            "sumo_prawo135" : "sumo/obrot_p_15.txt",
            "sprint_chod" : "sprint/chod.txt",
            "sprint_przod" : "sprint/krok_przod.txt",
            "sprint_tyl" : "sprint/krok_tyl.txt",
            "sprint_lewo15" : "sumo/obrot_l_15.txt",
            "sprint_prawo15" : "sumo/obrot_r_15.txt",
            "sprint_przod24" : "sprint/przod24.txt",
            "sprint_przod48" : "sprint/przod48.txt",
            "sprint_przod48old" : "sprint/przod48old.txt",
            "sprint_przod48safe" : "sprint/przod48safe.txt",
            "sprint_prawo90" : "sumo/obrot_p_90.txt",
            "sprint_lewo90" : "sumo/obrot_l_90.txt",
            "sprint_przod2" : "sumo/kroki2_przod_50.txt",
            "schody_przod" : "sumo/kroki2_przod_55.txt",
            "schodek" : "sumo/schodek.txt",
            "przod10" : "sumo/krok_przod_10.txt",
            "prawa_cala":"sumo/prawa_cala.txt",
            "lewa_cala" :"sumo/lewa_cala.txt",
            "prawa_pol2":"sumo/prawa_pol_2.txt",
            "prawa_pol1":"sumo/prawa_pol1.txt",
            "demo":"sumo/demo.txt",
            "demo2":"sumo/demo2.txt"
    }

    @staticmethod
    def find_angles(line):
        angles = re.findall('\d+', line)
        angles = list(map(int, angles))
        #print(angles)
        # return angles[1:20] - tak musi być :(
        return angles  # tak nie musi być

    @staticmethod
    def find_leg(line):
        for letter in ['B', 'L', 'R']:
            if letter in line:
                return letter

    def set_action(self, action_name):
        self.name = action_name
        file_name = self.nazwy[action_name]
        self.f = open(file_name)
        first_line = self.f.readline()
        number = re.search('\d+', first_line)
        self.number = int(number.group(0))
        # dodać obsługiwanie wyjątków?

    @staticmethod
    def difference(vector1, vector2):
        r = [0]*20
        for i in range(1, len(vector1)):
            r[i] = vector2[i] - vector1[i]
        return max(r)

    def stabilize(self, angles, servos):
        rmin = 5  # ????????????????????
        current_angles = servos.odczyt_poz()
        r = self.difference(current_angles, angles)  # lepiej największa różnica
        if r >= rmin:
            servos.przejscie(angles, 0.06 * (r/rmin))
            time.sleep(0.001)
        else:
            servos.przejscie(angles, 0.5)
            time.sleep(0.001)


    def play_action(self, action_name, connection):
        print ("started action " + action_name)



        self.set_action(action_name)
        matrix=[]                           # taka sobie wielka macierz, najpierw odczytjemy z pliku do niej
                                            # a potem z niej wysyłamy do serw ,podobno szybciej

        legs=[]                             # jeszcze taki wektorek do przechowywania informacji, na której nodze stoi Melson

        for i in range(self.number):
            line= self.f.readline()
            angles = self.find_angles(line)
            legs.append(self.find_leg(line))
            matrix.append(angles)

        self.leg = legs[0]
        self.stabilize(matrix[0], connection.servos)

        #connection.servos.przejscie(angles, 1)
        step = 0.01
        miedzyczasy = []
        for i in range(self.number - 1):
            a = time.time()
            if (legs[i] != self.leg):
                connection.servos.setSlope(legs[i])
                self.leg = legs[i]
            connection.servos.send_pos(matrix[i])
            while(time.time() - a < step):
                pass
            miedzyczasy.append(time.time()-a)
        #print(miedzyczasy)
        print ("finished action " + action_name)




    # def play_action(self, action_name, connection):
    #     a = time.time()
    #     self.set_action(action_name)
    #     line = self.f.readline()
    #     angles = self.find_angles(line)
    #     leg = self.find_leg(line)
    #     self.leg = leg
    #     self.stabilize(angles, connection.servos)
    #     #connection.servos.przejscie(angles, 1)
    #     for i in range(self.number - 1):
    #         b = time.time()
    #         c = b - a
    #         step = 0.01
    #
    #         while(c < step):
    #             #time.sleep(0.0001)
    #             b = time.time()
    #             c = b - a
    #         a = time.time()
    #         line = self.f.readline()
    #         angles = self.find_angles(line)
    #         leg = self.find_leg(line)
    #         if(leg!=self.leg):
    #             connection.servos.setSlope(leg)
    #             self.leg = leg
    #         connection.servos.send_pos(angles)

