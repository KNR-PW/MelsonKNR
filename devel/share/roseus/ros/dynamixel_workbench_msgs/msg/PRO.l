;; Auto-generated. Do not edit!


(when (boundp 'dynamixel_workbench_msgs::PRO)
  (if (not (find-package "DYNAMIXEL_WORKBENCH_MSGS"))
    (make-package "DYNAMIXEL_WORKBENCH_MSGS"))
  (shadow 'PRO (find-package "DYNAMIXEL_WORKBENCH_MSGS")))
(unless (find-package "DYNAMIXEL_WORKBENCH_MSGS::PRO")
  (make-package "DYNAMIXEL_WORKBENCH_MSGS::PRO"))

(in-package "ROS")
;;//! \htmlinclude PRO.msg.html


(defclass dynamixel_workbench_msgs::PRO
  :super ros::object
  :slots (_Model_Number _Firmware_Version _ID _Baud_Rate _Return_Delay_Time _Operating_Mode _Moving_Threshold _Temperature_Limit _Max_Voltage_Limit _Min_Voltage_Limit _Acceleration_Limit _Torque_Limit _Velocity_Limit _Max_Position_Limit _Min_Position_Limit _External_Port_Mode_1 _External_Port_Mode_2 _External_Port_Mode_3 _External_Port_Mode_4 _Shutdown _Torque_Enable _LED_RED _LED_GREEN _LED_BLUE _Velocity_I_Gain _Velocity_P_Gain _Position_P_Gain _Goal_Position _Goal_Velocity _Goal_Torque _Goal_Acceleration _Moving _Present_Position _Present_Velocity _Present_Current _Present_Input_Voltage _Present_Temperature _Registered_Instruction _Status_Return_Level _Hardware_Error_Status ))

(defmethod dynamixel_workbench_msgs::PRO
  (:init
   (&key
    ((:Model_Number __Model_Number) 0)
    ((:Firmware_Version __Firmware_Version) 0)
    ((:ID __ID) 0)
    ((:Baud_Rate __Baud_Rate) 0)
    ((:Return_Delay_Time __Return_Delay_Time) 0)
    ((:Operating_Mode __Operating_Mode) 0)
    ((:Moving_Threshold __Moving_Threshold) 0)
    ((:Temperature_Limit __Temperature_Limit) 0)
    ((:Max_Voltage_Limit __Max_Voltage_Limit) 0)
    ((:Min_Voltage_Limit __Min_Voltage_Limit) 0)
    ((:Acceleration_Limit __Acceleration_Limit) 0)
    ((:Torque_Limit __Torque_Limit) 0)
    ((:Velocity_Limit __Velocity_Limit) 0)
    ((:Max_Position_Limit __Max_Position_Limit) 0)
    ((:Min_Position_Limit __Min_Position_Limit) 0)
    ((:External_Port_Mode_1 __External_Port_Mode_1) 0)
    ((:External_Port_Mode_2 __External_Port_Mode_2) 0)
    ((:External_Port_Mode_3 __External_Port_Mode_3) 0)
    ((:External_Port_Mode_4 __External_Port_Mode_4) 0)
    ((:Shutdown __Shutdown) 0)
    ((:Torque_Enable __Torque_Enable) 0)
    ((:LED_RED __LED_RED) 0)
    ((:LED_GREEN __LED_GREEN) 0)
    ((:LED_BLUE __LED_BLUE) 0)
    ((:Velocity_I_Gain __Velocity_I_Gain) 0)
    ((:Velocity_P_Gain __Velocity_P_Gain) 0)
    ((:Position_P_Gain __Position_P_Gain) 0)
    ((:Goal_Position __Goal_Position) 0)
    ((:Goal_Velocity __Goal_Velocity) 0)
    ((:Goal_Torque __Goal_Torque) 0)
    ((:Goal_Acceleration __Goal_Acceleration) 0)
    ((:Moving __Moving) 0)
    ((:Present_Position __Present_Position) 0)
    ((:Present_Velocity __Present_Velocity) 0)
    ((:Present_Current __Present_Current) 0)
    ((:Present_Input_Voltage __Present_Input_Voltage) 0)
    ((:Present_Temperature __Present_Temperature) 0)
    ((:Registered_Instruction __Registered_Instruction) 0)
    ((:Status_Return_Level __Status_Return_Level) 0)
    ((:Hardware_Error_Status __Hardware_Error_Status) 0)
    )
   (send-super :init)
   (setq _Model_Number (round __Model_Number))
   (setq _Firmware_Version (round __Firmware_Version))
   (setq _ID (round __ID))
   (setq _Baud_Rate (round __Baud_Rate))
   (setq _Return_Delay_Time (round __Return_Delay_Time))
   (setq _Operating_Mode (round __Operating_Mode))
   (setq _Moving_Threshold (round __Moving_Threshold))
   (setq _Temperature_Limit (round __Temperature_Limit))
   (setq _Max_Voltage_Limit (round __Max_Voltage_Limit))
   (setq _Min_Voltage_Limit (round __Min_Voltage_Limit))
   (setq _Acceleration_Limit (round __Acceleration_Limit))
   (setq _Torque_Limit (round __Torque_Limit))
   (setq _Velocity_Limit (round __Velocity_Limit))
   (setq _Max_Position_Limit (round __Max_Position_Limit))
   (setq _Min_Position_Limit (round __Min_Position_Limit))
   (setq _External_Port_Mode_1 (round __External_Port_Mode_1))
   (setq _External_Port_Mode_2 (round __External_Port_Mode_2))
   (setq _External_Port_Mode_3 (round __External_Port_Mode_3))
   (setq _External_Port_Mode_4 (round __External_Port_Mode_4))
   (setq _Shutdown (round __Shutdown))
   (setq _Torque_Enable (round __Torque_Enable))
   (setq _LED_RED (round __LED_RED))
   (setq _LED_GREEN (round __LED_GREEN))
   (setq _LED_BLUE (round __LED_BLUE))
   (setq _Velocity_I_Gain (round __Velocity_I_Gain))
   (setq _Velocity_P_Gain (round __Velocity_P_Gain))
   (setq _Position_P_Gain (round __Position_P_Gain))
   (setq _Goal_Position (round __Goal_Position))
   (setq _Goal_Velocity (round __Goal_Velocity))
   (setq _Goal_Torque (round __Goal_Torque))
   (setq _Goal_Acceleration (round __Goal_Acceleration))
   (setq _Moving (round __Moving))
   (setq _Present_Position (round __Present_Position))
   (setq _Present_Velocity (round __Present_Velocity))
   (setq _Present_Current (round __Present_Current))
   (setq _Present_Input_Voltage (round __Present_Input_Voltage))
   (setq _Present_Temperature (round __Present_Temperature))
   (setq _Registered_Instruction (round __Registered_Instruction))
   (setq _Status_Return_Level (round __Status_Return_Level))
   (setq _Hardware_Error_Status (round __Hardware_Error_Status))
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
  (:Operating_Mode
   (&optional __Operating_Mode)
   (if __Operating_Mode (setq _Operating_Mode __Operating_Mode)) _Operating_Mode)
  (:Moving_Threshold
   (&optional __Moving_Threshold)
   (if __Moving_Threshold (setq _Moving_Threshold __Moving_Threshold)) _Moving_Threshold)
  (:Temperature_Limit
   (&optional __Temperature_Limit)
   (if __Temperature_Limit (setq _Temperature_Limit __Temperature_Limit)) _Temperature_Limit)
  (:Max_Voltage_Limit
   (&optional __Max_Voltage_Limit)
   (if __Max_Voltage_Limit (setq _Max_Voltage_Limit __Max_Voltage_Limit)) _Max_Voltage_Limit)
  (:Min_Voltage_Limit
   (&optional __Min_Voltage_Limit)
   (if __Min_Voltage_Limit (setq _Min_Voltage_Limit __Min_Voltage_Limit)) _Min_Voltage_Limit)
  (:Acceleration_Limit
   (&optional __Acceleration_Limit)
   (if __Acceleration_Limit (setq _Acceleration_Limit __Acceleration_Limit)) _Acceleration_Limit)
  (:Torque_Limit
   (&optional __Torque_Limit)
   (if __Torque_Limit (setq _Torque_Limit __Torque_Limit)) _Torque_Limit)
  (:Velocity_Limit
   (&optional __Velocity_Limit)
   (if __Velocity_Limit (setq _Velocity_Limit __Velocity_Limit)) _Velocity_Limit)
  (:Max_Position_Limit
   (&optional __Max_Position_Limit)
   (if __Max_Position_Limit (setq _Max_Position_Limit __Max_Position_Limit)) _Max_Position_Limit)
  (:Min_Position_Limit
   (&optional __Min_Position_Limit)
   (if __Min_Position_Limit (setq _Min_Position_Limit __Min_Position_Limit)) _Min_Position_Limit)
  (:External_Port_Mode_1
   (&optional __External_Port_Mode_1)
   (if __External_Port_Mode_1 (setq _External_Port_Mode_1 __External_Port_Mode_1)) _External_Port_Mode_1)
  (:External_Port_Mode_2
   (&optional __External_Port_Mode_2)
   (if __External_Port_Mode_2 (setq _External_Port_Mode_2 __External_Port_Mode_2)) _External_Port_Mode_2)
  (:External_Port_Mode_3
   (&optional __External_Port_Mode_3)
   (if __External_Port_Mode_3 (setq _External_Port_Mode_3 __External_Port_Mode_3)) _External_Port_Mode_3)
  (:External_Port_Mode_4
   (&optional __External_Port_Mode_4)
   (if __External_Port_Mode_4 (setq _External_Port_Mode_4 __External_Port_Mode_4)) _External_Port_Mode_4)
  (:Shutdown
   (&optional __Shutdown)
   (if __Shutdown (setq _Shutdown __Shutdown)) _Shutdown)
  (:Torque_Enable
   (&optional __Torque_Enable)
   (if __Torque_Enable (setq _Torque_Enable __Torque_Enable)) _Torque_Enable)
  (:LED_RED
   (&optional __LED_RED)
   (if __LED_RED (setq _LED_RED __LED_RED)) _LED_RED)
  (:LED_GREEN
   (&optional __LED_GREEN)
   (if __LED_GREEN (setq _LED_GREEN __LED_GREEN)) _LED_GREEN)
  (:LED_BLUE
   (&optional __LED_BLUE)
   (if __LED_BLUE (setq _LED_BLUE __LED_BLUE)) _LED_BLUE)
  (:Velocity_I_Gain
   (&optional __Velocity_I_Gain)
   (if __Velocity_I_Gain (setq _Velocity_I_Gain __Velocity_I_Gain)) _Velocity_I_Gain)
  (:Velocity_P_Gain
   (&optional __Velocity_P_Gain)
   (if __Velocity_P_Gain (setq _Velocity_P_Gain __Velocity_P_Gain)) _Velocity_P_Gain)
  (:Position_P_Gain
   (&optional __Position_P_Gain)
   (if __Position_P_Gain (setq _Position_P_Gain __Position_P_Gain)) _Position_P_Gain)
  (:Goal_Position
   (&optional __Goal_Position)
   (if __Goal_Position (setq _Goal_Position __Goal_Position)) _Goal_Position)
  (:Goal_Velocity
   (&optional __Goal_Velocity)
   (if __Goal_Velocity (setq _Goal_Velocity __Goal_Velocity)) _Goal_Velocity)
  (:Goal_Torque
   (&optional __Goal_Torque)
   (if __Goal_Torque (setq _Goal_Torque __Goal_Torque)) _Goal_Torque)
  (:Goal_Acceleration
   (&optional __Goal_Acceleration)
   (if __Goal_Acceleration (setq _Goal_Acceleration __Goal_Acceleration)) _Goal_Acceleration)
  (:Moving
   (&optional __Moving)
   (if __Moving (setq _Moving __Moving)) _Moving)
  (:Present_Position
   (&optional __Present_Position)
   (if __Present_Position (setq _Present_Position __Present_Position)) _Present_Position)
  (:Present_Velocity
   (&optional __Present_Velocity)
   (if __Present_Velocity (setq _Present_Velocity __Present_Velocity)) _Present_Velocity)
  (:Present_Current
   (&optional __Present_Current)
   (if __Present_Current (setq _Present_Current __Present_Current)) _Present_Current)
  (:Present_Input_Voltage
   (&optional __Present_Input_Voltage)
   (if __Present_Input_Voltage (setq _Present_Input_Voltage __Present_Input_Voltage)) _Present_Input_Voltage)
  (:Present_Temperature
   (&optional __Present_Temperature)
   (if __Present_Temperature (setq _Present_Temperature __Present_Temperature)) _Present_Temperature)
  (:Registered_Instruction
   (&optional __Registered_Instruction)
   (if __Registered_Instruction (setq _Registered_Instruction __Registered_Instruction)) _Registered_Instruction)
  (:Status_Return_Level
   (&optional __Status_Return_Level)
   (if __Status_Return_Level (setq _Status_Return_Level __Status_Return_Level)) _Status_Return_Level)
  (:Hardware_Error_Status
   (&optional __Hardware_Error_Status)
   (if __Hardware_Error_Status (setq _Hardware_Error_Status __Hardware_Error_Status)) _Hardware_Error_Status)
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
    ;; uint8 _Operating_Mode
    1
    ;; uint32 _Moving_Threshold
    4
    ;; uint8 _Temperature_Limit
    1
    ;; uint16 _Max_Voltage_Limit
    2
    ;; uint16 _Min_Voltage_Limit
    2
    ;; uint32 _Acceleration_Limit
    4
    ;; uint16 _Torque_Limit
    2
    ;; uint32 _Velocity_Limit
    4
    ;; int32 _Max_Position_Limit
    4
    ;; int32 _Min_Position_Limit
    4
    ;; uint8 _External_Port_Mode_1
    1
    ;; uint8 _External_Port_Mode_2
    1
    ;; uint8 _External_Port_Mode_3
    1
    ;; uint8 _External_Port_Mode_4
    1
    ;; uint8 _Shutdown
    1
    ;; uint8 _Torque_Enable
    1
    ;; uint8 _LED_RED
    1
    ;; uint8 _LED_GREEN
    1
    ;; uint8 _LED_BLUE
    1
    ;; uint16 _Velocity_I_Gain
    2
    ;; uint16 _Velocity_P_Gain
    2
    ;; uint16 _Position_P_Gain
    2
    ;; int32 _Goal_Position
    4
    ;; uint32 _Goal_Velocity
    4
    ;; uint16 _Goal_Torque
    2
    ;; int32 _Goal_Acceleration
    4
    ;; uint8 _Moving
    1
    ;; int32 _Present_Position
    4
    ;; uint32 _Present_Velocity
    4
    ;; uint16 _Present_Current
    2
    ;; uint16 _Present_Input_Voltage
    2
    ;; uint8 _Present_Temperature
    1
    ;; uint8 _Registered_Instruction
    1
    ;; uint8 _Status_Return_Level
    1
    ;; uint8 _Hardware_Error_Status
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
     ;; uint8 _Operating_Mode
       (write-byte _Operating_Mode s)
     ;; uint32 _Moving_Threshold
       (write-long _Moving_Threshold s)
     ;; uint8 _Temperature_Limit
       (write-byte _Temperature_Limit s)
     ;; uint16 _Max_Voltage_Limit
       (write-word _Max_Voltage_Limit s)
     ;; uint16 _Min_Voltage_Limit
       (write-word _Min_Voltage_Limit s)
     ;; uint32 _Acceleration_Limit
       (write-long _Acceleration_Limit s)
     ;; uint16 _Torque_Limit
       (write-word _Torque_Limit s)
     ;; uint32 _Velocity_Limit
       (write-long _Velocity_Limit s)
     ;; int32 _Max_Position_Limit
       (write-long _Max_Position_Limit s)
     ;; int32 _Min_Position_Limit
       (write-long _Min_Position_Limit s)
     ;; uint8 _External_Port_Mode_1
       (write-byte _External_Port_Mode_1 s)
     ;; uint8 _External_Port_Mode_2
       (write-byte _External_Port_Mode_2 s)
     ;; uint8 _External_Port_Mode_3
       (write-byte _External_Port_Mode_3 s)
     ;; uint8 _External_Port_Mode_4
       (write-byte _External_Port_Mode_4 s)
     ;; uint8 _Shutdown
       (write-byte _Shutdown s)
     ;; uint8 _Torque_Enable
       (write-byte _Torque_Enable s)
     ;; uint8 _LED_RED
       (write-byte _LED_RED s)
     ;; uint8 _LED_GREEN
       (write-byte _LED_GREEN s)
     ;; uint8 _LED_BLUE
       (write-byte _LED_BLUE s)
     ;; uint16 _Velocity_I_Gain
       (write-word _Velocity_I_Gain s)
     ;; uint16 _Velocity_P_Gain
       (write-word _Velocity_P_Gain s)
     ;; uint16 _Position_P_Gain
       (write-word _Position_P_Gain s)
     ;; int32 _Goal_Position
       (write-long _Goal_Position s)
     ;; uint32 _Goal_Velocity
       (write-long _Goal_Velocity s)
     ;; uint16 _Goal_Torque
       (write-word _Goal_Torque s)
     ;; int32 _Goal_Acceleration
       (write-long _Goal_Acceleration s)
     ;; uint8 _Moving
       (write-byte _Moving s)
     ;; int32 _Present_Position
       (write-long _Present_Position s)
     ;; uint32 _Present_Velocity
       (write-long _Present_Velocity s)
     ;; uint16 _Present_Current
       (write-word _Present_Current s)
     ;; uint16 _Present_Input_Voltage
       (write-word _Present_Input_Voltage s)
     ;; uint8 _Present_Temperature
       (write-byte _Present_Temperature s)
     ;; uint8 _Registered_Instruction
       (write-byte _Registered_Instruction s)
     ;; uint8 _Status_Return_Level
       (write-byte _Status_Return_Level s)
     ;; uint8 _Hardware_Error_Status
       (write-byte _Hardware_Error_Status s)
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
   ;; uint8 _Operating_Mode
     (setq _Operating_Mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint32 _Moving_Threshold
     (setq _Moving_Threshold (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8 _Temperature_Limit
     (setq _Temperature_Limit (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint16 _Max_Voltage_Limit
     (setq _Max_Voltage_Limit (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _Min_Voltage_Limit
     (setq _Min_Voltage_Limit (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint32 _Acceleration_Limit
     (setq _Acceleration_Limit (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint16 _Torque_Limit
     (setq _Torque_Limit (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint32 _Velocity_Limit
     (setq _Velocity_Limit (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _Max_Position_Limit
     (setq _Max_Position_Limit (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _Min_Position_Limit
     (setq _Min_Position_Limit (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8 _External_Port_Mode_1
     (setq _External_Port_Mode_1 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _External_Port_Mode_2
     (setq _External_Port_Mode_2 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _External_Port_Mode_3
     (setq _External_Port_Mode_3 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _External_Port_Mode_4
     (setq _External_Port_Mode_4 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Shutdown
     (setq _Shutdown (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Torque_Enable
     (setq _Torque_Enable (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _LED_RED
     (setq _LED_RED (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _LED_GREEN
     (setq _LED_GREEN (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _LED_BLUE
     (setq _LED_BLUE (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint16 _Velocity_I_Gain
     (setq _Velocity_I_Gain (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _Velocity_P_Gain
     (setq _Velocity_P_Gain (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _Position_P_Gain
     (setq _Position_P_Gain (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int32 _Goal_Position
     (setq _Goal_Position (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _Goal_Velocity
     (setq _Goal_Velocity (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint16 _Goal_Torque
     (setq _Goal_Torque (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int32 _Goal_Acceleration
     (setq _Goal_Acceleration (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8 _Moving
     (setq _Moving (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; int32 _Present_Position
     (setq _Present_Position (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _Present_Velocity
     (setq _Present_Velocity (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint16 _Present_Current
     (setq _Present_Current (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _Present_Input_Voltage
     (setq _Present_Input_Voltage (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _Present_Temperature
     (setq _Present_Temperature (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Registered_Instruction
     (setq _Registered_Instruction (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Status_Return_Level
     (setq _Status_Return_Level (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Hardware_Error_Status
     (setq _Hardware_Error_Status (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get dynamixel_workbench_msgs::PRO :md5sum-) "c0387b4038d0572ab0d83e71bcb8fa5e")
(setf (get dynamixel_workbench_msgs::PRO :datatype-) "dynamixel_workbench_msgs/PRO")
(setf (get dynamixel_workbench_msgs::PRO :definition-)
      "# This message is compatible with control table of Dynamixel PRO L42-10-S300-R
# If you want to specific information about control table, please follow the link (http://emanual.robotis.com/)

uint16 Model_Number
uint8  Firmware_Version
uint8  ID
uint8  Baud_Rate
uint8  Return_Delay_Time
uint8  Operating_Mode
uint32 Moving_Threshold
uint8  Temperature_Limit
uint16 Max_Voltage_Limit
uint16 Min_Voltage_Limit
uint32 Acceleration_Limit
uint16 Torque_Limit
uint32 Velocity_Limit
int32  Max_Position_Limit
int32  Min_Position_Limit
uint8  External_Port_Mode_1
uint8  External_Port_Mode_2
uint8  External_Port_Mode_3
uint8  External_Port_Mode_4
uint8  Shutdown

uint8  Torque_Enable
uint8  LED_RED
uint8  LED_GREEN
uint8  LED_BLUE
uint16 Velocity_I_Gain
uint16 Velocity_P_Gain
uint16 Position_P_Gain
int32  Goal_Position
uint32 Goal_Velocity
uint16 Goal_Torque
int32  Goal_Acceleration
uint8  Moving
int32  Present_Position
uint32 Present_Velocity
uint16 Present_Current
uint16 Present_Input_Voltage
uint8  Present_Temperature
uint8  Registered_Instruction
uint8  Status_Return_Level
uint8  Hardware_Error_Status



")



(provide :dynamixel_workbench_msgs/PRO "c0387b4038d0572ab0d83e71bcb8fa5e")


