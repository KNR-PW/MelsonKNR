
(cl:in-package :asdf)

(defsystem "dynamixel_workbench_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :dynamixel_workbench_msgs-msg
)
  :components ((:file "_package")
    (:file "DynamixelCommand" :depends-on ("_package_DynamixelCommand"))
    (:file "_package_DynamixelCommand" :depends-on ("_package"))
    (:file "GetDynamixelInfo" :depends-on ("_package_GetDynamixelInfo"))
    (:file "_package_GetDynamixelInfo" :depends-on ("_package"))
  ))