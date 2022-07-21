;; Auto-generated. Do not edit!


(when (boundp 'dynamixel_workbench_msgs::GetDynamixelInfo)
  (if (not (find-package "DYNAMIXEL_WORKBENCH_MSGS"))
    (make-package "DYNAMIXEL_WORKBENCH_MSGS"))
  (shadow 'GetDynamixelInfo (find-package "DYNAMIXEL_WORKBENCH_MSGS")))
(unless (find-package "DYNAMIXEL_WORKBENCH_MSGS::GETDYNAMIXELINFO")
  (make-package "DYNAMIXEL_WORKBENCH_MSGS::GETDYNAMIXELINFO"))
(unless (find-package "DYNAMIXEL_WORKBENCH_MSGS::GETDYNAMIXELINFOREQUEST")
  (make-package "DYNAMIXEL_WORKBENCH_MSGS::GETDYNAMIXELINFOREQUEST"))
(unless (find-package "DYNAMIXEL_WORKBENCH_MSGS::GETDYNAMIXELINFORESPONSE")
  (make-package "DYNAMIXEL_WORKBENCH_MSGS::GETDYNAMIXELINFORESPONSE"))

(in-package "ROS")





(defclass dynamixel_workbench_msgs::GetDynamixelInfoRequest
  :super ros::object
  :slots ())

(defmethod dynamixel_workbench_msgs::GetDynamixelInfoRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass dynamixel_workbench_msgs::GetDynamixelInfoResponse
  :super ros::object
  :slots (_dynamixel_info ))

(defmethod dynamixel_workbench_msgs::GetDynamixelInfoResponse
  (:init
   (&key
    ((:dynamixel_info __dynamixel_info) (instance dynamixel_workbench_msgs::DynamixelInfo :init))
    )
   (send-super :init)
   (setq _dynamixel_info __dynamixel_info)
   self)
  (:dynamixel_info
   (&rest __dynamixel_info)
   (if (keywordp (car __dynamixel_info))
       (send* _dynamixel_info __dynamixel_info)
     (progn
       (if __dynamixel_info (setq _dynamixel_info (car __dynamixel_info)))
       _dynamixel_info)))
  (:serialization-length
   ()
   (+
    ;; dynamixel_workbench_msgs/DynamixelInfo _dynamixel_info
    (send _dynamixel_info :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; dynamixel_workbench_msgs/DynamixelInfo _dynamixel_info
       (send _dynamixel_info :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; dynamixel_workbench_msgs/DynamixelInfo _dynamixel_info
     (send _dynamixel_info :deserialize buf ptr-) (incf ptr- (send _dynamixel_info :serialization-length))
   ;;
   self)
  )

(defclass dynamixel_workbench_msgs::GetDynamixelInfo
  :super ros::object
  :slots ())

(setf (get dynamixel_workbench_msgs::GetDynamixelInfo :md5sum-) "5075be00278efc6e6ba91f48b43afb53")
(setf (get dynamixel_workbench_msgs::GetDynamixelInfo :datatype-) "dynamixel_workbench_msgs/GetDynamixelInfo")
(setf (get dynamixel_workbench_msgs::GetDynamixelInfo :request) dynamixel_workbench_msgs::GetDynamixelInfoRequest)
(setf (get dynamixel_workbench_msgs::GetDynamixelInfo :response) dynamixel_workbench_msgs::GetDynamixelInfoResponse)

(defmethod dynamixel_workbench_msgs::GetDynamixelInfoRequest
  (:response () (instance dynamixel_workbench_msgs::GetDynamixelInfoResponse :init)))

(setf (get dynamixel_workbench_msgs::GetDynamixelInfoRequest :md5sum-) "5075be00278efc6e6ba91f48b43afb53")
(setf (get dynamixel_workbench_msgs::GetDynamixelInfoRequest :datatype-) "dynamixel_workbench_msgs/GetDynamixelInfoRequest")
(setf (get dynamixel_workbench_msgs::GetDynamixelInfoRequest :definition-)
      "# It is Served by 'single_dynamixel_monitor' node
# This message is used to get information of dynamixel

---

DynamixelInfo dynamixel_info


================================================================================
MSG: dynamixel_workbench_msgs/DynamixelInfo
# This message includes information of dynamixel's basic parameter

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

(setf (get dynamixel_workbench_msgs::GetDynamixelInfoResponse :md5sum-) "5075be00278efc6e6ba91f48b43afb53")
(setf (get dynamixel_workbench_msgs::GetDynamixelInfoResponse :datatype-) "dynamixel_workbench_msgs/GetDynamixelInfoResponse")
(setf (get dynamixel_workbench_msgs::GetDynamixelInfoResponse :definition-)
      "# It is Served by 'single_dynamixel_monitor' node
# This message is used to get information of dynamixel

---

DynamixelInfo dynamixel_info


================================================================================
MSG: dynamixel_workbench_msgs/DynamixelInfo
# This message includes information of dynamixel's basic parameter

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



(provide :dynamixel_workbench_msgs/GetDynamixelInfo "5075be00278efc6e6ba91f48b43afb53")


