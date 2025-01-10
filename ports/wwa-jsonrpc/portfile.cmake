vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO sjinks/jsonrpc-cpp
    REF v2.0.0
    SHA512 1132ecd1c9eba8912a7275460aca9095365ac7dbe80c5fbd59cc118ddc4e679cbee6f497e355ad071eef66ec0e61d7c882180ebde10fab3005af6fedcaa7470a
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
