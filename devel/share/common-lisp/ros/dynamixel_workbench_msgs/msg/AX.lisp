; Auto-generated. Do not edit!


(cl:in-package dynamixel_workbench_msgs-msg)


;//! \htmlinclude AX.msg.html

(cl:defclass <AX> (roslisp-msg-protocol:ros-message)
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
   (CW_Angle_Limit
    :reader CW_Angle_Limit
    :initarg :CW_Angle_Limit
    :type cl:fixnum
    :initform 0)
   (CCW_Angle_Limit
    :reader CCW_Angle_Limit
    :initarg :CCW_Angle_Limit
    :type cl:fixnum
    :initform 0)
   (Temperature_Limit
    :reader Temperature_Limit
    :initarg :Temperature_Limit
    :type cl:fixnum
    :initform 0)
   (Min_Voltage_Limit
    :reader Min_Voltage_Limit
    :initarg :Min_Voltage_Limit
    :type cl:fixnum
    :initform 0)
   (Max_Voltage_Limit
    :reader Max_Voltage_Limit
    :initarg :Max_Voltage_Limit
    :type cl:fixnum
    :initform 0)
   (Max_Torque
    :reader Max_Torque
    :initarg :Max_Torque
    :type cl:fixnum
    :initform 0)
   (Status_Return_Level
    :reader Status_Return_Level
    :initarg :Status_Return_Level
    :type cl:fixnum
    :initform 0)
   (Alarm_LED
    :reader Alarm_LED
    :initarg :Alarm_LED
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
   (LED
    :reader LED
    :initarg :LED
    :type cl:fixnum
    :initform 0)
   (CW_Compliance_Margin
    :reader CW_Compliance_Margin
    :initarg :CW_Compliance_Margin
    :type cl:fixnum
    :initform 0)
   (CCW_Compliance_Margin
    :reader CCW_Compliance_Margin
    :initarg :CCW_Compliance_Margin
    :type cl:fixnum
    :initform 0)
   (CW_Compliance_Slope
    :reader CW_Compliance_Slope
    :initarg :CW_Compliance_Slope
    :type cl:fixnum
    :initform 0)
   (CCW_Compliance_Slope
    :reader CCW_Compliance_Slope
    :initarg :CCW_Compliance_Slope
    :type cl:fixnum
    :initform 0)
   (Goal_Position
    :reader Goal_Position
    :initarg :Goal_Position
    :type cl:fixnum
    :initform 0)
   (Moving_Speed
    :reader Moving_Speed
    :initarg :Moving_Speed
    :type cl:fixnum
    :initform 0)
   (Torque_Limit
    :reader Torque_Limit
    :initarg :Torque_Limit
    :type cl:fixnum
    :initform 0)
   (Present_Position
    :reader Present_Position
    :initarg :Present_Position
    :type cl:fixnum
    :initform 0)
   (Present_Speed
    :reader Present_Speed
    :initarg :Present_Speed
    :type cl:fixnum
    :initform 0)
   (Present_Load
    :reader Present_Load
    :initarg :Present_Load
    :type cl:fixnum
    :initform 0)
   (Present_Voltage
    :reader Present_Voltage
    :initarg :Present_Voltage
    :type cl:fixnum
    :initform 0)
   (Present_Temperature
    :reader Present_Temperature
    :initarg :Present_Temperature
    :type cl:fixnum
    :initform 0)
   (Registered
    :reader Registered
    :initarg :Registered
    :type cl:fixnum
    :initform 0)
   (Moving
    :reader Moving
    :initarg :Moving
    :type cl:fixnum
    :initform 0)
   (Lock
    :reader Lock
    :initarg :Lock
    :type cl:fixnum
    :initform 0)
   (Punch
    :reader Punch
    :initarg :Punch
    :type cl:fixnum
    :initform 0))
)

