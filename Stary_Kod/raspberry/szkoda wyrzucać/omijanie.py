   def run6(self, machine, comm):
        comm.distance.update_sensors()
        if comm.distance.R < 12:    # get_sensors powinno zwracać zbiekt z trzema wartościami założyłem nazwy R, L, F
            self.text.play_action("sprint_lewo15", comm)
            self.text.play_action("sumo_przod", comm)

        elif comm.distance.L < 12:
            self.text.play_action("sprint_prawo15", comm)
            self.text.play_action("sumo_przod", comm)
        else:
            if self.avoid:
                if self.kierunek == 0:  # lewo
                    if comm.distance.R > 44:
                        self.text.play_action("sumo_przod2", comm)
                        self.text.play_action("sumo_przod2", comm)
                        self.text.play_action("sumo_przod2", comm)
                        self.text.play_action("sumo_przod2", comm)
                        self.text.play_action("sprint_prawo90", comm)
                        self.avoid = False
                    else:
                        self.text.play_action("sumo_przod2", comm)
                else:
                    if comm.distance.L > 44:
                        self.text.play_action("sumo_przod2", comm)
                        self.text.play_action("sumo_przod2", comm)
                        self.text.play_action("sumo_przod2", comm)
                        self.text.play_action("sumo_przod2", comm)
                        self.text.play_action("sprint_lewo90", comm)
                        self.avoid = False
                    else:
                        self.text.play_action("sumo_przod2", comm)
            else:
                if comm.distance.F <= 23:
                    if self.obst > 0:
                        self.kierunek = 1
                        self.text.play_action("sprint_prawo90", comm)
                    else:
                        self.kierunek = 0
                        self.text.play_action("sprint_lewo90", comm)
                    self.avoid = True
                    self.obst = self.obst + 1
                else:
                    self.text.play_action("sumo_przod2", comm)

    def run1(self, machine, comm):
        comm.distance.update_sensors()
        if comm.distance.R < 12:    # get_sensors powinno zwracać zbiekt z trzema wartościami założyłem nazwy R, L, F
            self.text.play_action("sprint_lewo15", comm)
            self.text.play_action("sumo_przod", comm)
        elif comm.distance.L < 12:
            self.text.play_action("sprint_prawo15", comm)
            self.text.play_action("sumo_przod", comm)
        else:
            if self.avoid:
                if self.kierunek == 0:  # lewo
                    if comm.distance.F <= 20:
                        self.text.play_action("sumo_przod2", comm)
                        self.text.play_action("sprint_prawo90", comm)
                        self.avoid = False
                    else:
                        self.text.play_action("sumo_przod2", comm)
                else:
                    if comm.distance.F <= 20:
                        self.text.play_action("sumo_przod2", comm)
                        self.text.play_action("sprint_lewo90", comm)
                        self.avoid = False
                    else:
                        self.text.play_action("sumo_przod2", comm)
            else:
                if comm.distance.F <= 20:
                    if comm.distance.R >= comm.distance.L:
                        self.kierunek = 1
                        self.text.play_action("sprint_prawo90", comm)
                    else:
                        self.kierunek = 0
                        self.text.play_action("sprint_lewo90", comm)
                    self.avoid = True
                else:
                    self.text.play_action("sumo_przod2", comm)


    def run100(self, machine, comm):
        self.text.play_action("prawa_pol1", comm)
        for i in range(1):
            self.text.play_action("lewa_cala", comm)
            self.text.play_action("prawa_cala", comm)
        self.text.play_action("lewa_cala", comm)
        self.text.play_action("prawa_pol2", comm)
        #self.text.play_action("sprint_lewo15", comm)
        self.text.play_action("sprint_lewo90", comm)

        self.text.play_action("prawa_pol1", comm)
        for i in range(4):
            self.text.play_action("lewa_cala", comm)
            self.text.play_action("prawa_cala", comm)
        self.text.play_action("lewa_cala", comm)
        self.text.play_action("prawa_pol2", comm)

        self.text.play_action("sprint_prawo90", comm)

        self.text.play_action("prawa_pol1", comm)
        for i in range(13):
            self.text.play_action("lewa_cala", comm)
            self.text.play_action("prawa_cala", comm)
        self.text.play_action("lewa_cala", comm)
        self.text.play_action("prawa_pol2", comm)

        self.text.play_action("sprint_prawo15", comm)
        self.text.play_action("sprint_prawo15", comm)
        self.text.play_action("sprint_prawo15", comm)

        self.text.play_action("prawa_pol1", comm)
        for i in range(7):
            self.text.play_action("lewa_cala", comm)
            self.text.play_action("prawa_cala", comm)
        self.text.play_action("lewa_cala", comm)
        self.text.play_action("prawa_pol2", comm)

        self.text.play_action("sprint_lewo90", comm)

        self.text.play_action("prawa_pol1", comm)
        for i in range(8):
            self.text.play_action("lewa_cala", comm)
            self.text.play_action("prawa_cala", comm)
        self.text.play_action("lewa_cala", comm)
        self.text.play_action("prawa_pol2", comm)


    
