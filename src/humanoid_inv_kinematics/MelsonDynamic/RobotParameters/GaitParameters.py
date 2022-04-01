#def LoadGaitParameters():

NumberOfTimeInstances = 1800
TimeInterval = 10  # time interval in between simulation time intervals [ms]
StepPelvisHeight = 170+28 # default 0.237 [mm]
NumOfStepsLeftLeg = 3
NumOfStepsRightLeg = 4
StepHeight = 20+28 # [mm]

# Gait cycle percentage participation, sum must equal 1

PARAM_DS = 0.3 # Double Support phase - times two for whole cycle (2 steps)
PARAM_SS = 0.5 - PARAM_DS # Single Support phase - times two for whole cycle (2 steps)

offset = 0

#   return NumberOfTimeInstances, TimeInterval, StepPelvisHeight, NumOfStepsLeftLeg, NumOfStepsRightLeg, StepHeight,\
#          PARAM_DS, PARAM_SS, offset