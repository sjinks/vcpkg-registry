vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO lurcher/unixODBC
    REF 2.3.12
    SHA512 f0c0a995c90ff3abd00a031430e2f2034d45ca96c7fba34adc826a668c4eeb77ee2e1be27b7b1817c706f43df4fa434746362e746a39e779256e006deeb790c7
)

set(ENV{CFLAGS} "$ENV{CFLAGS} -Wno-error=implicit-function-declaration")

if(VCPKG_TARGET_IS_OSX OR VCPKG_TARGET_IS_LINUX)
    list(APPEND OPTIONS --with-included-ltdl)
endif()

vcpkg_configure_make(
    SOURCE_PATH "${SOURCE_PATH}"
    AUTOCONFIG
    COPY_SOURCE
    NO_ADDITIONAL_PATHS
    OPTIONS ${OPTIONS}
)

foreach(DIR_SUFFIX dbg rel)
    if(EXISTS "${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-${DIR_SUFFIX}")
        foreach(FILE config.h unixodbc_conf.h)
            vcpkg_replace_string("${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-${DIR_SUFFIX}/${FILE}" "#define SYSTEM_FILE_PATH \"${CURRENT_INSTALLED_DIR}/etc\"" "#define SYSTEM_FILE_PATH \"/etc\"" IGNORE_UNCHANGED)
            vcpkg_replace_string("${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-${DIR_SUFFIX}/${FILE}" "#define SYSTEM_FILE_PATH \"${CURRENT_INSTALLED_DIR}/debug/etc\"" "#define SYSTEM_FILE_PATH \"/etc\"" IGNORE_UNCHANGED)
            vcpkg_replace_string("${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-${DIR_SUFFIX}/${FILE}" "${CURRENT_INSTALLED_DIR}" "/usr" IGNORE_UNCHANGED)
            vcpkg_replace_string("${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-${DIR_SUFFIX}/${FILE}" "${CURRENT_INSTALLED_DIR}/debug" "/usr" IGNORE_UNCHANGED)
        endforeach()
    endif()
endforeach()

vcpkg_install_make()

vcpkg_copy_pdbs()
vcpkg_fixup_pkgconfig()

if (VCPKG_LIBRARY_LINKAGE STREQUAL "static")
    file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/bin" "${CURRENT_PACKAGES_DIR}/debug/bin")
endif ()

file(REMOVE_RECURSE
     "${CURRENT_PACKAGES_DIR}/debug/include"
     "${CURRENT_PACKAGES_DIR}/debug/share"
     "${CURRENT_PACKAGES_DIR}/debug/etc"
     "${CURRENT_PACKAGES_DIR}/etc"
     "${CURRENT_PACKAGES_DIR}/share/man"
     "${CURRENT_PACKAGES_DIR}/share/${PORT}/man1"
     "${CURRENT_PACKAGES_DIR}/share/${PORT}/man5"
     "${CURRENT_PACKAGES_DIR}/share/${PORT}/man7"
)

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/unixodbcConfig.cmake" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
