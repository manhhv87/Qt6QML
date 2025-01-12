# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "GUI\\CMakeFiles\\GUI_autogen.dir\\AutogenUsed.txt"
  "GUI\\CMakeFiles\\GUI_autogen.dir\\ParseCache.txt"
  "GUI\\GUI_autogen"
  )
endif()
