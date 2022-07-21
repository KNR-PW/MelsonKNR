; Auto-generated. Do not edit!


(cl:in-package dynamixel_workbench_msgs-msg)


;//! \htmlinclude DynamixelLoadInfo.msg.html

(cl:defclass <DynamixelLoadInfo> (roslisp-msg-protocol:ros-message)
  ((device_name
    :reader device_name
    :initarg :device_name
    :type cl:string
    :initform "")
   (baud_rate
    :reader baud_rate
    :initarg :baud_rate
    :type cl:integer
    :initform 0)
   (protocol_version
    :reader protocol_version
    :initarg :protocol_version
    :type cl:float
    :initform 0.0))
)

(cl:defclass DynamixelLoadInfo (<DynamixelLoadInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DynamixelLoadInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DynamixelLoadInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dynamixel_workbench_msgs-msg:<DynamixelLoadInfo> is deprecated: use dynamixel_workbench_msgs-msg:DynamixelLoadInfo instead.")))

(cl:ensure-generic-function 'device_name-val :lambda-list '(m))
(cl:defmethod device_name-val ((m <DynamixelLoadInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:device_name-val is deprecated.  Use dynamixel_workbench_msgs-msg:device_name instead.")
  (device_name m))

(cl:ensure-generic-function 'baud_rate-val :lambda-list '(m))
(cl:defmethod baud_rate-val ((m <DynamixelLoadInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:baud_rate-val is deprecated.  Use dynamixel_workbench_msgs-msg:baud_rate instead.")
  (baud_rate m))

(cl:ensure-generic-function 'protocol_version-val :lambda-list '(m))
(cl:defmethod protocol_version-val ((m <DynamixelLoadInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:protocol_version-val is deprecated.  Use dynamixel_workbench_msgs-msg:protocol_version instead.")
  (protocol_version m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DynamixelLoadInfo>) ostream)
  "Serializes a message object of type '<DynamixelLoadInfo>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'device_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'device_name))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'baud_rate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'baud_rate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'baud_rate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'baud_rate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'baud_rate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'baud_rate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'baud_rate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'baud_rate)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'protocol_version))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DynamixelLoadInfo>) istream)
  "Deserializes a message object of type '<DynamixelLoadInfo>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'device_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'device_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'baud_rate)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'baud_rate)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'baud_rate)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'baud_rate)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'baud_rate)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'baud_rate)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'baud_rate)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'baud_rate)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'protocol_version) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DynamixelLoadInfo>)))
  "Returns string type for a message object of type '<DynamixelLoadInfo>"
  "dynamixel_workbench_msgs/DynamixelLoadInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DynamixelLoadInfo)))
  "Returns string type for a message object of type 'DynamixelLoadInfo"
  "dynamixel_workbench_msgs/DynamixelLoadInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DynamixelLoadInfo>)))
  "Returns md5sum for a message object of type '<DynamixelLoadInfo>"
  "af24d77e0b8329be8d17a782ba80f5e2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DynamixelLoadInfo)))
  "Returns md5sum for a message object of type 'DynamixelLoadInfo"
  "af24d77e0b8329be8d17a782ba80f5e2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DynamixelLoadInfo>)))
  "Returns full string definition for message of type '<DynamixelLoadInfo>"
  (cl:format cl:nil "# This message includes dynamixel's load information~%~%string device_name~%uint64 baud_rate~%float32 protocol_version~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DynamixelLoadInfo)))
  "Returns full string definition for message of type 'DynamixelLoadInfo"
  (cl:format cl:nil "# This message includes dynamixel's load information~%~%string device_name~%uint64 baud_rate~%float32 protocol_version~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DynamixelLoadInfo>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'device_name))
     8
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DynamixelLoadInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'DynamixelLoadInfo
    (cl:cons ':device_name (device_name msg))
    (cl:cons ':baud_rate (baud_rate msg))
    (cl:cons ':protocol_version (protocol_version msg))
))
