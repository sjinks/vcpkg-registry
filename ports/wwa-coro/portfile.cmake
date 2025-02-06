vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO sjinks/coro-cpp
    REF 06119cc6c469a0679c0b702cd56b6c95bd5fae19
    SHA512 2215257d94cf04f750bd942ac8ee2c02c2fcd72e98381d7e810f965b282d858afa818369e6fcc10742f9a19f2a92c7fa72b4ff2d2f408e3fa5f9fb1f1df2ec98
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS -DBUILD_TESTS=OFF -DBUILD_DOCS=OFF -DBUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()
vcpkg_fixup_pkgconfig()
vcpkg_cmake_config_fixup(PACKAGE_NAME wwa-coro CONFIG_PATH "lib/cmake/wwa-coro")

file(
    REMOVE_RECURSE
        "${CURRENT_PACKAGES_DIR}/debug/include"
        "${CURRENT_PACKAGES_DIR}/debug/share"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
file(COPY "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
