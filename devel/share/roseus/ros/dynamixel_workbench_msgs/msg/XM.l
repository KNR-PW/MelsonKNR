;; Auto-generated. Do not edit!


(when (boundp 'dynamixel_workbench_msgs::XM)
  (if (not (find-package "DYNAMIXEL_WORKBENCH_MSGS"))
    (make-package "DYNAMIXEL_WORKBENCH_MSGS"))
  (shadow 'XM (find-package "DYNAMIXEL_WORKBENCH_MSGS")))
(unless (find-package "DYNAMIXEL_WORKBENCH_MSGS::XM")
  (make-package "DYNAMIXEL_WORKBENCH_MSGS::XM"))

(in-package "ROS")
;;//! \htmlinclude XM.msg.html


(defclass dynamixel_workbench_msgs::XM
  :super ros::object
  :slots (_Model_Number _Firmware_Version _ID _Baud_Rate _Return_Delay_Time _Drive_Mode _Operating_Mode _Secondary_ID _Protocol_Version _Homing_Offset _Moving_Threshold _Temperature_Limit _Max_Voltage_Limit _Min_Voltage_Limit _PWM_Limit _Current_Limit _Acceleration_Limit _Velocity_Limit _Max_Position_Limit _Min_Position_Limit _Shutdown _Torque_Enable _LED _Status_Return_Level _Registered_Instruction _Hardware_Error_Status _Velocity_I_Gain _Velocity_P_Gain _Position_D_Gain _Position_I_Gain _Position_P_Gain _Feedforward_2nd_Gain _Feedforward_1st_Gain _Bus_Watchdog _Goal_PWM _Goal_Current _Goal_Velocity _Profile_Acceleration _Profile_Velocity _Goal_Position _Realtime_Tick _Moving _Moving_Status _Present_PWM _Present_Load _Present_Current _Present_Velocity _Present_Position _Velocity_Trajectory _Position_Trajectory _Present_Input_Voltage _Present_Temperature ))

(defmethod dynamixel_workbench_msgs::XM
  (:init
   (&key
    ((:Model_Number __Model_Number) 0)
    ((:Firmware_Version __Firmware_Version) 0)
    ((:ID __ID) 0)
    ((:Baud_Rate __Baud_Rate) 0)
    ((:Return_Delay_Time __Return_Delay_Time) 0)
    ((:Drive_Mode __Drive_Mode) 0)
    ((:Operating_Mode __Operating_Mode) 0)
    ((:Secondary_ID __Secondary_ID) 0)
    ((:Protocol_Version __Protocol_Version) 0)
    ((:Homing_Offset __Homing_Offset) 0)
    ((:Moving_Threshold __Moving_Threshold) 0)
    ((:Temperature_Limit __Temperature_Limit) 0)
    ((:Max_Voltage_Limit __Max_Voltage_Limit) 0)
    ((:Min_Voltage_Limit __Min_Voltage_Limit) 0)
    ((:PWM_Limit __PWM_Limit) 0)
    ((:Current_Limit __Current_Limit) 0)
    ((:Acceleration_Limit __Acceleration_Limit) 0)
    ((:Velocity_Limit __Velocity_Limit) 0)
    ((:Max_Position_Limit __Max_Position_Limit) 0)
    ((:Min_Position_Limit __Min_Position_Limit) 0)
    ((:Shutdown __Shutdown) 0)
    ((:Torque_Enable __Torque_Enable) 0)
    ((:LED __LED) 0)
    ((:Status_Return_Level __Status_Return_Level) 0)
    ((:Registered_Instruction __Registered_Instruction) 0)
    ((:Hardware_Error_Status __Hardware_Error_Status) 0)
    ((:Velocity_I_Gain __Velocity_I_Gain) 0)
    ((:Velocity_P_Gain __Velocity_P_Gain) 0)
    ((:Position_D_Gain __Position_D_Gain) 0)
    ((:Position_I_Gain __Position_I_Gain) 0)
    ((:Position_P_Gain __Position_P_Gain) 0)
    ((:Feedforward_2nd_Gain __Feedforward_2nd_Gain) 0)
    ((:Feedforward_1st_Gain __Feedforward_1st_Gain) 0)
    ((:Bus_Watchdog __Bus_Watchdog) 0)
    ((:Goal_PWM __Goal_PWM) 0)
    ((:Goal_Current __Goal_Current) 0)
    ((:Goal_Velocity __Goal_Velocity) 0)
    ((:Profile_Acceleration __Profile_Acceleration) 0)
    ((:Profile_Velocity __Profile_Velocity) 0)
    ((:Goal_Position __Goal_Position) 0)
    ((:Realtime_Tick __Realtime_Tick) 0)
    ((:Moving __Moving) 0)
    ((:Moving_Status __Moving_Status) 0)
    ((:Present_PWM __Present_PWM) 0)
    ((:Present_Load __Present_Load) 0)
    ((:Present_Current __Present_Current) 0)
    ((:Present_Velocity __Present_Velocity) 0)
    ((:Present_Position __Present_Position) 0)
    ((:Velocity_Trajectory __Velocity_Trajectory) 0)
    ((:Position_Trajectory __Position_Trajectory) 0)
    ((:Present_Input_Voltage __Present_Input_Voltage) 0)
    ((:Present_Temperature __Present_Temperature) 0)
    )
   (send-super :init)
   (setq _Model_Number (round __Model_Number))
   (setq _Firmware_Version (round __Firmware_Version))
   (setq _ID (round __ID))
   (setq _Baud_Rate (round __Baud_Rate))
   (setq _Return_Delay_Time (round __Return_Delay_Time))
   (setq _Drive_Mode (round __Drive_Mode))
   (setq _Operating_Mode (round __Operating_Mode))
   (setq _Secondary_ID (round __Secondary_ID))
   (setq _Protocol_Version (round __Protocol_Version))
   (setq _Homing_Offset (round __Homing_Offset))
   (setq _Moving_Threshold (round __Moving_Threshold))
   (setq _Temperature_Limit (round __Temperature_Limit))
   (setq _Max_Voltage_Limit (round __Max_Voltage_Limit))
   (setq _Min_Voltage_Limit (round __Min_Voltage_Limit))
   (setq _PWM_Limit (round __PWM_Limit))
   (setq _Current_Limit (round __Current_Limit))
   (setq _Acceleration_Limit (round __Acceleration_Limit))
   (setq _Velocity_Limit (round __Velocity_Limit))
   (setq _Max_Position_Limit (round __Max_Position_Limit))
   (setq _Min_Position_Limit (round __Min_Position_Limit))
   (setq _Shutdown (round __Shutdown))
   (setq _Torque_Enable (round __Torque_Enable))
   (setq _LED (round __LED))
   (setq _Status_Return_Level (round __Status_Return_Level))
   (setq _Registered_Instruction (round __Registered_Instruction))
   (setq _Hardware_Error_Status (round __Hardware_Error_Status))
   (setq _Velocity_I_Gain (round __Velocity_I_Gain))
   (setq _Velocity_P_Gain (round __Velocity_P_Gain))
   (setq _Position_D_Gain (round __Position_D_Gain))
   (setq _Position_I_Gain (round __Position_I_Gain))
   (setq _Position_P_Gain (round __Position_P_Gain))
   (setq _Feedforward_2nd_Gain (round __Feedforward_2nd_Gain))
   (setq _Feedforward_1st_Gain (round __Feedforward_1st_Gain))
   (setq _Bus_Watchdog (round __Bus_Watchdog))
   (setq _Goal_PWM (round __Goal_PWM))
   (setq _Goal_Current (round __Goal_Current))
   (setq _Goal_Velocity (round __Goal_Velocity))
   (setq _Profile_Acceleration (round __Profile_Acceleration))
   (setq _Profile_Velocity (round __Profile_Velocity))
   (setq _Goal_Position (round __Goal_Position))
   (setq _Realtime_Tick (round __Realtime_Tick))
   (setq _Moving (round __Moving))
   (setq _Moving_Status (round __Moving_Status))
   (setq _Present_PWM (round __Present_PWM))
   (setq _Present_Load (round __Present_Load))
   (setq _Present_Current (round __Present_Current))
   (setq _Present_Velocity (round __Present_Velocity))
   (setq _Present_Position (round __Present_Position))
   (setq _Velocity_Trajectory (round __Velocity_Trajectory))
   (setq _Position_Trajectory (round __Position_Trajectory))
   (setq _Present_Input_Voltage (round __Present_Input_Voltage))
   (setq _Present_Temperature (round __Present_Temperature))
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
  (:Drive_Mode
   (&optional __Drive_Mode)
   (if __Drive_Mode (setq _Drive_Mode __Drive_Mode)) _Drive_Mode)
  (:Operating_Mode
   (&optional __Operating_Mode)
   (if __Operating_Mode (setq _Operating_Mode __Operating_Mode)) _Operating_Mode)
  (:Secondary_ID
   (&optional __Secondary_ID)
   (if __Secondary_ID (setq _Secondary_ID __Secondary_ID)) _Secondary_ID)
  (:Protocol_Version
   (&optional __Protocol_Version)
   (if __Protocol_Version (setq _Protocol_Version __Protocol_Version)) _Protocol_Version)
  (:Homing_Offset
   (&optional __Homing_Offset)
   (if __Homing_Offset (setq _Homing_Offset __Homing_Offset)) _Homing_Offset)
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
  (:PWM_Limit
   (&optional __PWM_Limit)
   (if __PWM_Limit (setq _PWM_Limit __PWM_Limit)) _PWM_Limit)
  (:Current_Limit
   (&optional __Current_Limit)
   (if __Current_Limit (setq _Current_Limit __Current_Limit)) _Current_Limit)
  (:Acceleration_Limit
   (&optional __Acceleration_Limit)
   (if __Acceleration_Limit (setq _Acceleration_Limit __Acceleration_Limit)) _Acceleration_Limit)
  (:Velocity_Limit
   (&optional __Velocity_Limit)
   (if __Velocity_Limit (setq _Velocity_Limit __Velocity_Limit)) _Velocity_Limit)
  (:Max_Position_Limit
   (&optional __Max_Position_Limit)
   (if __Max_Position_Limit (setq _Max_Position_Limit __Max_Position_Limit)) _Max_Position_Limit)
  (:Min_Position_Limit
   (&optional __Min_Position_Limit)
   (if __Min_Position_Limit (setq _Min_Position_Limit __Min_Position_Limit)) _Min_Position_Limit)
  (:Shutdown
   (&optional __Shutdown)
   (if __Shutdown (setq _Shutdown __Shutdown)) _Shutdown)
  (:Torque_Enable
   (&optional __Torque_Enable)
   (if __Torque_Enable (setq _Torque_Enable __Torque_Enable)) _Torque_Enable)
  (:LED
   (&optional __LED)
   (if __LED (setq _LED __LED)) _LED)
  (:Status_Return_Level
   (&optional __Status_Return_Level)
   (if __Status_Return_Level (setq _Status_Return_Level __Status_Return_Level)) _Status_Return_Level)
  (:Registered_Instruction
   (&optional __Registered_Instruction)
   (if __Registered_Instruction (setq _Registered_Instruction __Registered_Instruction)) _Registered_Instruction)
  (:Hardware_Error_Status
   (&optional __Hardware_Error_Status)
   (if __Hardware_Error_Status (setq _Hardware_Error_Status __Hardware_Error_Status)) _Hardware_Error_Status)
  (:Velocity_I_Gain
   (&optional __Velocity_I_Gain)
   (if __Velocity_I_Gain (setq _Velocity_I_Gain __Velocity_I_Gain)) _Velocity_I_Gain)
  (:Velocity_P_Gain
   (&optional __Velocity_P_Gain)
   (if __Velocity_P_Gain (setq _Velocity_P_Gain __Velocity_P_Gain)) _Velocity_P_Gain)
  (:Position_D_Gain
   (&optional __Position_D_Gain)
   (if __Position_D_Gain (setq _Position_D_Gain __Position_D_Gain)) _Position_D_Gain)
  (:Position_I_Gain
   (&optional __Position_I_Gain)
   (if __Position_I_Gain (setq _Position_I_Gain __Position_I_Gain)) _Position_I_Gain)
  (:Position_P_Gain
   (&optional __Position_P_Gain)
   (if __Position_P_Gain (setq _Position_P_Gain __Position_P_Gain)) _Position_P_Gain)
  (:Feedforward_2nd_Gain
   (&optional __Feedforward_2nd_Gain)
   (if __Feedforward_2nd_Gain (setq _Feedforward_2nd_Gain __Feedforward_2nd_Gain)) _Feedforward_2nd_Gain)
  (:Feedforward_1st_Gain
   (&optional __Feedforward_1st_Gain)
   (if __Feedforward_1st_Gain (setq _Feedforward_1st_Gain __Feedforward_1st_Gain)) _Feedforward_1st_Gain)
  (:Bus_Watchdog
   (&optional __Bus_Watchdog)
   (if __Bus_Watchdog (setq _Bus_Watchdog __Bus_Watchdog)) _Bus_Watchdog)
  (:Goal_PWM
   (&optional __Goal_PWM)
   (if __Goal_PWM (setq _Goal_PWM __Goal_PWM)) _Goal_PWM)
  (:Goal_Current
   (&optional __Goal_Current)
   (if __Goal_Current (setq _Goal_Current __Goal_Current)) _Goal_Current)
  (:Goal_Velocity
   (&optional __Goal_Velocity)
   (if __Goal_Velocity (setq _Goal_Velocity __Goal_Velocity)) _Goal_Velocity)
  (:Profile_Acceleration
   (&optional __Profile_Acceleration)
   (if __Profile_Acceleration (setq _Profile_Acceleration __Profile_Acceleration)) _Profile_Acceleration)
  (:Profile_Velocity
   (&optional __Profile_Velocity)
   (if __Profile_Velocity (setq _Profile_Velocity __Profile_Velocity)) _Profile_Velocity)
  (:Goal_Position
   (&optional __Goal_Position)
   (if __Goal_Position (setq _Goal_Position __Goal_Position)) _Goal_Position)
  (:Realtime_Tick
   (&optional __Realtime_Tick)
   (if __Realtime_Tick (setq _Realtime_Tick __Realtime_Tick)) _Realtime_Tick)
  (:Moving
   (&optional __Moving)
   (if __Moving (setq _Moving __Moving)) _Moving)
  (:Moving_Status
   (&optional __Moving_Status)
   (if __Moving_Status (setq _Moving_Status __Moving_Status)) _Moving_Status)
  (:Present_PWM
   (&optional __Present_PWM)
   (if __Present_PWM (setq _Present_PWM __Present_PWM)) _Present_PWM)
  (:Present_Load
   (&optional __Present_Load)
   (if __Present_Load (setq _Present_Load __Present_Load)) _Present_Load)
  (:Present_Current
   (&optional __Present_Current)
   (if __Present_Current (setq _Present_Current __Present_Current)) _Present_Current)
  (:Present_Velocity
   (&optional __Present_Velocity)
   (if __Present_Velocity (setq _Present_Velocity __Present_Velocity)) _Present_Velocity)
  (:Present_Position
   (&optional __Present_Position)
   (if __Present_Position (setq _Present_Position __Present_Position)) _Present_Position)
  (:Velocity_Trajectory
   (&optional __Velocity_Trajectory)
   (if __Velocity_Trajectory (setq _Velocity_Trajectory __Velocity_Trajectory)) _Velocity_Trajectory)
  (:Position_Trajectory
   (&optional __Position_Trajectory)
   (if __Position_Trajectory (setq _Position_Trajectory __Position_Trajectory)) _Position_Trajectory)
  (:Present_Input_Voltage
   (&optional __Present_Input_Voltage)
   (if __Present_Input_Voltage (setq _Present_Input_Voltage __Present_Input_Voltage)) _Present_Input_Voltage)
  (:Present_Temperature
   (&optional __Present_Temperature)
   (if __Present_Temperature (setq _Present_Temperature __Present_Temperature)) _Present_Temperature)
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
    ;; uint8 _Drive_Mode
    1
    ;; uint8 _Operating_Mode
    1
    ;; uint8 _Secondary_ID
    1
    ;; uint8 _Protocol_Version
    1
    ;; int32 _Homing_Offset
    4
    ;; uint32 _Moving_Threshold
    4
    ;; uint8 _Temperature_Limit
    1
    ;; uint16 _Max_Voltage_Limit
    2
    ;; uint16 _Min_Voltage_Limit
    2
    ;; uint16 _PWM_Limit
    2
    ;; uint16 _Current_Limit
    2
    ;; uint32 _Acceleration_Limit
    4
    ;; uint32 _Velocity_Limit
    4
    ;; uint32 _Max_Position_Limit
    4
    ;; uint32 _Min_Position_Limit
    4
    ;; uint8 _Shutdown
    1
    ;; uint8 _Torque_Enable
    1
    ;; uint8 _LED
    1
    ;; uint8 _Status_Return_Level
    1
    ;; uint8 _Registered_Instruction
    1
    ;; uint8 _Hardware_Error_Status
    1
    ;; uint16 _Velocity_I_Gain
    2
    ;; uint16 _Velocity_P_Gain
    2
    ;; uint16 _Position_D_Gain
    2
    ;; uint16 _Position_I_Gain
    2
    ;; uint16 _Position_P_Gain
    2
    ;; uint16 _Feedforward_2nd_Gain
    2
    ;; uint16 _Feedforward_1st_Gain
    2
    ;; uint8 _Bus_Watchdog
    1
    ;; int16 _Goal_PWM
    2
    ;; int16 _Goal_Current
    2
    ;; int32 _Goal_Velocity
    4
    ;; uint32 _Profile_Acceleration
    4
    ;; uint32 _Profile_Velocity
    4
    ;; uint32 _Goal_Position
    4
    ;; uint16 _Realtime_Tick
    2
    ;; uint8 _Moving
    1
    ;; uint8 _Moving_Status
    1
    ;; int16 _Present_PWM
    2
    ;; int16 _Present_Load
    2
    ;; int16 _Present_Current
    2
    ;; int32 _Present_Velocity
    4
    ;; int32 _Present_Position
    4
    ;; uint32 _Velocity_Trajectory
    4
    ;; uint32 _Position_Trajectory
    4
    ;; uint16 _Present_Input_Voltage
    2
    ;; uint8 _Present_Temperature
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
     ;; uint8 _Drive_Mode
       (write-byte _Drive_Mode s)
     ;; uint8 _Operating_Mode
       (write-byte _Operating_Mode s)
     ;; uint8 _Secondary_ID
       (write-byte _Secondary_ID s)
     ;; uint8 _Protocol_Version
       (write-byte _Protocol_Version s)
     ;; int32 _Homing_Offset
       (write-long _Homing_Offset s)
     ;; uint32 _Moving_Threshold
       (write-long _Moving_Threshold s)
     ;; uint8 _Temperature_Limit
       (write-byte _Temperature_Limit s)
     ;; uint16 _Max_Voltage_Limit
       (write-word _Max_Voltage_Limit s)
     ;; uint16 _Min_Voltage_Limit
       (write-word _Min_Voltage_Limit s)
     ;; uint16 _PWM_Limit
       (write-word _PWM_Limit s)
     ;; uint16 _Current_Limit
       (write-word _Current_Limit s)
     ;; uint32 _Acceleration_Limit
       (write-long _Acceleration_Limit s)
     ;; uint32 _Velocity_Limit
       (write-long _Velocity_Limit s)
     ;; uint32 _Max_Position_Limit
       (write-long _Max_Position_Limit s)
     ;; uint32 _Min_Position_Limit
       (write-long _Min_Position_Limit s)
     ;; uint8 _Shutdown
       (write-byte _Shutdown s)
     ;; uint8 _Torque_Enable
       (write-byte _Torque_Enable s)
     ;; uint8 _LED
       (write-byte _LED s)
     ;; uint8 _Status_Return_Level
       (write-byte _Status_Return_Level s)
     ;; uint8 _Registered_Instruction
       (write-byte _Registered_Instruction s)
     ;; uint8 _Hardware_Error_Status
       (write-byte _Hardware_Error_Status s)
     ;; uint16 _Velocity_I_Gain
       (write-word _Velocity_I_Gain s)
     ;; uint16 _Velocity_P_Gain
       (write-word _Velocity_P_Gain s)
     ;; uint16 _Position_D_Gain
       (write-word _Position_D_Gain s)
     ;; uint16 _Position_I_Gain
       (write-word _Position_I_Gain s)
     ;; uint16 _Position_P_Gain
       (write-word _Position_P_Gain s)
     ;; uint16 _Feedforward_2nd_Gain
       (write-word _Feedforward_2nd_Gain s)
     ;; uint16 _Feedforward_1st_Gain
       (write-word _Feedforward_1st_Gain s)
     ;; uint8 _Bus_Watchdog
       (write-byte _Bus_Watchdog s)
     ;; int16 _Goal_PWM
       (write-word _Goal_PWM s)
     ;; int16 _Goal_Current
       (write-word _Goal_Current s)
     ;; int32 _Goal_Velocity
       (write-long _Goal_Velocity s)
     ;; uint32 _Profile_Acceleration
       (write-long _Profile_Acceleration s)
     ;; uint32 _Profile_Velocity
       (write-long _Profile_Velocity s)
     ;; uint32 _Goal_Position
       (write-long _Goal_Position s)
     ;; uint16 _Realtime_Tick
       (write-word _Realtime_Tick s)
     ;; uint8 _Moving
       (write-byte _Moving s)
     ;; uint8 _Moving_Status
       (write-byte _Moving_Status s)
     ;; int16 _Present_PWM
       (write-word _Present_PWM s)
     ;; int16 _Present_Load
       (write-word _Present_Load s)
     ;; int16 _Present_Current
       (write-word _Present_Current s)
     ;; int32 _Present_Velocity
       (write-long _Present_Velocity s)
     ;; int32 _Present_Position
       (write-long _Present_Position s)
     ;; uint32 _Velocity_Trajectory
       (write-long _Velocity_Trajectory s)
     ;; uint32 _Position_Trajectory
       (write-long _Position_Trajectory s)
     ;; uint16 _Present_Input_Voltage
       (write-word _Present_Input_Voltage s)
     ;; uint8 _Present_Temperature
       (write-byte _Present_Temperature s)
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
   ;; uint8 _Drive_Mode
     (setq _Drive_Mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Operating_Mode
     (setq _Operating_Mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Secondary_ID
     (setq _Secondary_ID (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Protocol_Version
     (setq _Protocol_Version (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; int32 _Homing_Offset
     (setq _Homing_Offset (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _Moving_Threshold
     (setq _Moving_Threshold (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8 _Temperature_Limit
     (setq _Temperature_Limit (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint16 _Max_Voltage_Limit
     (setq _Max_Voltage_Limit (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _Min_Voltage_Limit
     (setq _Min_Voltage_Limit (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _PWM_Limit
     (setq _PWM_Limit (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _Current_Limit
     (setq _Current_Limit (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint32 _Acceleration_Limit
     (setq _Acceleration_Limit (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _Velocity_Limit
     (setq _Velocity_Limit (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _Max_Position_Limit
     (setq _Max_Position_Limit (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _Min_Position_Limit
     (setq _Min_Position_Limit (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8 _Shutdown
     (setq _Shutdown (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Torque_Enable
     (setq _Torque_Enable (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _LED
     (setq _LED (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Status_Return_Level
     (setq _Status_Return_Level (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Registered_Instruction
     (setq _Registered_Instruction (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Hardware_Error_Status
     (setq _Hardware_Error_Status (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint16 _Velocity_I_Gain
     (setq _Velocity_I_Gain (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _Velocity_P_Gain
     (setq _Velocity_P_Gain (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _Position_D_Gain
     (setq _Position_D_Gain (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _Position_I_Gain
     (setq _Position_I_Gain (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _Position_P_Gain
     (setq _Position_P_Gain (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _Feedforward_2nd_Gain
     (setq _Feedforward_2nd_Gain (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _Feedforward_1st_Gain
     (setq _Feedforward_1st_Gain (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _Bus_Watchdog
     (setq _Bus_Watchdog (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; int16 _Goal_PWM
     (setq _Goal_PWM (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _Goal_Current
     (setq _Goal_Current (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int32 _Goal_Velocity
     (setq _Goal_Velocity (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _Profile_Acceleration
     (setq _Profile_Acceleration (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _Profile_Velocity
     (setq _Profile_Velocity (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _Goal_Position
     (setq _Goal_Position (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint16 _Realtime_Tick
     (setq _Realtime_Tick (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _Moving
     (setq _Moving (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Moving_Status
     (setq _Moving_Status (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; int16 _Present_PWM
     (setq _Present_PWM (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _Present_Load
     (setq _Present_Load (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _Present_Current
     (setq _Present_Current (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int32 _Present_Velocity
     (setq _Present_Velocity (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _Present_Position
     (setq _Present_Position (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _Velocity_Trajectory
     (setq _Velocity_Trajectory (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _Position_Trajectory
     (setq _Position_Trajectory (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint16 _Present_Input_Voltage
     (setq _Present_Input_Voltage (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _Present_Temperature
     (setq _Present_Temperature (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get dynamixel_workbench_msgs::XM :md5sum-) "625146aaba5730bf1ea1a9008887b10d")
(setf (get dynamixel_workbench_msgs::XM :datatype-) "dynamixel_workbench_msgs/XM")
(setf (get dynamixel_workbench_msgs::XM :definition-)
      "# This message is compatible with control table of Dynamixel XM Series (XM430-W210, XM430-W350)
# If you want to specific information about control table, please follow the link (http://support.robotis.com/en/)

uint16 Model_Number
uint8  Firmware_Version
uint8  ID
uint8  Baud_Rate
uint8  Return_Delay_Time
uint8  Drive_Mode
uint8  Operating_Mode
uint8  Secondary_ID
uint8  Protocol_Version
int32  Homing_Offset
uint32 Moving_Threshold
uint8  Temperature_Limit
uint16 Max_Voltage_Limit
uint16 Min_Voltage_Limit
uint16 PWM_Limit
uint16 Current_Limit
uint32 Acceleration_Limit
uint32 Velocity_Limit
uint32 Max_Position_Limit
uint32 Min_Position_Limit
uint8  Shutdown

uint8  Torque_Enable
uint8  LED
uint8  Status_Return_Level
uint8  Registered_Instruction
uint8  Hardware_Error_Status
uint16 Velocity_I_Gain
uint16 Velocity_P_Gain
uint16 Position_D_Gain
uint16 Position_I_Gain
uint16 Position_P_Gain
uint16 Feedforward_2nd_Gain
uint16 Feedforward_1st_Gain
uint8  Bus_Watchdog
int16  Goal_PWM
int16  Goal_Current
int32  Goal_Velocity
uint32 Profile_Acceleration
uint32 Profile_Velocity
uint32 Goal_Position
uint16 Realtime_Tick
uint8  Moving
uint8  Moving_Status
int16  Present_PWM
int16  Present_Load
int16  Present_Current
int32  Present_Velocity
int32  Present_Position
uint32 Velocity_Trajectory
uint32 Position_Trajectory
uint16 Present_Input_Voltage
uint8  Present_Temperature

")



(provide :dynamixel_workbench_msgs/XM "625146aaba5730bf1ea1a9008887b10d")


