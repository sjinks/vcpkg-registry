vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO sjinks/opentelemetry-configurator-cpp
    REF 47ea0deffd1186636f482e32583fbe561f0a9ab7
    SHA512 7bd4432cf8d88a9e312559c943da9b5351e19a9019a427253c4bb6739076e8da49991fae28caf8b839eb7dff4a1945e0c7cec5f64d06bba3d208c2b94a0ba6ba
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