(cl:defclass AX (<AX>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AX>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AX)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dynamixel_workbench_msgs-msg:<AX> is deprecated: use dynamixel_workbench_msgs-msg:AX instead.")))

(cl:ensure-generic-function 'Model_Number-val :lambda-list '(m))
(cl:defmethod Model_Number-val ((m <AX>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Model_Number-val is deprecated.  Use dynamixel_workbench_msgs-msg:Model_Number instead.")
  (Model_Number m))

(cl:ensure-generic-function 'Firmware_Version-val :lambda-list '(m))
(cl:defmethod Firmware_Version-val ((m <AX>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Firmware_Version-val is deprecated.  Use dynamixel_workbench_msgs-msg:Firmware_Version instead.")
  (Firmware_Version m))

(cl:ensure-generic-function 'ID-val :lambda-list '(m))
(cl:defmethod ID-val ((m <AX>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:ID-val is deprecated.  Use dynamixel_workbench_msgs-msg:ID instead.")
  (ID m))

(cl:ensure-generic-function 'Baud_Rate-val :lambda-list '(m))
(cl:defmethod Baud_Rate-val ((m <AX>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Baud_Rate-val is deprecated.  Use dynamixel_workbench_msgs-msg:Baud_Rate instead.")
  (Baud_Rate m))

(cl:ensure-generic-function 'Return_Delay_Time-val :lambda-list '(m))
(cl:defmethod Return_Delay_Time-val ((m <AX>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Return_Delay_Time-val is deprecated.  Use dynamixel_workbench_msgs-msg:Return_Delay_Time instead.")
  (Return_Delay_Time m))

(cl:ensure-generic-function 'CW_Angle_Limit-val :lambda-list '(m))
(cl:defmethod CW_Angle_Limit-val ((m <AX>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:CW_Angle_Limit-val is deprecated.  Use dynamixel_workbench_msgs-msg:CW_Angle_Limit instead.")
  (CW_Angle_Limit m))

(cl:ensure-generic-function 'CCW_Angle_Limit-val :lambda-list '(m))
(cl:defmethod CCW_Angle_Limit-val ((m <AX>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:CCW_Angle_Limit-val is deprecated.  Use dynamixel_workbench_msgs-msg:CCW_Angle_Limit instead.")
  (CCW_Angle_Limit m))

(cl:ensure-generic-function 'Temperature_Limit-val :lambda-list '(m))
(cl:defmethod Temperature_Limit-val ((m <AX>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Temperature_Limit-val is deprecated.  Use dynamixel_workbench_msgs-msg:Temperature_Limit instead.")
  (Temperature_Limit m))

(cl:ensure-generic-function 'Min_Voltage_Limit-val :lambda-list '(m))
(cl:defmethod Min_Voltage_Limit-val ((m <AX>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Min_Voltage_Limit-val is deprecated.  Use dynamixel_workbench_msgs-msg:Min_Voltage_Limit instead.")
  (Min_Voltage_Limit m))

(cl:ensure-generic-function 'Max_Voltage_Limit-val :lambda-list '(m))
(cl:defmethod Max_Voltage_Limit-val ((m <AX>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Max_Voltage_Limit-val is deprecated.  Use dynamixel_workbench_msgs-msg:Max_Voltage_Limit instead.")
  (Max_Voltage_Limit m))

(cl:ensure-generic-function 'Max_Torque-val :lambda-list '(m))
(cl:defmethod Max_Torque-val ((m <AX>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Max_Torque-val is deprecated.  Use dynamixel_workbench_msgs-msg:Max_Torque instead.")
  (Max_Torque m))

(cl:ensure-generic-function 'Status_Return_Level-val :lambda-list '(m))
(cl:defmethod Status_Return_Level-val ((m <AX>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Status_Return_Level-val is deprecated.  Use dynamixel_workbench_msgs-msg:Status_Return_Level instead.")
  (Status_Return_Level m))

(cl:ensure-generic-function 'Alarm_LED-val :lambda-list '(m))
(cl:defmethod Alarm_LED-val ((m <AX>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Alarm_LED-val is deprecated.  Use dynamixel_workbench_msgs-msg:Alarm_LED instead.")
  (Alarm_LED m))

(cl:ensure-generic-function 'Shutdown-val :lambda-list '(m))
(cl:defmethod Shutdown-val ((m <AX>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Shutdown-val is deprecated.  Use dynamixel_workbench_msgs-msg:Shutdown instead.")
  (Shutdown m))

(cl:ensure-generic-function 'Torque_Enable-val :lambda-list '(m))
(cl:defmethod Torque_Enable-val ((m <AX>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Torque_Enable-val is deprecated.  Use dynamixel_workbench_msgs-msg:Torque_Enable instead.")
  (Torque_Enable m))

(cl:ensure-generic-function 'LED-val :lambda-list '(m))
(cl:defmethod LED-val ((m <AX>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:LED-val is deprecated.  Use dynamixel_workbench_msgs-msg:LED instead.")
  (LED m))

(cl:ensure-generic-function 'CW_Compliance_Margin-val :lambda-list '(m))
(cl:defmethod CW_Compliance_Margin-val ((m <AX>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:CW_Compliance_Margin-val is deprecated.  Use dynamixel_workbench_msgs-msg:CW_Compliance_Margin instead.")
  (CW_Compliance_Margin m))

(cl:ensure-generic-function 'CCW_Compliance_Margin-val :lambda-list '(m))
(cl:defmethod CCW_Compliance_Margin-val ((m <AX>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:CCW_Compliance_Margin-val is deprecated.  Use dynamixel_workbench_msgs-msg:CCW_Compliance_Margin instead.")
  (CCW_Compliance_Margin m))

(cl:ensure-generic-function 'CW_Compliance_Slope-val :lambda-list '(m))
(cl:defmethod CW_Compliance_Slope-val ((m <AX>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:CW_Compliance_Slope-val is deprecated.  Use dynamixel_workbench_msgs-msg:CW_Compliance_Slope instead.")
  (CW_Compliance_Slope m))

(cl:ensure-generic-function 'CCW_Compliance_Slope-val :lambda-list '(m))
(cl:defmethod CCW_Compliance_Slope-val ((m <AX>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:CCW_Compliance_Slope-val is deprecated.  Use dynamixel_workbench_msgs-msg:CCW_Compliance_Slope instead.")
  (CCW_Compliance_Slope m))

(cl:ensure-generic-function 'Goal_Position-val :lambda-list '(m))
(cl:defmethod Goal_Position-val ((m <AX>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Goal_Position-val is deprecated.  Use dynamixel_workbench_msgs-msg:Goal_Position instead.")
  (Goal_Position m))

(cl:ensure-generic-function 'Moving_Speed-val :lambda-list '(m))
(cl:defmethod Moving_Speed-val ((m <AX>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Moving_Speed-val is deprecated.  Use dynamixel_workbench_msgs-msg:Moving_Speed instead.")
  (Moving_Speed m))

(cl:ensure-generic-function 'Torque_Limit-val :lambda-list '(m))
(cl:defmethod Torque_Limit-val ((m <AX>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Torque_Limit-val is deprecated.  Use dynamixel_workbench_msgs-msg:Torque_Limit instead.")
  (Torque_Limit m))

(cl:ensure-generic-function 'Present_Position-val :lambda-list '(m))
(cl:defmethod Present_Position-val ((m <AX>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Present_Position-val is deprecated.  Use dynamixel_workbench_msgs-msg:Present_Position instead.")
  (Present_Position m))

(cl:ensure-generic-function 'Present_Speed-val :lambda-list '(m))
(cl:defmethod Present_Speed-val ((m <AX>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Present_Speed-val is deprecated.  Use dynamixel_workbench_msgs-msg:Present_Speed instead.")
  (Present_Speed m))

(cl:ensure-generic-function 'Present_Load-val :lambda-list '(m))
(cl:defmethod Present_Load-val ((m <AX>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Present_Load-val is deprecated.  Use dynamixel_workbench_msgs-msg:Present_Load instead.")
  (Present_Load m))

(cl:ensure-generic-function 'Present_Voltage-val :lambda-list '(m))
(cl:defmethod Present_Voltage-val ((m <AX>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Present_Voltage-val is deprecated.  Use dynamixel_workbench_msgs-msg:Present_Voltage instead.")
  (Present_Voltage m))

(cl:ensure-generic-function 'Present_Temperature-val :lambda-list '(m))
(cl:defmethod Present_Temperature-val ((m <AX>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Present_Temperature-val is deprecated.  Use dynamixel_workbench_msgs-msg:Present_Temperature instead.")
  (Present_Temperature m))

(cl:ensure-generic-function 'Registered-val :lambda-list '(m))
(cl:defmethod Registered-val ((m <AX>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Registered-val is deprecated.  Use dynamixel_workbench_msgs-msg:Registered instead.")
  (Registered m))

(cl:ensure-generic-function 'Moving-val :lambda-list '(m))
(cl:defmethod Moving-val ((m <AX>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Moving-val is deprecated.  Use dynamixel_workbench_msgs-msg:Moving instead.")
  (Moving m))

(cl:ensure-generic-function 'Lock-val :lambda-list '(m))
(cl:defmethod Lock-val ((m <AX>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Lock-val is deprecated.  Use dynamixel_workbench_msgs-msg:Lock instead.")
  (Lock m))

(cl:ensure-generic-function 'Punch-val :lambda-list '(m))
(cl:defmethod Punch-val ((m <AX>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:Punch-val is deprecated.  Use dynamixel_workbench_msgs-msg:Punch instead.")
  (Punch m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AX>) ostream)
  "Serializes a message object of type '<AX>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Model_Number)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Model_Number)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Firmware_Version)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ID)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Baud_Rate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Return_Delay_Time)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'CW_Angle_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'CW_Angle_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'CCW_Angle_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'CCW_Angle_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Temperature_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Min_Voltage_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Max_Voltage_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Max_Torque)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Max_Torque)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Status_Return_Level)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Alarm_LED)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Shutdown)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Torque_Enable)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LED)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'CW_Compliance_Margin)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'CCW_Compliance_Margin)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'CW_Compliance_Slope)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'CCW_Compliance_Slope)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Goal_Position)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Goal_Position)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Moving_Speed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Moving_Speed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Torque_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Torque_Limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Present_Position)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Present_Position)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Present_Speed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Present_Speed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Present_Load)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Present_Load)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Present_Voltage)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Present_Temperature)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Registered)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Moving)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Lock)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Punch)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Punch)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AX>) istream)
  "Deserializes a message object of type '<AX>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Model_Number)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Model_Number)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Firmware_Version)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ID)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Baud_Rate)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Return_Delay_Time)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'CW_Angle_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'CW_Angle_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'CCW_Angle_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'CCW_Angle_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Temperature_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Min_Voltage_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Max_Voltage_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Max_Torque)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Max_Torque)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Status_Return_Level)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Alarm_LED)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Shutdown)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Torque_Enable)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LED)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'CW_Compliance_Margin)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'CCW_Compliance_Margin)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'CW_Compliance_Slope)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'CCW_Compliance_Slope)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Goal_Position)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Goal_Position)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Moving_Speed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Moving_Speed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Torque_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Torque_Limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Present_Position)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Present_Position)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Present_Speed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Present_Speed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Present_Load)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Present_Load)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Present_Voltage)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Present_Temperature)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Registered)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Moving)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Lock)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Punch)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Punch)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AX>)))
  "Returns string type for a message object of type '<AX>"
  "dynamixel_workbench_msgs/AX")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AX)))
  "Returns string type for a message object of type 'AX"
  "dynamixel_workbench_msgs/AX")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AX>)))
  "Returns md5sum for a message object of type '<AX>"
  "2995886198dd0136a45c431a45ec13b2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AX)))
  "Returns md5sum for a message object of type 'AX"
  "2995886198dd0136a45c431a45ec13b2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AX>)))
  "Returns full string definition for message of type '<AX>"
  (cl:format cl:nil "# This message is compatible with control table of Dynamixel AX Series (AX-12W, AX-12/AX-12+/AX-12A, AX-18F/AX-18A)~%# If you want to specific information about control table, please follow the link (http://emanual.robotis.com/)~%~%uint16 Model_Number~%uint8  Firmware_Version~%uint8  ID~%uint8  Baud_Rate~%uint8  Return_Delay_Time~%uint16 CW_Angle_Limit~%uint16 CCW_Angle_Limit~%uint8  Temperature_Limit~%uint8  Min_Voltage_Limit~%uint8  Max_Voltage_Limit~%uint16 Max_Torque~%uint8  Status_Return_Level~%uint8  Alarm_LED~%uint8  Shutdown~%~%uint8  Torque_Enable~%uint8  LED~%uint8  CW_Compliance_Margin~%uint8  CCW_Compliance_Margin~%uint8  CW_Compliance_Slope~%uint8  CCW_Compliance_Slope~%uint16 Goal_Position~%uint16 Moving_Speed~%uint16 Torque_Limit~%uint16 Present_Position~%uint16 Present_Speed~%uint16 Present_Load~%uint8  Present_Voltage~%uint8  Present_Temperature~%uint8  Registered~%uint8  Moving~%uint8  Lock~%uint16 Punch~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AX)))
  "Returns full string definition for message of type 'AX"
  (cl:format cl:nil "# This message is compatible with control table of Dynamixel AX Series (AX-12W, AX-12/AX-12+/AX-12A, AX-18F/AX-18A)~%# If you want to specific information about control table, please follow the link (http://emanual.robotis.com/)~%~%uint16 Model_Number~%uint8  Firmware_Version~%uint8  ID~%uint8  Baud_Rate~%uint8  Return_Delay_Time~%uint16 CW_Angle_Limit~%uint16 CCW_Angle_Limit~%uint8  Temperature_Limit~%uint8  Min_Voltage_Limit~%uint8  Max_Voltage_Limit~%uint16 Max_Torque~%uint8  Status_Return_Level~%uint8  Alarm_LED~%uint8  Shutdown~%~%uint8  Torque_Enable~%uint8  LED~%uint8  CW_Compliance_Margin~%uint8  CCW_Compliance_Margin~%uint8  CW_Compliance_Slope~%uint8  CCW_Compliance_Slope~%uint16 Goal_Position~%uint16 Moving_Speed~%uint16 Torque_Limit~%uint16 Present_Position~%uint16 Present_Speed~%uint16 Present_Load~%uint8  Present_Voltage~%uint8  Present_Temperature~%uint8  Registered~%uint8  Moving~%uint8  Lock~%uint16 Punch~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AX>))
  (cl:+ 0
     2
     1
     1
     1
     1
     2
     2
     1
     1
     1
     2
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
     2
     2
     2
     1
     1
     1
     1
     1
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AX>))
  "Converts a ROS message object to a list"
  (cl:list 'AX
    (cl:cons ':Model_Number (Model_Number msg))
    (cl:cons ':Firmware_Version (Firmware_Version msg))
    (cl:cons ':ID (ID msg))
    (cl:cons ':Baud_Rate (Baud_Rate msg))
    (cl:cons ':Return_Delay_Time (Return_Delay_Time msg))
    (cl:cons ':CW_Angle_Limit (CW_Angle_Limit msg))
    (cl:cons ':CCW_Angle_Limit (CCW_Angle_Limit msg))
    (cl:cons ':Temperature_Limit (Temperature_Limit msg))
    (cl:cons ':Min_Voltage_Limit (Min_Voltage_Limit msg))
    (cl:cons ':Max_Voltage_Limit (Max_Voltage_Limit msg))
    (cl:cons ':Max_Torque (Max_Torque msg))
    (cl:cons ':Status_Return_Level (Status_Return_Level msg))
    (cl:cons ':Alarm_LED (Alarm_LED msg))
    (cl:cons ':Shutdown (Shutdown msg))
    (cl:cons ':Torque_Enable (Torque_Enable msg))
    (cl:cons ':LED (LED msg))
    (cl:cons ':CW_Compliance_Margin (CW_Compliance_Margin msg))
    (cl:cons ':CCW_Compliance_Margin (CCW_Compliance_Margin msg))
    (cl:cons ':CW_Compliance_Slope (CW_Compliance_Slope msg))
    (cl:cons ':CCW_Compliance_Slope (CCW_Compliance_Slope msg))
    (cl:cons ':Goal_Position (Goal_Position msg))
    (cl:cons ':Moving_Speed (Moving_Speed msg))
    (cl:cons ':Torque_Limit (Torque_Limit msg))
    (cl:cons ':Present_Position (Present_Position msg))
    (cl:cons ':Present_Speed (Present_Speed msg))
    (cl:cons ':Present_Load (Present_Load msg))
    (cl:cons ':Present_Voltage (Present_Voltage msg))
    (cl:cons ':Present_Temperature (Present_Temperature msg))
    (cl:cons ':Registered (Registered msg))
    (cl:cons ':Moving (Moving msg))
    (cl:cons ':Lock (Lock msg))
    (cl:cons ':Punch (Punch msg))
))
