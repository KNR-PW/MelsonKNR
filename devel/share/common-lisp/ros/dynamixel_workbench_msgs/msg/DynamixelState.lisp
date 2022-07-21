; Auto-generated. Do not edit!


(cl:in-package dynamixel_workbench_msgs-msg)


;//! \htmlinclude DynamixelState.msg.html

(cl:defclass <DynamixelState> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0)
   (present_position
    :reader present_position
    :initarg :present_position
    :type cl:integer
    :initform 0)
   (present_velocity
    :reader present_velocity
    :initarg :present_velocity
    :type cl:integer
    :initform 0)
   (present_current
    :reader present_current
    :initarg :present_current
    :type cl:fixnum
    :initform 0))
)

(cl:defclass DynamixelState (<DynamixelState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DynamixelState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DynamixelState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dynamixel_workbench_msgs-msg:<DynamixelState> is deprecated: use dynamixel_workbench_msgs-msg:DynamixelState instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <DynamixelState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:name-val is deprecated.  Use dynamixel_workbench_msgs-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <DynamixelState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:id-val is deprecated.  Use dynamixel_workbench_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'present_position-val :lambda-list '(m))
(cl:defmethod present_position-val ((m <DynamixelState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:present_position-val is deprecated.  Use dynamixel_workbench_msgs-msg:present_position instead.")
  (present_position m))

(cl:ensure-generic-function 'present_velocity-val :lambda-list '(m))
(cl:defmethod present_velocity-val ((m <DynamixelState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:present_velocity-val is deprecated.  Use dynamixel_workbench_msgs-msg:present_velocity instead.")
  (present_velocity m))

(cl:ensure-generic-function 'present_current-val :lambda-list '(m))
(cl:defmethod present_current-val ((m <DynamixelState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:present_current-val is deprecated.  Use dynamixel_workbench_msgs-msg:present_current instead.")
  (present_current m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DynamixelState>) ostream)
  "Serializes a message object of type '<DynamixelState>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'present_position)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'present_velocity)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'present_current)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DynamixelState>) istream)
  "Deserializes a message object of type '<DynamixelState>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'present_position) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'present_velocity) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'present_current) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DynamixelState>)))
  "Returns string type for a message object of type '<DynamixelState>"
  "dynamixel_workbench_msgs/DynamixelState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DynamixelState)))
  "Returns string type for a message object of type 'DynamixelState"
  "dynamixel_workbench_msgs/DynamixelState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DynamixelState>)))
  "Returns md5sum for a message object of type '<DynamixelState>"
  "c9a7ca26833f8d4ad5b00272b4226f36")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DynamixelState)))
  "Returns md5sum for a message object of type 'DynamixelState"
  "c9a7ca26833f8d4ad5b00272b4226f36")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DynamixelState>)))
  "Returns full string definition for message of type '<DynamixelState>"
  (cl:format cl:nil "# This message includes basic data of dynamixel~%~%string name~%uint8  id~%~%int32  present_position~%int32  present_velocity~%int16  present_current~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DynamixelState)))
  "Returns full string definition for message of type 'DynamixelState"
  (cl:format cl:nil "# This message includes basic data of dynamixel~%~%string name~%uint8  id~%~%int32  present_position~%int32  present_velocity~%int16  present_current~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DynamixelState>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     1
     4
     4
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DynamixelState>))
  "Converts a ROS message object to a list"
  (cl:list 'DynamixelState
    (cl:cons ':name (name msg))
    (cl:cons ':id (id msg))
    (cl:cons ':present_position (present_position msg))
    (cl:cons ':present_velocity (present_velocity msg))
    (cl:cons ':present_current (present_current msg))
))
