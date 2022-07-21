;; Auto-generated. Do not edit!


(when (boundp 'dynamixel_workbench_msgs::MXExt)
  (if (not (find-package "DYNAMIXEL_WORKBENCH_MSGS"))
    (make-package "DYNAMIXEL_WORKBENCH_MSGS"))
  (shadow 'MXExt (find-package "DYNAMIXEL_WORKBENCH_MSGS")))
(unless (find-package "DYNAMIXEL_WORKBENCH_MSGS::MXEXT")
  (make-package "DYNAMIXEL_WORKBENCH_MSGS::MXEXT"))

(in-package "ROS")
;;//! \htmlinclude MXExt.msg.html


(defclass dynamixel_workbench_msgs::MXExt
  :super ros::object
  :slots (_Model_Number _Firmware_Version _ID _Baud_Rate _Return_Delay_Time _CW_Angle_Limit _CCW_Angle_Limit _Temperature_Limit _Min_Voltage_Limit _Max_Voltage_Limit _Max_Torque _Status_Return_Level _Alarm_LED _Shutdown _Multi_Turn_Offset _Resolution_Divider _Torque_Enable _LED _D_gain _I_gain _P_gain _Goal_Position _Moving_Speed _Torque_Limit _Present_Position _Present_Speed _Present_Load _Present_Voltage _Present_Temperature _Registered _Moving _Lock _Punch _Current _Torque_Control_Mode_Enable _Goal_Torque _Goal_Acceleration ))

(defmethod dynamixel_workbench_msgs::MXExt
  (:init
   (&key
    ((:Model_Number __Model_Number) 0)
    ((:Firmware_Version __Firmware_Version) 0)
    ((:ID __ID) 0)
    ((:Baud_Rate __Baud_Rate) 0)
    ((:Return_Delay_Time __Return_Delay_Time) 0)
    ((:CW_Angle_Limit __CW_Angle_Limit) 0)
    ((:CCW_Angle_Limit __CCW_Angle_Limit) 0)
    ((:Temperature_Limit __Temperature_Limit) 0)
    ((:Min_Voltage_Limit __Min_Voltage_Limit) 0)
    ((:Max_Voltage_Limit __Max_Voltage_Limit) 0)
    ((:Max_Torque __Max_Torque) 0)
    ((:Status_Return_Level __Status_Return_Level) 0)
    ((:Alarm_LED __Alarm_LED) 0)
    ((:Shutdown __Shutdown) 0)
    ((:Multi_Turn_Offset __Multi_Turn_Offset) 0)
    ((:Resolution_Divider __Resolution_Divider) 0)
    ((:Torque_Enable __Torque_Enable) 0)
    ((:LED __LED) 0)
    ((:D_gain __D_gain) 0)
    ((:I_gain __I_gain) 0)
    ((:P_gain __P_gain) 0)
    ((:Goal_Position __Goal_Position) 0)
    ((:Moving_Speed __Moving_Speed) 0)
    ((:Torque_Limit __Torque_Limit) 0)
    ((:Present_Position __Present_Position) 0)
    ((:Present_Speed __Present_Speed) 0)
    ((:Present_Load __Present_Load) 0)
    ((:Present_Voltage __Present_Voltage) 0)
    ((:Present_Temperature __Present_Temperature) 0)
    ((:Registered __Registered) 0)
    ((:Moving __Moving) 0)
    ((:Lock __Lock) 0)
    ((:Punch __Punch) 0)
    ((:Current __Current) 0)
    ((:Torque_Control_Mode_Enable __Torque_Control_Mode_Enable) 0)
    ((:Goal_Torque __Goal_Torque) 0)
    ((:Goal_Acceleration __Goal_Acceleration) 0)
    )
   (send-super :init)
   (setq _Model_Number (round __Model_Number))
   (setq _Firmware_Version (round __Firmware_Version))
   (setq _ID (round __ID))
   (setq _Baud_Rate (round __Baud_Rate))
   (setq _Return_Delay_Time (round __Return_Delay_Time))
   (setq _CW_Angle_Limit (round __CW_Angle_Limit))
   (setq _CCW_Angle_Limit (round __CCW_Angle_Limit))
   (setq _Temperature_Limit (round __Temperature_Limit))
   (setq _Min_Voltage_Limit (round __Min_Voltage_Limit))
   (setq _Max_Voltage_Limit (round __Max_Voltage_Limit))
   (setq _Max_Torque (round __Max_Torque))
   (setq _Status_Return_Level (round __Status_Return_Level))
   (setq _Alarm_LED (round __Alarm_LED))
   (setq _Shutdown (round __Shutdown))
   (setq _Multi_Turn_Offset (round __Multi_Turn_Offset))
   (setq _Resolution_Divider (round __Resolution_Divider))
   (setq _Torque_Enable (round __Torque_Enable))
   (setq _LED (round __LED))
   (setq _D_gain (round __D_gain))
   (setq _I_gain (round __I_gain))
   (setq _P_gain (round __P_gain))
   (setq _Goal_Position (round __Goal_Position))
   (setq _Moving_Speed (round __Moving_Speed))
   (setq _Torque_Limit (round __Torque_Limit))
   (setq _Present_Position (round __Present_Position))
   (setq _Present_Speed (round __Present_Speed))
   (setq _Present_Load (round __Present_Load))
   (setq _Present_Voltage (round __Present_Voltage))
   (setq _Present_Temperature (round __Present_Temperature))
   (setq _Registered (round __Registered))
   (setq _Moving (round __Moving))
   (setq _Lock (round __Lock))
   (setq _Punch (round __Punch))
   (setq _Current (round __Current))
   (setq _Torque_Control_Mode_Enable (round __Torque_Control_Mode_Enable))
   (setq _Goal_Torque (round __Goal_Torque))
   (setq _Goal_Acceleration (round __Goal_Acceleration))
   self)
  (:Model_Number
   (&optional __Model_Number)
   (if __Model_Number (setq _Model_Number __Model_Number)) _Model_Number)
  (:Firmware_Version
   (&optional __Firmware_Version)
   (if __Firmware_Version (setq _Firmware_Version __Firmware_Version)) _Firmware_Version)
  (:ID
   (&optional __ID)
   (if __ID (setq _ID __ID)) _ID)
  (:Baud_Rate
   (&optional __Baud_Rate)
   (if __Baud_Rate (setq _Baud_Rate __Baud_Rate)) _Baud_Rate)
  (:Return_Delay_Time
   (&optional __Return_Delay_Time)
   (if __Return_Delay_Time (setq _Return_Delay_Time __Return_Delay_Time)) _Return_Delay_Time)
  (:CW_Angle_Limit
   (&optional __CW_Angle_Limit)
   (if __CW_Angle_Limit (setq _CW_Angle_Limit __CW_Angle_Limit)) _CW_Angle_Limit)
  (:CCW_Angle_Limit
   (&optional __CCW_Angle_Limit)
   (if __CCW_Angle_Limit (setq _CCW_Angle_Limit __CCW_Angle_Limit)) _CCW_Angle_Limit)
  (:Temperature_Limit
   (&optional __Temperature_Limit)
   (if __Temperature_Limit (setq _Temperature_Limit __Temperature_Limit)) _Temperature_Limit)
  (:Min_Voltage_Limit
   (&optional __Min_Voltage_Limit)
   (if __Min_Voltage_Limit (setq _Min_Voltage_Limit __Min_Voltage_Limit)) _Min_Voltage_Limit)
  (:Max_Voltage_Limit
   (&optional __Max_Voltage_Limit)
   (if __Max_Voltage_Limit (setq _Max_Voltage_Limit __Max_Voltage_Limit)) _Max_Voltage_Limit)
  (:Max_Torque
   (&optional __Max_Torque)
   (if __Max_Torque (setq _Max_Torque __Max_Torque)) _Max_Torque)
  (:Status_Return_Level
   (&optional __Status_Return_Level)
   (if __Status_Return_Level (setq _Status_Return_Level __Status_Return_Level)) _Status_Return_Level)
  (:Alarm_LED
   (&optional __Alarm_LED)
   (if __Alarm_LED (setq _Alarm_LED __Alarm_LED)) _Alarm_LED)
  (:Shutdown
   (&optional __Shutdown)
   (if __Shutdown (setq _Shutdown __Shutdown)) _Shutdown)
  (:Multi_Turn_Offset
   (&optional __Multi_Turn_Offset)
   (if __Multi_Turn_Offset (setq _Multi_Turn_Offset __Multi_Turn_Offset)) _Multi_Turn_Offset)
  (:Resolution_Divider
   (&optional __Resolution_Divider)
   (if __Resolution_Divider (setq _Resolution_Divider __Resolution_Divider)) _Resolution_Divider)
  (:Torque_Enable
   (&optional __Torque_Enable)
   (if __Torque_Enable (setq _Torque_Enable __Torque_Enable)) _Torque_Enable)
  (:LED
   (&optional __LED)
   (if __LED (setq _LED __LED)) _LED)
  (:D_gain
   (&optional __D_gain)
   (if __D_gain (setq _D_gain __D_gain)) _D_gain)
  (:I_gain
   (&optional __I_gain)
   (if __I_gain (setq _I_gain __I_gain)) _I_gain)
  (:P_gain
   (&optional __P_gain)
   (if __P_gain (setq _P_gain __P_gain)) _P_gain)
  (:Goal_Position
   (&optional __Goal_Position)
   (if __Goal_Position (setq _Goal_Position __Goal_Position)) _Goal_Position)
  (:Moving_Speed
   (&optional __Moving_Speed)
   (if __Moving_Speed (setq _Moving_Speed __Moving_Speed)) _Moving_Speed)
  (:Torque_Limit
   (&optional __Torque_Limit)
   (if __Torque_Limit (setq _Torque_Limit __Torque_Limit)) _Torque_Limit)
  (:Present_Position
   (&optional __Present_Position)
   (if __Present_Position (setq _Present_Position __Present_Position)) _Present_Position)
  (:Present_Speed
   (&optional __Present_Speed)
   (if __Present_Speed (setq _Present_Speed __Present_Speed)) _Present_Speed)
  (:Present_Load
   (&optional __Present_Load)
   (if __Present_Load (setq _Present_Load __Present_Load)) _Present_Load)
  (:Present_Voltage
   (&optional __Present_Voltage)
   (if __Present_Voltage (setq _Present_Voltage __Present_Voltage)) _Present_Voltage)
  (:Present_Temperature
   (&optional __Present_Temperature)
   (if __Present_Temperature (setq _Present_Temperature __Present_Temperature)) _Present_Temperature)
  (:Registered
   (&optional __Registered)
   (if __Registered (setq _Registered __Registered)) _Registered)
  (:Moving
   (&optional __Moving)
   (if __Moving (setq _Moving __Moving)) _Moving)
  (:Lock
   (&optional __Lock)
   (if __Lock (setq _Lock __Lock)) _Lock)
  (:Punch
   (&optional __Punch)
   (if __Punch (setq _Punch __Punch)) _Punch)
  (:Current
   (&optional __Current)
   (if __Current (setq _Current __Current)) _Current)
  (:Torque_Control_Mode_Enable
   (&optional __Torque_Control_Mode_Enable)
   (if __Torque_Control_Mode_Enable (setq _Torque_Control_Mode_Enable __Torque_Control_Mode_Enable)) _Torque_Control_Mode_Enable)
  (:Goal_Torque
   (&optional __Goal_Torque)
   (if __Goal_Torque (setq _Goal_Torque __Goal_Torque)) _Goal_Torque)
  (:Goal_Acceleration
   (&optional __Goal_Acceleration)
   (if __Goal_Acceleration (setq _Goal_Acceleration __Goal_Acceleration)) _Goal_Acceleration)
  (:serialization-length
   ()
   (+
    ;; uint16 _Model_Number
    2
    ;; uint8 _Firmware_Version
    1
    ;; uint8 _ID
    1
    ;; uint8 _Baud_Rate
    1
    ;; uint8 _Return_Delay_Time
    1
    ;; uint16 _CW_Angle_Limit
    2
    ;; uint16 _CCW_Angle_Limit
    2
    ;; uint8 _Temperature_Limit
    1
    ;; uint8 _Min_Voltage_Limit
    1
    ;; uint8 _Max_Voltage_Limit
    1
    ;; uint16 _Max_Torque
    2
    ;; uint8 _Status_Return_Level
    1
    ;; uint8 _Alarm_LED
    1
    ;; uint8 _Shutdown
    1
    ;; uint16 _Multi_Turn_Offset
    2
    ;; uint8 _Resolution_Divider
    1
    ;; uint8 _Torque_Enable
    1
    ;; uint8 _LED
    1
    ;; uint8 _D_gain
    1
    ;; uint8 _I_gain
    1
    ;; uint8 _P_gain
    1
    ;; uint16 _Goal_Position
    2
    ;; uint16 _Moving_Speed
    2
    ;; uint16 _Torque_Limit
    2
    ;; uint16 _Present_Position
    2
    ;; uint16 _Present_Speed
    2
    ;; uint16 _Present_Load
    2
    ;; uint8 _Present_Voltage
    1
    ;; uint8 _Present_Temperature
    1
    ;; uint8 _Registered
    1
    ;; uint8 _Moving
    1
    ;; uint8 _Lock
    1
    ;; uint16 _Punch
    2
    ;; uint16 _Current
    2
    ;; uint8 _Torque_Control_Mode_Enable
    1
    ;; uint16 _Goal_Torque
    2
    ;; uint8 _Goal_Acceleration
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16 _Model_Number
       (write-word _Model_Number s)
     ;; uint8 _Firmware_Version
       (write-byte _Firmware_Version s)
     ;; uint8 _ID
       (write-byte _ID s)
     ;; uint8 _Baud_Rate
       (write-byte _Baud_Rate s)
     ;; uint8 _Return_Delay_Time
       (write-byte _Return_Delay_Time s)
     ;; uint16 _CW_Angle_Limit
       (write-word _CW_Angle_Limit s)
     ;; uint16 _CCW_Angle_Limit
       (write-word _CCW_Angle_Limit s)
     ;; uint8 _Temperature_Limit
       (write-byte _Temperature_Limit s)
     ;; uint8 _Min_Voltage_Limit
       (write-byte _Min_Voltage_Limit s)
     ;; uint8 _Max_Voltage_Limit
       (write-byte _Max_Voltage_Limit s)
     ;; uint16 _Max_Torque
       (write-word _Max_Torque s)
     ;; uint8 _Status_Return_Level
       (write-byte _Status_Return_Level s)
     ;; uint8 _Alarm_LED
       (write-byte _Alarm_LED s)
     ;; uint8 _Shutdown
       (write-byte _Shutdown s)
     ;; uint16 _Multi_Turn_Offset
       (write-word _Multi_Turn_Offset s)
     ;; uint8 _Resolution_Divider
       (write-byte _Resolution_Divider s)
     ;; uint8 _Torque_Enable
       (write-byte _Torque_Enable s)
     ;; uint8 _LED
       (write-byte _LED s)
     ;; uint8 _D_gain
       (write-byte _D_gain s)
     ;; uint8 _I_gain
       (write-byte _I_gain s)
     ;; uint8 _P_gain
       (write-byte _P_gain s)
     ;; uint16 _Goal_Position
       (write-word _Goal_Position s)
     ;; uint16 _Moving_Speed
       (write-word _Moving_Speed s)
     ;; uint16 _Torque_Limit
       (write-word _Torque_Limit s)
     ;; uint16 _Present_Position
       (write-word _Present_Position s)
     ;; uint16 _Present_Speed
       (write-word _Present_Speed s)
     ;; uint16 _Present_Load
       (write-word _Present_Load s)
     ;; uint8 _Present_Voltage
       (write-byte _Present_Voltage s)
     ;; uint8 _Present_Temperature
       (write-byte _Present_Temperature s)
     ;; uint8 _Registered
       (write-byte _Registered s)
     ;; uint8 _Moving
       (write-byte _Moving s)
     ;; uint8 _Lock
       (write-byte _Lock s)
     ;; uint16 _Punch
       (write-word _Punch s)
     ;; uint16 _Current
       (write-word _Current s)
     ;; uint8 _Torque_Control_Mode_Enable
       (write-byte _Torque_Control_Mode_Enable s)
     ;; uint16 _Goal_Torque
       (write-word _Goal_Torque s)
     ;; uint8 _Goal_Acceleration
       (write-byte _Goal_Acceleration s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16 _Model_Number
     (setq _Model_Number (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _Firmware_Version
     (setq _Firmware_Version (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _ID
     (setq _ID (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Baud_Rate
     (setq _Baud_Rate (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Return_Delay_Time
     (setq _Return_Delay_Time (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint16 _CW_Angle_Limit
     (setq _CW_Angle_Limit (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _CCW_Angle_Limit
     (setq _CCW_Angle_Limit (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _Temperature_Limit
     (setq _Temperature_Limit (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Min_Voltage_Limit
     (setq _Min_Voltage_Limit (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Max_Voltage_Limit
     (setq _Max_Voltage_Limit (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint16 _Max_Torque
     (setq _Max_Torque (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _Status_Return_Level
     (setq _Status_Return_Level (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Alarm_LED
     (setq _Alarm_LED (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Shutdown
     (setq _Shutdown (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint16 _Multi_Turn_Offset
     (setq _Multi_Turn_Offset (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _Resolution_Divider
     (setq _Resolution_Divider (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Torque_Enable
     (setq _Torque_Enable (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _LED
     (setq _LED (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _D_gain
     (setq _D_gain (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _I_gain
     (setq _I_gain (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _P_gain
     (setq _P_gain (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint16 _Goal_Position
     (setq _Goal_Position (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _Moving_Speed
     (setq _Moving_Speed (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _Torque_Limit
     (setq _Torque_Limit (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _Present_Position
     (setq _Present_Position (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _Present_Speed
     (setq _Present_Speed (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _Present_Load
     (setq _Present_Load (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _Present_Voltage
     (setq _Present_Voltage (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Present_Temperature
     (setq _Present_Temperature (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Registered
     (setq _Registered (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Moving
     (setq _Moving (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Lock
     (setq _Lock (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint16 _Punch
     (setq _Punch (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _Current
     (setq _Current (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _Torque_Control_Mode_Enable
     (setq _Torque_Control_Mode_Enable (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint16 _Goal_Torque
     (setq _Goal_Torque (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _Goal_Acceleration
     (setq _Goal_Acceleration (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get dynamixel_workbench_msgs::MXExt :md5sum-) "2fbd27c9b5d24a5196a094d168160140")
(setf (get dynamixel_workbench_msgs::MXExt :datatype-) "dynamixel_workbench_msgs/MXExt")
(setf (get dynamixel_workbench_msgs::MXExt :definition-)
      "# This message is compatible with control table of Dynamixel MX Series (MX-64T/MX64-R/MX-64AT/MX-64AR, MX-106T/MX-106R)
# If you want to specific information about control table, please follow the link (http://emanual.robotis.com/)

uint16 Model_Number
uint8  Firmware_Version
uint8  ID
uint8  Baud_Rate
uint8  Return_Delay_Time
uint16 CW_Angle_Limit
uint16 CCW_Angle_Limit
uint8  Temperature_Limit
uint8  Min_Voltage_Limit
uint8  Max_Voltage_Limit
uint16 Max_Torque
uint8  Status_Return_Level
uint8  Alarm_LED
uint8  Shutdown
uint16 Multi_Turn_Offset
uint8  Resolution_Divider

uint8  Torque_Enable
uint8  LED
uint8  D_gain
uint8  I_gain
uint8  P_gain
uint16 Goal_Position
uint16 Moving_Speed
uint16 Torque_Limit
uint16 Present_Position
uint16 Present_Speed
uint16 Present_Load
uint8  Present_Voltage
uint8  Present_Temperature
uint8  Registered
uint8  Moving
uint8  Lock
uint16 Punch
uint16 Current
uint8  Torque_Control_Mode_Enable
uint16 Goal_Torque
uint8  Goal_Acceleration

")



(provide :dynamixel_workbench_msgs/MXExt "2fbd27c9b5d24a5196a094d168160140")


