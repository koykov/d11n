cmake_minimum_required(VERSION 3.17)
project(zeromq)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -pthread")

find_library(libzmq
        NAMES zmq
        HINTS /usr/local/lib
        )

add_executable(zeromq main.cpp zmq.hpp)
target_link_libraries(zeromq PUBLIC ${libzmq})
