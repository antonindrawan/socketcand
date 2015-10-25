cmake_minimum_required(VERSION 2.8.11)

project(socketcand)

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
target_link_libraries(${PROJECT_NAME} pthread)

set(SOCKETCAND_CLIENT_SOURCE_FILES
  socketcandcl.c
)
add_executable(${PROJECT_NAME}cl ${SOCKETCAND_CLIENT_SOURCE_FILES})
