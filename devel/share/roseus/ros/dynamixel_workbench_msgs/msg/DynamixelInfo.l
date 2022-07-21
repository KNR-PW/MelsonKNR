;; Auto-generated. Do not edit!


(when (boundp 'dynamixel_workbench_msgs::DynamixelInfo)
  (if (not (find-package "DYNAMIXEL_WORKBENCH_MSGS"))
    (make-package "DYNAMIXEL_WORKBENCH_MSGS"))
  (shadow 'DynamixelInfo (find-package "DYNAMIXEL_WORKBENCH_MSGS")))
(unless (find-package "DYNAMIXEL_WORKBENCH_MSGS::DYNAMIXELINFO")
  (make-package "DYNAMIXEL_WORKBENCH_MSGS::DYNAMIXELINFO"))

(in-package "ROS")
;;//! \htmlinclude DynamixelInfo.msg.html


(defclass dynamixel_workbench_msgs::DynamixelInfo
  :super ros::object
  :slots (_load_info _model_name _model_number _model_id ))

(defmethod dynamixel_workbench_msgs::DynamixelInfo
  (:init
   (&key
    ((:load_info __load_info) (instance dynamixel_workbench_msgs::DynamixelLoadInfo :init))
    ((:model_name __model_name) "")
    ((:model_number __model_number) 0)
    ((:model_id __model_id) 0)
    )
   (send-super :init)
   (setq _load_info __load_info)
   (setq _model_name (string __model_name))
   (setq _model_number (round __model_number))
   (setq _model_id (round __model_id))
   self)
  (:load_info
   (&rest __load_info)
   (if (keywordp (car __load_info))
       (send* _load_info __load_info)
     (progn
       (if __load_info (setq _load_info (car __load_info)))
       _load_info)))
  (:model_name
   (&optional __model_name)
   (if __model_name (setq _model_name __model_name)) _model_name)
  (:model_number
   (&optional __model_number)
   (if __model_number (setq _model_number __model_number)) _model_number)
  (:model_id
   (&optional __model_id)
   (if __model_id (setq _model_id __model_id)) _model_id)
  (:serialization-length
   ()
   (+
    ;; dynamixel_workbench_msgs/DynamixelLoadInfo _load_info
    (send _load_info :serialization-length)
    ;; string _model_name
    4 (length _model_name)
    ;; uint16 _model_number
    2
    ;; uint8 _model_id
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; dynamixel_workbench_msgs/DynamixelLoadInfo _load_info
       (send _load_info :serialize s)
     ;; string _model_name
       (write-long (length _model_name) s) (princ _model_name s)
     ;; uint16 _model_number
       (write-word _model_number s)
     ;; uint8 _model_id
       (write-byte _model_id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; dynamixel_workbench_msgs/DynamixelLoadInfo _load_info
     (send _load_info :deserialize buf ptr-) (incf ptr- (send _load_info :serialization-length))
   ;; string _model_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _model_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint16 _model_number
     (setq _model_number (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _model_id
     (setq _model_id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get dynamixel_workbench_msgs::DynamixelInfo :md5sum-) "8c02a7626d88db402a8af7bc5e0880d4")
(setf (get dynamixel_workbench_msgs::DynamixelInfo :datatype-) "dynamixel_workbench_msgs/DynamixelInfo")
(setf (get dynamixel_workbench_msgs::DynamixelInfo :definition-)
      "# This message includes information of dynamixel's basic parameter

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

")



(provide :dynamixel_workbench_msgs/DynamixelInfo "8c02a7626d88db402a8af7bc5e0880d4")


