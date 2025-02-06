vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO sjinks/coro-cpp
    REF 2cb6b759bb441593d6cc7d6e3dee0c3e4e5fe455
    SHA512 24e6e11aff41a5ab6feec4536b8d2eb79923e581b68f930ee62e125bb0e9bd1296f34efa37a8d658695d5ff719dd8fbf7c04f6fbf8e98557ba4a91b54108553d
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
