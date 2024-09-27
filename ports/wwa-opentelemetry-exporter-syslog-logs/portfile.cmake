vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO sjinks/opentelemetry_exporter_syslog_logs
    REF v1.0.0.1
    SHA512 ed736a126416f04dad3329a5e559762514f7dfed619b7ae581acfd639b3d34c4521bbaf1d0254ac298cc994a2bf02d2552057439ebd5b1f7b75e32cc71cd796d
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
