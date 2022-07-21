;; Auto-generated. Do not edit!


(when (boundp 'dynamixel_workbench_msgs::DynamixelState)
  (if (not (find-package "DYNAMIXEL_WORKBENCH_MSGS"))
    (make-package "DYNAMIXEL_WORKBENCH_MSGS"))
  (shadow 'DynamixelState (find-package "DYNAMIXEL_WORKBENCH_MSGS")))
(unless (find-package "DYNAMIXEL_WORKBENCH_MSGS::DYNAMIXELSTATE")
  (make-package "DYNAMIXEL_WORKBENCH_MSGS::DYNAMIXELSTATE"))

(in-package "ROS")
;;//! \htmlinclude DynamixelState.msg.html


(defclass dynamixel_workbench_msgs::DynamixelState
  :super ros::object
  :slots (_name _id _present_position _present_velocity _present_current ))

(defmethod dynamixel_workbench_msgs::DynamixelState
  (:init
   (&key
    ((:name __name) "")
    ((:id __id) 0)
    ((:present_position __present_position) 0)
    ((:present_velocity __present_velocity) 0)
    ((:present_current __present_current) 0)
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _id (round __id))
   (setq _present_position (round __present_position))
   (setq _present_velocity (round __present_velocity))
   (setq _present_current (round __present_current))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:present_position
   (&optional __present_position)
   (if __present_position (setq _present_position __present_position)) _present_position)
  (:present_velocity
   (&optional __present_velocity)
   (if __present_velocity (setq _present_velocity __present_velocity)) _present_velocity)
  (:present_current
   (&optional __present_current)
   (if __present_current (setq _present_current __present_current)) _present_current)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; uint8 _id
    1
    ;; int32 _present_position
    4
    ;; int32 _present_velocity
    4
    ;; int16 _present_current
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; uint8 _id
       (write-byte _id s)
     ;; int32 _present_position
       (write-long _present_position s)
     ;; int32 _present_velocity
       (write-long _present_velocity s)
     ;; int16 _present_current
       (write-word _present_current s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint8 _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; int32 _present_position
     (setq _present_position (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _present_velocity
     (setq _present_velocity (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int16 _present_current
     (setq _present_current (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get dynamixel_workbench_msgs::DynamixelState :md5sum-) "c9a7ca26833f8d4ad5b00272b4226f36")
(setf (get dynamixel_workbench_msgs::DynamixelState :datatype-) "dynamixel_workbench_msgs/DynamixelState")
(setf (get dynamixel_workbench_msgs::DynamixelState :definition-)
      "# This message includes basic data of dynamixel

string name
uint8  id

int32  present_position
int32  present_velocity
int16  present_current




")



(provide :dynamixel_workbench_msgs/DynamixelState "c9a7ca26833f8d4ad5b00272b4226f36")


