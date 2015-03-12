PROJECT(alpha)

SET(CMAKE_COLOR_MAKEFILE ON)
SET(CMAKE_VERBOSE_MAKEFILE ON)

cmake_minimum_required(VERSION 3.0)
FIND_PACKAGE(OpenCV REQUIRED)
set(cairo_DIR .)
set(CMAKE_MODULE_PATH .)
FIND_PACKAGE(cairo REQUIRED)

set(SOURCE_FILES generate.cpp)
# set(SOURCE_FILES test-opencv.c)
add_executable(generate ${SOURCE_FILES})

target_link_libraries(generate
        ${OpenCV_LIBS}
        ${CMAKE_THREAD_LIBS_INIT}
        /usr/local/Cellar/cairo/1.12.16/lib/libcairo.2.dylib
)
