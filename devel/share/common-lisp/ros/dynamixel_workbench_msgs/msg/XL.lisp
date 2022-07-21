; Auto-generated. Do not edit!


(cl:in-package dynamixel_workbench_msgs-msg)


;//! \htmlinclude XL.msg.html

(cl:defclass <XL> (roslisp-msg-protocol:ros-message)
  ((Model_Number
    :reader Model_Number
    :initarg :Model_Number
    :type cl:fixnum
    :initform 0)
   (Firmware_Version
    :reader Firmware_Version
    :initarg :Firmware_Version
    :type cl:fixnum
    :initform 0)
   (ID
    :reader ID
    :initarg :ID
    :type cl:fixnum
    :initform 0)
   (Baud_Rate
    :reader Baud_Rate
    :initarg :Baud_Rate
    :type cl:fixnum
    :initform 0)
   (Return_Delay_Time
    :reader Return_Delay_Time
    :initarg :Return_Delay_Time
    :type cl:fixnum
    :initform 0)
   (Drive_Mode
    :reader Drive_Mode
    :initarg :Drive_Mode
    :type cl:fixnum
    :initform 0)
   (Operating_Mode
    :reader Operating_Mode
    :initarg :Operating_Mode
    :type cl:fixnum
    :initform 0)
   (Secondary_ID
    :reader Secondary_ID
    :initarg :Secondary_ID
    :type cl:fixnum
    :initform 0)
   (Protocol_Version
    :reader Protocol_Version
    :initarg :Protocol_Version
    :type cl:fixnum
    :initform 0)
   (Homing_Offset
    :reader Homing_Offset
    :initarg :Homing_Offset
    :type cl:integer
    :initform 0)
   (Moving_Threshold
    :reader Moving_Threshold
    :initarg :Moving_Threshold
    :type cl:integer
    :initform 0)
   (Temperature_Limit
    :reader Temperature_Limit
    :initarg :Temperature_Limit
    :type cl:fixnum
    :initform 0)
   (Max_Voltage_Limit
    :reader Max_Voltage_Limit
    :initarg :Max_Voltage_Limit
    :type cl:fixnum
    :initform 0)
   (Min_Voltage_Limit
    :reader Min_Voltage_Limit
    :initarg :Min_Voltage_Limit
    :type cl:fixnum
    :initform 0)
   (PWM_Limit
    :reader PWM_Limit
    :initarg :PWM_Limit
    :type cl:fixnum
    :initform 0)
   (Acceleration_Limit
    :reader Acceleration_Limit
    :initarg :Acceleration_Limit
    :type cl:integer
    :initform 0)
   (Velocity_Limit
    :reader Velocity_Limit
    :initarg :Velocity_Limit
    :type cl:integer
    :initform 0)
   (Max_Position_Limit
    :reader Max_Position_Limit
    :initarg :Max_Position_Limit
    :type cl:integer
    :initform 0)
   (Min_Position_Limit
    :reader Min_Position_Limit
    :initarg :Min_Position_Limit
    :type cl:integer
    :initform 0)
   (Shutdown
    :reader Shutdown
    :initarg :Shutdown
    :type cl:fixnum
    :initform 0)
   (Torque_Enable
    :reader Torque_Enable
    :initarg :Torque_Enable
    :type cl:fixnum
    :initform 0)
   (LED
    :reader LED
    :initarg :LED
    :type cl:fixnum
    :initform 0)
   (Status_Return_Level
    :reader Status_Return_Level
    :initarg :Status_Return_Level
    :type cl:fixnum
    :initform 0)
   (Registered_Instruction
    :reader Registered_Instruction
    :initarg :Registered_Instruction
    :type cl:fixnum
    :initform 0)
   (Hardware_Error_Status
    :reader Hardware_Error_Status
    :initarg :Hardware_Error_Status
    :type cl:fixnum
    :initform 0)
   (Velocity_I_Gain
    :reader Velocity_I_Gain
    :initarg :Velocity_I_Gain
    :type cl:fixnum
    :initform 0)
   (Velocity_P_Gain
    :reader Velocity_P_Gain
    :initarg :Velocity_P_Gain
    :type cl:fixnum
    :initform 0)
   (Position_D_Gain
    :reader Position_D_Gain
    :initarg :Position_D_Gain
    :type cl:fixnum
    :initform 0)
   (Position_I_Gain
    :reader Position_I_Gain
    :initarg :Position_I_Gain
    :type cl:fixnum
    :initform 0)
   (Position_P_Gain
    :reader Position_P_Gain
    :initarg :Position_P_Gain
    :type cl:fixnum
    :initform 0)
   (Feedforward_2nd_Gain
    :reader Feedforward_2nd_Gain
    :initarg :Feedforward_2nd_Gain
    :type cl:fixnum
    :initform 0)
   (Feedforward_1st_Gain
    :reader Feedforward_1st_Gain
    :initarg :Feedforward_1st_Gain
    :type cl:fixnum
    :initform 0)
   (Bus_Watchdog
    :reader Bus_Watchdog
    :initarg :Bus_Watchdog
    :type cl:fixnum
    :initform 0)
   (Goal_PWM
    :reader Goal_PWM
    :initarg :Goal_PWM
    :type cl:fixnum
    :initform 0)
   (Goal_Velocity
    :reader Goal_Velocity
    :initarg :Goal_Velocity
    :type cl:integer
    :initform 0)
   (Profile_Acceleration
    :reader Profile_Acceleration
    :initarg :Profile_Acceleration
    :type cl:integer
    :initform 0)
   (Profile_Velocity
    :reader Profile_Velocity
    :initarg :Profile_Velocity
    :type cl:integer
    :initform 0)
   (Goal_Position
    :reader Goal_Position
    :initarg :Goal_Position
    :type cl:integer
    :initform 0)
   (Realtime_Tick
    :reader Realtime_Tick
    :initarg :Realtime_Tick
    :type cl:fixnum
    :initform 0)
   (Moving
    :reader Moving
    :initarg :Moving
    :type cl:fixnum
    :initform 0)
   (Moving_Status
    :reader Moving_Status
    :initarg :Moving_Status
    :type cl:fixnum
    :initform 0)
   (Present_PWM
    :reader Present_PWM
    :initarg :Present_PWM
    :type cl:fixnum
    :initform 0)
   (Present_Load
    :reader Present_Load
    :initarg :Present_Load
    :type cl:fixnum
    :initform 0)
   (Present_Velocity
    :reader Present_Velocity
    :initarg :Present_Velocity
    :type cl:integer
    :initform 0)
   (Present_Position
    :reader Present_Position
    :initarg :Present_Position
    :type cl:integer
    :initform 0)
   (Velocity_Trajectory
    :reader Velocity_Trajectory
    :initarg :Velocity_Trajectory
    :type cl:integer
    :initform 0)
   (Position_Trajectory
    :reader Position_Trajectory
    :initarg :Position_Trajectory
    :type cl:integer
    :initform 0)
   (Present_Input_Voltage
    :reader Present_Input_Voltage
    :initarg :Present_Input_Voltage
    :type cl:fixnum
    :initform 0)
   (Present_Temperature
    :reader Present_Temperature
    :initarg :Present_Temperature
    :type cl:fixnum
    :initform 0))
)

