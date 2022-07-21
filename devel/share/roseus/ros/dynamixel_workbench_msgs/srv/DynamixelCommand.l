;; Auto-generated. Do not edit!


(when (boundp 'dynamixel_workbench_msgs::DynamixelCommand)
  (if (not (find-package "DYNAMIXEL_WORKBENCH_MSGS"))
    (make-package "DYNAMIXEL_WORKBENCH_MSGS"))
  (shadow 'DynamixelCommand (find-package "DYNAMIXEL_WORKBENCH_MSGS")))
(unless (find-package "DYNAMIXEL_WORKBENCH_MSGS::DYNAMIXELCOMMAND")
  (make-package "DYNAMIXEL_WORKBENCH_MSGS::DYNAMIXELCOMMAND"))
(unless (find-package "DYNAMIXEL_WORKBENCH_MSGS::DYNAMIXELCOMMANDREQUEST")
  (make-package "DYNAMIXEL_WORKBENCH_MSGS::DYNAMIXELCOMMANDREQUEST"))
(unless (find-package "DYNAMIXEL_WORKBENCH_MSGS::DYNAMIXELCOMMANDRESPONSE")
  (make-package "DYNAMIXEL_WORKBENCH_MSGS::DYNAMIXELCOMMANDRESPONSE"))

(in-package "ROS")





(defclass dynamixel_workbench_msgs::DynamixelCommandRequest
  :super ros::object
  :slots (_command _id _addr_name _value ))

(defmethod dynamixel_workbench_msgs::DynamixelCommandRequest
  (:init
   (&key
    ((:command __command) "")
    ((:id __id) 0)
    ((:addr_name __addr_name) "")
    ((:value __value) 0)
    )
   (send-super :init)
   (setq _command (string __command))
   (setq _id (round __id))
   (setq _addr_name (string __addr_name))
   (setq _value (round __value))
   self)
  (:command
   (&optional __command)
   (if __command (setq _command __command)) _command)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:addr_name
   (&optional __addr_name)
   (if __addr_name (setq _addr_name __addr_name)) _addr_name)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:serialization-length
   ()
   (+
    ;; string _command
    4 (length _command)
    ;; uint8 _id
    1
    ;; string _addr_name
    4 (length _addr_name)
    ;; int32 _value
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _command
       (write-long (length _command) s) (princ _command s)
     ;; uint8 _id
       (write-byte _id s)
     ;; string _addr_name
       (write-long (length _addr_name) s) (princ _addr_name s)
     ;; int32 _value
       (write-long _value s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _command
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _command (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint8 _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; string _addr_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _addr_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _value
     (setq _value (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass dynamixel_workbench_msgs::DynamixelCommandResponse
  :super ros::object
  :slots (_comm_result ))

(defmethod dynamixel_workbench_msgs::DynamixelCommandResponse
  (:init
   (&key
    ((:comm_result __comm_result) nil)
    )
   (send-super :init)
   (setq _comm_result __comm_result)
   self)
  (:comm_result
   (&optional (__comm_result :null))
   (if (not (eq __comm_result :null)) (setq _comm_result __comm_result)) _comm_result)
  (:serialization-length
   ()
   (+
    ;; bool _comm_result
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _comm_result
       (if _comm_result (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _comm_result
     (setq _comm_result (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass dynamixel_workbench_msgs::DynamixelCommand
  :super ros::object
  :slots ())

(setf (get dynamixel_workbench_msgs::DynamixelCommand :md5sum-) "0727903129a32e0035005c41640400e6")
(setf (get dynamixel_workbench_msgs::DynamixelCommand :datatype-) "dynamixel_workbench_msgs/DynamixelCommand")
(setf (get dynamixel_workbench_msgs::DynamixelCommand :request) dynamixel_workbench_msgs::DynamixelCommandRequest)
(setf (get dynamixel_workbench_msgs::DynamixelCommand :response) dynamixel_workbench_msgs::DynamixelCommandResponse)

(defmethod dynamixel_workbench_msgs::DynamixelCommandRequest
  (:response () (instance dynamixel_workbench_msgs::DynamixelCommandResponse :init)))

(setf (get dynamixel_workbench_msgs::DynamixelCommandRequest :md5sum-) "0727903129a32e0035005c41640400e6")
(setf (get dynamixel_workbench_msgs::DynamixelCommandRequest :datatype-) "dynamixel_workbench_msgs/DynamixelCommandRequest")
(setf (get dynamixel_workbench_msgs::DynamixelCommandRequest :definition-)
      "# It is Served by 'single_dynamixel_monitor' node
# This message is used to send command to dynamixel

string command

uint8 id
string addr_name
int32 value

---

bool comm_result

")

(setf (get dynamixel_workbench_msgs::DynamixelCommandResponse :md5sum-) "0727903129a32e0035005c41640400e6")
(setf (get dynamixel_workbench_msgs::DynamixelCommandResponse :datatype-) "dynamixel_workbench_msgs/DynamixelCommandResponse")
(setf (get dynamixel_workbench_msgs::DynamixelCommandResponse :definition-)
      "# It is Served by 'single_dynamixel_monitor' node
# This message is used to send command to dynamixel

string command

uint8 id
string addr_name
int32 value

---

bool comm_result

")



(provide :dynamixel_workbench_msgs/DynamixelCommand "0727903129a32e0035005c41640400e6")


