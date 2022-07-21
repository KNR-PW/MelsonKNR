;; Auto-generated. Do not edit!


(when (boundp 'dynamixel_workbench_msgs::DynamixelStateList)
  (if (not (find-package "DYNAMIXEL_WORKBENCH_MSGS"))
    (make-package "DYNAMIXEL_WORKBENCH_MSGS"))
  (shadow 'DynamixelStateList (find-package "DYNAMIXEL_WORKBENCH_MSGS")))
(unless (find-package "DYNAMIXEL_WORKBENCH_MSGS::DYNAMIXELSTATELIST")
  (make-package "DYNAMIXEL_WORKBENCH_MSGS::DYNAMIXELSTATELIST"))

(in-package "ROS")
;;//! \htmlinclude DynamixelStateList.msg.html


(defclass dynamixel_workbench_msgs::DynamixelStateList
  :super ros::object
  :slots (_dynamixel_state ))

(defmethod dynamixel_workbench_msgs::DynamixelStateList
  (:init
   (&key
    ((:dynamixel_state __dynamixel_state) ())
    )
   (send-super :init)
   (setq _dynamixel_state __dynamixel_state)
   self)
  (:dynamixel_state
   (&rest __dynamixel_state)
   (if (keywordp (car __dynamixel_state))
       (send* _dynamixel_state __dynamixel_state)
     (progn
       (if __dynamixel_state (setq _dynamixel_state (car __dynamixel_state)))
       _dynamixel_state)))
  (:serialization-length
   ()
   (+
    ;; dynamixel_workbench_msgs/DynamixelState[] _dynamixel_state
    (apply #'+ (send-all _dynamixel_state :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; dynamixel_workbench_msgs/DynamixelState[] _dynamixel_state
     (write-long (length _dynamixel_state) s)
     (dolist (elem _dynamixel_state)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; dynamixel_workbench_msgs/DynamixelState[] _dynamixel_state
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _dynamixel_state (let (r) (dotimes (i n) (push (instance dynamixel_workbench_msgs::DynamixelState :init) r)) r))
     (dolist (elem- _dynamixel_state)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get dynamixel_workbench_msgs::DynamixelStateList :md5sum-) "52c1af7cbc10f50d2e78a86519b081ee")
(setf (get dynamixel_workbench_msgs::DynamixelStateList :datatype-) "dynamixel_workbench_msgs/DynamixelStateList")
(setf (get dynamixel_workbench_msgs::DynamixelStateList :definition-)
      "# DynamixelState List

DynamixelState[] dynamixel_state

================================================================================
MSG: dynamixel_workbench_msgs/DynamixelState
# This message includes basic data of dynamixel

string name
uint8  id

int32  present_position
int32  present_velocity
int16  present_current




")



(provide :dynamixel_workbench_msgs/DynamixelStateList "52c1af7cbc10f50d2e78a86519b081ee")