(cl:defclass XL (<XL>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <XL>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'XL)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dynamixel_workbench_msgs-msg:<XL> is deprecated: use dynamixel_workbench_msgs-msg:XL instead.")))

(cl:ensure-generic-function 'Model_Number-val :lambda-list '(m))
(cl:defmethod Model_Number-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Model_Number-val is deprecated.  Use dynamixel_workbench_msgs-msg:Model_Number instead.")
  (Model_Number m))

(cl:ensure-generic-function 'Firmware_Version-val :lambda-list '(m))
(cl:defmethod Firmware_Version-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Firmware_Version-val is deprecated.  Use dynamixel_workbench_msgs-msg:Firmware_Version instead.")
  (Firmware_Version m))

(cl:ensure-generic-function 'ID-val :lambda-list '(m))
(cl:defmethod ID-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:ID-val is deprecated.  Use dynamixel_workbench_msgs-msg:ID instead.")
  (ID m))

(cl:ensure-generic-function 'Baud_Rate-val :lambda-list '(m))
(cl:defmethod Baud_Rate-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Baud_Rate-val is deprecated.  Use dynamixel_workbench_msgs-msg:Baud_Rate instead.")
  (Baud_Rate m))

(cl:ensure-generic-function 'Return_Delay_Time-val :lambda-list '(m))
(cl:defmethod Return_Delay_Time-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Return_Delay_Time-val is deprecated.  Use dynamixel_workbench_msgs-msg:Return_Delay_Time instead.")
  (Return_Delay_Time m))

(cl:ensure-generic-function 'Drive_Mode-val :lambda-list '(m))
(cl:defmethod Drive_Mode-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Drive_Mode-val is deprecated.  Use dynamixel_workbench_msgs-msg:Drive_Mode instead.")
  (Drive_Mode m))

(cl:ensure-generic-function 'Operating_Mode-val :lambda-list '(m))
(cl:defmethod Operating_Mode-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Operating_Mode-val is deprecated.  Use dynamixel_workbench_msgs-msg:Operating_Mode instead.")
  (Operating_Mode m))

(cl:ensure-generic-function 'Secondary_ID-val :lambda-list '(m))
(cl:defmethod Secondary_ID-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Secondary_ID-val is deprecated.  Use dynamixel_workbench_msgs-msg:Secondary_ID instead.")
  (Secondary_ID m))

(cl:ensure-generic-function 'Protocol_Version-val :lambda-list '(m))
(cl:defmethod Protocol_Version-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Protocol_Version-val is deprecated.  Use dynamixel_workbench_msgs-msg:Protocol_Version instead.")
  (Protocol_Version m))

(cl:ensure-generic-function 'Homing_Offset-val :lambda-list '(m))
(cl:defmethod Homing_Offset-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Homing_Offset-val is deprecated.  Use dynamixel_workbench_msgs-msg:Homing_Offset instead.")
  (Homing_Offset m))

(cl:ensure-generic-function 'Moving_Threshold-val :lambda-list '(m))
(cl:defmethod Moving_Threshold-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Moving_Threshold-val is deprecated.  Use dynamixel_workbench_msgs-msg:Moving_Threshold instead.")
  (Moving_Threshold m))

(cl:ensure-generic-function 'Temperature_Limit-val :lambda-list '(m))
(cl:defmethod Temperature_Limit-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Temperature_Limit-val is deprecated.  Use dynamixel_workbench_msgs-msg:Temperature_Limit instead.")
  (Temperature_Limit m))

(cl:ensure-generic-function 'Max_Voltage_Limit-val :lambda-list '(m))
(cl:defmethod Max_Voltage_Limit-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Max_Voltage_Limit-val is deprecated.  Use dynamixel_workbench_msgs-msg:Max_Voltage_Limit instead.")
  (Max_Voltage_Limit m))

(cl:ensure-generic-function 'Min_Voltage_Limit-val :lambda-list '(m))
(cl:defmethod Min_Voltage_Limit-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Min_Voltage_Limit-val is deprecated.  Use dynamixel_workbench_msgs-msg:Min_Voltage_Limit instead.")
  (Min_Voltage_Limit m))

(cl:ensure-generic-function 'PWM_Limit-val :lambda-list '(m))
(cl:defmethod PWM_Limit-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:PWM_Limit-val is deprecated.  Use dynamixel_workbench_msgs-msg:PWM_Limit instead.")
  (PWM_Limit m))

(cl:ensure-generic-function 'Acceleration_Limit-val :lambda-list '(m))
(cl:defmethod Acceleration_Limit-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Acceleration_Limit-val is deprecated.  Use dynamixel_workbench_msgs-msg:Acceleration_Limit instead.")
  (Acceleration_Limit m))

(cl:ensure-generic-function 'Velocity_Limit-val :lambda-list '(m))
(cl:defmethod Velocity_Limit-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Velocity_Limit-val is deprecated.  Use dynamixel_workbench_msgs-msg:Velocity_Limit instead.")
  (Velocity_Limit m))

(cl:ensure-generic-function 'Max_Position_Limit-val :lambda-list '(m))
(cl:defmethod Max_Position_Limit-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Max_Position_Limit-val is deprecated.  Use dynamixel_workbench_msgs-msg:Max_Position_Limit instead.")
  (Max_Position_Limit m))

(cl:ensure-generic-function 'Min_Position_Limit-val :lambda-list '(m))
(cl:defmethod Min_Position_Limit-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Min_Position_Limit-val is deprecated.  Use dynamixel_workbench_msgs-msg:Min_Position_Limit instead.")
  (Min_Position_Limit m))

(cl:ensure-generic-function 'Shutdown-val :lambda-list '(m))
(cl:defmethod Shutdown-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Shutdown-val is deprecated.  Use dynamixel_workbench_msgs-msg:Shutdown instead.")
  (Shutdown m))

(cl:ensure-generic-function 'Torque_Enable-val :lambda-list '(m))
(cl:defmethod Torque_Enable-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Torque_Enable-val is deprecated.  Use dynamixel_workbench_msgs-msg:Torque_Enable instead.")
  (Torque_Enable m))

(cl:ensure-generic-function 'LED-val :lambda-list '(m))
(cl:defmethod LED-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:LED-val is deprecated.  Use dynamixel_workbench_msgs-msg:LED instead.")
  (LED m))

(cl:ensure-generic-function 'Status_Return_Level-val :lambda-list '(m))
(cl:defmethod Status_Return_Level-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Status_Return_Level-val is deprecated.  Use dynamixel_workbench_msgs-msg:Status_Return_Level instead.")
  (Status_Return_Level m))

(cl:ensure-generic-function 'Registered_Instruction-val :lambda-list '(m))
(cl:defmethod Registered_Instruction-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Registered_Instruction-val is deprecated.  Use dynamixel_workbench_msgs-msg:Registered_Instruction instead.")
  (Registered_Instruction m))

(cl:ensure-generic-function 'Hardware_Error_Status-val :lambda-list '(m))
(cl:defmethod Hardware_Error_Status-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Hardware_Error_Status-val is deprecated.  Use dynamixel_workbench_msgs-msg:Hardware_Error_Status instead.")
  (Hardware_Error_Status m))

(cl:ensure-generic-function 'Velocity_I_Gain-val :lambda-list '(m))
(cl:defmethod Velocity_I_Gain-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Velocity_I_Gain-val is deprecated.  Use dynamixel_workbench_msgs-msg:Velocity_I_Gain instead.")
  (Velocity_I_Gain m))

(cl:ensure-generic-function 'Velocity_P_Gain-val :lambda-list '(m))
(cl:defmethod Velocity_P_Gain-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Velocity_P_Gain-val is deprecated.  Use dynamixel_workbench_msgs-msg:Velocity_P_Gain instead.")
  (Velocity_P_Gain m))

(cl:ensure-generic-function 'Position_D_Gain-val :lambda-list '(m))
(cl:defmethod Position_D_Gain-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Position_D_Gain-val is deprecated.  Use dynamixel_workbench_msgs-msg:Position_D_Gain instead.")
  (Position_D_Gain m))

(cl:ensure-generic-function 'Position_I_Gain-val :lambda-list '(m))
(cl:defmethod Position_I_Gain-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Position_I_Gain-val is deprecated.  Use dynamixel_workbench_msgs-msg:Position_I_Gain instead.")
  (Position_I_Gain m))

(cl:ensure-generic-function 'Position_P_Gain-val :lambda-list '(m))
(cl:defmethod Position_P_Gain-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Position_P_Gain-val is deprecated.  Use dynamixel_workbench_msgs-msg:Position_P_Gain instead.")
  (Position_P_Gain m))

(cl:ensure-generic-function 'Feedforward_2nd_Gain-val :lambda-list '(m))
(cl:defmethod Feedforward_2nd_Gain-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Feedforward_2nd_Gain-val is deprecated.  Use dynamixel_workbench_msgs-msg:Feedforward_2nd_Gain instead.")
  (Feedforward_2nd_Gain m))

(cl:ensure-generic-function 'Feedforward_1st_Gain-val :lambda-list '(m))
(cl:defmethod Feedforward_1st_Gain-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Feedforward_1st_Gain-val is deprecated.  Use dynamixel_workbench_msgs-msg:Feedforward_1st_Gain instead.")
  (Feedforward_1st_Gain m))

(cl:ensure-generic-function 'Bus_Watchdog-val :lambda-list '(m))
(cl:defmethod Bus_Watchdog-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Bus_Watchdog-val is deprecated.  Use dynamixel_workbench_msgs-msg:Bus_Watchdog instead.")
  (Bus_Watchdog m))

(cl:ensure-generic-function 'Goal_PWM-val :lambda-list '(m))
(cl:defmethod Goal_PWM-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Goal_PWM-val is deprecated.  Use dynamixel_workbench_msgs-msg:Goal_PWM instead.")
  (Goal_PWM m))

(cl:ensure-generic-function 'Goal_Velocity-val :lambda-list '(m))
(cl:defmethod Goal_Velocity-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Goal_Velocity-val is deprecated.  Use dynamixel_workbench_msgs-msg:Goal_Velocity instead.")
  (Goal_Velocity m))

(cl:ensure-generic-function 'Profile_Acceleration-val :lambda-list '(m))
(cl:defmethod Profile_Acceleration-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Profile_Acceleration-val is deprecated.  Use dynamixel_workbench_msgs-msg:Profile_Acceleration instead.")
  (Profile_Acceleration m))

(cl:ensure-generic-function 'Profile_Velocity-val :lambda-list '(m))
(cl:defmethod Profile_Velocity-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Profile_Velocity-val is deprecated.  Use dynamixel_workbench_msgs-msg:Profile_Velocity instead.")
  (Profile_Velocity m))

(cl:ensure-generic-function 'Goal_Position-val :lambda-list '(m))
(cl:defmethod Goal_Position-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Goal_Position-val is deprecated.  Use dynamixel_workbench_msgs-msg:Goal_Position instead.")
  (Goal_Position m))

(cl:ensure-generic-function 'Realtime_Tick-val :lambda-list '(m))
(cl:defmethod Realtime_Tick-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Realtime_Tick-val is deprecated.  Use dynamixel_workbench_msgs-msg:Realtime_Tick instead.")
  (Realtime_Tick m))

(cl:ensure-generic-function 'Moving-val :lambda-list '(m))
(cl:defmethod Moving-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Moving-val is deprecated.  Use dynamixel_workbench_msgs-msg:Moving instead.")
  (Moving m))

(cl:ensure-generic-function 'Moving_Status-val :lambda-list '(m))
(cl:defmethod Moving_Status-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Moving_Status-val is deprecated.  Use dynamixel_workbench_msgs-msg:Moving_Status instead.")
  (Moving_Status m))

(cl:ensure-generic-function 'Present_PWM-val :lambda-list '(m))
(cl:defmethod Present_PWM-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Present_PWM-val is deprecated.  Use dynamixel_workbench_msgs-msg:Present_PWM instead.")
  (Present_PWM m))

(cl:ensure-generic-function 'Present_Load-val :lambda-list '(m))
(cl:defmethod Present_Load-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Present_Load-val is deprecated.  Use dynamixel_workbench_msgs-msg:Present_Load instead.")
  (Present_Load m))

(cl:ensure-generic-function 'Present_Velocity-val :lambda-list '(m))
(cl:defmethod Present_Velocity-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Present_Velocity-val is deprecated.  Use dynamixel_workbench_msgs-msg:Present_Velocity instead.")
  (Present_Velocity m))

(cl:ensure-generic-function 'Present_Position-val :lambda-list '(m))
(cl:defmethod Present_Position-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Present_Position-val is deprecated.  Use dynamixel_workbench_msgs-msg:Present_Position instead.")
  (Present_Position m))

(cl:ensure-generic-function 'Velocity_Trajectory-val :lambda-list '(m))
(cl:defmethod Velocity_Trajectory-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Velocity_Trajectory-val is deprecated.  Use dynamixel_workbench_msgs-msg:Velocity_Trajectory instead.")
  (Velocity_Trajectory m))

(cl:ensure-generic-function 'Position_Trajectory-val :lambda-list '(m))
(cl:defmethod Position_Trajectory-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Position_Trajectory-val is deprecated.  Use dynamixel_workbench_msgs-msg:Position_Trajectory instead.")
  (Position_Trajectory m))

(cl:ensure-generic-function 'Present_Input_Voltage-val :lambda-list '(m))
(cl:defmethod Present_Input_Voltage-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Present_Input_Voltage-val is deprecated.  Use dynamixel_workbench_msgs-msg:Present_Input_Voltage instead.")
  (Present_Input_Voltage m))

(cl:ensure-generic-function 'Present_Temperature-val :lambda-list '(m))
(cl:defmethod Present_Temperature-val ((m <XL>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Present_Temperature-val is deprecated.  Use dynamixel_workbench_msgs-msg:Present_Temperature instead.")
  (Present_Temperature m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <XL>) ostream)
  "Serializes a message object of type '<XL>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Model_Number)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Model_Number)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Firmware_Version)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ID)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Baud_Rate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Return_Delay_Time)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Drive_Mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Operating_Mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Secondary_ID)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Protocol_Version)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'Homing_Offset)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Moving_Threshold)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Moving_Threshold)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'Moving_Threshold)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'Moving_Threshold)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Temperature_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Max_Voltage_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Max_Voltage_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Min_Voltage_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Min_Voltage_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'PWM_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'PWM_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Acceleration_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Acceleration_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'Acceleration_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'Acceleration_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Velocity_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Velocity_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'Velocity_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'Velocity_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Max_Position_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Max_Position_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'Max_Position_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'Max_Position_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Min_Position_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Min_Position_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'Min_Position_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'Min_Position_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Shutdown)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Torque_Enable)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LED)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Status_Return_Level)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Registered_Instruction)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Hardware_Error_Status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Velocity_I_Gain)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Velocity_I_Gain)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Velocity_P_Gain)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Velocity_P_Gain)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Position_D_Gain)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Position_D_Gain)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Position_I_Gain)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Position_I_Gain)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Position_P_Gain)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Position_P_Gain)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Feedforward_2nd_Gain)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Feedforward_2nd_Gain)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Feedforward_1st_Gain)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Feedforward_1st_Gain)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Bus_Watchdog)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'Goal_PWM)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'Goal_Velocity)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Profile_Acceleration)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Profile_Acceleration)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'Profile_Acceleration)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'Profile_Acceleration)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Profile_Velocity)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Profile_Velocity)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'Profile_Velocity)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'Profile_Velocity)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Goal_Position)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Goal_Position)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'Goal_Position)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'Goal_Position)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Realtime_Tick)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Realtime_Tick)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Moving)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Moving_Status)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'Present_PWM)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'Present_Load)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'Present_Velocity)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'Present_Position)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Velocity_Trajectory)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Velocity_Trajectory)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'Velocity_Trajectory)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'Velocity_Trajectory)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Position_Trajectory)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Position_Trajectory)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'Position_Trajectory)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'Position_Trajectory)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Present_Input_Voltage)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Present_Input_Voltage)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Present_Temperature)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <XL>) istream)
  "Deserializes a message object of type '<XL>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Model_Number)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Model_Number)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Firmware_Version)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ID)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Baud_Rate)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Return_Delay_Time)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Drive_Mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Operating_Mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Secondary_ID)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Protocol_Version)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Homing_Offset) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Moving_Threshold)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Moving_Threshold)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'Moving_Threshold)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'Moving_Threshold)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Temperature_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Max_Voltage_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Max_Voltage_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Min_Voltage_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Min_Voltage_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'PWM_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'PWM_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Acceleration_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Acceleration_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'Acceleration_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'Acceleration_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Velocity_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Velocity_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'Velocity_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'Velocity_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Max_Position_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Max_Position_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'Max_Position_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'Max_Position_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Min_Position_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Min_Position_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'Min_Position_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'Min_Position_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Shutdown)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Torque_Enable)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LED)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Status_Return_Level)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Registered_Instruction)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Hardware_Error_Status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Velocity_I_Gain)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Velocity_I_Gain)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Velocity_P_Gain)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Velocity_P_Gain)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Position_D_Gain)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Position_D_Gain)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Position_I_Gain)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Position_I_Gain)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Position_P_Gain)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Position_P_Gain)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Feedforward_2nd_Gain)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Feedforward_2nd_Gain)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Feedforward_1st_Gain)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Feedforward_1st_Gain)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Bus_Watchdog)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Goal_PWM) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Goal_Velocity) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Profile_Acceleration)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Profile_Acceleration)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'Profile_Acceleration)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'Profile_Acceleration)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Profile_Velocity)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Profile_Velocity)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'Profile_Velocity)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'Profile_Velocity)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Goal_Position)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Goal_Position)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'Goal_Position)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'Goal_Position)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Realtime_Tick)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Realtime_Tick)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Moving)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Moving_Status)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Present_PWM) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Present_Load) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Present_Velocity) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Present_Position) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Velocity_Trajectory)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Velocity_Trajectory)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'Velocity_Trajectory)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'Velocity_Trajectory)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Position_Trajectory)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Position_Trajectory)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'Position_Trajectory)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'Position_Trajectory)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Present_Input_Voltage)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Present_Input_Voltage)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Present_Temperature)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<XL>)))
  "Returns string type for a message object of type '<XL>"
  "dynamixel_workbench_msgs/XL")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'XL)))
  "Returns string type for a message object of type 'XL"
  "dynamixel_workbench_msgs/XL")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<XL>)))
  "Returns md5sum for a message object of type '<XL>"
  "ea49a2701ed85afc888c2c84aca6af1f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'XL)))
  "Returns md5sum for a message object of type 'XL"
  "ea49a2701ed85afc888c2c84aca6af1f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<XL>)))
  "Returns full string definition for message of type '<XL>"
  (cl:format cl:nil "# This message is compatible with control table of Dynamixel XL Series (XL430-W250)~%# If you want to specific information about control table, please follow the link (http://emanual.robotis.com/)~%~%uint16 Model_Number~%uint8  Firmware_Version~%uint8  ID~%uint8  Baud_Rate~%uint8  Return_Delay_Time~%uint8  Drive_Mode~%uint8  Operating_Mode~%uint8  Secondary_ID~%uint8  Protocol_Version~%int32  Homing_Offset~%uint32 Moving_Threshold~%uint8  Temperature_Limit~%uint16 Max_Voltage_Limit~%uint16 Min_Voltage_Limit~%uint16 PWM_Limit~%uint32 Acceleration_Limit~%uint32 Velocity_Limit~%uint32 Max_Position_Limit~%uint32 Min_Position_Limit~%uint8  Shutdown~%~%uint8  Torque_Enable~%uint8  LED~%uint8  Status_Return_Level~%uint8  Registered_Instruction~%uint8  Hardware_Error_Status~%uint16 Velocity_I_Gain~%uint16 Velocity_P_Gain~%uint16 Position_D_Gain~%uint16 Position_I_Gain~%uint16 Position_P_Gain~%uint16 Feedforward_2nd_Gain~%uint16 Feedforward_1st_Gain~%uint8  Bus_Watchdog~%int16  Goal_PWM~%int32  Goal_Velocity~%uint32 Profile_Acceleration~%uint32 Profile_Velocity~%uint32 Goal_Position~%uint16 Realtime_Tick~%uint8  Moving~%uint8  Moving_Status~%int16  Present_PWM~%int16  Present_Load~%int32  Present_Velocity~%int32  Present_Position~%uint32 Velocity_Trajectory~%uint32 Position_Trajectory~%uint16 Present_Input_Voltage~%uint8  Present_Temperature~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'XL)))
  "Returns full string definition for message of type 'XL"
  (cl:format cl:nil "# This message is compatible with control table of Dynamixel XL Series (XL430-W250)~%# If you want to specific information about control table, please follow the link (http://emanual.robotis.com/)~%~%uint16 Model_Number~%uint8  Firmware_Version~%uint8  ID~%uint8  Baud_Rate~%uint8  Return_Delay_Time~%uint8  Drive_Mode~%uint8  Operating_Mode~%uint8  Secondary_ID~%uint8  Protocol_Version~%int32  Homing_Offset~%uint32 Moving_Threshold~%uint8  Temperature_Limit~%uint16 Max_Voltage_Limit~%uint16 Min_Voltage_Limit~%uint16 PWM_Limit~%uint32 Acceleration_Limit~%uint32 Velocity_Limit~%uint32 Max_Position_Limit~%uint32 Min_Position_Limit~%uint8  Shutdown~%~%uint8  Torque_Enable~%uint8  LED~%uint8  Status_Return_Level~%uint8  Registered_Instruction~%uint8  Hardware_Error_Status~%uint16 Velocity_I_Gain~%uint16 Velocity_P_Gain~%uint16 Position_D_Gain~%uint16 Position_I_Gain~%uint16 Position_P_Gain~%uint16 Feedforward_2nd_Gain~%uint16 Feedforward_1st_Gain~%uint8  Bus_Watchdog~%int16  Goal_PWM~%int32  Goal_Velocity~%uint32 Profile_Acceleration~%uint32 Profile_Velocity~%uint32 Goal_Position~%uint16 Realtime_Tick~%uint8  Moving~%uint8  Moving_Status~%int16  Present_PWM~%int16  Present_Load~%int32  Present_Velocity~%int32  Present_Position~%uint32 Velocity_Trajectory~%uint32 Position_Trajectory~%uint16 Present_Input_Voltage~%uint8  Present_Temperature~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <XL>))
  (cl:+ 0
     2
     1
     1
     1
     1
     1
     1
     1
     1
     4
     4
     1
     2
     2
     2
     4
     4
     4
     4
     1
     1
     1
     1
     1
     1
     2
     2
     2
     2
     2
     2
     2
     1
     2
     4
     4
     4
     4
     2
     1
     1
     2
     2
     4
     4
     4
     4
     2
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <XL>))
  "Converts a ROS message object to a list"
  (cl:list 'XL
    (cl:cons ':Model_Number (Model_Number msg))
    (cl:cons ':Firmware_Version (Firmware_Version msg))
    (cl:cons ':ID (ID msg))
    (cl:cons ':Baud_Rate (Baud_Rate msg))
    (cl:cons ':Return_Delay_Time (Return_Delay_Time msg))
    (cl:cons ':Drive_Mode (Drive_Mode msg))
    (cl:cons ':Operating_Mode (Operating_Mode msg))
    (cl:cons ':Secondary_ID (Secondary_ID msg))
    (cl:cons ':Protocol_Version (Protocol_Version msg))
    (cl:cons ':Homing_Offset (Homing_Offset msg))
    (cl:cons ':Moving_Threshold (Moving_Threshold msg))
    (cl:cons ':Temperature_Limit (Temperature_Limit msg))
    (cl:cons ':Max_Voltage_Limit (Max_Voltage_Limit msg))
    (cl:cons ':Min_Voltage_Limit (Min_Voltage_Limit msg))
    (cl:cons ':PWM_Limit (PWM_Limit msg))
    (cl:cons ':Acceleration_Limit (Acceleration_Limit msg))
    (cl:cons ':Velocity_Limit (Velocity_Limit msg))
    (cl:cons ':Max_Position_Limit (Max_Position_Limit msg))
    (cl:cons ':Min_Position_Limit (Min_Position_Limit msg))
    (cl:cons ':Shutdown (Shutdown msg))
    (cl:cons ':Torque_Enable (Torque_Enable msg))
    (cl:cons ':LED (LED msg))
    (cl:cons ':Status_Return_Level (Status_Return_Level msg))
    (cl:cons ':Registered_Instruction (Registered_Instruction msg))
    (cl:cons ':Hardware_Error_Status (Hardware_Error_Status msg))
    (cl:cons ':Velocity_I_Gain (Velocity_I_Gain msg))
    (cl:cons ':Velocity_P_Gain (Velocity_P_Gain msg))
    (cl:cons ':Position_D_Gain (Position_D_Gain msg))
    (cl:cons ':Position_I_Gain (Position_I_Gain msg))
    (cl:cons ':Position_P_Gain (Position_P_Gain msg))
    (cl:cons ':Feedforward_2nd_Gain (Feedforward_2nd_Gain msg))
    (cl:cons ':Feedforward_1st_Gain (Feedforward_1st_Gain msg))
    (cl:cons ':Bus_Watchdog (Bus_Watchdog msg))
    (cl:cons ':Goal_PWM (Goal_PWM msg))
    (cl:cons ':Goal_Velocity (Goal_Velocity msg))
    (cl:cons ':Profile_Acceleration (Profile_Acceleration msg))
    (cl:cons ':Profile_Velocity (Profile_Velocity msg))
    (cl:cons ':Goal_Position (Goal_Position msg))
    (cl:cons ':Realtime_Tick (Realtime_Tick msg))
    (cl:cons ':Moving (Moving msg))
    (cl:cons ':Moving_Status (Moving_Status msg))
    (cl:cons ':Present_PWM (Present_PWM msg))
    (cl:cons ':Present_Load (Present_Load msg))
    (cl:cons ':Present_Velocity (Present_Velocity msg))
    (cl:cons ':Present_Position (Present_Position msg))
    (cl:cons ':Velocity_Trajectory (Velocity_Trajectory msg))
    (cl:cons ':Position_Trajectory (Position_Trajectory msg))
    (cl:cons ':Present_Input_Voltage (Present_Input_Voltage msg))
    (cl:cons ':Present_Temperature (Present_Temperature msg))
))
