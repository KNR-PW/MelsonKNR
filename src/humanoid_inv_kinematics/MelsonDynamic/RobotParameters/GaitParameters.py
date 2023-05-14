#def LoadGaitParameters():

NumberOfTimeInstances = 1200
TimeInterval = 10  # time interval in between simulation time intervals [ms]
#StepPelvisHeight = 170+28 # default 0.237 [mm]

StepPelvisHeight = 190
NumOfStepsLeftLeg = 3
NumOfStepsRightLeg = 4
# StepHeight = 20+28 # [mm] TODO komentarz do testów z matlabem
StepHeight = 75
# Gait cycle percentage participation, sum must equal 1

#PARAM_DS = 0.3 # Double Support phase - times two for whole cycle (2 steps)
#PARAM_SS = 0.5 - PARAM_DS # Single Support phase - times two for whole cycle (2 steps)
#TODO komentarz do testow z matlabem

PARAM_DS = 0.25
PARAM_SS = 0.25

offset = 0

#   return NumberOfTimeInstances, TimeInterval, StepPelvisHeight, NumOfStepsLeftLeg, NumOfStepsRightLeg, StepHeight,\
#          PARAM_DS, PARAM_SS, offset