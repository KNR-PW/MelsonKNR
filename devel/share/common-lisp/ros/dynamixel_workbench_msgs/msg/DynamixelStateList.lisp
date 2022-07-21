; Auto-generated. Do not edit!


(cl:in-package dynamixel_workbench_msgs-msg)


;//! \htmlinclude DynamixelStateList.msg.html

(cl:defclass <DynamixelStateList> (roslisp-msg-protocol:ros-message)
  ((dynamixel_state
    :reader dynamixel_state
    :initarg :dynamixel_state
    :type (cl:vector dynamixel_workbench_msgs-msg:DynamixelState)
   :initform (cl:make-array 0 :element-type 'dynamixel_workbench_msgs-msg:DynamixelState :initial-element (cl:make-instance 'dynamixel_workbench_msgs-msg:DynamixelState))))
)

(cl:defclass DynamixelStateList (<DynamixelStateList>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DynamixelStateList>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DynamixelStateList)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dynamixel_workbench_msgs-msg:<DynamixelStateList> is deprecated: use dynamixel_workbench_msgs-msg:DynamixelStateList instead.")))

(cl:ensure-generic-function 'dynamixel_state-val :lambda-list '(m))
(cl:defmethod dynamixel_state-val ((m <DynamixelStateList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-msg:dynamixel_state-val is deprecated.  Use dynamixel_workbench_msgs-msg:dynamixel_state instead.")
  (dynamixel_state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DynamixelStateList>) ostream)
  "Serializes a message object of type '<DynamixelStateList>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'dynamixel_state))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'dynamixel_state))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DynamixelStateList>) istream)
  "Deserializes a message object of type '<DynamixelStateList>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'dynamixel_state) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'dynamixel_state)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'dynamixel_workbench_msgs-msg:DynamixelState))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DynamixelStateList>)))
  "Returns string type for a message object of type '<DynamixelStateList>"
  "dynamixel_workbench_msgs/DynamixelStateList")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DynamixelStateList)))
  "Returns string type for a message object of type 'DynamixelStateList"
  "dynamixel_workbench_msgs/DynamixelStateList")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DynamixelStateList>)))
  "Returns md5sum for a message object of type '<DynamixelStateList>"
  "52c1af7cbc10f50d2e78a86519b081ee")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DynamixelStateList)))
  "Returns md5sum for a message object of type 'DynamixelStateList"
  "52c1af7cbc10f50d2e78a86519b081ee")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DynamixelStateList>)))
  "Returns full string definition for message of type '<DynamixelStateList>"
  (cl:format cl:nil "# DynamixelState List~%~%DynamixelState[] dynamixel_state~%~%================================================================================~%MSG: dynamixel_workbench_msgs/DynamixelState~%# This message includes basic data of dynamixel~%~%string name~%uint8  id~%~%int32  present_position~%int32  present_velocity~%int16  present_current~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DynamixelStateList)))
  "Returns full string definition for message of type 'DynamixelStateList"
  (cl:format cl:nil "# DynamixelState List~%~%DynamixelState[] dynamixel_state~%~%================================================================================~%MSG: dynamixel_workbench_msgs/DynamixelState~%# This message includes basic data of dynamixel~%~%string name~%uint8  id~%~%int32  present_position~%int32  present_velocity~%int16  present_current~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DynamixelStateList>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'dynamixel_state) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DynamixelStateList>))
  "Converts a ROS message object to a list"
  (cl:list 'DynamixelStateList
    (cl:cons ':dynamixel_state (dynamixel_state msg))
))
