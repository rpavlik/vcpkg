cmake_minimum_required(VERSION 3.8)
project(imgui CXX)

set(CMAKE_DEBUG_POSTFIX d)
set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)

set(IMGUI_INCLUDES_PUBLIC
    imgui.h
    imconfig.h
)

set(IMGUI_INCLUDES_PRIVATE
    imgui_internal.h
)

set(IMGUI_SOURCES
    imgui.cpp
    imgui_demo.cpp
    imgui_draw.cpp
)

add_library(imgui
    ${IMGUI_INCLUDES_PUBLIC}
    ${IMGUI_INCLUDES_PRIVATE}
    ${IMGUI_SOURCES}
)

install(TARGETS imgui
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
)

if(NOT IMGUI_SKIP_HEADERS)
    install(
        FILES ${IMGUI_INCLUDES_PUBLIC}
        DESTINATION include
    )
endif()
