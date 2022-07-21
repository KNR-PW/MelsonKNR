// Auto-generated. Do not edit!

// (in-package dynamixel_workbench_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class DynamixelCommandRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.command = null;
      this.id = null;
      this.addr_name = null;
      this.value = null;
    }
    else {
      if (initObj.hasOwnProperty('command')) {
        this.command = initObj.command
      }
      else {
        this.command = '';
      }
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('addr_name')) {
        this.addr_name = initObj.addr_name
      }
      else {
        this.addr_name = '';
      }
      if (initObj.hasOwnProperty('value')) {
        this.value = initObj.value
      }
      else {
        this.value = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DynamixelCommandRequest
    // Serialize message field [command]
    bufferOffset = _serializer.string(obj.command, buffer, bufferOffset);
    // Serialize message field [id]
    bufferOffset = _serializer.uint8(obj.id, buffer, bufferOffset);
    // Serialize message field [addr_name]
    bufferOffset = _serializer.string(obj.addr_name, buffer, bufferOffset);
    // Serialize message field [value]
    bufferOffset = _serializer.int32(obj.value, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DynamixelCommandRequest
    let len;
    let data = new DynamixelCommandRequest(null);
    // Deserialize message field [command]
    data.command = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [id]
    data.id = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [addr_name]
    data.addr_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [value]
    data.value = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.command);
    length += _getByteLength(object.addr_name);
    return length + 13;
  }

  static datatype() {
    // Returns string type for a service object
    return 'dynamixel_workbench_msgs/DynamixelCommandRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '567da0de54717bf69d417bbe8d582ee9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # It is Served by 'single_dynamixel_monitor' node
    # This message is used to send command to dynamixel
    
    string command
    
    uint8 id
    string addr_name
    int32 value
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DynamixelCommandRequest(null);
    if (msg.command !== undefined) {
      resolved.command = msg.command;
    }
    else {
      resolved.command = ''
    }

    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.addr_name !== undefined) {
      resolved.addr_name = msg.addr_name;
    }
    else {
      resolved.addr_name = ''
    }

    if (msg.value !== undefined) {
      resolved.value = msg.value;
    }
    else {
      resolved.value = 0
    }

    return resolved;
    }
};

class DynamixelCommandResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.comm_result = null;
    }
    else {
      if (initObj.hasOwnProperty('comm_result')) {
        this.comm_result = initObj.comm_result
      }
      else {
        this.comm_result = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DynamixelCommandResponse
    // Serialize message field [comm_result]
    bufferOffset = _serializer.bool(obj.comm_result, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DynamixelCommandResponse
    let len;
    let data = new DynamixelCommandResponse(null);
    // Deserialize message field [comm_result]
    data.comm_result = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'dynamixel_workbench_msgs/DynamixelCommandResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f12f56e0367ef7d42085bd5f9c478576';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    bool comm_result
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DynamixelCommandResponse(null);
    if (msg.comm_result !== undefined) {
      resolved.comm_result = msg.comm_result;
    }
    else {
      resolved.comm_result = false
    }

    return resolved;
    }
};

module.exports = {
  Request: DynamixelCommandRequest,
  Response: DynamixelCommandResponse,
  md5sum() { return '0727903129a32e0035005c41640400e6'; },
  datatype() { return 'dynamixel_workbench_msgs/DynamixelCommand'; }
};
