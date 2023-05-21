# This part of the repository contains code for the trajectory generation and inverse kinematics for __Melson__ and __Melman__ robots.

## Code is currently in the process of rewriting in Python from old code written in Matlab.

## Why?
To move robot you need to rotate motors to the right angles with certain speed so the movement seems smooth. To do that inverse kinematic equasions are first written and than solved inside code.

## How does it work?
Robot position is set, than inverse kinematics equations are solved and the result of that is converted to set of angle positions of motors in discrete time samples.

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

## Construction:
Code is divided into 3 sections:
  - Trajectory generation (for now only walking is straight path) 
  - Inverse Kinematics 
  - Robots parameters

There are also few subscripts\functions that are used for elements below, that are self-explanatory.

### Trajectory generation (can be used for both robots)
 - `GaitParameters.py` - parameters for walking in straight line
 -  `GaitStepPlanner.py` - script that generates feet trajectories 
 -  `solveCom.py` - script that generates trajectory for robot's center of mass (CoM) from feet trajectory
 -  `GenerateHandsTrajectory.py` - script that generates hands trajectory from feet and CoM trajectories

### Inverse Kinematics (where 'X' represents Melson or Melman)
- `Jacobian_X_generator.py` - function that generates Jacobian matrix based on robot's current internal state
- `Forward_kinematics_X.py` - function that generates forward kinematics vector based on robot's current internal state
- `CLIK_X.py` - function that solves one iteration of redundant inverse kinematics problem using damped pseudoinverse Jacobian method
- `main_X.py` - script that is currently used to generate internal state for every time step for straight walking. 

### Robots parameters (where 'X' represents Melson or Melman)
- `X_parameters.py` - script that holds information about physical state of a robot properties (mass, dimensions etc.)

 
