vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO sjinks/jsonrpc-cpp
    REF fb18b33a4d5190ca52da239cd214d9affa10de16 # v3.1.0
    SHA512 22eab20577396052830860e0c74df9a5b89b9e92cab5b39e4e10db4ddff6412b03fd97cc43f7ba08e177e3c88177b8a4b9ba5831195e18358981e2f26e4ea4c7
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS -DBUILD_TESTS=OFF -DBUILD_DOCS=OFF
)

vcpkg_cmake_install()
vcpkg_fixup_pkgconfig()
vcpkg_cmake_config_fixup(PACKAGE_NAME wwa_jsonrpc CONFIG_PATH "lib/cmake/wwa_jsonrpc")

file(
    REMOVE_RECURSE
        "${CURRENT_PACKAGES_DIR}/debug/include"
        "${CURRENT_PACKAGES_DIR}/debug/share"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
file(COPY "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
