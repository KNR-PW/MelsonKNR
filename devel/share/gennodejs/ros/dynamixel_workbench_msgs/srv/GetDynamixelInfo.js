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

let DynamixelInfo = require('../msg/DynamixelInfo.js');

//-----------------------------------------------------------

class GetDynamixelInfoRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetDynamixelInfoRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetDynamixelInfoRequest
    let len;
    let data = new GetDynamixelInfoRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'dynamixel_workbench_msgs/GetDynamixelInfoRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # It is Served by 'single_dynamixel_monitor' node
    # This message is used to get information of dynamixel
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetDynamixelInfoRequest(null);
    return resolved;
    }
};

class GetDynamixelInfoResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.dynamixel_info = null;
    }
    else {
      if (initObj.hasOwnProperty('dynamixel_info')) {
        this.dynamixel_info = initObj.dynamixel_info
      }
      else {
        this.dynamixel_info = new DynamixelInfo();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetDynamixelInfoResponse
    // Serialize message field [dynamixel_info]
    bufferOffset = DynamixelInfo.serialize(obj.dynamixel_info, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetDynamixelInfoResponse
    let len;
    let data = new GetDynamixelInfoResponse(null);
    // Deserialize message field [dynamixel_info]
    data.dynamixel_info = DynamixelInfo.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += DynamixelInfo.getMessageSize(object.dynamixel_info);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'dynamixel_workbench_msgs/GetDynamixelInfoResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5075be00278efc6e6ba91f48b43afb53';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    DynamixelInfo dynamixel_info
    
    
    ================================================================================
    MSG: dynamixel_workbench_msgs/DynamixelInfo
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
    const resolved = new GetDynamixelInfoResponse(null);
    if (msg.dynamixel_info !== undefined) {
      resolved.dynamixel_info = DynamixelInfo.Resolve(msg.dynamixel_info)
    }
    else {
      resolved.dynamixel_info = new DynamixelInfo()
    }

    return resolved;
    }
};

module.exports = {
  Request: GetDynamixelInfoRequest,
  Response: GetDynamixelInfoResponse,
  md5sum() { return '5075be00278efc6e6ba91f48b43afb53'; },
  datatype() { return 'dynamixel_workbench_msgs/GetDynamixelInfo'; }
};
