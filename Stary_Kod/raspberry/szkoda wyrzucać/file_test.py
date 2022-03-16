import os
import re


class Txtest:
    def __init__(self):
        pass

    def assign_file(self, filename):
        self.f = open(filename)

    def close_file(self):
        self.f.close()

    def print_line(self):
        line = self.f.readline()
        angles = re.findall('\d+', line)
        angles = list(map(int, angles))
        print(angles[1:20])


tekst = Txtest()
tekst.assign_file("krok_przod_6s.txt")
tekst.f.readline()
for i in range(5):
    tekst.print_line()

tekst.close_file()
