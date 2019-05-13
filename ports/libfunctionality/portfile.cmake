# Common Ambient Variables:
#   CURRENT_BUILDTREES_DIR    = ${VCPKG_ROOT_DIR}\buildtrees\${PORT}
#   CURRENT_PACKAGES_DIR      = ${VCPKG_ROOT_DIR}\packages\${PORT}_${TARGET_TRIPLET}
#   CURRENT_PORT_DIR          = ${VCPKG_ROOT_DIR}\ports\${PORT}
#   PORT                      = current port name (zlib, etc)
#   TARGET_TRIPLET            = current triplet (x86-windows, x64-windows-static, etc)
#   VCPKG_CRT_LINKAGE         = C runtime linkage type (static, dynamic)
#   VCPKG_LIBRARY_LINKAGE     = target library linkage type (static, dynamic)
#   VCPKG_ROOT_DIR            = <C:\path\to\current\vcpkg>
#   VCPKG_TARGET_ARCHITECTURE = target architecture (x64, x86, arm)
#

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO OSVR/libfunctionality
    REF aa72a4c4a567
    SHA512 593067d7d074425f92365d76415d45da86dbd523d3dbcdc0e89bdcd0c3c26037f3f4d383d933059b9bf1efcc99b865ccd2cdc1b2bd9f3af99b0b306a2203eaa5
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA # Disable this option if project cannot be built with Ninja
    OPTIONS -DBUILD_TESTING=OFF # to avoid build breakage with vc2017
    # OPTIONS -DUSE_THIS_IN_ALL_BUILDS=1 -DUSE_THIS_TOO=2
    # OPTIONS_RELEASE -DOPTIMIZE=1
    # OPTIONS_DEBUG -DDEBUGGABLE=1
)

vcpkg_install_cmake()

vcpkg_fixup_cmake_targets(CONFIG_PATH "lib/cmake/libfunctionality")

vcpkg_copy_pdbs()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
file(REMOVE_RECURSE
    ${CURRENT_PACKAGES_DIR}/debug/CONTRIBUTING.md
    ${CURRENT_PACKAGES_DIR}/debug/LICENSE
    ${CURRENT_PACKAGES_DIR}/debug/NOTICE
    ${CURRENT_PACKAGES_DIR}/debug/README.md
    ${CURRENT_PACKAGES_DIR}/CONTRIBUTING.md
    ${CURRENT_PACKAGES_DIR}/LICENSE
    ${CURRENT_PACKAGES_DIR}/NOTICE
    ${CURRENT_PACKAGES_DIR}/README.md
)

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/lib/cmake)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/lib/cmake)

# Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/libfunctionality RENAME copyright)
file(INSTALL ${SOURCE_PATH}/NOTICE DESTINATION ${CURRENT_PACKAGES_DIR}/share/libfunctionality)

# Post-build test for cmake libraries
vcpkg_test_cmake(PACKAGE_NAME libfunctionality)
