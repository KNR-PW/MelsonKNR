// Auto-generated. Do not edit!

// (in-package dynamixel_workbench_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let DynamixelLoadInfo = require('./DynamixelLoadInfo.js');

//-----------------------------------------------------------

class DynamixelInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.load_info = null;
      this.model_name = null;
      this.model_number = null;
      this.model_id = null;
    }
    else {
      if (initObj.hasOwnProperty('load_info')) {
        this.load_info = initObj.load_info
      }
      else {
        this.load_info = new DynamixelLoadInfo();
      }
      if (initObj.hasOwnProperty('model_name')) {
        this.model_name = initObj.model_name
      }
      else {
        this.model_name = '';
      }
      if (initObj.hasOwnProperty('model_number')) {
        this.model_number = initObj.model_number
      }
      else {
        this.model_number = 0;
      }
      if (initObj.hasOwnProperty('model_id')) {
        this.model_id = initObj.model_id
      }
      else {
        this.model_id = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DynamixelInfo
    // Serialize message field [load_info]
    bufferOffset = DynamixelLoadInfo.serialize(obj.load_info, buffer, bufferOffset);
    // Serialize message field [model_name]
    bufferOffset = _serializer.string(obj.model_name, buffer, bufferOffset);
    // Serialize message field [model_number]
    bufferOffset = _serializer.uint16(obj.model_number, buffer, bufferOffset);
    // Serialize message field [model_id]
    bufferOffset = _serializer.uint8(obj.model_id, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DynamixelInfo
    let len;
    let data = new DynamixelInfo(null);
    // Deserialize message field [load_info]
    data.load_info = DynamixelLoadInfo.deserialize(buffer, bufferOffset);
    // Deserialize message field [model_name]
    data.model_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [model_number]
    data.model_number = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [model_id]
    data.model_id = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += DynamixelLoadInfo.getMessageSize(object.load_info);
    length += _getByteLength(object.model_name);
    return length + 7;
  }

  static datatype() {
    // Returns string type for a message object
    return 'dynamixel_workbench_msgs/DynamixelInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8c02a7626d88db402a8af7bc5e0880d4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This message includes information of dynamixel's basic parameter
    
    DynamixelLoadInfo load_info
    
    string model_name
    uint16 model_number
    uint8 model_id
    
    
    ================================================================================
    MSG: dynamixel_workbench_msgs/DynamixelLoadInfo
    # This message includes dynamixel's load information
    
    string device_name
    uint64 baud_rate
    float32 protocol_version
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DynamixelInfo(null);
    if (msg.load_info !== undefined) {
      resolved.load_info = DynamixelLoadInfo.Resolve(msg.load_info)
    }
    else {
      resolved.load_info = new DynamixelLoadInfo()
    }

    if (msg.model_name !== undefined) {
      resolved.model_name = msg.model_name;
    }
    else {
      resolved.model_name = ''
    }

    if (msg.model_number !== undefined) {
      resolved.model_number = msg.model_number;
    }
    else {
      resolved.model_number = 0
    }

    if (msg.model_id !== undefined) {
      resolved.model_id = msg.model_id;
    }
    else {
      resolved.model_id = 0
    }

    return resolved;
    }
};

module.exports = DynamixelInfo;
