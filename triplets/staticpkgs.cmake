set(STATIC_PACKAGES
	jsoncpp
	protobuf)

foreach(PKG ${STATIC_PACKAGES})
	if(PORT STREQUAL PKG)
		set(VCPKG_LIBRARY_LINKAGE static)
		break()
	endif()
endforeach()