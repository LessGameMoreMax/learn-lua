cmake_minimum_required(VERSION 3.30)
project(learn_lua C)

set(CMAKE_C_STANDARD 99)

set(SRC)
file(GLOB SRC "src/*.c")
add_executable(learn_lua ${SRC})
