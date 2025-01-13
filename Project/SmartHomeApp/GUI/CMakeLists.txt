cmake_minimum_required(VERSION 3.16)

# Set application name
set(EXECUTABLE_NAME "GUI")

project(${EXECUTABLE_NAME} VERSION 0.1 LANGUAGES CXX)

# Tell CMake to call moc automaticly
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)   # Run rcc automatically

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick Core Qml Gui QuickControls2 Core5Compat)

qt_standard_project_setup(REQUIRES 6.5)

# Telling CMake location of our app .qrc file
qt_add_resources(APP_RESOURCES ${CMAKE_CURRENT_SOURCE_DIR}/Qml/app.qrc)
qt_add_resources(CONTROL_RESOURCES ${CMAKE_SOURCE_DIR}/Components/qml.qrc)

# collect all source files in the main project
file(GLOB CPP_SOURCES *.cpp)
file(GLOB HPP_SOURCES *.h)

qt_add_executable(${EXECUTABLE_NAME}
    ${CPP_SOURCES}
    ${HPP_SOURCES}
    ${APP_RESOURCES}
    ${CONTROL_RESOURCES}
)

target_compile_features(
    ${PROJECT_NAME}
    PRIVATE
        cxx_auto_type
        cxx_generic_lambdas
)

target_link_libraries(${EXECUTABLE_NAME}
    PRIVATE 
        Qt6::Quick
        Qt6::Core
        Qt6::Qml
        Qt6::Core5Compat
        Qt6::Gui
        Qt6::QuickControls2
)
