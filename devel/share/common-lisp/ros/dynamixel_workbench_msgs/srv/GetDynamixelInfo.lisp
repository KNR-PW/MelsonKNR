; Auto-generated. Do not edit!


(cl:in-package dynamixel_workbench_msgs-srv)


;//! \htmlinclude GetDynamixelInfo-request.msg.html

(cl:defclass <GetDynamixelInfo-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GetDynamixelInfo-request (<GetDynamixelInfo-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetDynamixelInfo-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetDynamixelInfo-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dynamixel_workbench_msgs-srv:<GetDynamixelInfo-request> is deprecated: use dynamixel_workbench_msgs-srv:GetDynamixelInfo-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetDynamixelInfo-request>) ostream)
  "Serializes a message object of type '<GetDynamixelInfo-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetDynamixelInfo-request>) istream)
  "Deserializes a message object of type '<GetDynamixelInfo-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetDynamixelInfo-request>)))
  "Returns string type for a service object of type '<GetDynamixelInfo-request>"
  "dynamixel_workbench_msgs/GetDynamixelInfoRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetDynamixelInfo-request)))
  "Returns string type for a service object of type 'GetDynamixelInfo-request"
  "dynamixel_workbench_msgs/GetDynamixelInfoRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetDynamixelInfo-request>)))
  "Returns md5sum for a message object of type '<GetDynamixelInfo-request>"
  "5075be00278efc6e6ba91f48b43afb53")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetDynamixelInfo-request)))
  "Returns md5sum for a message object of type 'GetDynamixelInfo-request"
  "5075be00278efc6e6ba91f48b43afb53")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetDynamixelInfo-request>)))
  "Returns full string definition for message of type '<GetDynamixelInfo-request>"
  (cl:format cl:nil "# It is Served by 'single_dynamixel_monitor' node~%# This message is used to get information of dynamixel~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetDynamixelInfo-request)))
  "Returns full string definition for message of type 'GetDynamixelInfo-request"
  (cl:format cl:nil "# It is Served by 'single_dynamixel_monitor' node~%# This message is used to get information of dynamixel~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetDynamixelInfo-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetDynamixelInfo-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetDynamixelInfo-request
))
;//! \htmlinclude GetDynamixelInfo-response.msg.html

(cl:defclass <GetDynamixelInfo-response> (roslisp-msg-protocol:ros-message)
  ((dynamixel_info
    :reader dynamixel_info
    :initarg :dynamixel_info
    :type dynamixel_workbench_msgs-msg:DynamixelInfo
    :initform (cl:make-instance 'dynamixel_workbench_msgs-msg:DynamixelInfo)))
)

(cl:defclass GetDynamixelInfo-response (<GetDynamixelInfo-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetDynamixelInfo-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetDynamixelInfo-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dynamixel_workbench_msgs-srv:<GetDynamixelInfo-response> is deprecated: use dynamixel_workbench_msgs-srv:GetDynamixelInfo-response instead.")))

(cl:ensure-generic-function 'dynamixel_info-val :lambda-list '(m))
(cl:defmethod dynamixel_info-val ((m <GetDynamixelInfo-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_workbench_msgs-srv:dynamixel_info-val is deprecated.  Use dynamixel_workbench_msgs-srv:dynamixel_info instead.")
  (dynamixel_info m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetDynamixelInfo-response>) ostream)
  "Serializes a message object of type '<GetDynamixelInfo-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'dynamixel_info) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetDynamixelInfo-response>) istream)
  "Deserializes a message object of type '<GetDynamixelInfo-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'dynamixel_info) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetDynamixelInfo-response>)))
  "Returns string type for a service object of type '<GetDynamixelInfo-response>"
  "dynamixel_workbench_msgs/GetDynamixelInfoResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetDynamixelInfo-response)))
  "Returns string type for a service object of type 'GetDynamixelInfo-response"
  "dynamixel_workbench_msgs/GetDynamixelInfoResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetDynamixelInfo-response>)))
  "Returns md5sum for a message object of type '<GetDynamixelInfo-response>"
  "5075be00278efc6e6ba91f48b43afb53")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetDynamixelInfo-response)))
  "Returns md5sum for a message object of type 'GetDynamixelInfo-response"
  "5075be00278efc6e6ba91f48b43afb53")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetDynamixelInfo-response>)))
  "Returns full string definition for message of type '<GetDynamixelInfo-response>"
  (cl:format cl:nil "~%DynamixelInfo dynamixel_info~%~%~%================================================================================~%MSG: dynamixel_workbench_msgs/DynamixelInfo~%# This message includes information of dynamixel's basic parameter~%~%DynamixelLoadInfo load_info~%~%string model_name~%uint16 model_number~%uint8 model_id~%~%~%================================================================================~%MSG: dynamixel_workbench_msgs/DynamixelLoadInfo~%# This message includes dynamixel's load information~%~%string device_name~%uint64 baud_rate~%float32 protocol_version~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetDynamixelInfo-response)))
  "Returns full string definition for message of type 'GetDynamixelInfo-response"
  (cl:format cl:nil "~%DynamixelInfo dynamixel_info~%~%~%================================================================================~%MSG: dynamixel_workbench_msgs/DynamixelInfo~%# This message includes information of dynamixel's basic parameter~%~%DynamixelLoadInfo load_info~%~%string model_name~%uint16 model_number~%uint8 model_id~%~%~%================================================================================~%MSG: dynamixel_workbench_msgs/DynamixelLoadInfo~%# This message includes dynamixel's load information~%~%string device_name~%uint64 baud_rate~%float32 protocol_version~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetDynamixelInfo-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'dynamixel_info))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetDynamixelInfo-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetDynamixelInfo-response
    (cl:cons ':dynamixel_info (dynamixel_info msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetDynamixelInfo)))
  'GetDynamixelInfo-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetDynamixelInfo)))
  'GetDynamixelInfo-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetDynamixelInfo)))
  "Returns string type for a service object of type '<GetDynamixelInfo>"
  "dynamixel_workbench_msgs/GetDynamixelInfo")