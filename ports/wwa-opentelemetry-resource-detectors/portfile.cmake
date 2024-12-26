vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO sjinks/opentelemetry-resource-detectors-cpp
    REF v1.0.4
    SHA512 53c25a68a81a1a66ee243d64cd548d545812196cdee6f056970ecae42206dfea3a4d833620c42f8d5508d375e57b1eb784a4b8eea70468758f06cc352c7ae527
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DWITH_TESTING=OFF
        -DWITH_EXAMPLES=OFF
        -DWITH_MPH=OFF
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
