cmake_minimum_required(VERSION 3.16)

cmake_policy(SET CMP0099 NEW)

# TODO set application name
set(EXECUTABLE_NAME "Example1")

project(${EXECUTABLE_NAME} VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Core Quick)

qt_standard_project_setup(REQUIRES 6.5)

# collect all source files in the main project
file(GLOB CPP_SOURCES src/*.cpp)
file(GLOB HPP_SOURCES src/*.h)

qt_add_executable(${EXECUTABLE_NAME}
    ${CPP_SOURCES}
    ${HPP_SOURCES}
)

# Group the QML sources. Subfolders must be grouped seperately!
file(GLOB QML_SOURCES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} qml/*.qml)
source_group("Qml Files" FILES ${QML_SOURCES})

qt_add_qml_module(${EXECUTABLE_NAME}
    URI ${EXECUTABLE_NAME}
    RESOURCE_PREFIX /
    VERSION 0.1
    QML_FILES ${QML_SOURCES}
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(${EXECUTABLE_NAME} PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appCustomComponent
#    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
#    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE FALSE
    WIN32_EXECUTABLE TRUE
)

target_include_directories(${EXECUTABLE_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/src)

# if external modules are defines
# TODO the plugin part of other modules has to be added here
#      Naming: <MODULE_NAME>plugin
target_link_libraries(${EXECUTABLE_NAME}
    PRIVATE Qt6::Quick
    PRIVATE Qt6::Core
)

include(GNUInstallDirs)
install(TARGETS ${EXECUTABLE_NAME}
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
