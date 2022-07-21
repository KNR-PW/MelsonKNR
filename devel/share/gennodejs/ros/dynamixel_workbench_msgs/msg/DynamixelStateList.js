// Auto-generated. Do not edit!

// (in-package dynamixel_workbench_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let DynamixelState = require('./DynamixelState.js');

//-----------------------------------------------------------

class DynamixelStateList {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.dynamixel_state = null;
    }
    else {
      if (initObj.hasOwnProperty('dynamixel_state')) {
        this.dynamixel_state = initObj.dynamixel_state
      }
      else {
        this.dynamixel_state = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DynamixelStateList
    // Serialize message field [dynamixel_state]
    // Serialize the length for message field [dynamixel_state]
    bufferOffset = _serializer.uint32(obj.dynamixel_state.length, buffer, bufferOffset);
    obj.dynamixel_state.forEach((val) => {
      bufferOffset = DynamixelState.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DynamixelStateList
    let len;
    let data = new DynamixelStateList(null);
    // Deserialize message field [dynamixel_state]
    // Deserialize array length for message field [dynamixel_state]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.dynamixel_state = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.dynamixel_state[i] = DynamixelState.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.dynamixel_state.forEach((val) => {
      length += DynamixelState.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'dynamixel_workbench_msgs/DynamixelStateList';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '52c1af7cbc10f50d2e78a86519b081ee';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # DynamixelState List
    
    DynamixelState[] dynamixel_state
    
    ================================================================================
    MSG: dynamixel_workbench_msgs/DynamixelState
    # This message includes basic data of dynamixel
    
    string name
    uint8  id
    
    int32  present_position
    int32  present_velocity
    int16  present_current
    
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DynamixelStateList(null);
    if (msg.dynamixel_state !== undefined) {
      resolved.dynamixel_state = new Array(msg.dynamixel_state.length);
      for (let i = 0; i < resolved.dynamixel_state.length; ++i) {
        resolved.dynamixel_state[i] = DynamixelState.Resolve(msg.dynamixel_state[i]);
      }
    }
    else {
      resolved.dynamixel_state = []
    }

    return resolved;
    }
};

module.exports = DynamixelStateList;
