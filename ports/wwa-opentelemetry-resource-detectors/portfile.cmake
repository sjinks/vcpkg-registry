vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO sjinks/opentelemetry-resource-detectors-cpp
    REF v1.0.1
    SHA512 f210111b66f5be807664168bdd804a311e7cdbc215924bcb662665d191d25b5827488af537490cfaf5f98cc8b67fcf9a90a6ed95c726dcc0a4a53f673d141ddc
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
