vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO sjinks/scope-action-cpp
    REF v1.0.1
    SHA512 d52976e40c63e9d2985163ca213794f646efa74fd5276c95c30428f7d667f6adfbc68d7b25c2bf2612d3d540464588d365b27caabd98017f3304df10bfbdbe96
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS -DBUILD_TESTING=OFF -DBUILD_DOCS=OFF -DBUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()
vcpkg_fixup_pkgconfig()
vcpkg_cmake_config_fixup(PACKAGE_NAME wwa-scope-action CONFIG_PATH "lib/cmake/wwa-scope-action")

file(
    REMOVE_RECURSE
        "${CURRENT_PACKAGES_DIR}/debug/include"
        "${CURRENT_PACKAGES_DIR}/debug/share"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
file(COPY "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
