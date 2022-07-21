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

class PRO {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Model_Number = null;
      this.Firmware_Version = null;
      this.ID = null;
      this.Baud_Rate = null;
      this.Return_Delay_Time = null;
      this.Operating_Mode = null;
      this.Moving_Threshold = null;
      this.Temperature_Limit = null;
      this.Max_Voltage_Limit = null;
      this.Min_Voltage_Limit = null;
      this.Acceleration_Limit = null;
      this.Torque_Limit = null;
      this.Velocity_Limit = null;
      this.Max_Position_Limit = null;
      this.Min_Position_Limit = null;
      this.External_Port_Mode_1 = null;
      this.External_Port_Mode_2 = null;
      this.External_Port_Mode_3 = null;
      this.External_Port_Mode_4 = null;
      this.Shutdown = null;
      this.Torque_Enable = null;
      this.LED_RED = null;
      this.LED_GREEN = null;
      this.LED_BLUE = null;
      this.Velocity_I_Gain = null;
      this.Velocity_P_Gain = null;
      this.Position_P_Gain = null;
      this.Goal_Position = null;
      this.Goal_Velocity = null;
      this.Goal_Torque = null;
      this.Goal_Acceleration = null;
      this.Moving = null;
      this.Present_Position = null;
      this.Present_Velocity = null;
      this.Present_Current = null;
      this.Present_Input_Voltage = null;
      this.Present_Temperature = null;
      this.Registered_Instruction = null;
      this.Status_Return_Level = null;
      this.Hardware_Error_Status = null;
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
      if (initObj.hasOwnProperty('Operating_Mode')) {
        this.Operating_Mode = initObj.Operating_Mode
      }
      else {
        this.Operating_Mode = 0;
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
      if (initObj.hasOwnProperty('Acceleration_Limit')) {
        this.Acceleration_Limit = initObj.Acceleration_Limit
      }
      else {
        this.Acceleration_Limit = 0;
      }
      if (initObj.hasOwnProperty('Torque_Limit')) {
        this.Torque_Limit = initObj.Torque_Limit
      }
      else {
        this.Torque_Limit = 0;
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
      if (initObj.hasOwnProperty('External_Port_Mode_1')) {
        this.External_Port_Mode_1 = initObj.External_Port_Mode_1
      }
      else {
        this.External_Port_Mode_1 = 0;
      }
      if (initObj.hasOwnProperty('External_Port_Mode_2')) {
        this.External_Port_Mode_2 = initObj.External_Port_Mode_2
      }
      else {
        this.External_Port_Mode_2 = 0;
      }
      if (initObj.hasOwnProperty('External_Port_Mode_3')) {
        this.External_Port_Mode_3 = initObj.External_Port_Mode_3
      }
      else {
        this.External_Port_Mode_3 = 0;
      }
      if (initObj.hasOwnProperty('External_Port_Mode_4')) {
        this.External_Port_Mode_4 = initObj.External_Port_Mode_4
      }
      else {
        this.External_Port_Mode_4 = 0;
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
      if (initObj.hasOwnProperty('LED_RED')) {
        this.LED_RED = initObj.LED_RED
      }
      else {
        this.LED_RED = 0;
      }
      if (initObj.hasOwnProperty('LED_GREEN')) {
        this.LED_GREEN = initObj.LED_GREEN
      }
      else {
        this.LED_GREEN = 0;
      }
      if (initObj.hasOwnProperty('LED_BLUE')) {
        this.LED_BLUE = initObj.LED_BLUE
      }
      else {
        this.LED_BLUE = 0;
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
      if (initObj.hasOwnProperty('Position_P_Gain')) {
        this.Position_P_Gain = initObj.Position_P_Gain
      }
      else {
        this.Position_P_Gain = 0;
      }
      if (initObj.hasOwnProperty('Goal_Position')) {
        this.Goal_Position = initObj.Goal_Position
      }
      else {
        this.Goal_Position = 0;
      }
      if (initObj.hasOwnProperty('Goal_Velocity')) {
        this.Goal_Velocity = initObj.Goal_Velocity
      }
      else {
        this.Goal_Velocity = 0;
      }
      if (initObj.hasOwnProperty('Goal_Torque')) {
        this.Goal_Torque = initObj.Goal_Torque
      }
      else {
        this.Goal_Torque = 0;
      }
      if (initObj.hasOwnProperty('Goal_Acceleration')) {
        this.Goal_Acceleration = initObj.Goal_Acceleration
      }
      else {
        this.Goal_Acceleration = 0;
      }
      if (initObj.hasOwnProperty('Moving')) {
        this.Moving = initObj.Moving
      }
      else {
        this.Moving = 0;
      }
      if (initObj.hasOwnProperty('Present_Position')) {
        this.Present_Position = initObj.Present_Position
      }
      else {
        this.Present_Position = 0;
      }
      if (initObj.hasOwnProperty('Present_Velocity')) {
        this.Present_Velocity = initObj.Present_Velocity
      }
      else {
        this.Present_Velocity = 0;
      }
      if (initObj.hasOwnProperty('Present_Current')) {
        this.Present_Current = initObj.Present_Current
      }
      else {
        this.Present_Current = 0;
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
      if (initObj.hasOwnProperty('Registered_Instruction')) {
        this.Registered_Instruction = initObj.Registered_Instruction
      }
      else {
        this.Registered_Instruction = 0;
      }
      if (initObj.hasOwnProperty('Status_Return_Level')) {
        this.Status_Return_Level = initObj.Status_Return_Level
      }
      else {
        this.Status_Return_Level = 0;
      }
      if (initObj.hasOwnProperty('Hardware_Error_Status')) {
        this.Hardware_Error_Status = initObj.Hardware_Error_Status
      }
      else {
        this.Hardware_Error_Status = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PRO
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
    // Serialize message field [Operating_Mode]
    bufferOffset = _serializer.uint8(obj.Operating_Mode, buffer, bufferOffset);
    // Serialize message field [Moving_Threshold]
    bufferOffset = _serializer.uint32(obj.Moving_Threshold, buffer, bufferOffset);
    // Serialize message field [Temperature_Limit]
    bufferOffset = _serializer.uint8(obj.Temperature_Limit, buffer, bufferOffset);
    // Serialize message field [Max_Voltage_Limit]
    bufferOffset = _serializer.uint16(obj.Max_Voltage_Limit, buffer, bufferOffset);
    // Serialize message field [Min_Voltage_Limit]
    bufferOffset = _serializer.uint16(obj.Min_Voltage_Limit, buffer, bufferOffset);
    // Serialize message field [Acceleration_Limit]
    bufferOffset = _serializer.uint32(obj.Acceleration_Limit, buffer, bufferOffset);
    // Serialize message field [Torque_Limit]
    bufferOffset = _serializer.uint16(obj.Torque_Limit, buffer, bufferOffset);
    // Serialize message field [Velocity_Limit]
    bufferOffset = _serializer.uint32(obj.Velocity_Limit, buffer, bufferOffset);
    // Serialize message field [Max_Position_Limit]
    bufferOffset = _serializer.int32(obj.Max_Position_Limit, buffer, bufferOffset);
    // Serialize message field [Min_Position_Limit]
    bufferOffset = _serializer.int32(obj.Min_Position_Limit, buffer, bufferOffset);
    // Serialize message field [External_Port_Mode_1]
    bufferOffset = _serializer.uint8(obj.External_Port_Mode_1, buffer, bufferOffset);
    // Serialize message field [External_Port_Mode_2]
    bufferOffset = _serializer.uint8(obj.External_Port_Mode_2, buffer, bufferOffset);
    // Serialize message field [External_Port_Mode_3]
    bufferOffset = _serializer.uint8(obj.External_Port_Mode_3, buffer, bufferOffset);
    // Serialize message field [External_Port_Mode_4]
    bufferOffset = _serializer.uint8(obj.External_Port_Mode_4, buffer, bufferOffset);
    // Serialize message field [Shutdown]
    bufferOffset = _serializer.uint8(obj.Shutdown, buffer, bufferOffset);
    // Serialize message field [Torque_Enable]
    bufferOffset = _serializer.uint8(obj.Torque_Enable, buffer, bufferOffset);
    // Serialize message field [LED_RED]
    bufferOffset = _serializer.uint8(obj.LED_RED, buffer, bufferOffset);
    // Serialize message field [LED_GREEN]
    bufferOffset = _serializer.uint8(obj.LED_GREEN, buffer, bufferOffset);
    // Serialize message field [LED_BLUE]
    bufferOffset = _serializer.uint8(obj.LED_BLUE, buffer, bufferOffset);
    // Serialize message field [Velocity_I_Gain]
    bufferOffset = _serializer.uint16(obj.Velocity_I_Gain, buffer, bufferOffset);
    // Serialize message field [Velocity_P_Gain]
    bufferOffset = _serializer.uint16(obj.Velocity_P_Gain, buffer, bufferOffset);
    // Serialize message field [Position_P_Gain]
    bufferOffset = _serializer.uint16(obj.Position_P_Gain, buffer, bufferOffset);
    // Serialize message field [Goal_Position]
    bufferOffset = _serializer.int32(obj.Goal_Position, buffer, bufferOffset);
    // Serialize message field [Goal_Velocity]
    bufferOffset = _serializer.uint32(obj.Goal_Velocity, buffer, bufferOffset);
    // Serialize message field [Goal_Torque]
    bufferOffset = _serializer.uint16(obj.Goal_Torque, buffer, bufferOffset);
    // Serialize message field [Goal_Acceleration]
    bufferOffset = _serializer.int32(obj.Goal_Acceleration, buffer, bufferOffset);
    // Serialize message field [Moving]
    bufferOffset = _serializer.uint8(obj.Moving, buffer, bufferOffset);
    // Serialize message field [Present_Position]
    bufferOffset = _serializer.int32(obj.Present_Position, buffer, bufferOffset);
    // Serialize message field [Present_Velocity]
    bufferOffset = _serializer.uint32(obj.Present_Velocity, buffer, bufferOffset);
    // Serialize message field [Present_Current]
    bufferOffset = _serializer.uint16(obj.Present_Current, buffer, bufferOffset);
    // Serialize message field [Present_Input_Voltage]
    bufferOffset = _serializer.uint16(obj.Present_Input_Voltage, buffer, bufferOffset);
    // Serialize message field [Present_Temperature]
    bufferOffset = _serializer.uint8(obj.Present_Temperature, buffer, bufferOffset);
    // Serialize message field [Registered_Instruction]
    bufferOffset = _serializer.uint8(obj.Registered_Instruction, buffer, bufferOffset);
    // Serialize message field [Status_Return_Level]
    bufferOffset = _serializer.uint8(obj.Status_Return_Level, buffer, bufferOffset);
    // Serialize message field [Hardware_Error_Status]
    bufferOffset = _serializer.uint8(obj.Hardware_Error_Status, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PRO
    let len;
    let data = new PRO(null);
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
    // Deserialize message field [Operating_Mode]
    data.Operating_Mode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Moving_Threshold]
    data.Moving_Threshold = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [Temperature_Limit]
    data.Temperature_Limit = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Max_Voltage_Limit]
    data.Max_Voltage_Limit = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Min_Voltage_Limit]
    data.Min_Voltage_Limit = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Acceleration_Limit]
    data.Acceleration_Limit = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [Torque_Limit]
    data.Torque_Limit = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Velocity_Limit]
    data.Velocity_Limit = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [Max_Position_Limit]
    data.Max_Position_Limit = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [Min_Position_Limit]
    data.Min_Position_Limit = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [External_Port_Mode_1]
    data.External_Port_Mode_1 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [External_Port_Mode_2]
    data.External_Port_Mode_2 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [External_Port_Mode_3]
    data.External_Port_Mode_3 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [External_Port_Mode_4]
    data.External_Port_Mode_4 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Shutdown]
    data.Shutdown = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Torque_Enable]
    data.Torque_Enable = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [LED_RED]
    data.LED_RED = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [LED_GREEN]
    data.LED_GREEN = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [LED_BLUE]
    data.LED_BLUE = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Velocity_I_Gain]
    data.Velocity_I_Gain = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Velocity_P_Gain]
    data.Velocity_P_Gain = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Position_P_Gain]
    data.Position_P_Gain = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Goal_Position]
    data.Goal_Position = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [Goal_Velocity]
    data.Goal_Velocity = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [Goal_Torque]
    data.Goal_Torque = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Goal_Acceleration]
    data.Goal_Acceleration = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [Moving]
    data.Moving = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Present_Position]
    data.Present_Position = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [Present_Velocity]
    data.Present_Velocity = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [Present_Current]
    data.Present_Current = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Present_Input_Voltage]
    data.Present_Input_Voltage = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Present_Temperature]
    data.Present_Temperature = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Registered_Instruction]
    data.Registered_Instruction = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Status_Return_Level]
    data.Status_Return_Level = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Hardware_Error_Status]
    data.Hardware_Error_Status = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 80;
  }

  static datatype() {
    // Returns string type for a message object
    return 'dynamixel_workbench_msgs/PRO';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c0387b4038d0572ab0d83e71bcb8fa5e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This message is compatible with control table of Dynamixel PRO L42-10-S300-R
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
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PRO(null);
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

    if (msg.Operating_Mode !== undefined) {
      resolved.Operating_Mode = msg.Operating_Mode;
    }
    else {
      resolved.Operating_Mode = 0
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

    if (msg.Acceleration_Limit !== undefined) {
      resolved.Acceleration_Limit = msg.Acceleration_Limit;
    }
    else {
      resolved.Acceleration_Limit = 0
    }

    if (msg.Torque_Limit !== undefined) {
      resolved.Torque_Limit = msg.Torque_Limit;
    }
    else {
      resolved.Torque_Limit = 0
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

    if (msg.External_Port_Mode_1 !== undefined) {
      resolved.External_Port_Mode_1 = msg.External_Port_Mode_1;
    }
    else {
      resolved.External_Port_Mode_1 = 0
    }

    if (msg.External_Port_Mode_2 !== undefined) {
      resolved.External_Port_Mode_2 = msg.External_Port_Mode_2;
    }
    else {
      resolved.External_Port_Mode_2 = 0
    }

    if (msg.External_Port_Mode_3 !== undefined) {
      resolved.External_Port_Mode_3 = msg.External_Port_Mode_3;
    }
    else {
      resolved.External_Port_Mode_3 = 0
    }

    if (msg.External_Port_Mode_4 !== undefined) {
      resolved.External_Port_Mode_4 = msg.External_Port_Mode_4;
    }
    else {
      resolved.External_Port_Mode_4 = 0
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

    if (msg.LED_RED !== undefined) {
      resolved.LED_RED = msg.LED_RED;
    }
    else {
      resolved.LED_RED = 0
    }

    if (msg.LED_GREEN !== undefined) {
      resolved.LED_GREEN = msg.LED_GREEN;
    }
    else {
      resolved.LED_GREEN = 0
    }

    if (msg.LED_BLUE !== undefined) {
      resolved.LED_BLUE = msg.LED_BLUE;
    }
    else {
      resolved.LED_BLUE = 0
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

    if (msg.Position_P_Gain !== undefined) {
      resolved.Position_P_Gain = msg.Position_P_Gain;
    }
    else {
      resolved.Position_P_Gain = 0
    }

    if (msg.Goal_Position !== undefined) {
      resolved.Goal_Position = msg.Goal_Position;
    }
    else {
      resolved.Goal_Position = 0
    }

    if (msg.Goal_Velocity !== undefined) {
      resolved.Goal_Velocity = msg.Goal_Velocity;
    }
    else {
      resolved.Goal_Velocity = 0
    }

    if (msg.Goal_Torque !== undefined) {
      resolved.Goal_Torque = msg.Goal_Torque;
    }
    else {
      resolved.Goal_Torque = 0
    }

    if (msg.Goal_Acceleration !== undefined) {
      resolved.Goal_Acceleration = msg.Goal_Acceleration;
    }
    else {
      resolved.Goal_Acceleration = 0
    }

    if (msg.Moving !== undefined) {
      resolved.Moving = msg.Moving;
    }
    else {
      resolved.Moving = 0
    }

    if (msg.Present_Position !== undefined) {
      resolved.Present_Position = msg.Present_Position;
    }
    else {
      resolved.Present_Position = 0
    }

    if (msg.Present_Velocity !== undefined) {
      resolved.Present_Velocity = msg.Present_Velocity;
    }
    else {
      resolved.Present_Velocity = 0
    }

    if (msg.Present_Current !== undefined) {
      resolved.Present_Current = msg.Present_Current;
    }
    else {
      resolved.Present_Current = 0
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

    if (msg.Registered_Instruction !== undefined) {
      resolved.Registered_Instruction = msg.Registered_Instruction;
    }
    else {
      resolved.Registered_Instruction = 0
    }

    if (msg.Status_Return_Level !== undefined) {
      resolved.Status_Return_Level = msg.Status_Return_Level;
    }
    else {
      resolved.Status_Return_Level = 0
    }

    if (msg.Hardware_Error_Status !== undefined) {
      resolved.Hardware_Error_Status = msg.Hardware_Error_Status;
    }
    else {
      resolved.Hardware_Error_Status = 0
    }

    return resolved;
    }
};

module.exports = PRO;
