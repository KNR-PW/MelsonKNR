;; Auto-generated. Do not edit!


(when (boundp 'dynamixel_workbench_msgs::DynamixelLoadInfo)
  (if (not (find-package "DYNAMIXEL_WORKBENCH_MSGS"))
    (make-package "DYNAMIXEL_WORKBENCH_MSGS"))
  (shadow 'DynamixelLoadInfo (find-package "DYNAMIXEL_WORKBENCH_MSGS")))
(unless (find-package "DYNAMIXEL_WORKBENCH_MSGS::DYNAMIXELLOADINFO")
  (make-package "DYNAMIXEL_WORKBENCH_MSGS::DYNAMIXELLOADINFO"))

(in-package "ROS")
;;//! \htmlinclude DynamixelLoadInfo.msg.html


(defclass dynamixel_workbench_msgs::DynamixelLoadInfo
  :super ros::object
  :slots (_device_name _baud_rate _protocol_version ))

(defmethod dynamixel_workbench_msgs::DynamixelLoadInfo
  (:init
   (&key
    ((:device_name __device_name) "")
    ((:baud_rate __baud_rate) 0)
    ((:protocol_version __protocol_version) 0.0)
    )
   (send-super :init)
   (setq _device_name (string __device_name))
   (setq _baud_rate (round __baud_rate))
   (setq _protocol_version (float __protocol_version))
   self)
  (:device_name
   (&optional __device_name)
   (if __device_name (setq _device_name __device_name)) _device_name)
  (:baud_rate
   (&optional __baud_rate)
   (if __baud_rate (setq _baud_rate __baud_rate)) _baud_rate)
  (:protocol_version
   (&optional __protocol_version)
   (if __protocol_version (setq _protocol_version __protocol_version)) _protocol_version)
  (:serialization-length
   ()
   (+
    ;; string _device_name
    4 (length _device_name)
    ;; uint64 _baud_rate
    8
    ;; float32 _protocol_version
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _device_name
       (write-long (length _device_name) s) (princ _device_name s)
     ;; uint64 _baud_rate
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _baud_rate (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _baud_rate) (= (length (_baud_rate . bv)) 2)) ;; bignum
              (write-long (ash (elt (_baud_rate . bv) 0) 0) s)
              (write-long (ash (elt (_baud_rate . bv) 1) -1) s))
             ((and (class _baud_rate) (= (length (_baud_rate . bv)) 1)) ;; big1
              (write-long (elt (_baud_rate . bv) 0) s)
              (write-long (if (>= _baud_rate 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _baud_rate s)(write-long (if (>= _baud_rate 0) 0 #xffffffff) s)))
     ;; float32 _protocol_version
       (sys::poke _protocol_version (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _device_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _device_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint64 _baud_rate
     
#+(or :alpha :irix6 :x86_64)
      (setf _baud_rate (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _baud_rate (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float32 _protocol_version
     (setq _protocol_version (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get dynamixel_workbench_msgs::DynamixelLoadInfo :md5sum-) "af24d77e0b8329be8d17a782ba80f5e2")
(setf (get dynamixel_workbench_msgs::DynamixelLoadInfo :datatype-) "dynamixel_workbench_msgs/DynamixelLoadInfo")
(setf (get dynamixel_workbench_msgs::DynamixelLoadInfo :definition-)
      "# This message includes dynamixel's load information

string device_name
uint64 baud_rate
float32 protocol_version

")



(provide :dynamixel_workbench_msgs/DynamixelLoadInfo "af24d77e0b8329be8d17a782ba80f5e2")


