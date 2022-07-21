; Auto-generated. Do not edit!


(cl:in-package dynamixel_workbench_msgs-msg)


;//! \htmlinclude PROExt.msg.html

(cl:defclass <PROExt> (roslisp-msg-protocol:ros-message)
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
   (Operating_Mode
    :reader Operating_Mode
    :initarg :Operating_Mode
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
   (Acceleration_Limit
    :reader Acceleration_Limit
    :initarg :Acceleration_Limit
    :type cl:integer
    :initform 0)
   (Torque_Limit
    :reader Torque_Limit
    :initarg :Torque_Limit
    :type cl:fixnum
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
   (External_Port_Mode_1
    :reader External_Port_Mode_1
    :initarg :External_Port_Mode_1
    :type cl:fixnum
    :initform 0)
   (External_Port_Mode_2
    :reader External_Port_Mode_2
    :initarg :External_Port_Mode_2
    :type cl:fixnum
    :initform 0)
   (External_Port_Mode_3
    :reader External_Port_Mode_3
    :initarg :External_Port_Mode_3
    :type cl:fixnum
    :initform 0)
   (External_Port_Mode_4
    :reader External_Port_Mode_4
    :initarg :External_Port_Mode_4
    :type cl:fixnum
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
   (LED_RED
    :reader LED_RED
    :initarg :LED_RED
    :type cl:fixnum
    :initform 0)
   (LED_GREEN
    :reader LED_GREEN
    :initarg :LED_GREEN
    :type cl:fixnum
    :initform 0)
   (LED_BLUE
    :reader LED_BLUE
    :initarg :LED_BLUE
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
   (Position_P_Gain
    :reader Position_P_Gain
    :initarg :Position_P_Gain
    :type cl:fixnum
    :initform 0)
   (Goal_Position
    :reader Goal_Position
    :initarg :Goal_Position
    :type cl:integer
    :initform 0)
   (Goal_Velocity
    :reader Goal_Velocity
    :initarg :Goal_Velocity
    :type cl:integer
    :initform 0)
   (Goal_Torque
    :reader Goal_Torque
    :initarg :Goal_Torque
    :type cl:fixnum
    :initform 0)
   (Goal_Acceleration
    :reader Goal_Acceleration
    :initarg :Goal_Acceleration
    :type cl:integer
    :initform 0)
   (Moving
    :reader Moving
    :initarg :Moving
    :type cl:fixnum
    :initform 0)
   (Present_Position
    :reader Present_Position
    :initarg :Present_Position
    :type cl:integer
    :initform 0)
   (Present_Velocity
    :reader Present_Velocity
    :initarg :Present_Velocity
    :type cl:integer
    :initform 0)
   (Present_Current
    :reader Present_Current
    :initarg :Present_Current
    :type cl:fixnum
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
    :initform 0)
   (Registered_Instruction
    :reader Registered_Instruction
    :initarg :Registered_Instruction
    :type cl:fixnum
    :initform 0)
   (Status_Return_Level
    :reader Status_Return_Level
    :initarg :Status_Return_Level
    :type cl:fixnum
    :initform 0)
   (Hardware_Error_Status
    :reader Hardware_Error_Status
    :initarg :Hardware_Error_Status
    :type cl:fixnum
    :initform 0))
)

(cl:defclass PROExt (<PROExt>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PROExt>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PROExt)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dynamixel_workbench_msgs-msg:<PROExt> is deprecated: use dynamixel_workbench_msgs-msg:PROExt instead.")))

(cl:ensure-generic-function 'Model_Number-val :lambda-list '(m))
(cl:defmethod Model_Number-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Model_Number-val is deprecated.  Use dynamixel_workbench_msgs-msg:Model_Number instead.")
  (Model_Number m))

(cl:ensure-generic-function 'Firmware_Version-val :lambda-list '(m))
(cl:defmethod Firmware_Version-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Firmware_Version-val is deprecated.  Use dynamixel_workbench_msgs-msg:Firmware_Version instead.")
  (Firmware_Version m))

(cl:ensure-generic-function 'ID-val :lambda-list '(m))
(cl:defmethod ID-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:ID-val is deprecated.  Use dynamixel_workbench_msgs-msg:ID instead.")
  (ID m))

(cl:ensure-generic-function 'Baud_Rate-val :lambda-list '(m))
(cl:defmethod Baud_Rate-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Baud_Rate-val is deprecated.  Use dynamixel_workbench_msgs-msg:Baud_Rate instead.")
  (Baud_Rate m))

(cl:ensure-generic-function 'Return_Delay_Time-val :lambda-list '(m))
(cl:defmethod Return_Delay_Time-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Return_Delay_Time-val is deprecated.  Use dynamixel_workbench_msgs-msg:Return_Delay_Time instead.")
  (Return_Delay_Time m))

(cl:ensure-generic-function 'Operating_Mode-val :lambda-list '(m))
(cl:defmethod Operating_Mode-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Operating_Mode-val is deprecated.  Use dynamixel_workbench_msgs-msg:Operating_Mode instead.")
  (Operating_Mode m))

(cl:ensure-generic-function 'Homing_Offset-val :lambda-list '(m))
(cl:defmethod Homing_Offset-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Homing_Offset-val is deprecated.  Use dynamixel_workbench_msgs-msg:Homing_Offset instead.")
  (Homing_Offset m))

(cl:ensure-generic-function 'Moving_Threshold-val :lambda-list '(m))
(cl:defmethod Moving_Threshold-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Moving_Threshold-val is deprecated.  Use dynamixel_workbench_msgs-msg:Moving_Threshold instead.")
  (Moving_Threshold m))

(cl:ensure-generic-function 'Temperature_Limit-val :lambda-list '(m))
(cl:defmethod Temperature_Limit-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Temperature_Limit-val is deprecated.  Use dynamixel_workbench_msgs-msg:Temperature_Limit instead.")
  (Temperature_Limit m))

(cl:ensure-generic-function 'Max_Voltage_Limit-val :lambda-list '(m))
(cl:defmethod Max_Voltage_Limit-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Max_Voltage_Limit-val is deprecated.  Use dynamixel_workbench_msgs-msg:Max_Voltage_Limit instead.")
  (Max_Voltage_Limit m))

(cl:ensure-generic-function 'Min_Voltage_Limit-val :lambda-list '(m))
(cl:defmethod Min_Voltage_Limit-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Min_Voltage_Limit-val is deprecated.  Use dynamixel_workbench_msgs-msg:Min_Voltage_Limit instead.")
  (Min_Voltage_Limit m))

(cl:ensure-generic-function 'Acceleration_Limit-val :lambda-list '(m))
(cl:defmethod Acceleration_Limit-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Acceleration_Limit-val is deprecated.  Use dynamixel_workbench_msgs-msg:Acceleration_Limit instead.")
  (Acceleration_Limit m))

(cl:ensure-generic-function 'Torque_Limit-val :lambda-list '(m))
(cl:defmethod Torque_Limit-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Torque_Limit-val is deprecated.  Use dynamixel_workbench_msgs-msg:Torque_Limit instead.")
  (Torque_Limit m))

(cl:ensure-generic-function 'Velocity_Limit-val :lambda-list '(m))
(cl:defmethod Velocity_Limit-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Velocity_Limit-val is deprecated.  Use dynamixel_workbench_msgs-msg:Velocity_Limit instead.")
  (Velocity_Limit m))

(cl:ensure-generic-function 'Max_Position_Limit-val :lambda-list '(m))
(cl:defmethod Max_Position_Limit-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Max_Position_Limit-val is deprecated.  Use dynamixel_workbench_msgs-msg:Max_Position_Limit instead.")
  (Max_Position_Limit m))

(cl:ensure-generic-function 'Min_Position_Limit-val :lambda-list '(m))
(cl:defmethod Min_Position_Limit-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Min_Position_Limit-val is deprecated.  Use dynamixel_workbench_msgs-msg:Min_Position_Limit instead.")
  (Min_Position_Limit m))

(cl:ensure-generic-function 'External_Port_Mode_1-val :lambda-list '(m))
(cl:defmethod External_Port_Mode_1-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:External_Port_Mode_1-val is deprecated.  Use dynamixel_workbench_msgs-msg:External_Port_Mode_1 instead.")
  (External_Port_Mode_1 m))

(cl:ensure-generic-function 'External_Port_Mode_2-val :lambda-list '(m))
(cl:defmethod External_Port_Mode_2-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:External_Port_Mode_2-val is deprecated.  Use dynamixel_workbench_msgs-msg:External_Port_Mode_2 instead.")
  (External_Port_Mode_2 m))

(cl:ensure-generic-function 'External_Port_Mode_3-val :lambda-list '(m))
(cl:defmethod External_Port_Mode_3-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:External_Port_Mode_3-val is deprecated.  Use dynamixel_workbench_msgs-msg:External_Port_Mode_3 instead.")
  (External_Port_Mode_3 m))

(cl:ensure-generic-function 'External_Port_Mode_4-val :lambda-list '(m))
(cl:defmethod External_Port_Mode_4-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:External_Port_Mode_4-val is deprecated.  Use dynamixel_workbench_msgs-msg:External_Port_Mode_4 instead.")
  (External_Port_Mode_4 m))

(cl:ensure-generic-function 'Shutdown-val :lambda-list '(m))
(cl:defmethod Shutdown-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Shutdown-val is deprecated.  Use dynamixel_workbench_msgs-msg:Shutdown instead.")
  (Shutdown m))

(cl:ensure-generic-function 'Torque_Enable-val :lambda-list '(m))
(cl:defmethod Torque_Enable-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Torque_Enable-val is deprecated.  Use dynamixel_workbench_msgs-msg:Torque_Enable instead.")
  (Torque_Enable m))

(cl:ensure-generic-function 'LED_RED-val :lambda-list '(m))
(cl:defmethod LED_RED-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:LED_RED-val is deprecated.  Use dynamixel_workbench_msgs-msg:LED_RED instead.")
  (LED_RED m))

(cl:ensure-generic-function 'LED_GREEN-val :lambda-list '(m))
(cl:defmethod LED_GREEN-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:LED_GREEN-val is deprecated.  Use dynamixel_workbench_msgs-msg:LED_GREEN instead.")
  (LED_GREEN m))

(cl:ensure-generic-function 'LED_BLUE-val :lambda-list '(m))
(cl:defmethod LED_BLUE-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:LED_BLUE-val is deprecated.  Use dynamixel_workbench_msgs-msg:LED_BLUE instead.")
  (LED_BLUE m))

(cl:ensure-generic-function 'Velocity_I_Gain-val :lambda-list '(m))
(cl:defmethod Velocity_I_Gain-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Velocity_I_Gain-val is deprecated.  Use dynamixel_workbench_msgs-msg:Velocity_I_Gain instead.")
  (Velocity_I_Gain m))

(cl:ensure-generic-function 'Velocity_P_Gain-val :lambda-list '(m))
(cl:defmethod Velocity_P_Gain-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Velocity_P_Gain-val is deprecated.  Use dynamixel_workbench_msgs-msg:Velocity_P_Gain instead.")
  (Velocity_P_Gain m))

(cl:ensure-generic-function 'Position_P_Gain-val :lambda-list '(m))
(cl:defmethod Position_P_Gain-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Position_P_Gain-val is deprecated.  Use dynamixel_workbench_msgs-msg:Position_P_Gain instead.")
  (Position_P_Gain m))

(cl:ensure-generic-function 'Goal_Position-val :lambda-list '(m))
(cl:defmethod Goal_Position-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Goal_Position-val is deprecated.  Use dynamixel_workbench_msgs-msg:Goal_Position instead.")
  (Goal_Position m))

(cl:ensure-generic-function 'Goal_Velocity-val :lambda-list '(m))
(cl:defmethod Goal_Velocity-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Goal_Velocity-val is deprecated.  Use dynamixel_workbench_msgs-msg:Goal_Velocity instead.")
  (Goal_Velocity m))

(cl:ensure-generic-function 'Goal_Torque-val :lambda-list '(m))
(cl:defmethod Goal_Torque-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Goal_Torque-val is deprecated.  Use dynamixel_workbench_msgs-msg:Goal_Torque instead.")
  (Goal_Torque m))

(cl:ensure-generic-function 'Goal_Acceleration-val :lambda-list '(m))
(cl:defmethod Goal_Acceleration-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Goal_Acceleration-val is deprecated.  Use dynamixel_workbench_msgs-msg:Goal_Acceleration instead.")
  (Goal_Acceleration m))

(cl:ensure-generic-function 'Moving-val :lambda-list '(m))
(cl:defmethod Moving-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Moving-val is deprecated.  Use dynamixel_workbench_msgs-msg:Moving instead.")
  (Moving m))

(cl:ensure-generic-function 'Present_Position-val :lambda-list '(m))
(cl:defmethod Present_Position-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Present_Position-val is deprecated.  Use dynamixel_workbench_msgs-msg:Present_Position instead.")
  (Present_Position m))

(cl:ensure-generic-function 'Present_Velocity-val :lambda-list '(m))
(cl:defmethod Present_Velocity-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Present_Velocity-val is deprecated.  Use dynamixel_workbench_msgs-msg:Present_Velocity instead.")
  (Present_Velocity m))

(cl:ensure-generic-function 'Present_Current-val :lambda-list '(m))
(cl:defmethod Present_Current-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Present_Current-val is deprecated.  Use dynamixel_workbench_msgs-msg:Present_Current instead.")
  (Present_Current m))

(cl:ensure-generic-function 'Present_Input_Voltage-val :lambda-list '(m))
(cl:defmethod Present_Input_Voltage-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Present_Input_Voltage-val is deprecated.  Use dynamixel_workbench_msgs-msg:Present_Input_Voltage instead.")
  (Present_Input_Voltage m))

(cl:ensure-generic-function 'Present_Temperature-val :lambda-list '(m))
(cl:defmethod Present_Temperature-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Present_Temperature-val is deprecated.  Use dynamixel_workbench_msgs-msg:Present_Temperature instead.")
  (Present_Temperature m))

(cl:ensure-generic-function 'Registered_Instruction-val :lambda-list '(m))
(cl:defmethod Registered_Instruction-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Registered_Instruction-val is deprecated.  Use dynamixel_workbench_msgs-msg:Registered_Instruction instead.")
  (Registered_Instruction m))

(cl:ensure-generic-function 'Status_Return_Level-val :lambda-list '(m))
(cl:defmethod Status_Return_Level-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Status_Return_Level-val is deprecated.  Use dynamixel_workbench_msgs-msg:Status_Return_Level instead.")
  (Status_Return_Level m))

(cl:ensure-generic-function 'Hardware_Error_Status-val :lambda-list '(m))
(cl:defmethod Hardware_Error_Status-val ((m <PROExt>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Hardware_Error_Status-val is deprecated.  Use dynamixel_workbench_msgs-msg:Hardware_Error_Status instead.")
  (Hardware_Error_Status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PROExt>) ostream)
  "Serializes a message object of type '<PROExt>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Model_Number)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Model_Number)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Firmware_Version)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ID)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Baud_Rate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Return_Delay_Time)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Operating_Mode)) ostream)
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
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Acceleration_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Acceleration_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'Acceleration_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'Acceleration_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Torque_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Torque_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Velocity_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Velocity_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'Velocity_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'Velocity_Limit)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'Max_Position_Limit)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'Min_Position_Limit)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'External_Port_Mode_1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'External_Port_Mode_2)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'External_Port_Mode_3)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'External_Port_Mode_4)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Shutdown)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Torque_Enable)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LED_RED)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LED_GREEN)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LED_BLUE)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Velocity_I_Gain)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Velocity_I_Gain)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Velocity_P_Gain)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Velocity_P_Gain)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Position_P_Gain)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Position_P_Gain)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'Goal_Position)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Goal_Velocity)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Goal_Velocity)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'Goal_Velocity)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'Goal_Velocity)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Goal_Torque)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Goal_Torque)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'Goal_Acceleration)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Moving)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'Present_Position)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Present_Velocity)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Present_Velocity)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'Present_Velocity)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'Present_Velocity)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Present_Current)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Present_Current)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Present_Input_Voltage)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Present_Input_Voltage)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Present_Temperature)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Registered_Instruction)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Status_Return_Level)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Hardware_Error_Status)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PROExt>) istream)
  "Deserializes a message object of type '<PROExt>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Model_Number)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Model_Number)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Firmware_Version)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ID)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Baud_Rate)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Return_Delay_Time)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Operating_Mode)) (cl:read-byte istream))
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
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Acceleration_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Acceleration_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'Acceleration_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'Acceleration_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Torque_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Torque_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Velocity_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Velocity_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'Velocity_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'Velocity_Limit)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Max_Position_Limit) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Min_Position_Limit) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'External_Port_Mode_1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'External_Port_Mode_2)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'External_Port_Mode_3)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'External_Port_Mode_4)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Shutdown)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Torque_Enable)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LED_RED)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LED_GREEN)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LED_BLUE)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Velocity_I_Gain)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Velocity_I_Gain)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Velocity_P_Gain)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Velocity_P_Gain)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Position_P_Gain)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Position_P_Gain)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Goal_Position) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Goal_Velocity)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Goal_Velocity)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'Goal_Velocity)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'Goal_Velocity)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Goal_Torque)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Goal_Torque)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Goal_Acceleration) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Moving)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Present_Position) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Present_Velocity)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Present_Velocity)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'Present_Velocity)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'Present_Velocity)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Present_Current)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Present_Current)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Present_Input_Voltage)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Present_Input_Voltage)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Present_Temperature)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Registered_Instruction)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Status_Return_Level)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Hardware_Error_Status)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PROExt>)))
  "Returns string type for a message object of type '<PROExt>"
  "dynamixel_workbench_msgs/PROExt")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PROExt)))
  "Returns string type for a message object of type 'PROExt"
  "dynamixel_workbench_msgs/PROExt")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PROExt>)))
  "Returns md5sum for a message object of type '<PROExt>"
  "7e5c32f4e1d1adb95d72d66d5dcec77e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PROExt)))
  "Returns md5sum for a message object of type 'PROExt"
  "7e5c32f4e1d1adb95d72d66d5dcec77e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PROExt>)))
  "Returns full string definition for message of type '<PROExt>"
  (cl:format cl:nil "# This message is compatible with control table of Dynamixel PRO Series~%# (L54-30-S500-R, L54-30-S400-R,  L54-50-S500-R, L54-50-S290-R,~%#  M42-10-S260-R, M54-40-S250-R,  M54-60-S250-R,~%#  H42-20-S300-R, H54-100-S500-R, H54-200-S500-R)~%# If you want to specific information about control table, please follow the link (http://emanual.robotis.com/)~%~%uint16 Model_Number~%uint8  Firmware_Version~%uint8  ID~%uint8  Baud_Rate~%uint8  Return_Delay_Time~%uint8  Operating_Mode~%int32  Homing_Offset~%uint32 Moving_Threshold~%uint8  Temperature_Limit~%uint16 Max_Voltage_Limit~%uint16 Min_Voltage_Limit~%uint32 Acceleration_Limit~%uint16 Torque_Limit~%uint32 Velocity_Limit~%int32  Max_Position_Limit~%int32  Min_Position_Limit~%uint8  External_Port_Mode_1~%uint8  External_Port_Mode_2~%uint8  External_Port_Mode_3~%uint8  External_Port_Mode_4~%uint8  Shutdown~%~%uint8  Torque_Enable~%uint8  LED_RED~%uint8  LED_GREEN~%uint8  LED_BLUE~%uint16 Velocity_I_Gain~%uint16 Velocity_P_Gain~%uint16 Position_P_Gain~%int32  Goal_Position~%uint32 Goal_Velocity~%uint16 Goal_Torque~%int32  Goal_Acceleration~%uint8  Moving~%int32  Present_Position~%uint32 Present_Velocity~%uint16 Present_Current~%uint16 Present_Input_Voltage~%uint8  Present_Temperature~%uint8  Registered_Instruction~%uint8  Status_Return_Level~%uint8  Hardware_Error_Status~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PROExt)))
  "Returns full string definition for message of type 'PROExt"
  (cl:format cl:nil "# This message is compatible with control table of Dynamixel PRO Series~%# (L54-30-S500-R, L54-30-S400-R,  L54-50-S500-R, L54-50-S290-R,~%#  M42-10-S260-R, M54-40-S250-R,  M54-60-S250-R,~%#  H42-20-S300-R, H54-100-S500-R, H54-200-S500-R)~%# If you want to specific information about control table, please follow the link (http://emanual.robotis.com/)~%~%uint16 Model_Number~%uint8  Firmware_Version~%uint8  ID~%uint8  Baud_Rate~%uint8  Return_Delay_Time~%uint8  Operating_Mode~%int32  Homing_Offset~%uint32 Moving_Threshold~%uint8  Temperature_Limit~%uint16 Max_Voltage_Limit~%uint16 Min_Voltage_Limit~%uint32 Acceleration_Limit~%uint16 Torque_Limit~%uint32 Velocity_Limit~%int32  Max_Position_Limit~%int32  Min_Position_Limit~%uint8  External_Port_Mode_1~%uint8  External_Port_Mode_2~%uint8  External_Port_Mode_3~%uint8  External_Port_Mode_4~%uint8  Shutdown~%~%uint8  Torque_Enable~%uint8  LED_RED~%uint8  LED_GREEN~%uint8  LED_BLUE~%uint16 Velocity_I_Gain~%uint16 Velocity_P_Gain~%uint16 Position_P_Gain~%int32  Goal_Position~%uint32 Goal_Velocity~%uint16 Goal_Torque~%int32  Goal_Acceleration~%uint8  Moving~%int32  Present_Position~%uint32 Present_Velocity~%uint16 Present_Current~%uint16 Present_Input_Voltage~%uint8  Present_Temperature~%uint8  Registered_Instruction~%uint8  Status_Return_Level~%uint8  Hardware_Error_Status~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PROExt>))
  (cl:+ 0
     2
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
     4
     2
     4
     4
     4
     1
     1
     1
     1
     1
     1
     1
     1
     1
     2
     2
     2
     4
     4
     2
     4
     1
     4
     4
     2
     2
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PROExt>))
  "Converts a ROS message object to a list"
  (cl:list 'PROExt
    (cl:cons ':Model_Number (Model_Number msg))
    (cl:cons ':Firmware_Version (Firmware_Version msg))
    (cl:cons ':ID (ID msg))
    (cl:cons ':Baud_Rate (Baud_Rate msg))
    (cl:cons ':Return_Delay_Time (Return_Delay_Time msg))
    (cl:cons ':Operating_Mode (Operating_Mode msg))
    (cl:cons ':Homing_Offset (Homing_Offset msg))
    (cl:cons ':Moving_Threshold (Moving_Threshold msg))
    (cl:cons ':Temperature_Limit (Temperature_Limit msg))
    (cl:cons ':Max_Voltage_Limit (Max_Voltage_Limit msg))
    (cl:cons ':Min_Voltage_Limit (Min_Voltage_Limit msg))
    (cl:cons ':Acceleration_Limit (Acceleration_Limit msg))
    (cl:cons ':Torque_Limit (Torque_Limit msg))
    (cl:cons ':Velocity_Limit (Velocity_Limit msg))
    (cl:cons ':Max_Position_Limit (Max_Position_Limit msg))
    (cl:cons ':Min_Position_Limit (Min_Position_Limit msg))
    (cl:cons ':External_Port_Mode_1 (External_Port_Mode_1 msg))
    (cl:cons ':External_Port_Mode_2 (External_Port_Mode_2 msg))
    (cl:cons ':External_Port_Mode_3 (External_Port_Mode_3 msg))
    (cl:cons ':External_Port_Mode_4 (External_Port_Mode_4 msg))
    (cl:cons ':Shutdown (Shutdown msg))
    (cl:cons ':Torque_Enable (Torque_Enable msg))
    (cl:cons ':LED_RED (LED_RED msg))
    (cl:cons ':LED_GREEN (LED_GREEN msg))
    (cl:cons ':LED_BLUE (LED_BLUE msg))
    (cl:cons ':Velocity_I_Gain (Velocity_I_Gain msg))
    (cl:cons ':Velocity_P_Gain (Velocity_P_Gain msg))
    (cl:cons ':Position_P_Gain (Position_P_Gain msg))
    (cl:cons ':Goal_Position (Goal_Position msg))
    (cl:cons ':Goal_Velocity (Goal_Velocity msg))
    (cl:cons ':Goal_Torque (Goal_Torque msg))
    (cl:cons ':Goal_Acceleration (Goal_Acceleration msg))
    (cl:cons ':Moving (Moving msg))
    (cl:cons ':Present_Position (Present_Position msg))
    (cl:cons ':Present_Velocity (Present_Velocity msg))
    (cl:cons ':Present_Current (Present_Current msg))
    (cl:cons ':Present_Input_Voltage (Present_Input_Voltage msg))
    (cl:cons ':Present_Temperature (Present_Temperature msg))
    (cl:cons ':Registered_Instruction (Registered_Instruction msg))
    (cl:cons ':Status_Return_Level (Status_Return_Level msg))
    (cl:cons ':Hardware_Error_Status (Hardware_Error_Status msg))
))
