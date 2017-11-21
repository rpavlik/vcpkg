set(STATIC_PACKAGES
	jsoncpp # Simpler and easier this way
	protobuf # Build errors if dynamic?
	zlib # since we aren't using the official zlib binaries, they prefer static linking...
	)

foreach(PKG ${STATIC_PACKAGES})
	if(PORT STREQUAL PKG)
		set(VCPKG_LIBRARY_LINKAGE static)
		break()
	endif()
endforeach()