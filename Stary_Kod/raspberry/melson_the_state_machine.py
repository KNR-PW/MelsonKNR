from readtxt import Readtxt
from communication import Connections
from time import sleep
import pygame
import time
# pygame jest potrzebny do sterowania zdalnego
import sys
from math import ceil


class RobotState:
    def run(self, machine, comm):
        raise NotImplementedError


class Sumo(RobotState):
    def __init__(self):
        self.text = Readtxt()
        self.last_seen = 1
        self.hits = 0
        self.start = True

    def run(self, machine, comm):
        print("running sumo")
        if self.start:
            machine.wstan()
            time.sleep(3.5)
            self.start = False
            self.text.play_action("sprint_prawo90", comm)
        distance = comm.distance
        distance.update_sensors()
        servos = comm.servos
        if distance.F < 45:
            self.last_seen = 3
            print("przod: " + str(distance.F))
            if distance.F < 20:
                if self.hits > 6 and distance.F > 10:
                    self.text.play_action("sumo_przod", comm)
                    self.hits = 0                
                else:
                    print("atakuję!!!!!!!!")
                    self.text.play_action("sumo_atak", comm)
                    self.hits = self.hits + 1
            else:
                self.text.play_action("sumo_przod", comm)
                self.hits = 0
        elif distance.R < 38:
            self.last_seen = 1
            self.text.play_action("sumo_prawo15", comm)
            self.hits = 0
        elif distance.L < 37:
            self.last_seen = 2
            self.text.play_action("sumo_lewo15", comm)
            self.hits = 0
        else:
            if self.last_seen == 1:
                self.text.play_action("sumo_prawo15", comm)
            elif self.last_seen == 2:
                self.text.play_action("sumo_lewo15", comm)
            elif self.last_seen == 3:
                self.text.play_action("sumo_przod2", comm)
            
            self.hits = 0


class Sprint(RobotState):
    def __init__(self):
        self.text = Readtxt()
        self.avoid = False
        self.obst = 0
        self.lewa = True
        self.start = True


    def run(self, machine, comm):
        if self.start:
            self.text.play_action("prawa_pol1", comm)
            self.text.play_action("lewa_cala", comm)
            self.start = False
        comm.distance.update_sensors()
        if comm.distance.R < 20:    
            self.text.play_action("prawa_pol2", comm)
            self.text.play_action("sprint_lewo15", comm)
            self.text.play_action("prawa_pol1", comm)
            self.text.play_action("lewa_cala", comm)
        elif comm.distance.L < 20:
            self.text.play_action("prawa_pol2", comm)
            self.text.play_action("sprint_prawo15", comm)
            self.text.play_action("prawa_pol1", comm)
            self.text.play_action("lewa_cala", comm)
        else:
            self.text.play_action("prawa_cala", comm)
            self.text.play_action("lewa_cala", comm)




class Test(RobotState):
    def __init__(self):
        self.text = Readtxt()

    def run(self, machine, comm):
        self.text.play_action("demo", comm)
        machine.state = Waiting()

class Test_2(RobotState):
    def __init__(self):
        self.text = Readtxt()

    def run(self, machine, comm):
        self.text.play_action("demo2", comm)
        machine.state = Waiting()


class Stairs(RobotState):
    def __init__(self):
        self.text = Readtxt()
        self.first = False

    def run(self, machine, comm):
        comm.servos.wstawanie()
        self.text.play_action("schodek", comm)
        self.text.play_action("przod10", comm)
        #self.text.play_action("przod10", comm)
        #self.text.play_action("sumo_przod2", comm)
        self.text.play_action("schody_przod", comm)
        if comm.buttons.get_mode():
            return True
        self.text.play_action("schodek", comm)
        if comm.buttons.get_mode():
            return True
        self.text.play_action("przod10", comm)
        if comm.buttons.get_mode():
            return True
        self.text.play_action("schody_przod", comm)
        if comm.buttons.get_mode():
            return True
        self.text.play_action("schodek", comm)
        if comm.buttons.get_mode():
            return True
        self.text.play_action("przod10", comm)
        if comm.buttons.get_mode():
            return True
        self.text.play_action("schody_przod", comm)
        if comm.buttons.get_mode():
            return True
        machine.state = Waiting()

    def run2(self, machine, comm):
        self.text.play_action("schodek", comm)
        time.sleep(5)


# dodać stan Waiting (dla klawisza) i przejście ze stanów!!!!!!!!!!!!


class Zdalny(RobotState):
    def __init__(self):
        self.text = Readtxt()
        self.screen = pygame.display.set_mode((800, 600))
        # flaga pozwalajaca utrzymac pygame
        self.on = True

    def run(self, machine, comm):
        while self.on:
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    self.on = False
                if event.type == pygame.KEYDOWN and event.key == pygame.K_ESCAPE:
                    self.on = False
                elif event.type == pygame.KEYDOWN:
                    if event.key == pygame.K_w:
                        self.text.play_action("sumo_przod", comm)
                    elif event.key == pygame.K_s:
                        self.text.play_action("sumo_tyl", comm)
                    elif event.key == pygame.K_d:
                        self.text.play_action("sumo_prawo15", comm)
                    elif event.key == pygame.K_a:
                        self.text.play_action("sumo_lewo15", comm)
                    elif event.key == pygame.K_SPACE:
                        self.text.play_action("sumo_atak", comm)
                    elif event.key == pygame.K_p:
                        self.text.play_action('sumo_kopl', comm)


class Waiting(RobotState):
    def __init__(self):
        self.text = Readtxt()

    def run(self, machine, comm):
        state = comm.buttons.choose_mode()
        machine.set_state(state)


class RobotMachine:  # dodać obsługiwanie servos.set_start(angeles, leg?)
    def __init__(self, comm, init_state=Waiting()):
        self.comm = comm
        self.state = init_state



    def work(self):
        self.state.run(self, self.comm)

    def wstan(self):
        self.comm.servos.wstawanie()

    def set_state(self, state):
        mode = Waiting()
        print(state)
        #self.wstan()
        #time.sleep(1)
        if state == 'sprint':
            mode = Sprint()
        if state == 'battle':
            mode = Sumo()
        if state == 'remote':
            mode = Test_2()
        if state == 'stairs':
            mode = Test()
        self.state = mode

    # def zdal(self):
    #     self.state = Zdalny()
    #     self.state.run(self, self.comm)
