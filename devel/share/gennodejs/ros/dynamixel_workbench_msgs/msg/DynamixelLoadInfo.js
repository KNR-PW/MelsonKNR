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

class DynamixelLoadInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.device_name = null;
      this.baud_rate = null;
      this.protocol_version = null;
    }
    else {
      if (initObj.hasOwnProperty('device_name')) {
        this.device_name = initObj.device_name
      }
      else {
        this.device_name = '';
      }
      if (initObj.hasOwnProperty('baud_rate')) {
        this.baud_rate = initObj.baud_rate
      }
      else {
        this.baud_rate = 0;
      }
      if (initObj.hasOwnProperty('protocol_version')) {
        this.protocol_version = initObj.protocol_version
      }
      else {
        this.protocol_version = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DynamixelLoadInfo
    // Serialize message field [device_name]
    bufferOffset = _serializer.string(obj.device_name, buffer, bufferOffset);
    // Serialize message field [baud_rate]
    bufferOffset = _serializer.uint64(obj.baud_rate, buffer, bufferOffset);
    // Serialize message field [protocol_version]
    bufferOffset = _serializer.float32(obj.protocol_version, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DynamixelLoadInfo
    let len;
    let data = new DynamixelLoadInfo(null);
    // Deserialize message field [device_name]
    data.device_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [baud_rate]
    data.baud_rate = _deserializer.uint64(buffer, bufferOffset);
    // Deserialize message field [protocol_version]
    data.protocol_version = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.device_name);
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'dynamixel_workbench_msgs/DynamixelLoadInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'af24d77e0b8329be8d17a782ba80f5e2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new DynamixelLoadInfo(null);
    if (msg.device_name !== undefined) {
      resolved.device_name = msg.device_name;
    }
    else {
      resolved.device_name = ''
    }

    if (msg.baud_rate !== undefined) {
      resolved.baud_rate = msg.baud_rate;
    }
    else {
      resolved.baud_rate = 0
    }

    if (msg.protocol_version !== undefined) {
      resolved.protocol_version = msg.protocol_version;
    }
    else {
      resolved.protocol_version = 0.0
    }

    return resolved;
    }
};

module.exports = DynamixelLoadInfo;
