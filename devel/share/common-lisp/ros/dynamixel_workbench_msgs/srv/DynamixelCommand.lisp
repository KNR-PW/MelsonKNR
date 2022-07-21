; Auto-generated. Do not edit!


(cl:in-package dynamixel_workbench_msgs-srv)


;//! \htmlinclude DynamixelCommand-request.msg.html

(cl:defclass <DynamixelCommand-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type cl:string
    :initform "")
   (id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0)
   (addr_name
    :reader addr_name
    :initarg :addr_name
    :type cl:string
    :initform "")
   (value
    :reader value
    :initarg :value
    :type cl:integer
    :initform 0))
)

(cl:defclass DynamixelCommand-request (<DynamixelCommand-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DynamixelCommand-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DynamixelCommand-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dynamixel_workbench_msgs-srv:<DynamixelCommand-request> is deprecated: use dynamixel_workbench_msgs-srv:DynamixelCommand-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <DynamixelCommand-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-srv:command-val is deprecated.  Use dynamixel_workbench_msgs-srv:command instead.")
  (command m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <DynamixelCommand-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-srv:id-val is deprecated.  Use dynamixel_workbench_msgs-srv:id instead.")
  (id m))

(cl:ensure-generic-function 'addr_name-val :lambda-list '(m))
(cl:defmethod addr_name-val ((m <DynamixelCommand-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-srv:addr_name-val is deprecated.  Use dynamixel_workbench_msgs-srv:addr_name instead.")
  (addr_name m))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <DynamixelCommand-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-srv:value-val is deprecated.  Use dynamixel_workbench_msgs-srv:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DynamixelCommand-request>) ostream)
  "Serializes a message object of type '<DynamixelCommand-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'command))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'command))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'addr_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'addr_name))
  (cl:let* ((signed (cl:slot-value msg 'value)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DynamixelCommand-request>) istream)
  "Deserializes a message object of type '<DynamixelCommand-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'command) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'command) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'addr_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'addr_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'value) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DynamixelCommand-request>)))
  "Returns string type for a service object of type '<DynamixelCommand-request>"
  "dynamixel_workbench_msgs/DynamixelCommandRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DynamixelCommand-request)))
  "Returns string type for a service object of type 'DynamixelCommand-request"
  "dynamixel_workbench_msgs/DynamixelCommandRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DynamixelCommand-request>)))
  "Returns md5sum for a message object of type '<DynamixelCommand-request>"
  "0727903129a32e0035005c41640400e6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DynamixelCommand-request)))
  "Returns md5sum for a message object of type 'DynamixelCommand-request"
  "0727903129a32e0035005c41640400e6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DynamixelCommand-request>)))
  "Returns full string definition for message of type '<DynamixelCommand-request>"
  (cl:format cl:nil "# It is Served by 'single_dynamixel_monitor' node~%# This message is used to send command to dynamixel~%~%string command~%~%uint8 id~%string addr_name~%int32 value~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DynamixelCommand-request)))
  "Returns full string definition for message of type 'DynamixelCommand-request"
  (cl:format cl:nil "# It is Served by 'single_dynamixel_monitor' node~%# This message is used to send command to dynamixel~%~%string command~%~%uint8 id~%string addr_name~%int32 value~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DynamixelCommand-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'command))
     1
     4 (cl:length (cl:slot-value msg 'addr_name))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DynamixelCommand-request>))
  "Converts a ROS message object to a list"
  (cl:list 'DynamixelCommand-request
    (cl:cons ':command (command msg))
    (cl:cons ':id (id msg))
    (cl:cons ':addr_name (addr_name msg))
    (cl:cons ':value (value msg))
))
;//! \htmlinclude DynamixelCommand-response.msg.html

(cl:defclass <DynamixelCommand-response> (roslisp-msg-protocol:ros-message)
  ((comm_result
    :reader comm_result
    :initarg :comm_result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass DynamixelCommand-response (<DynamixelCommand-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DynamixelCommand-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DynamixelCommand-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dynamixel_workbench_msgs-srv:<DynamixelCommand-response> is deprecated: use dynamixel_workbench_msgs-srv:DynamixelCommand-response instead.")))

(cl:ensure-generic-function 'comm_result-val :lambda-list '(m))
(cl:defmethod comm_result-val ((m <DynamixelCommand-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-srv:comm_result-val is deprecated.  Use dynamixel_workbench_msgs-srv:comm_result instead.")
  (comm_result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DynamixelCommand-response>) ostream)
  "Serializes a message object of type '<DynamixelCommand-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'comm_result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DynamixelCommand-response>) istream)
  "Deserializes a message object of type '<DynamixelCommand-response>"
    (cl:setf (cl:slot-value msg 'comm_result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DynamixelCommand-response>)))
  "Returns string type for a service object of type '<DynamixelCommand-response>"
  "dynamixel_workbench_msgs/DynamixelCommandResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DynamixelCommand-response)))
  "Returns string type for a service object of type 'DynamixelCommand-response"
  "dynamixel_workbench_msgs/DynamixelCommandResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DynamixelCommand-response>)))
  "Returns md5sum for a message object of type '<DynamixelCommand-response>"
  "0727903129a32e0035005c41640400e6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DynamixelCommand-response)))
  "Returns md5sum for a message object of type 'DynamixelCommand-response"
  "0727903129a32e0035005c41640400e6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DynamixelCommand-response>)))
  "Returns full string definition for message of type '<DynamixelCommand-response>"
  (cl:format cl:nil "~%bool comm_result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DynamixelCommand-response)))
  "Returns full string definition for message of type 'DynamixelCommand-response"
  (cl:format cl:nil "~%bool comm_result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DynamixelCommand-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DynamixelCommand-response>))
  "Converts a ROS message object to a list"
  (cl:list 'DynamixelCommand-response
    (cl:cons ':comm_result (comm_result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'DynamixelCommand)))
  'DynamixelCommand-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'DynamixelCommand)))
  'DynamixelCommand-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DynamixelCommand)))
  "Returns string type for a service object of type '<DynamixelCommand>"
  "dynamixel_workbench_msgs/DynamixelCommand")