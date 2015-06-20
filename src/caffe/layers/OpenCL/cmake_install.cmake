# Install script for directory: /Users/me/ai/caffes/caffe_cl/src/caffe/layers/OpenCL

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/Users/me/ai/caffes/caffe_cl/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
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

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/src/caffe/layers/OpenCL" TYPE FILE FILES "/Users/me/ai/caffes/caffe_cl/src/caffe/layers/OpenCL/bnll_layer-STD.cl")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/src/caffe/layers/OpenCL" TYPE FILE FILES "/Users/me/ai/caffes/caffe_cl/src/caffe/layers/OpenCL/bnll_layer.cl")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/src/caffe/layers/OpenCL" TYPE FILE FILES "/Users/me/ai/caffes/caffe_cl/src/caffe/layers/OpenCL/contrastive_loss_layer-STD.cl")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/src/caffe/layers/OpenCL" TYPE FILE FILES "/Users/me/ai/caffes/caffe_cl/src/caffe/layers/OpenCL/contrastive_loss_layer.cl")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/src/caffe/layers/OpenCL" TYPE FILE FILES "/Users/me/ai/caffes/caffe_cl/src/caffe/layers/OpenCL/dropout_layer-STD.cl")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/src/caffe/layers/OpenCL" TYPE FILE FILES "/Users/me/ai/caffes/caffe_cl/src/caffe/layers/OpenCL/dropout_layer.cl")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/src/caffe/layers/OpenCL" TYPE FILE FILES "/Users/me/ai/caffes/caffe_cl/src/caffe/layers/OpenCL/eltwise_layer-STD.cl")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/src/caffe/layers/OpenCL" TYPE FILE FILES "/Users/me/ai/caffes/caffe_cl/src/caffe/layers/OpenCL/eltwise_layer.cl")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/src/caffe/layers/OpenCL" TYPE FILE FILES "/Users/me/ai/caffes/caffe_cl/src/caffe/layers/OpenCL/lrn_layer-STD.cl")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/src/caffe/layers/OpenCL" TYPE FILE FILES "/Users/me/ai/caffes/caffe_cl/src/caffe/layers/OpenCL/lrn_layer.cl")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/src/caffe/layers/OpenCL" TYPE FILE FILES "/Users/me/ai/caffes/caffe_cl/src/caffe/layers/OpenCL/mvn_layer-STD.cl")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/src/caffe/layers/OpenCL" TYPE FILE FILES "/Users/me/ai/caffes/caffe_cl/src/caffe/layers/OpenCL/mvn_layer.cl")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/src/caffe/layers/OpenCL" TYPE FILE FILES "/Users/me/ai/caffes/caffe_cl/src/caffe/layers/OpenCL/pooling_layer-STD.cl")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/src/caffe/layers/OpenCL" TYPE FILE FILES "/Users/me/ai/caffes/caffe_cl/src/caffe/layers/OpenCL/pooling_layer.cl")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/src/caffe/layers/OpenCL" TYPE FILE FILES "/Users/me/ai/caffes/caffe_cl/src/caffe/layers/OpenCL/prelu_layer-STD.cl")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/src/caffe/layers/OpenCL" TYPE FILE FILES "/Users/me/ai/caffes/caffe_cl/src/caffe/layers/OpenCL/prelu_layer.cl")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/src/caffe/layers/OpenCL" TYPE FILE FILES "/Users/me/ai/caffes/caffe_cl/src/caffe/layers/OpenCL/relu_layer-STD.cl")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/src/caffe/layers/OpenCL" TYPE FILE FILES "/Users/me/ai/caffes/caffe_cl/src/caffe/layers/OpenCL/relu_layer.cl")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/src/caffe/layers/OpenCL" TYPE FILE FILES "/Users/me/ai/caffes/caffe_cl/src/caffe/layers/OpenCL/sigmoid_layer-STD.cl")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/src/caffe/layers/OpenCL" TYPE FILE FILES "/Users/me/ai/caffes/caffe_cl/src/caffe/layers/OpenCL/sigmoid_layer.cl")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/src/caffe/layers/OpenCL" TYPE FILE FILES "/Users/me/ai/caffes/caffe_cl/src/caffe/layers/OpenCL/softmax_layer-STD.cl")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/src/caffe/layers/OpenCL" TYPE FILE FILES "/Users/me/ai/caffes/caffe_cl/src/caffe/layers/OpenCL/softmax_layer.cl")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/src/caffe/layers/OpenCL" TYPE FILE FILES "/Users/me/ai/caffes/caffe_cl/src/caffe/layers/OpenCL/softmax_loss_layer-STD.cl")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/src/caffe/layers/OpenCL" TYPE FILE FILES "/Users/me/ai/caffes/caffe_cl/src/caffe/layers/OpenCL/softmax_loss_layer.cl")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/src/caffe/layers/OpenCL" TYPE FILE FILES "/Users/me/ai/caffes/caffe_cl/src/caffe/layers/OpenCL/tanh_layer-STD.cl")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/src/caffe/layers/OpenCL" TYPE FILE FILES "/Users/me/ai/caffes/caffe_cl/src/caffe/layers/OpenCL/tanh_layer.cl")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/src/caffe/layers/OpenCL" TYPE FILE FILES "/Users/me/ai/caffes/caffe_cl/src/caffe/layers/OpenCL/threshold_layer-STD.cl")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/src/caffe/layers/OpenCL" TYPE FILE FILES "/Users/me/ai/caffes/caffe_cl/src/caffe/layers/OpenCL/threshold_layer.cl")
endif()

