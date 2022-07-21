; Auto-generated. Do not edit!


(cl:in-package dynamixel_workbench_msgs-msg)


;//! \htmlinclude DynamixelInfo.msg.html

(cl:defclass <DynamixelInfo> (roslisp-msg-protocol:ros-message)
  ((load_info
    :reader load_info
    :initarg :load_info
    :type dynamixel_workbench_msgs-msg:DynamixelLoadInfo
    :initform (cl:make-instance 'dynamixel_workbench_msgs-msg:DynamixelLoadInfo))
   (model_name
    :reader model_name
    :initarg :model_name
    :type cl:string
    :initform "")
   (model_number
    :reader model_number
    :initarg :model_number
    :type cl:fixnum
    :initform 0)
   (model_id
    :reader model_id
    :initarg :model_id
    :type cl:fixnum
    :initform 0))
)

(cl:defclass DynamixelInfo (<DynamixelInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DynamixelInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DynamixelInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dynamixel_workbench_msgs-msg:<DynamixelInfo> is deprecated: use dynamixel_workbench_msgs-msg:DynamixelInfo instead.")))

(cl:ensure-generic-function 'load_info-val :lambda-list '(m))
(cl:defmethod load_info-val ((m <DynamixelInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:load_info-val is deprecated.  Use dynamixel_workbench_msgs-msg:load_info instead.")
  (load_info m))

(cl:ensure-generic-function 'model_name-val :lambda-list '(m))
(cl:defmethod model_name-val ((m <DynamixelInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:model_name-val is deprecated.  Use dynamixel_workbench_msgs-msg:model_name instead.")
  (model_name m))

(cl:ensure-generic-function 'model_number-val :lambda-list '(m))
(cl:defmethod model_number-val ((m <DynamixelInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:model_number-val is deprecated.  Use dynamixel_workbench_msgs-msg:model_number instead.")
  (model_number m))

(cl:ensure-generic-function 'model_id-val :lambda-list '(m))
(cl:defmethod model_id-val ((m <DynamixelInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:model_id-val is deprecated.  Use dynamixel_workbench_msgs-msg:model_id instead.")
  (model_id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DynamixelInfo>) ostream)
  "Serializes a message object of type '<DynamixelInfo>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'load_info) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'model_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'model_name))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'model_number)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'model_number)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'model_id)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DynamixelInfo>) istream)
  "Deserializes a message object of type '<DynamixelInfo>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'load_info) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'model_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'model_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'model_number)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'model_number)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'model_id)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DynamixelInfo>)))
  "Returns string type for a message object of type '<DynamixelInfo>"
  "dynamixel_workbench_msgs/DynamixelInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DynamixelInfo)))
  "Returns string type for a message object of type 'DynamixelInfo"
  "dynamixel_workbench_msgs/DynamixelInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DynamixelInfo>)))
  "Returns md5sum for a message object of type '<DynamixelInfo>"
  "8c02a7626d88db402a8af7bc5e0880d4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DynamixelInfo)))
  "Returns md5sum for a message object of type 'DynamixelInfo"
  "8c02a7626d88db402a8af7bc5e0880d4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DynamixelInfo>)))
  "Returns full string definition for message of type '<DynamixelInfo>"
  (cl:format cl:nil "# This message includes information of dynamixel's basic parameter~%~%DynamixelLoadInfo load_info~%~%string model_name~%uint16 model_number~%uint8 model_id~%~%~%================================================================================~%MSG: dynamixel_workbench_msgs/DynamixelLoadInfo~%# This message includes dynamixel's load information~%~%string device_name~%uint64 baud_rate~%float32 protocol_version~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DynamixelInfo)))
  "Returns full string definition for message of type 'DynamixelInfo"
  (cl:format cl:nil "# This message includes information of dynamixel's basic parameter~%~%DynamixelLoadInfo load_info~%~%string model_name~%uint16 model_number~%uint8 model_id~%~%~%================================================================================~%MSG: dynamixel_workbench_msgs/DynamixelLoadInfo~%# This message includes dynamixel's load information~%~%string device_name~%uint64 baud_rate~%float32 protocol_version~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DynamixelInfo>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'load_info))
     4 (cl:length (cl:slot-value msg 'model_name))
     2
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DynamixelInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'DynamixelInfo
    (cl:cons ':load_info (load_info msg))
    (cl:cons ':model_name (model_name msg))
    (cl:cons ':model_number (model_number msg))
    (cl:cons ':model_id (model_id msg))
))
