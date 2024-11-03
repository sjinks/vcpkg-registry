vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO sjinks/simple-threadpool
    REF v0.0.1
    SHA512 c9f0041554df7a4f476eee0876cfa0fc3f379c92557494664d266e577a4abeeaaa65d7195c7203685ad955938b01410532c2b5496fc16a5d061353542b5c651f
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBUILD_TESTS=OFF
)

vcpkg_cmake_install()
vcpkg_fixup_pkgconfig()
vcpkg_cmake_config_fixup(PACKAGE_NAME wwa-simple-threadpool CONFIG_PATH "lib/cmake/wwa-simple-threadpool")

file(
    REMOVE_RECURSE
        "${CURRENT_PACKAGES_DIR}/debug/include"
        "${CURRENT_PACKAGES_DIR}/debug/share"
)

set(VCPKG_POLICY_SKIP_COPYRIGHT_CHECK enabled)
# vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
file(COPY "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
