vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO sjinks/opentelemetry-process-metrics-cpp
    REF 7c835670bb4b1b31207bfbef9f6c86f5eaf07625
    SHA512 75c2b064586fcead4a3d3215d0cda45bb737d0dbfab64b933c7858f2b6100ad2f4dfa0c5bf5c22ff50fa3d8bcbd77f29f7d55220c14eda3bfe2bfe24e80781e4
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS -DWITH_EXAMPLES=OFF
)

vcpkg_cmake_install()
vcpkg_fixup_pkgconfig()
vcpkg_cmake_config_fixup(PACKAGE_NAME wwa_opentelemetry_process_metrics CONFIG_PATH "lib/cmake/wwa_opentelemetry_process_metrics")

file(
    REMOVE_RECURSE
        "${CURRENT_PACKAGES_DIR}/debug/include"
        "${CURRENT_PACKAGES_DIR}/debug/share"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
file(COPY "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
