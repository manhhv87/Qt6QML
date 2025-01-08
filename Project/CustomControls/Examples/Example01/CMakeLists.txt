cmake_minimum_required(VERSION 3.16)

# Set application name
set(EXECUTABLE_NAME "Example1")

project(${EXECUTABLE_NAME} VERSION 0.1 LANGUAGES CXX)

# Tell CMake to call moc automaticly
set(CMAKE_AUTOMOC ON)

find_package(Qt6 REQUIRED COMPONENTS Quick Core Qml Core5Compat)

qt_standard_project_setup(REQUIRES 6.5)

# Telling CMake location of our app .qrc file
qt_add_resources(APP_RESOURCES ${CMAKE_CURRENT_LIST_DIR}/qml/app.qrc)
qt_add_resources(CONTROL_RESOURCES ${CMAKE_SOURCE_DIR}/Controls/qml.qrc)

qt_add_executable(${EXECUTABLE_NAME}
    main.cpp            
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
)
