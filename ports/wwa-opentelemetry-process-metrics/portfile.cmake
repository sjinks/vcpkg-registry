vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO sjinks/opentelemetry-process-metrics-cpp
    REF 2791844dc4fcecc0513f6e53ac49a48f59e5cc5d
    SHA512 db6d4eea28116db3731ee5b22710b5d9333d8023f04c33bcb5ee57287528275c3275ae7f5eda8492c526b4414a573c827bbf20541bf33c46a8e52bf6f60bb2b3
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
