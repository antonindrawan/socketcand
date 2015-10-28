cmake_minimum_required(VERSION 2.8.11)

project(socketcand)

if(ARM_LINUX)
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -static")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -static")
  add_definitions(-DARM_LINUX=1)
endif()

include_directories(
  ${PROJECT_SOURCE_DIR}
  ${PROJECT_SOURCE_DIR}/include
)

set(SOURCE_FILES
  ${PROJECT_SOURCE_DIR}/socketcand.c
  ${PROJECT_SOURCE_DIR}/statistics.c
  ${PROJECT_SOURCE_DIR}/beacon.c
  ${PROJECT_SOURCE_DIR}/state_bcm.c
  ${PROJECT_SOURCE_DIR}/state_raw.c
  ${PROJECT_SOURCE_DIR}/state_isotp.c
  ${PROJECT_SOURCE_DIR}/state_control.c
)

add_executable(${PROJECT_NAME} ${SOURCE_FILES})

if(LINUX OR ARM_LINUX)
  target_link_libraries(${PROJECT_NAME} pthread)
endif()

set(SOCKETCAND_CLIENT_SOURCE_FILES
  socketcandcl.c
)
add_executable(${PROJECT_NAME}cl ${SOCKETCAND_CLIENT_SOURCE_FILES})
