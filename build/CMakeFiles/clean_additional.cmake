# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\MyQmlApp_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\MyQmlApp_autogen.dir\\ParseCache.txt"
  "MyQmlApp_autogen"
  )
endif()
