# This part of the repository contains code for the inverse kinematics for __Melson__ robot.

## Code is currently in the process of rewriting in Python from old code written in Matlab.

## Why?
To move robot you need to rotate motors to the right angles with certain speed so the movement seems smooth. To do that inverse kinematic equasions are first written and than solved inside code.

## How does it work?
Robot position is set, than inverse kinematics equasions are solved and the result of that is converted to set of angle positions of motors in discrete time samples.

Basic implementation contains taking a few steps, but there are possibilities for more advanced moves. Some of them are implemented in Matlab code.


## TODO 
- Put the code together
- Test Python and Matlab versions and compare them
- Refactoring code:
    - Unified naming convention
    - Writting code to use classes
    - Optimizing code to work faster

## Future plans
- Solving knematics equasions could be done "_on-line_" insted of "_off-line_", meaning robot seek solutions and adapt while running
- Modifing code to work for __Melman__ robot
