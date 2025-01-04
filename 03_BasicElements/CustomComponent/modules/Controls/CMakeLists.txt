cmake_minimum_required(VERSION 3.16)

cmake_policy(SET CMP0099 NEW)

set(MODULE_NAME "Controls")

project(${MODULE_NAME} VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(QT_QML_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})

find_package(Qt6 REQUIRED COMPONENTS Quick)

file(GLOB QML_SOURCES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} qml/*.qml)
source_group("Qml Files" FILES ${QML_SOURCES})

file(GLOB CPP_SOURCES *.cpp)
file(GLOB HPP_SOURCES *.h)

qt_add_library(${MODULE_NAME} STATIC)
qt_add_qml_module(${MODULE_NAME}
    URI ${MODULE_NAME}
    VERSION 0.1
    QML_FILES ${QML_SOURCES}
    SOURCES ${CPP_SOURCES} ${HPP_SOURCES}
)

set_target_properties(${MODULE_NAME} PROPERTIES
    MACOSX_BUNDLE FALSE
    WIN32_EXECUTABLE TRUE
)

target_compile_definitions(${MODULE_NAME}
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)

target_link_libraries(${MODULE_NAME}
    PRIVATE Qt6::Quick)

target_include_directories(${MODULE_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
