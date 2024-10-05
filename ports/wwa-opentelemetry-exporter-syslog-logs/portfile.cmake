vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO sjinks/opentelemetry_exporter_syslog_logs
    REF v1.0.1
    SHA512 4955997721f9b2e5e601d742de75036dce44f79c1a9406b9c2bf2b66152233b76b2a3178c5aaef24a3455f0199c6715235d4a8c50ebdf32ceaef2a22b50cb8e6
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS -DWITH_TESTING=OFF
)

vcpkg_cmake_install()
vcpkg_fixup_pkgconfig()
vcpkg_cmake_config_fixup(PACKAGE_NAME wwa_opentelemetry_exporter_syslog_logs CONFIG_PATH "lib/cmake/wwa_opentelemetry_exporter_syslog_logs")

file(
    REMOVE_RECURSE
        "${CURRENT_PACKAGES_DIR}/debug/include"
        "${CURRENT_PACKAGES_DIR}/debug/share"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
file(COPY "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
