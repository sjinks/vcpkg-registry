vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO sjinks/opentelemetry-resource-detectors-cpp
    REF v1.0.2
    SHA512 876f0d8d89104ec3115e6bc66666f7a262da1440bcbb8f740a6a0303149b800ea181a54e02d845e47499dca23bb9d2ba3cc7e0ad8efe4a83d5622f4a49b6562b
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DWITH_TESTING=OFF
        -DWITH_EXAMPLES=OFF
)

vcpkg_cmake_install()
vcpkg_fixup_pkgconfig()
vcpkg_cmake_config_fixup(PACKAGE_NAME wwa_opentelemetry_resource_detectors CONFIG_PATH "lib/cmake/wwa_opentelemetry_resource_detectors")

file(
    REMOVE_RECURSE
        "${CURRENT_PACKAGES_DIR}/debug/include"
        "${CURRENT_PACKAGES_DIR}/debug/share"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
file(COPY "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
