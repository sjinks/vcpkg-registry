vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO sjinks/opentelemetry-configurator-cpp
    REF b20ce5ead1a8d3b26145adf3c783bf1135657226
    SHA512 be79a05090b8ec1c31d878e7a9404048c886572568655c09b1dc5e542efc4053a8484f2d1f3aaba1ecf227b58201ea5e1216c9ef8a663416c6ab7c89f1b4d43e
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_cmake_install()
vcpkg_fixup_pkgconfig()
vcpkg_cmake_config_fixup(PACKAGE_NAME wwa_opentelemetry_configurator CONFIG_PATH "lib/cmake/wwa_opentelemetry_configurator")

file(
    REMOVE_RECURSE
        "${CURRENT_PACKAGES_DIR}/debug/include"
        "${CURRENT_PACKAGES_DIR}/debug/share"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
file(COPY "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
