import re


class Readtxt:

    # Na jeden krok zawsze jest ten sam czas?
    nazwy = {
        "start": "0:/test/start_pos.txt",
        "wstan": "0:/test/wstan.txt",
        "przod48": "0:/sprint/przod_48.txt",
        "przod": "0:/sumo/krok_przod.txt",
        "tyl": "0:/sumo/krok_tyl.txt",
        "przod2": "0:/sumo/dwa_kroki_przod.txt",
        "tyl2": "0: / sumo/dwa_kroki_tyl.txt",
        "prawo": "0:/sumo/krok_prawo.txt",
        "lewo": "0:/sumo/krok_lewo.txt",
        "prawo15": "0:/sumo/obrot_p_15.txt",
        "lewo15": "0:/sumo/obrot_l_15.txt",
        "prawo30": "0:/sumo/obrot_p_30.txt",
        "lewo30": "0:/sumo/obrot_l_30.txt",
        "prawo45": "0:/sumo/obrot_p_45.txt",
        "lewo45": "0:/sumo/obrot_l_45.txt",
        "prawo60": "0:/sumo/obrot_p_60.txt",
        "lewo60": "0:/sumo/obrot_l_60.txt",
        "prawo90": "0:/sumo/obrot_p_90.txt",
        "lewo90": "0:/sumo/obrot_l_90.txt",
        "prawo120": "0:/sumo/obrot_p_120.txt",
        "lewo120": "0:/sumo/obrot_l_120.txt",
        "prawo_kop": "0:/sumo/kop_prawa.txt",
        "lewo_kop": "0:/sumo/kop_lewa.txt",
        "atak": "0:/sumo/atak.txt",  # co to jest 0_o
        "prawo135": "0:/sumo/obrot_p_135.txt",
        "przod24": "0:/sprint/przod_24.txt"
    }

    def __init__(self):
        self.number = 0
        self.step = 0

    def get_angles(self, next_step):  # dodać obsługę f == None JAK?
        if next_step:
            if self.step < self.number:
                next_line()

        angles = re.findall('\d+', self.line)
        angles = list(map(int, angles))
        return angles

    def get_leg(self, next_step):
        if next_step:
            if step < self.number - 1:
                next_line()

        for letter in ['B', 'L', 'R']:
            if letter in self.line:
                return letter

    def next_line(self):
        self.line = self.f.readline()
        self.step += 1

    def set_action(self, action_name):
        self.name = action_name
        file_name = nazwy[action_name]
        self.f = open(file_name)
        first_line = self.f.readline()
        number = re.search('\d+', first_line)
        self.number = int(number.group(0))
        self.step = 0
        # next_line()

    def get_angles_for_action(self, action_name):
        if not(action_name == self.name):
            set_action(action_name)
        return get_angles(True)

    def get_leg_for_action(self, action_name):
        if not(action_name == self.name):
            set_action(action_name)
        return get_leg(True)

    def end(self):
        return self.step >= self.number
