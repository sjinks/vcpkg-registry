vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO sjinks/opentelemetry_exporter_syslog_logs
    REF v1.0.2
    SHA512 55aa9ea018ac7ffc3889c9c391f8e024b372871914318f379bd12d92cdcaa462495f8238a4efe3dd9f2ae25b2770b9f1a7e922b53306da101f4de40c9beb73bf
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
