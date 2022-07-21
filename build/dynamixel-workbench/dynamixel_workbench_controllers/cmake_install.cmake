# Install script for directory: /home/drozdzal/MelsonKNR/src/dynamixel-workbench/dynamixel_workbench_controllers

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/drozdzal/MelsonKNR/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/drozdzal/MelsonKNR/build/dynamixel-workbench/dynamixel_workbench_controllers/catkin_generated/installspace/dynamixel_workbench_controllers.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dynamixel_workbench_controllers/cmake" TYPE FILE FILES
    "/home/drozdzal/MelsonKNR/build/dynamixel-workbench/dynamixel_workbench_controllers/catkin_generated/installspace/dynamixel_workbench_controllersConfig.cmake"
    "/home/drozdzal/MelsonKNR/build/dynamixel-workbench/dynamixel_workbench_controllers/catkin_generated/installspace/dynamixel_workbench_controllersConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dynamixel_workbench_controllers" TYPE FILE FILES "/home/drozdzal/MelsonKNR/src/dynamixel-workbench/dynamixel_workbench_controllers/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_workbench_controllers/dynamixel_workbench_controllers" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_workbench_controllers/dynamixel_workbench_controllers")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_workbench_controllers/dynamixel_workbench_controllers"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/dynamixel_workbench_controllers" TYPE EXECUTABLE FILES "/home/drozdzal/MelsonKNR/devel/lib/dynamixel_workbench_controllers/dynamixel_workbench_controllers")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_workbench_controllers/dynamixel_workbench_controllers" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_workbench_controllers/dynamixel_workbench_controllers")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_workbench_controllers/dynamixel_workbench_controllers"
         OLD_RPATH "/usr/usr/lib/x86_64-linux-gnu:/home/drozdzal/MelsonKNR/devel/lib:/home/drozdzal/catkin_ws/devel/lib:/opt/ros/noetic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_workbench_controllers/dynamixel_workbench_controllers")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_workbench_controllers/find_dynamixel" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_workbench_controllers/find_dynamixel")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_workbench_controllers/find_dynamixel"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/dynamixel_workbench_controllers" TYPE EXECUTABLE FILES "/home/drozdzal/MelsonKNR/devel/lib/dynamixel_workbench_controllers/find_dynamixel")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_workbench_controllers/find_dynamixel" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_workbench_controllers/find_dynamixel")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_workbench_controllers/find_dynamixel"
         OLD_RPATH "/usr/usr/lib/x86_64-linux-gnu:/home/drozdzal/MelsonKNR/devel/lib:/home/drozdzal/catkin_ws/devel/lib:/opt/ros/noetic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_workbench_controllers/find_dynamixel")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dynamixel_workbench_controllers" TYPE DIRECTORY FILES "/home/drozdzal/MelsonKNR/src/dynamixel-workbench/dynamixel_workbench_controllers/include/dynamixel_workbench_controllers/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dynamixel_workbench_controllers" TYPE DIRECTORY FILES
    "/home/drozdzal/MelsonKNR/src/dynamixel-workbench/dynamixel_workbench_controllers/launch"
    "/home/drozdzal/MelsonKNR/src/dynamixel-workbench/dynamixel_workbench_controllers/config"
    )
endif()

