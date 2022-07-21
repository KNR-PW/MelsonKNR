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

class MXExt {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Model_Number = null;
      this.Firmware_Version = null;
      this.ID = null;
      this.Baud_Rate = null;
      this.Return_Delay_Time = null;
      this.CW_Angle_Limit = null;
      this.CCW_Angle_Limit = null;
      this.Temperature_Limit = null;
      this.Min_Voltage_Limit = null;
      this.Max_Voltage_Limit = null;
      this.Max_Torque = null;
      this.Status_Return_Level = null;
      this.Alarm_LED = null;
      this.Shutdown = null;
      this.Multi_Turn_Offset = null;
      this.Resolution_Divider = null;
      this.Torque_Enable = null;
      this.LED = null;
      this.D_gain = null;
      this.I_gain = null;
      this.P_gain = null;
      this.Goal_Position = null;
      this.Moving_Speed = null;
      this.Torque_Limit = null;
      this.Present_Position = null;
      this.Present_Speed = null;
      this.Present_Load = null;
      this.Present_Voltage = null;
      this.Present_Temperature = null;
      this.Registered = null;
      this.Moving = null;
      this.Lock = null;
      this.Punch = null;
      this.Current = null;
      this.Torque_Control_Mode_Enable = null;
      this.Goal_Torque = null;
      this.Goal_Acceleration = null;
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
      if (initObj.hasOwnProperty('CW_Angle_Limit')) {
        this.CW_Angle_Limit = initObj.CW_Angle_Limit
      }
      else {
        this.CW_Angle_Limit = 0;
      }
      if (initObj.hasOwnProperty('CCW_Angle_Limit')) {
        this.CCW_Angle_Limit = initObj.CCW_Angle_Limit
      }
      else {
        this.CCW_Angle_Limit = 0;
      }
      if (initObj.hasOwnProperty('Temperature_Limit')) {
        this.Temperature_Limit = initObj.Temperature_Limit
      }
      else {
        this.Temperature_Limit = 0;
      }
      if (initObj.hasOwnProperty('Min_Voltage_Limit')) {
        this.Min_Voltage_Limit = initObj.Min_Voltage_Limit
      }
      else {
        this.Min_Voltage_Limit = 0;
      }
      if (initObj.hasOwnProperty('Max_Voltage_Limit')) {
        this.Max_Voltage_Limit = initObj.Max_Voltage_Limit
      }
      else {
        this.Max_Voltage_Limit = 0;
      }
      if (initObj.hasOwnProperty('Max_Torque')) {
        this.Max_Torque = initObj.Max_Torque
      }
      else {
        this.Max_Torque = 0;
      }
      if (initObj.hasOwnProperty('Status_Return_Level')) {
        this.Status_Return_Level = initObj.Status_Return_Level
      }
      else {
        this.Status_Return_Level = 0;
      }
      if (initObj.hasOwnProperty('Alarm_LED')) {
        this.Alarm_LED = initObj.Alarm_LED
      }
      else {
        this.Alarm_LED = 0;
      }
      if (initObj.hasOwnProperty('Shutdown')) {
        this.Shutdown = initObj.Shutdown
      }
      else {
        this.Shutdown = 0;
      }
      if (initObj.hasOwnProperty('Multi_Turn_Offset')) {
        this.Multi_Turn_Offset = initObj.Multi_Turn_Offset
      }
      else {
        this.Multi_Turn_Offset = 0;
      }
      if (initObj.hasOwnProperty('Resolution_Divider')) {
        this.Resolution_Divider = initObj.Resolution_Divider
      }
      else {
        this.Resolution_Divider = 0;
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
      if (initObj.hasOwnProperty('D_gain')) {
        this.D_gain = initObj.D_gain
      }
      else {
        this.D_gain = 0;
      }
      if (initObj.hasOwnProperty('I_gain')) {
        this.I_gain = initObj.I_gain
      }
      else {
        this.I_gain = 0;
      }
      if (initObj.hasOwnProperty('P_gain')) {
        this.P_gain = initObj.P_gain
      }
      else {
        this.P_gain = 0;
      }
      if (initObj.hasOwnProperty('Goal_Position')) {
        this.Goal_Position = initObj.Goal_Position
      }
      else {
        this.Goal_Position = 0;
      }
      if (initObj.hasOwnProperty('Moving_Speed')) {
        this.Moving_Speed = initObj.Moving_Speed
      }
      else {
        this.Moving_Speed = 0;
      }
      if (initObj.hasOwnProperty('Torque_Limit')) {
        this.Torque_Limit = initObj.Torque_Limit
      }
      else {
        this.Torque_Limit = 0;
      }
      if (initObj.hasOwnProperty('Present_Position')) {
        this.Present_Position = initObj.Present_Position
      }
      else {
        this.Present_Position = 0;
      }
      if (initObj.hasOwnProperty('Present_Speed')) {
        this.Present_Speed = initObj.Present_Speed
      }
      else {
        this.Present_Speed = 0;
      }
      if (initObj.hasOwnProperty('Present_Load')) {
        this.Present_Load = initObj.Present_Load
      }
      else {
        this.Present_Load = 0;
      }
      if (initObj.hasOwnProperty('Present_Voltage')) {
        this.Present_Voltage = initObj.Present_Voltage
      }
      else {
        this.Present_Voltage = 0;
      }
      if (initObj.hasOwnProperty('Present_Temperature')) {
        this.Present_Temperature = initObj.Present_Temperature
      }
      else {
        this.Present_Temperature = 0;
      }
      if (initObj.hasOwnProperty('Registered')) {
        this.Registered = initObj.Registered
      }
      else {
        this.Registered = 0;
      }
      if (initObj.hasOwnProperty('Moving')) {
        this.Moving = initObj.Moving
      }
      else {
        this.Moving = 0;
      }
      if (initObj.hasOwnProperty('Lock')) {
        this.Lock = initObj.Lock
      }
      else {
        this.Lock = 0;
      }
      if (initObj.hasOwnProperty('Punch')) {
        this.Punch = initObj.Punch
      }
      else {
        this.Punch = 0;
      }
      if (initObj.hasOwnProperty('Current')) {
        this.Current = initObj.Current
      }
      else {
        this.Current = 0;
      }
      if (initObj.hasOwnProperty('Torque_Control_Mode_Enable')) {
        this.Torque_Control_Mode_Enable = initObj.Torque_Control_Mode_Enable
      }
      else {
        this.Torque_Control_Mode_Enable = 0;
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
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MXExt
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
    // Serialize message field [CW_Angle_Limit]
    bufferOffset = _serializer.uint16(obj.CW_Angle_Limit, buffer, bufferOffset);
    // Serialize message field [CCW_Angle_Limit]
    bufferOffset = _serializer.uint16(obj.CCW_Angle_Limit, buffer, bufferOffset);
    // Serialize message field [Temperature_Limit]
    bufferOffset = _serializer.uint8(obj.Temperature_Limit, buffer, bufferOffset);
    // Serialize message field [Min_Voltage_Limit]
    bufferOffset = _serializer.uint8(obj.Min_Voltage_Limit, buffer, bufferOffset);
    // Serialize message field [Max_Voltage_Limit]
    bufferOffset = _serializer.uint8(obj.Max_Voltage_Limit, buffer, bufferOffset);
    // Serialize message field [Max_Torque]
    bufferOffset = _serializer.uint16(obj.Max_Torque, buffer, bufferOffset);
    // Serialize message field [Status_Return_Level]
    bufferOffset = _serializer.uint8(obj.Status_Return_Level, buffer, bufferOffset);
    // Serialize message field [Alarm_LED]
    bufferOffset = _serializer.uint8(obj.Alarm_LED, buffer, bufferOffset);
    // Serialize message field [Shutdown]
    bufferOffset = _serializer.uint8(obj.Shutdown, buffer, bufferOffset);
    // Serialize message field [Multi_Turn_Offset]
    bufferOffset = _serializer.uint16(obj.Multi_Turn_Offset, buffer, bufferOffset);
    // Serialize message field [Resolution_Divider]
    bufferOffset = _serializer.uint8(obj.Resolution_Divider, buffer, bufferOffset);
    // Serialize message field [Torque_Enable]
    bufferOffset = _serializer.uint8(obj.Torque_Enable, buffer, bufferOffset);
    // Serialize message field [LED]
    bufferOffset = _serializer.uint8(obj.LED, buffer, bufferOffset);
    // Serialize message field [D_gain]
    bufferOffset = _serializer.uint8(obj.D_gain, buffer, bufferOffset);
    // Serialize message field [I_gain]
    bufferOffset = _serializer.uint8(obj.I_gain, buffer, bufferOffset);
    // Serialize message field [P_gain]
    bufferOffset = _serializer.uint8(obj.P_gain, buffer, bufferOffset);
    // Serialize message field [Goal_Position]
    bufferOffset = _serializer.uint16(obj.Goal_Position, buffer, bufferOffset);
    // Serialize message field [Moving_Speed]
    bufferOffset = _serializer.uint16(obj.Moving_Speed, buffer, bufferOffset);
    // Serialize message field [Torque_Limit]
    bufferOffset = _serializer.uint16(obj.Torque_Limit, buffer, bufferOffset);
    // Serialize message field [Present_Position]
    bufferOffset = _serializer.uint16(obj.Present_Position, buffer, bufferOffset);
    // Serialize message field [Present_Speed]
    bufferOffset = _serializer.uint16(obj.Present_Speed, buffer, bufferOffset);
    // Serialize message field [Present_Load]
    bufferOffset = _serializer.uint16(obj.Present_Load, buffer, bufferOffset);
    // Serialize message field [Present_Voltage]
    bufferOffset = _serializer.uint8(obj.Present_Voltage, buffer, bufferOffset);
    // Serialize message field [Present_Temperature]
    bufferOffset = _serializer.uint8(obj.Present_Temperature, buffer, bufferOffset);
    // Serialize message field [Registered]
    bufferOffset = _serializer.uint8(obj.Registered, buffer, bufferOffset);
    // Serialize message field [Moving]
    bufferOffset = _serializer.uint8(obj.Moving, buffer, bufferOffset);
    // Serialize message field [Lock]
    bufferOffset = _serializer.uint8(obj.Lock, buffer, bufferOffset);
    // Serialize message field [Punch]
    bufferOffset = _serializer.uint16(obj.Punch, buffer, bufferOffset);
    // Serialize message field [Current]
    bufferOffset = _serializer.uint16(obj.Current, buffer, bufferOffset);
    // Serialize message field [Torque_Control_Mode_Enable]
    bufferOffset = _serializer.uint8(obj.Torque_Control_Mode_Enable, buffer, bufferOffset);
    // Serialize message field [Goal_Torque]
    bufferOffset = _serializer.uint16(obj.Goal_Torque, buffer, bufferOffset);
    // Serialize message field [Goal_Acceleration]
    bufferOffset = _serializer.uint8(obj.Goal_Acceleration, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MXExt
    let len;
    let data = new MXExt(null);
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
    // Deserialize message field [CW_Angle_Limit]
    data.CW_Angle_Limit = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [CCW_Angle_Limit]
    data.CCW_Angle_Limit = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Temperature_Limit]
    data.Temperature_Limit = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Min_Voltage_Limit]
    data.Min_Voltage_Limit = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Max_Voltage_Limit]
    data.Max_Voltage_Limit = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Max_Torque]
    data.Max_Torque = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Status_Return_Level]
    data.Status_Return_Level = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Alarm_LED]
    data.Alarm_LED = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Shutdown]
    data.Shutdown = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Multi_Turn_Offset]
    data.Multi_Turn_Offset = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Resolution_Divider]
    data.Resolution_Divider = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Torque_Enable]
    data.Torque_Enable = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [LED]
    data.LED = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [D_gain]
    data.D_gain = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [I_gain]
    data.I_gain = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [P_gain]
    data.P_gain = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Goal_Position]
    data.Goal_Position = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Moving_Speed]
    data.Moving_Speed = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Torque_Limit]
    data.Torque_Limit = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Present_Position]
    data.Present_Position = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Present_Speed]
    data.Present_Speed = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Present_Load]
    data.Present_Load = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Present_Voltage]
    data.Present_Voltage = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Present_Temperature]
    data.Present_Temperature = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Registered]
    data.Registered = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Moving]
    data.Moving = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Lock]
    data.Lock = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Punch]
    data.Punch = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Current]
    data.Current = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Torque_Control_Mode_Enable]
    data.Torque_Control_Mode_Enable = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Goal_Torque]
    data.Goal_Torque = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Goal_Acceleration]
    data.Goal_Acceleration = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 51;
  }

  static datatype() {
    // Returns string type for a message object
    return 'dynamixel_workbench_msgs/MXExt';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2fbd27c9b5d24a5196a094d168160140';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This message is compatible with control table of Dynamixel MX Series (MX-64T/MX64-R/MX-64AT/MX-64AR, MX-106T/MX-106R)
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MXExt(null);
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

    if (msg.CW_Angle_Limit !== undefined) {
      resolved.CW_Angle_Limit = msg.CW_Angle_Limit;
    }
    else {
      resolved.CW_Angle_Limit = 0
    }

    if (msg.CCW_Angle_Limit !== undefined) {
      resolved.CCW_Angle_Limit = msg.CCW_Angle_Limit;
    }
    else {
      resolved.CCW_Angle_Limit = 0
    }

    if (msg.Temperature_Limit !== undefined) {
      resolved.Temperature_Limit = msg.Temperature_Limit;
    }
    else {
      resolved.Temperature_Limit = 0
    }

    if (msg.Min_Voltage_Limit !== undefined) {
      resolved.Min_Voltage_Limit = msg.Min_Voltage_Limit;
    }
    else {
      resolved.Min_Voltage_Limit = 0
    }

    if (msg.Max_Voltage_Limit !== undefined) {
      resolved.Max_Voltage_Limit = msg.Max_Voltage_Limit;
    }
    else {
      resolved.Max_Voltage_Limit = 0
    }

    if (msg.Max_Torque !== undefined) {
      resolved.Max_Torque = msg.Max_Torque;
    }
    else {
      resolved.Max_Torque = 0
    }

    if (msg.Status_Return_Level !== undefined) {
      resolved.Status_Return_Level = msg.Status_Return_Level;
    }
    else {
      resolved.Status_Return_Level = 0
    }

    if (msg.Alarm_LED !== undefined) {
      resolved.Alarm_LED = msg.Alarm_LED;
    }
    else {
      resolved.Alarm_LED = 0
    }

    if (msg.Shutdown !== undefined) {
      resolved.Shutdown = msg.Shutdown;
    }
    else {
      resolved.Shutdown = 0
    }

    if (msg.Multi_Turn_Offset !== undefined) {
      resolved.Multi_Turn_Offset = msg.Multi_Turn_Offset;
    }
    else {
      resolved.Multi_Turn_Offset = 0
    }

    if (msg.Resolution_Divider !== undefined) {
      resolved.Resolution_Divider = msg.Resolution_Divider;
    }
    else {
      resolved.Resolution_Divider = 0
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

    if (msg.D_gain !== undefined) {
      resolved.D_gain = msg.D_gain;
    }
    else {
      resolved.D_gain = 0
    }

    if (msg.I_gain !== undefined) {
      resolved.I_gain = msg.I_gain;
    }
    else {
      resolved.I_gain = 0
    }

    if (msg.P_gain !== undefined) {
      resolved.P_gain = msg.P_gain;
    }
    else {
      resolved.P_gain = 0
    }

    if (msg.Goal_Position !== undefined) {
      resolved.Goal_Position = msg.Goal_Position;
    }
    else {
      resolved.Goal_Position = 0
    }

    if (msg.Moving_Speed !== undefined) {
      resolved.Moving_Speed = msg.Moving_Speed;
    }
    else {
      resolved.Moving_Speed = 0
    }

    if (msg.Torque_Limit !== undefined) {
      resolved.Torque_Limit = msg.Torque_Limit;
    }
    else {
      resolved.Torque_Limit = 0
    }

    if (msg.Present_Position !== undefined) {
      resolved.Present_Position = msg.Present_Position;
    }
    else {
      resolved.Present_Position = 0
    }

    if (msg.Present_Speed !== undefined) {
      resolved.Present_Speed = msg.Present_Speed;
    }
    else {
      resolved.Present_Speed = 0
    }

    if (msg.Present_Load !== undefined) {
      resolved.Present_Load = msg.Present_Load;
    }
    else {
      resolved.Present_Load = 0
    }

    if (msg.Present_Voltage !== undefined) {
      resolved.Present_Voltage = msg.Present_Voltage;
    }
    else {
      resolved.Present_Voltage = 0
    }

    if (msg.Present_Temperature !== undefined) {
      resolved.Present_Temperature = msg.Present_Temperature;
    }
    else {
      resolved.Present_Temperature = 0
    }

    if (msg.Registered !== undefined) {
      resolved.Registered = msg.Registered;
    }
    else {
      resolved.Registered = 0
    }

    if (msg.Moving !== undefined) {
      resolved.Moving = msg.Moving;
    }
    else {
      resolved.Moving = 0
    }

    if (msg.Lock !== undefined) {
      resolved.Lock = msg.Lock;
    }
    else {
      resolved.Lock = 0
    }

    if (msg.Punch !== undefined) {
      resolved.Punch = msg.Punch;
    }
    else {
      resolved.Punch = 0
    }

    if (msg.Current !== undefined) {
      resolved.Current = msg.Current;
    }
    else {
      resolved.Current = 0
    }

    if (msg.Torque_Control_Mode_Enable !== undefined) {
      resolved.Torque_Control_Mode_Enable = msg.Torque_Control_Mode_Enable;
    }
    else {
      resolved.Torque_Control_Mode_Enable = 0
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

    return resolved;
    }
};

module.exports = MXExt;
