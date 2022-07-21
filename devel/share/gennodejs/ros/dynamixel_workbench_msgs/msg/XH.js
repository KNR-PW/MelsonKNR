// Auto-generated. Do not edit!

// (in-package dynamixel_workbench_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class XH {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Model_Number = null;
      this.Firmware_Version = null;
      this.ID = null;
      this.Baud_Rate = null;
      this.Return_Delay_Time = null;
      this.Drive_Mode = null;
      this.Operating_Mode = null;
      this.Secondary_ID = null;
      this.Protocol_Version = null;
      this.Homing_Offset = null;
      this.Moving_Threshold = null;
      this.Temperature_Limit = null;
      this.Max_Voltage_Limit = null;
      this.Min_Voltage_Limit = null;
      this.PWM_Limit = null;
      this.Current_Limit = null;
      this.Acceleration_Limit = null;
      this.Velocity_Limit = null;
      this.Max_Position_Limit = null;
      this.Min_Position_Limit = null;
      this.Shutdown = null;
      this.Torque_Enable = null;
      this.LED = null;
      this.Status_Return_Level = null;
      this.Registered_Instruction = null;
      this.Hardware_Error_Status = null;
      this.Velocity_I_Gain = null;
      this.Velocity_P_Gain = null;
      this.Position_D_Gain = null;
      this.Position_I_Gain = null;
      this.Position_P_Gain = null;
      this.Feedforward_2nd_Gain = null;
      this.Feedforward_1st_Gain = null;
      this.Bus_Watchdog = null;
      this.Goal_PWM = null;
      this.Goal_Current = null;
      this.Goal_Velocity = null;
      this.Profile_Acceleration = null;
      this.Profile_Velocity = null;
      this.Goal_Position = null;
      this.Realtime_Tick = null;
      this.Moving = null;
      this.Moving_Status = null;
      this.Present_PWM = null;
      this.Present_Current = null;
      this.Present_Velocity = null;
      this.Present_Position = null;
      this.Velocity_Trajectory = null;
      this.Position_Trajectory = null;
      this.Present_Input_Voltage = null;
      this.Present_Temperature = null;
    }
    else {
      if (initObj.hasOwnProperty('Model_Number')) {
        this.Model_Number = initObj.Model_Number
      }
      else {
        this.Model_Number = 0;
      }
      if (initObj.hasOwnProperty('Firmware_Version')) {
        this.Firmware_Version = initObj.Firmware_Version
      }
      else {
        this.Firmware_Version = 0;
      }
      if (initObj.hasOwnProperty('ID')) {
        this.ID = initObj.ID
      }
      else {
        this.ID = 0;
      }
      if (initObj.hasOwnProperty('Baud_Rate')) {
        this.Baud_Rate = initObj.Baud_Rate
      }
      else {
        this.Baud_Rate = 0;
      }
      if (initObj.hasOwnProperty('Return_Delay_Time')) {
        this.Return_Delay_Time = initObj.Return_Delay_Time
      }
      else {
        this.Return_Delay_Time = 0;
      }
      if (initObj.hasOwnProperty('Drive_Mode')) {
        this.Drive_Mode = initObj.Drive_Mode
      }
      else {
        this.Drive_Mode = 0;
      }
      if (initObj.hasOwnProperty('Operating_Mode')) {
        this.Operating_Mode = initObj.Operating_Mode
      }
      else {
        this.Operating_Mode = 0;
      }
      if (initObj.hasOwnProperty('Secondary_ID')) {
        this.Secondary_ID = initObj.Secondary_ID
      }
      else {
        this.Secondary_ID = 0;
      }
      if (initObj.hasOwnProperty('Protocol_Version')) {
        this.Protocol_Version = initObj.Protocol_Version
      }
      else {
        this.Protocol_Version = 0;
      }
      if (initObj.hasOwnProperty('Homing_Offset')) {
        this.Homing_Offset = initObj.Homing_Offset
      }
      else {
        this.Homing_Offset = 0;
      }
      if (initObj.hasOwnProperty('Moving_Threshold')) {
        this.Moving_Threshold = initObj.Moving_Threshold
      }
      else {
        this.Moving_Threshold = 0;
      }
      if (initObj.hasOwnProperty('Temperature_Limit')) {
        this.Temperature_Limit = initObj.Temperature_Limit
      }
      else {
        this.Temperature_Limit = 0;
      }
      if (initObj.hasOwnProperty('Max_Voltage_Limit')) {
        this.Max_Voltage_Limit = initObj.Max_Voltage_Limit
      }
      else {
        this.Max_Voltage_Limit = 0;
      }
      if (initObj.hasOwnProperty('Min_Voltage_Limit')) {
        this.Min_Voltage_Limit = initObj.Min_Voltage_Limit
      }
      else {
        this.Min_Voltage_Limit = 0;
      }
      if (initObj.hasOwnProperty('PWM_Limit')) {
        this.PWM_Limit = initObj.PWM_Limit
      }
      else {
        this.PWM_Limit = 0;
      }
      if (initObj.hasOwnProperty('Current_Limit')) {
        this.Current_Limit = initObj.Current_Limit
      }
      else {
        this.Current_Limit = 0;
      }
      if (initObj.hasOwnProperty('Acceleration_Limit')) {
        this.Acceleration_Limit = initObj.Acceleration_Limit
      }
      else {
        this.Acceleration_Limit = 0;
      }
      if (initObj.hasOwnProperty('Velocity_Limit')) {
        this.Velocity_Limit = initObj.Velocity_Limit
      }
      else {
        this.Velocity_Limit = 0;
      }
      if (initObj.hasOwnProperty('Max_Position_Limit')) {
        this.Max_Position_Limit = initObj.Max_Position_Limit
      }
      else {
        this.Max_Position_Limit = 0;
      }
      if (initObj.hasOwnProperty('Min_Position_Limit')) {
        this.Min_Position_Limit = initObj.Min_Position_Limit
      }
      else {
        this.Min_Position_Limit = 0;
      }
      if (initObj.hasOwnProperty('Shutdown')) {
        this.Shutdown = initObj.Shutdown
      }
      else {
        this.Shutdown = 0;
      }
      if (initObj.hasOwnProperty('Torque_Enable')) {
        this.Torque_Enable = initObj.Torque_Enable
      }
      else {
        this.Torque_Enable = 0;
      }
      if (initObj.hasOwnProperty('LED')) {
        this.LED = initObj.LED
      }
      else {
        this.LED = 0;
      }
      if (initObj.hasOwnProperty('Status_Return_Level')) {
        this.Status_Return_Level = initObj.Status_Return_Level
      }
      else {
        this.Status_Return_Level = 0;
      }
      if (initObj.hasOwnProperty('Registered_Instruction')) {
        this.Registered_Instruction = initObj.Registered_Instruction
      }
      else {
        this.Registered_Instruction = 0;
      }
      if (initObj.hasOwnProperty('Hardware_Error_Status')) {
        this.Hardware_Error_Status = initObj.Hardware_Error_Status
      }
      else {
        this.Hardware_Error_Status = 0;
      }
      if (initObj.hasOwnProperty('Velocity_I_Gain')) {
        this.Velocity_I_Gain = initObj.Velocity_I_Gain
      }
      else {
        this.Velocity_I_Gain = 0;
      }
      if (initObj.hasOwnProperty('Velocity_P_Gain')) {
        this.Velocity_P_Gain = initObj.Velocity_P_Gain
      }
      else {
        this.Velocity_P_Gain = 0;
      }
      if (initObj.hasOwnProperty('Position_D_Gain')) {
        this.Position_D_Gain = initObj.Position_D_Gain
      }
      else {
        this.Position_D_Gain = 0;
      }
      if (initObj.hasOwnProperty('Position_I_Gain')) {
        this.Position_I_Gain = initObj.Position_I_Gain
      }
      else {
        this.Position_I_Gain = 0;
      }
      if (initObj.hasOwnProperty('Position_P_Gain')) {
        this.Position_P_Gain = initObj.Position_P_Gain
      }
      else {
        this.Position_P_Gain = 0;
      }
      if (initObj.hasOwnProperty('Feedforward_2nd_Gain')) {
        this.Feedforward_2nd_Gain = initObj.Feedforward_2nd_Gain
      }
      else {
        this.Feedforward_2nd_Gain = 0;
      }
      if (initObj.hasOwnProperty('Feedforward_1st_Gain')) {
        this.Feedforward_1st_Gain = initObj.Feedforward_1st_Gain
      }
      else {
        this.Feedforward_1st_Gain = 0;
      }
      if (initObj.hasOwnProperty('Bus_Watchdog')) {
        this.Bus_Watchdog = initObj.Bus_Watchdog
      }
      else {
        this.Bus_Watchdog = 0;
      }
      if (initObj.hasOwnProperty('Goal_PWM')) {
        this.Goal_PWM = initObj.Goal_PWM
      }
      else {
        this.Goal_PWM = 0;
      }
      if (initObj.hasOwnProperty('Goal_Current')) {
        this.Goal_Current = initObj.Goal_Current
      }
      else {
        this.Goal_Current = 0;
      }
      if (initObj.hasOwnProperty('Goal_Velocity')) {
        this.Goal_Velocity = initObj.Goal_Velocity
      }
      else {
        this.Goal_Velocity = 0;
      }
      if (initObj.hasOwnProperty('Profile_Acceleration')) {
        this.Profile_Acceleration = initObj.Profile_Acceleration
      }
      else {
        this.Profile_Acceleration = 0;
      }
      if (initObj.hasOwnProperty('Profile_Velocity')) {
        this.Profile_Velocity = initObj.Profile_Velocity
      }
      else {
        this.Profile_Velocity = 0;
      }
      if (initObj.hasOwnProperty('Goal_Position')) {
        this.Goal_Position = initObj.Goal_Position
      }
      else {
        this.Goal_Position = 0;
      }
      if (initObj.hasOwnProperty('Realtime_Tick')) {
        this.Realtime_Tick = initObj.Realtime_Tick
      }
      else {
        this.Realtime_Tick = 0;
      }
      if (initObj.hasOwnProperty('Moving')) {
        this.Moving = initObj.Moving
      }
      else {
        this.Moving = 0;
      }
      if (initObj.hasOwnProperty('Moving_Status')) {
        this.Moving_Status = initObj.Moving_Status
      }
      else {
        this.Moving_Status = 0;
      }
      if (initObj.hasOwnProperty('Present_PWM')) {
        this.Present_PWM = initObj.Present_PWM
      }
      else {
        this.Present_PWM = 0;
      }
      if (initObj.hasOwnProperty('Present_Current')) {
        this.Present_Current = initObj.Present_Current
      }
      else {
        this.Present_Current = 0;
      }
      if (initObj.hasOwnProperty('Present_Velocity')) {
        this.Present_Velocity = initObj.Present_Velocity
      }
      else {
        this.Present_Velocity = 0;
      }
      if (initObj.hasOwnProperty('Present_Position')) {
        this.Present_Position = initObj.Present_Position
      }
      else {
        this.Present_Position = 0;
      }
      if (initObj.hasOwnProperty('Velocity_Trajectory')) {
        this.Velocity_Trajectory = initObj.Velocity_Trajectory
      }
      else {
        this.Velocity_Trajectory = 0;
      }
      if (initObj.hasOwnProperty('Position_Trajectory')) {
        this.Position_Trajectory = initObj.Position_Trajectory
      }
      else {
        this.Position_Trajectory = 0;
      }
      if (initObj.hasOwnProperty('Present_Input_Voltage')) {
        this.Present_Input_Voltage = initObj.Present_Input_Voltage
      }
      else {
        this.Present_Input_Voltage = 0;
      }
      if (initObj.hasOwnProperty('Present_Temperature')) {
        this.Present_Temperature = initObj.Present_Temperature
      }
      else {
        this.Present_Temperature = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type XH
    // Serialize message field [Model_Number]
    bufferOffset = _serializer.uint16(obj.Model_Number, buffer, bufferOffset);
    // Serialize message field [Firmware_Version]
    bufferOffset = _serializer.uint8(obj.Firmware_Version, buffer, bufferOffset);
    // Serialize message field [ID]
    bufferOffset = _serializer.uint8(obj.ID, buffer, bufferOffset);
    // Serialize message field [Baud_Rate]
    bufferOffset = _serializer.uint8(obj.Baud_Rate, buffer, bufferOffset);
    // Serialize message field [Return_Delay_Time]
    bufferOffset = _serializer.uint8(obj.Return_Delay_Time, buffer, bufferOffset);
    // Serialize message field [Drive_Mode]
    bufferOffset = _serializer.uint8(obj.Drive_Mode, buffer, bufferOffset);
    // Serialize message field [Operating_Mode]
    bufferOffset = _serializer.uint8(obj.Operating_Mode, buffer, bufferOffset);
    // Serialize message field [Secondary_ID]
    bufferOffset = _serializer.uint8(obj.Secondary_ID, buffer, bufferOffset);
    // Serialize message field [Protocol_Version]
    bufferOffset = _serializer.uint8(obj.Protocol_Version, buffer, bufferOffset);
    // Serialize message field [Homing_Offset]
    bufferOffset = _serializer.int32(obj.Homing_Offset, buffer, bufferOffset);
    // Serialize message field [Moving_Threshold]
    bufferOffset = _serializer.uint32(obj.Moving_Threshold, buffer, bufferOffset);
    // Serialize message field [Temperature_Limit]
    bufferOffset = _serializer.uint8(obj.Temperature_Limit, buffer, bufferOffset);
    // Serialize message field [Max_Voltage_Limit]
    bufferOffset = _serializer.uint16(obj.Max_Voltage_Limit, buffer, bufferOffset);
    // Serialize message field [Min_Voltage_Limit]
    bufferOffset = _serializer.uint16(obj.Min_Voltage_Limit, buffer, bufferOffset);
    // Serialize message field [PWM_Limit]
    bufferOffset = _serializer.uint16(obj.PWM_Limit, buffer, bufferOffset);
    // Serialize message field [Current_Limit]
    bufferOffset = _serializer.uint16(obj.Current_Limit, buffer, bufferOffset);
    // Serialize message field [Acceleration_Limit]
    bufferOffset = _serializer.uint32(obj.Acceleration_Limit, buffer, bufferOffset);
    // Serialize message field [Velocity_Limit]
    bufferOffset = _serializer.uint32(obj.Velocity_Limit, buffer, bufferOffset);
    // Serialize message field [Max_Position_Limit]
    bufferOffset = _serializer.uint32(obj.Max_Position_Limit, buffer, bufferOffset);
    // Serialize message field [Min_Position_Limit]
    bufferOffset = _serializer.uint32(obj.Min_Position_Limit, buffer, bufferOffset);
    // Serialize message field [Shutdown]
    bufferOffset = _serializer.uint8(obj.Shutdown, buffer, bufferOffset);
    // Serialize message field [Torque_Enable]
    bufferOffset = _serializer.uint8(obj.Torque_Enable, buffer, bufferOffset);
    // Serialize message field [LED]
    bufferOffset = _serializer.uint8(obj.LED, buffer, bufferOffset);
    // Serialize message field [Status_Return_Level]
    bufferOffset = _serializer.uint8(obj.Status_Return_Level, buffer, bufferOffset);
    // Serialize message field [Registered_Instruction]
    bufferOffset = _serializer.uint8(obj.Registered_Instruction, buffer, bufferOffset);
    // Serialize message field [Hardware_Error_Status]
    bufferOffset = _serializer.uint8(obj.Hardware_Error_Status, buffer, bufferOffset);
    // Serialize message field [Velocity_I_Gain]
    bufferOffset = _serializer.uint16(obj.Velocity_I_Gain, buffer, bufferOffset);
    // Serialize message field [Velocity_P_Gain]
    bufferOffset = _serializer.uint16(obj.Velocity_P_Gain, buffer, bufferOffset);
    // Serialize message field [Position_D_Gain]
    bufferOffset = _serializer.uint16(obj.Position_D_Gain, buffer, bufferOffset);
    // Serialize message field [Position_I_Gain]
    bufferOffset = _serializer.uint16(obj.Position_I_Gain, buffer, bufferOffset);
    // Serialize message field [Position_P_Gain]
    bufferOffset = _serializer.uint16(obj.Position_P_Gain, buffer, bufferOffset);
    // Serialize message field [Feedforward_2nd_Gain]
    bufferOffset = _serializer.uint16(obj.Feedforward_2nd_Gain, buffer, bufferOffset);
    // Serialize message field [Feedforward_1st_Gain]
    bufferOffset = _serializer.uint16(obj.Feedforward_1st_Gain, buffer, bufferOffset);
    // Serialize message field [Bus_Watchdog]
    bufferOffset = _serializer.uint8(obj.Bus_Watchdog, buffer, bufferOffset);
    // Serialize message field [Goal_PWM]
    bufferOffset = _serializer.int16(obj.Goal_PWM, buffer, bufferOffset);
    // Serialize message field [Goal_Current]
    bufferOffset = _serializer.int16(obj.Goal_Current, buffer, bufferOffset);
    // Serialize message field [Goal_Velocity]
    bufferOffset = _serializer.int32(obj.Goal_Velocity, buffer, bufferOffset);
    // Serialize message field [Profile_Acceleration]
    bufferOffset = _serializer.uint32(obj.Profile_Acceleration, buffer, bufferOffset);
    // Serialize message field [Profile_Velocity]
    bufferOffset = _serializer.uint32(obj.Profile_Velocity, buffer, bufferOffset);
    // Serialize message field [Goal_Position]
    bufferOffset = _serializer.uint32(obj.Goal_Position, buffer, bufferOffset);
    // Serialize message field [Realtime_Tick]
    bufferOffset = _serializer.uint16(obj.Realtime_Tick, buffer, bufferOffset);
    // Serialize message field [Moving]
    bufferOffset = _serializer.uint8(obj.Moving, buffer, bufferOffset);
    // Serialize message field [Moving_Status]
    bufferOffset = _serializer.uint8(obj.Moving_Status, buffer, bufferOffset);
    // Serialize message field [Present_PWM]
    bufferOffset = _serializer.int16(obj.Present_PWM, buffer, bufferOffset);
    // Serialize message field [Present_Current]
    bufferOffset = _serializer.int16(obj.Present_Current, buffer, bufferOffset);
    // Serialize message field [Present_Velocity]
    bufferOffset = _serializer.int32(obj.Present_Velocity, buffer, bufferOffset);
    // Serialize message field [Present_Position]
    bufferOffset = _serializer.int32(obj.Present_Position, buffer, bufferOffset);
    // Serialize message field [Velocity_Trajectory]
    bufferOffset = _serializer.uint32(obj.Velocity_Trajectory, buffer, bufferOffset);
    // Serialize message field [Position_Trajectory]
    bufferOffset = _serializer.uint32(obj.Position_Trajectory, buffer, bufferOffset);
    // Serialize message field [Present_Input_Voltage]
    bufferOffset = _serializer.uint16(obj.Present_Input_Voltage, buffer, bufferOffset);
    // Serialize message field [Present_Temperature]
    bufferOffset = _serializer.uint8(obj.Present_Temperature, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type XH
    let len;
    let data = new XH(null);
    // Deserialize message field [Model_Number]
    data.Model_Number = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Firmware_Version]
    data.Firmware_Version = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [ID]
    data.ID = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Baud_Rate]
    data.Baud_Rate = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Return_Delay_Time]
    data.Return_Delay_Time = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Drive_Mode]
    data.Drive_Mode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Operating_Mode]
    data.Operating_Mode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Secondary_ID]
    data.Secondary_ID = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Protocol_Version]
    data.Protocol_Version = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Homing_Offset]
    data.Homing_Offset = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [Moving_Threshold]
    data.Moving_Threshold = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [Temperature_Limit]
    data.Temperature_Limit = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Max_Voltage_Limit]
    data.Max_Voltage_Limit = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Min_Voltage_Limit]
    data.Min_Voltage_Limit = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [PWM_Limit]
    data.PWM_Limit = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Current_Limit]
    data.Current_Limit = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Acceleration_Limit]
    data.Acceleration_Limit = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [Velocity_Limit]
    data.Velocity_Limit = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [Max_Position_Limit]
    data.Max_Position_Limit = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [Min_Position_Limit]
    data.Min_Position_Limit = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [Shutdown]
    data.Shutdown = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Torque_Enable]
    data.Torque_Enable = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [LED]
    data.LED = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Status_Return_Level]
    data.Status_Return_Level = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Registered_Instruction]
    data.Registered_Instruction = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Hardware_Error_Status]
    data.Hardware_Error_Status = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Velocity_I_Gain]
    data.Velocity_I_Gain = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Velocity_P_Gain]
    data.Velocity_P_Gain = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Position_D_Gain]
    data.Position_D_Gain = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Position_I_Gain]
    data.Position_I_Gain = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Position_P_Gain]
    data.Position_P_Gain = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Feedforward_2nd_Gain]
    data.Feedforward_2nd_Gain = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Feedforward_1st_Gain]
    data.Feedforward_1st_Gain = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Bus_Watchdog]
    data.Bus_Watchdog = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Goal_PWM]
    data.Goal_PWM = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [Goal_Current]
    data.Goal_Current = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [Goal_Velocity]
    data.Goal_Velocity = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [Profile_Acceleration]
    data.Profile_Acceleration = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [Profile_Velocity]
    data.Profile_Velocity = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [Goal_Position]
    data.Goal_Position = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [Realtime_Tick]
    data.Realtime_Tick = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Moving]
    data.Moving = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Moving_Status]
    data.Moving_Status = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Present_PWM]
    data.Present_PWM = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [Present_Current]
    data.Present_Current = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [Present_Velocity]
    data.Present_Velocity = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [Present_Position]
    data.Present_Position = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [Velocity_Trajectory]
    data.Velocity_Trajectory = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [Position_Trajectory]
    data.Position_Trajectory = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [Present_Input_Voltage]
    data.Present_Input_Voltage = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Present_Temperature]
    data.Present_Temperature = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 111;
  }

  static datatype() {
    // Returns string type for a message object
    return 'dynamixel_workbench_msgs/XH';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e5260697f25a6834d84f685c2f474e33';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This message is compatible with control table of Dynamixel XH Series (XH430-W210, XH430-W350, XH430-V210, XH430-V350)
    # If you want to specific information about control table, please follow the link (http://emanual.robotis.com/)
    
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
    int16  Present_Current
    int32  Present_Velocity
    int32  Present_Position
    uint32 Velocity_Trajectory
    uint32 Position_Trajectory
    uint16 Present_Input_Voltage
    uint8  Present_Temperature
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new XH(null);
    if (msg.Model_Number !== undefined) {
      resolved.Model_Number = msg.Model_Number;
    }
    else {
      resolved.Model_Number = 0
    }

    if (msg.Firmware_Version !== undefined) {
      resolved.Firmware_Version = msg.Firmware_Version;
    }
    else {
      resolved.Firmware_Version = 0
    }

    if (msg.ID !== undefined) {
      resolved.ID = msg.ID;
    }
    else {
      resolved.ID = 0
    }

    if (msg.Baud_Rate !== undefined) {
      resolved.Baud_Rate = msg.Baud_Rate;
    }
    else {
      resolved.Baud_Rate = 0
    }

    if (msg.Return_Delay_Time !== undefined) {
      resolved.Return_Delay_Time = msg.Return_Delay_Time;
    }
    else {
      resolved.Return_Delay_Time = 0
    }

    if (msg.Drive_Mode !== undefined) {
      resolved.Drive_Mode = msg.Drive_Mode;
    }
    else {
      resolved.Drive_Mode = 0
    }

    if (msg.Operating_Mode !== undefined) {
      resolved.Operating_Mode = msg.Operating_Mode;
    }
    else {
      resolved.Operating_Mode = 0
    }

    if (msg.Secondary_ID !== undefined) {
      resolved.Secondary_ID = msg.Secondary_ID;
    }
    else {
      resolved.Secondary_ID = 0
    }

    if (msg.Protocol_Version !== undefined) {
      resolved.Protocol_Version = msg.Protocol_Version;
    }
    else {
      resolved.Protocol_Version = 0
    }

    if (msg.Homing_Offset !== undefined) {
      resolved.Homing_Offset = msg.Homing_Offset;
    }
    else {
      resolved.Homing_Offset = 0
    }

    if (msg.Moving_Threshold !== undefined) {
      resolved.Moving_Threshold = msg.Moving_Threshold;
    }
    else {
      resolved.Moving_Threshold = 0
    }

    if (msg.Temperature_Limit !== undefined) {
      resolved.Temperature_Limit = msg.Temperature_Limit;
    }
    else {
      resolved.Temperature_Limit = 0
    }

    if (msg.Max_Voltage_Limit !== undefined) {
      resolved.Max_Voltage_Limit = msg.Max_Voltage_Limit;
    }
    else {
      resolved.Max_Voltage_Limit = 0
    }

    if (msg.Min_Voltage_Limit !== undefined) {
      resolved.Min_Voltage_Limit = msg.Min_Voltage_Limit;
    }
    else {
      resolved.Min_Voltage_Limit = 0
    }

    if (msg.PWM_Limit !== undefined) {
      resolved.PWM_Limit = msg.PWM_Limit;
    }
    else {
      resolved.PWM_Limit = 0
    }

    if (msg.Current_Limit !== undefined) {
      resolved.Current_Limit = msg.Current_Limit;
    }
    else {
      resolved.Current_Limit = 0
    }

    if (msg.Acceleration_Limit !== undefined) {
      resolved.Acceleration_Limit = msg.Acceleration_Limit;
    }
    else {
      resolved.Acceleration_Limit = 0
    }

    if (msg.Velocity_Limit !== undefined) {
      resolved.Velocity_Limit = msg.Velocity_Limit;
    }
    else {
      resolved.Velocity_Limit = 0
    }

    if (msg.Max_Position_Limit !== undefined) {
      resolved.Max_Position_Limit = msg.Max_Position_Limit;
    }
    else {
      resolved.Max_Position_Limit = 0
    }

    if (msg.Min_Position_Limit !== undefined) {
      resolved.Min_Position_Limit = msg.Min_Position_Limit;
    }
    else {
      resolved.Min_Position_Limit = 0
    }

    if (msg.Shutdown !== undefined) {
      resolved.Shutdown = msg.Shutdown;
    }
    else {
      resolved.Shutdown = 0
    }

    if (msg.Torque_Enable !== undefined) {
      resolved.Torque_Enable = msg.Torque_Enable;
    }
    else {
      resolved.Torque_Enable = 0
    }

    if (msg.LED !== undefined) {
      resolved.LED = msg.LED;
    }
    else {
      resolved.LED = 0
    }

    if (msg.Status_Return_Level !== undefined) {
      resolved.Status_Return_Level = msg.Status_Return_Level;
    }
    else {
      resolved.Status_Return_Level = 0
    }

    if (msg.Registered_Instruction !== undefined) {
      resolved.Registered_Instruction = msg.Registered_Instruction;
    }
    else {
      resolved.Registered_Instruction = 0
    }

    if (msg.Hardware_Error_Status !== undefined) {
      resolved.Hardware_Error_Status = msg.Hardware_Error_Status;
    }
    else {
      resolved.Hardware_Error_Status = 0
    }

    if (msg.Velocity_I_Gain !== undefined) {
      resolved.Velocity_I_Gain = msg.Velocity_I_Gain;
    }
    else {
      resolved.Velocity_I_Gain = 0
    }

    if (msg.Velocity_P_Gain !== undefined) {
      resolved.Velocity_P_Gain = msg.Velocity_P_Gain;
    }
    else {
      resolved.Velocity_P_Gain = 0
    }

    if (msg.Position_D_Gain !== undefined) {
      resolved.Position_D_Gain = msg.Position_D_Gain;
    }
    else {
      resolved.Position_D_Gain = 0
    }

    if (msg.Position_I_Gain !== undefined) {
      resolved.Position_I_Gain = msg.Position_I_Gain;
    }
    else {
      resolved.Position_I_Gain = 0
    }

    if (msg.Position_P_Gain !== undefined) {
      resolved.Position_P_Gain = msg.Position_P_Gain;
    }
    else {
      resolved.Position_P_Gain = 0
    }

    if (msg.Feedforward_2nd_Gain !== undefined) {
      resolved.Feedforward_2nd_Gain = msg.Feedforward_2nd_Gain;
    }
    else {
      resolved.Feedforward_2nd_Gain = 0
    }

    if (msg.Feedforward_1st_Gain !== undefined) {
      resolved.Feedforward_1st_Gain = msg.Feedforward_1st_Gain;
    }
    else {
      resolved.Feedforward_1st_Gain = 0
    }

    if (msg.Bus_Watchdog !== undefined) {
      resolved.Bus_Watchdog = msg.Bus_Watchdog;
    }
    else {
      resolved.Bus_Watchdog = 0
    }

    if (msg.Goal_PWM !== undefined) {
      resolved.Goal_PWM = msg.Goal_PWM;
    }
    else {
      resolved.Goal_PWM = 0
    }

    if (msg.Goal_Current !== undefined) {
      resolved.Goal_Current = msg.Goal_Current;
    }
    else {
      resolved.Goal_Current = 0
    }

    if (msg.Goal_Velocity !== undefined) {
      resolved.Goal_Velocity = msg.Goal_Velocity;
    }
    else {
      resolved.Goal_Velocity = 0
    }

    if (msg.Profile_Acceleration !== undefined) {
      resolved.Profile_Acceleration = msg.Profile_Acceleration;
    }
    else {
      resolved.Profile_Acceleration = 0
    }

    if (msg.Profile_Velocity !== undefined) {
      resolved.Profile_Velocity = msg.Profile_Velocity;
    }
    else {
      resolved.Profile_Velocity = 0
    }

    if (msg.Goal_Position !== undefined) {
      resolved.Goal_Position = msg.Goal_Position;
    }
    else {
      resolved.Goal_Position = 0
    }

    if (msg.Realtime_Tick !== undefined) {
      resolved.Realtime_Tick = msg.Realtime_Tick;
    }
    else {
      resolved.Realtime_Tick = 0
    }

    if (msg.Moving !== undefined) {
      resolved.Moving = msg.Moving;
    }
    else {
      resolved.Moving = 0
    }

    if (msg.Moving_Status !== undefined) {
      resolved.Moving_Status = msg.Moving_Status;
    }
    else {
      resolved.Moving_Status = 0
    }

    if (msg.Present_PWM !== undefined) {
      resolved.Present_PWM = msg.Present_PWM;
    }
    else {
      resolved.Present_PWM = 0
    }

    if (msg.Present_Current !== undefined) {
      resolved.Present_Current = msg.Present_Current;
    }
    else {
      resolved.Present_Current = 0
    }

    if (msg.Present_Velocity !== undefined) {
      resolved.Present_Velocity = msg.Present_Velocity;
    }
    else {
      resolved.Present_Velocity = 0
    }

    if (msg.Present_Position !== undefined) {
      resolved.Present_Position = msg.Present_Position;
    }
    else {
      resolved.Present_Position = 0
    }

    if (msg.Velocity_Trajectory !== undefined) {
      resolved.Velocity_Trajectory = msg.Velocity_Trajectory;
    }
    else {
      resolved.Velocity_Trajectory = 0
    }

    if (msg.Position_Trajectory !== undefined) {
      resolved.Position_Trajectory = msg.Position_Trajectory;
    }
    else {
      resolved.Position_Trajectory = 0
    }

    if (msg.Present_Input_Voltage !== undefined) {
      resolved.Present_Input_Voltage = msg.Present_Input_Voltage;
    }
    else {
      resolved.Present_Input_Voltage = 0
    }

    if (msg.Present_Temperature !== undefined) {
      resolved.Present_Temperature = msg.Present_Temperature;
    }
    else {
      resolved.Present_Temperature = 0
    }

    return resolved;
    }
};

module.exports = XH;
