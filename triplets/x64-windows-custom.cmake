set(VCPKG_PLATFORM_TOOLSET v140)
set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_CRT_LINKAGE dynamic)

# By default
set(VCPKG_LIBRARY_LINKAGE dynamic)
# But not for every package
include(${CMAKE_CURRENT_LIST_DIR}/staticpkgs.cmake)
